package com.sushant.live.restcontroller;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sushant.live.model.ArohiCustomer;
import com.sushant.live.service.ArohiCustomerService;
import com.sushant.live.service.CustomerService;

@RestController
@RequestMapping("/api/arohi/customer")
public class ArohiCustomerController {
    
    @Autowired
    private ArohiCustomerService customerService;

    @PostMapping("/add")
    public String addCustomer(@RequestBody ArohiCustomer customer) {
        customerService.addCustomer(customer);
        return "Customer added successfully!";
    }

    @GetMapping("/all")
    public List<ArohiCustomer> getAllCustomers() {
        return customerService.getAllCustomers();
    }

    @GetMapping("/{id}")
    public Optional<ArohiCustomer> getCustomerById(@PathVariable Long id) {
        return customerService.getCustomerById(id);
    }
    
    @DeleteMapping("/delete/{id}")
    public String deleteCustomer(@PathVariable Long id) {
        customerService.deleteCustomer(id);
        return "Customer deleted successfully!";
    }

    @PutMapping("/update")
    public String updateCustomer(@RequestBody ArohiCustomer customer) {
        customerService.updateCustomer(customer);
        return "Customer updated successfully!";
    }
}