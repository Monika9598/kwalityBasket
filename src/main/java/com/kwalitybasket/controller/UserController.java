package com.kwalitybasket.controller;

import com.kwalitybasket.model.User;
import com.kwalitybasket.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String user(Model model) {
        model.addAttribute("register", new User());
        return "register";
    }

    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public String signup(@ModelAttribute("user") User user, Model model) {
        try {
            userService.signUp(user);
        } catch (Exception e) {
            model.addAttribute("message", e.getMessage());
            return "signup";
        }
        model.addAttribute("message", "User " + user.getUserName() + " is successfully registered");
        return "signup";
    }

    @RequestMapping(value = "/signin", method = RequestMethod.GET)
    public String homelogin(Model model) {
        List<User> contact = userService.listAll();
        model.addAttribute("loginUser", new User());
        return "login";
    }

    @RequestMapping(value = "/addlogin", method = RequestMethod.POST)
    public String addlogin(@ModelAttribute("loginUser") User loginUser, Model model, HttpSession session) {
        //BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//        String fName = loginUser.getUserName();
//        //loginUser.setUserName(fName);
//        session.setAttribute("username", fName);
//        String pswrd = loginUser.getPassword();
//        System.out.println(fName);
//        System.out.println(pswrd);
//        String pass = Encryption.encrypt(pswrd);
//        System.out.println("encoded password for login is...");
//        System.out.println(pass);
//
//        String check = userService.equals(fName, pass);
//        System.out.println(check);
//        //int encodepwd=check.indexOf(pswrd);
//
//        if (check == null) {
//            System.out.println("invalid user");
//            model.addAttribute("loginUser", new User());
//            return "loginUser";
//        }

        model.addAttribute("register", new User());
        return "register";
    }


    @RequestMapping(value = "/forgotusers", method = RequestMethod.GET)
    public String homeforgotpassword(Model model) {
        List<User> contact = userService.listAll();
        model.addAttribute("forgotuser", new User());

        return "forgotuser";
    }

    @RequestMapping(value = "/forgotpass", method = RequestMethod.POST)
    public String forgotgpass(@ModelAttribute("forgotuser") User forgotuser, BindingResult result, Model model, ModelMap mapp) {

//        String userName = forgotuser.getUserName();
//        String passwordd = forgotuser.getPassword();
//        System.out.println("user username is..");
//        System.out.println(userName);
//        String cnfpass = forgotuser.getConfirmPassword();
//
//        String password = Encryption.encrypt(passwordd);
//        // String password= passwordEncoderr.encode(passwordd);
//        System.out.println("this is encrypted password for update");
//        System.out.println(password);
//
//        int checkemail = userService.forgotuserequals(userName, password);
//
//
//        if (passwordd.equals(cnfpass)) {
//            System.out.println("password matched");
//
//
//            if (checkemail == 0) {
//                System.out.println("invalid user");
//                mapp.addAttribute("msgg", "Invalid user");
//                model.addAttribute("forgotuser", new User());
//                return "forgotuser";
//            }
//
//            model.addAttribute("UserResetPswrd", new User());
//            return "userreset";
//
//        }
//        mapp.addAttribute("msg", "password did not match");
//        model.addAttribute("forgotuser", new User());
        return "forgotuser";


    }


    @RequestMapping(value = "/adminLogin", method = RequestMethod.GET)
    public String homeuserreset(Model model, HttpSession session, HttpServletRequest request) {

        String userName = (String) session.getAttribute("username");
        System.out.println(userName);
        //List<User> contact = registerService.tryToAccessAdmin();
        model.addAttribute("UserResetPswrd", new User());

        // model.put("command", new Contact());
        return "userreset";
    }
}