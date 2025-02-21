package com.sushant.live.restcontroller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.sushant.live.model.Customer;
import com.sushant.live.service.CustomerService;
import com.sushant.live.utils.SessionManager;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/api/customers")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    
    @GetMapping("/get")
    public ResponseEntity<Customer> getCustomer() {
    	System.out.println("CustomerController : getCustomer()");
        Customer customer = customerService.getCustomerById(SessionManager.getInstance().getUsername()); // Fetch customer by ID (example)
        customer.setBussinessName(customer.getBussinessName().toUpperCase());
        return ResponseEntity.ok(customer);
    }
    
    @GetMapping("/getAll")
    public ResponseEntity<List<Customer>> getAll() {
    	System.out.println("CustomerController : getCustomer()");
        List<Customer> customer = customerService.getCustomer();
        System.out.println("Number of all customer"+customer.size());
        return ResponseEntity.ok(customer);
    }

    // Add a new customer
    @PostMapping("/add")
    public ResponseEntity<String> addCustomer(
            @RequestParam("mobile") String mobile,
            @RequestParam("name") String name,
            @RequestParam("bussinessName") String bussinessName,
            @RequestParam("gstNo") String gstNo,
            @RequestParam("acNo") String acNo,
            @RequestParam("ifsc") String ifsc,
            @RequestParam("bankName") String bankName,
            @RequestParam("address") String address,
            @RequestParam("password") String password,
            @RequestParam(value = "picture", required = false) MultipartFile picture) {

        byte[] pictureData = null;

        if (picture != null && !picture.isEmpty()) {
            try {
                pictureData = picture.getBytes();
            } catch (IOException e) {
                return ResponseEntity.badRequest().body("Failed to upload picture");
            }
        }

        Customer customer = new Customer(mobile, name, bussinessName, gstNo, acNo, ifsc, bankName, address, pictureData, password);
        customerService.addCustomer(customer);

        return ResponseEntity.ok("Customer added successfully");
    }
    
 }
