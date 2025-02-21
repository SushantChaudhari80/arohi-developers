package com.sushant.live.restcontroller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sushant.live.model.Customer;
import com.sushant.live.service.CustomerService;
import com.sushant.live.utils.SessionManager;


@RestController
@RequestMapping("/login")
public class LoginCotroller {
	
	 @Autowired
	 private CustomerService customerService;
	    
	
	 @GetMapping("/user")
	 public Map<String, String> getCredentials(@RequestParam String email, @RequestParam String pass) {
	        System.out.println("Mobile: " + email + ", Password: " + pass);
	        
	        Map<String, String> response = new HashMap<>();
	        Customer c = customerService.getCustomerById(email);
	        if (!(c.equals(null))) {	
	        	System.out.println(c.getMobile() + c.getPassword());
	        if(email.equals(c.getMobile()) & pass.equals(c.getPassword())) {
	        response.put("message", "success");
	        SessionManager session = SessionManager.getInstance();
	        session.setUsername(email);
			 }else {
				 response.put("message", "Invalid Credentials , rertry");
			 }
	        }else {
	        	response.put("message", "User not exist");
	        }
			        
	        
	        return response;  // Spring Boot will automatically convert this map to JSON
	    }
}
	
