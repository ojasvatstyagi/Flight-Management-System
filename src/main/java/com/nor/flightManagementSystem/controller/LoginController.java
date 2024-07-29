package com.nor.flightManagementSystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


import com.nor.flightManagementSystem.bean.FlightUser;
import com.nor.flightManagementSystem.exception.DatabaseException;
import com.nor.flightManagementSystem.exception.UserAlreadyExistsException;
import com.nor.flightManagementSystem.service.FlightUserService;

@RestController
public class LoginController {

    @Autowired
    private FlightUserService service;

    @Autowired
    private BCryptPasswordEncoder bCrypt;

    @GetMapping("/fms")
    public ModelAndView showHomePage() {
        return new ModelAndView("Home");
    }
    
    @GetMapping({"/index", "/"})
    public ModelAndView showIndexPage() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        
        String userType = service.getTypeByUsername(username);
        
        String indexPage = "";
        if (userType.equalsIgnoreCase("Admin"))
            indexPage = "indexAdm";
        else if (userType.equalsIgnoreCase("Customer"))
            indexPage = "indexCust";
        
        ModelAndView mv = new ModelAndView(indexPage);
        mv.addObject("username", username); // Add username to the model
        return mv;
    }

    
    @GetMapping("/register")
    public ModelAndView showUserRegistrationPage() {
        FlightUser user = new FlightUser();
        ModelAndView mv = new ModelAndView("newUserEntry");
        mv.addObject("userRecord", user);
        return mv;
    }

    @PostMapping("/register")
    public ModelAndView saveUserRegistrationPage(@ModelAttribute("userRecord") FlightUser user) {

        if (service.userExists(user.getUsername())) {
            throw new UserAlreadyExistsException("Username already exists. Please choose a different username.");
        }
        try {
            String encodedPassword = bCrypt.encode(user.getPassword()); // encrypts the password
            FlightUser newUser = new FlightUser();
            newUser.setUsername(user.getUsername());
            newUser.setPassword(encodedPassword);
            newUser.setType(user.getType());
            newUser.setEmail(user.getEmail());
            service.save(newUser);
            return new ModelAndView("loginPage");
        } catch (Exception e) {
            throw new DatabaseException("Problem saving user to the database", e);
        }
    }


    @GetMapping("/loginpage")
    public ModelAndView showLoginPage(@RequestParam(required = false) String error) {
        ModelAndView mv = new ModelAndView("loginPage");
        if (error != null) {
            mv.addObject("error", "Invalid username or password.");
        }
        return mv;
    }

    @ExceptionHandler(UserAlreadyExistsException.class)
    public ModelAndView handleUserAlreadyExistsException(UserAlreadyExistsException e) {
        FlightUser user = new FlightUser();
        ModelAndView mv = new ModelAndView("newUserEntry");
        mv.addObject("userRecord", user);
        mv.addObject("error", e.getMessage());
        return mv;
    }

    @ExceptionHandler(DatabaseException.class)
    public ModelAndView handleDatabaseException(DatabaseException e) {
        ModelAndView mv = new ModelAndView("errorPage");
        mv.addObject("error", "A database problem occurred. Please try again later.");
        return mv;
    }
}
