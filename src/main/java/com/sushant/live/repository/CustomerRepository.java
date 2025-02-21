package com.sushant.live.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sushant.live.model.Customer;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, String> {
    // No need to define methods, JpaRepository provides the necessary methods like save, find, delete, etc.

}

