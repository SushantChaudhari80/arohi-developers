package com.sushant.live.service;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sushant.live.model.ArohiCustomer;
import com.sushant.live.repository.ArohiCustomerRepository;


@Service
public class ArohiCustomerService {
    
    @Autowired
    private ArohiCustomerRepository customerRepository;

    // Save customer
    public ArohiCustomer addCustomer(ArohiCustomer customer) {
        return customerRepository.save(customer);
    }

    // Get all customers
    public List<ArohiCustomer> getAllCustomers() {
        return customerRepository.findAll();
    }

    // Get customer by ID
    public Optional<ArohiCustomer> getCustomerById(Long id) {
        return customerRepository.findById(id);
    }
    
    public void deleteCustomer(Long id) {
        customerRepository.deleteById(id);
    }

    public ArohiCustomer updateCustomer(ArohiCustomer customer) {
        return customerRepository.save(customer);
    }
}
