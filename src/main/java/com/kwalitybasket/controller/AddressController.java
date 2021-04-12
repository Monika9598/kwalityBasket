package com.kwalitybasket.controller;

import com.kwalitybasket.constant.Status;
import com.kwalitybasket.model.Address;
import com.kwalitybasket.model.User;
import com.kwalitybasket.service.AddressService;
import com.kwalitybasket.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.InvalidObjectException;
import java.security.Principal;
import java.util.List;

@Controller
public class AddressController {

    @Autowired
    private UserService userService;

    @Autowired
    private AddressService addressService;

    @RequestMapping(value = "/saveAddress", method = RequestMethod.POST)
    @ResponseBody
    public String saveAddress(Model model, @ModelAttribute("address") Address address, Principal principal) {
        User user = getUser(principal);
        address.setUser(user);
        address.setStatus(Status.ACTIVE.getCode());
        addressService.save(address);
        List<Address> addresses = addressService.listUserAddress(user);
        model.addAttribute("addressList", addresses);
        return "redirect";
    }

    @RequestMapping(value = "/deleteAddress", method = RequestMethod.POST)
    @ResponseBody
    public String deleteAddress(Model model, @RequestParam Long addressId, Principal principal) throws InvalidObjectException {
        addressService.delete(addressId);
        User user = getUser(principal);
        List<Address> addresses = addressService.listUserAddress(user);
        model.addAttribute("addressList", addresses);
        return "redirect";
    }

    @RequestMapping(value = "/listAddress", method = RequestMethod.POST)
    public String listUserAddress(Model model, Principal principal) {
        User user = getUser(principal);
        List<Address> addresses = addressService.listUserAddress(user);
        model.addAttribute("addressList", addresses);
        return "redirect:/";
    }

    private User getUser(Principal principal) {
        try {
            return userService.fetchUser(principal.getName());
        } catch (InvalidObjectException e) {
            e.printStackTrace();
        }

        return null;
    }
}
