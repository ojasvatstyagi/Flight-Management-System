package com.nor.flightManagementSystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.nor.flightManagementSystem.bean.FlightUser;
import com.nor.flightManagementSystem.service.FlightUserService;

@RestController
public class LoginController {

    @Autowired
    private FlightUserService service;
    
    @Autowired
    private BCryptPasswordEncoder bCrypt;

    @GetMapping("/register")
    public ModelAndView showUserRegistrationPage() {
        FlightUser user = new FlightUser();
        ModelAndView mv = new ModelAndView("newUserEntry");
        mv.addObject("userRecord", user);
        return mv;
    }

    @PostMapping("/register")
    public ModelAndView saveUserRegistrationPage(@ModelAttribute("userRecord") FlightUser user) {
        String encodedPassword = bCrypt.encode(user.getPassword()); // encrypts the password
        FlightUser newUser = new FlightUser();
        newUser.setUsername(user.getUsername());
        newUser.setPassword(encodedPassword);
        newUser.setType(user.getType());
        service.save(newUser);
        return new     ModelAndView("loginPage");
    }

    @GetMapping("/loginpage")
    public ModelAndView showLoginPage(@RequestParam(value = "error", required = false) String error) {
        ModelAndView mv = new ModelAndView("loginPage");
        if (error != null) {
            mv.addObject("error", "Invalid username or password.");
        }
        return mv;
    }

//    @GetMapping("/loginerror")
//    public ModelAndView showLoginErrorPage() {
//        ModelAndView mv = new ModelAndView("loginPage");
//        mv.addObject("error", "Invalid username or password.");
//        return mv;
//    }
    
}
