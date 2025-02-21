package com.sushant.live.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sushant.live.model.Customer;
import com.sushant.live.repository.CustomerRepository;

@Service
public class CustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    // Method to add a new customer
    public void addCustomer(Customer customer) {
        customerRepository.save(customer);
    }
    
    public Customer getCustomerById(String A) {
    	return customerRepository.getById(A);
    }
    public List<Customer> getCustomer() {
    	return customerRepository.findAll();
    }
}
