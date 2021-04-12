package com.kwalitybasket.service;

import com.kwalitybasket.constant.Status;
import com.kwalitybasket.dto.Cart;
import com.kwalitybasket.dto.OrderDto;
import com.kwalitybasket.model.Order;
import com.kwalitybasket.model.OrderDetail;
import com.kwalitybasket.model.Product;
import com.kwalitybasket.model.User;
import com.kwalitybasket.repository.OrderDetailRepository;
import com.kwalitybasket.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.io.InvalidObjectException;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;

@Service
@Transactional
public class OrderService {

    @Autowired
    private OrderDetailRepository repo;

    @Autowired
    private AddressService addressService;

    @Autowired
    private ProductService productService;

    @Autowired
    private OrderRepository orderRepository;

    public List<com.kwalitybasket.model.OrderDetail> listAll() {
        return (List<com.kwalitybasket.model.OrderDetail>) repo.findAll();
    }

    //@Cacheable("userCart")
    public Cart findUserCart(User user) {
        return new Cart(repo.findByUserAndStatus(user, Status.PENDING_CHECKOUT.getCode()));
    }

    public List<com.kwalitybasket.model.OrderDetail> findByUserOrders(User user) {
        return repo.findByUser(user);
    }

    public String addToCart(User user, Long productId, Integer quantity) {
        List<OrderDetail> orderDetails = repo.findByUserAndStatus(user, Status.PENDING_CHECKOUT.getCode());

        Integer totalQuantity = orderDetails.stream()
                .collect(Collectors.summingInt(OrderDetail::getQuantity))
                + quantity;

        Optional<OrderDetail> currentProductCart = orderDetails
                .stream()
                .filter(orderDetail -> orderDetail.getProduct().getId().equals(productId))
                .findFirst();
        Product product = productService.fetchProductById(productId);

        if (currentProductCart.isPresent()) {
            com.kwalitybasket.model.OrderDetail orderDetail = currentProductCart.get();
            quantity = orderDetail.getQuantity() + quantity;
            if (quantity < 1) {
                repo.delete(orderDetail);
            } else {
                orderDetail.setQuantity(quantity);
                orderDetail.setAmount(product.getPrice());
                repo.save(orderDetail);
            }
        } else if (quantity > 0) {
            com.kwalitybasket.model.OrderDetail orderDetail = new com.kwalitybasket.model.OrderDetail();
            orderDetail.setQuantity(quantity);
            orderDetail.setAmount(product.getPrice());
            orderDetail.setUser(user);
            orderDetail.setStatus(Status.PENDING_CHECKOUT.getCode());
            orderDetail.setProduct(product);
            repo.save(orderDetail);
        }
        return totalQuantity == null ? "" : totalQuantity.toString();
    }

    public Order completeOrder(User user, OrderDto orderDto) throws InvalidObjectException {
        com.kwalitybasket.model.Address address = addressService.fetchAddress(orderDto.getAddressId());
        List<OrderDetail> orderDetails = (List<OrderDetail>) repo.findAllById(orderDto.getOrderIds());
        Order order = new Order();
        order.setOrderReference();
        order.setAddress(address);
        order.setOrderDetails(orderDetails);
        order.setStatus(Status.PENDING_PAYMENT.getCode());
        AtomicReference<Double> totalAmount = new AtomicReference<>((double) 0);
        orderDetails.stream().map(orderDetail -> {
            totalAmount.updateAndGet(v -> v + orderDetail.getAmount());
            orderDetail.setOrder(order);
            orderDetail.setStatus(Status.PENDING_PAYMENT.getCode());
            return orderDetail;
        }).collect(Collectors.toList());
        order.setTotalAmount(totalAmount.get());
        Order savedOrder = orderRepository.save(order);
        repo.saveAll(orderDetails);
        return savedOrder;
    }

    public List<Order> listAllOrders() {
        return (List<Order>) orderRepository.findAll();
    }
}
