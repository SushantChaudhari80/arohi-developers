package com.sushant.live.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sushant.live.model.Enquiry_a;

@Repository
public interface EnquiryRepository extends JpaRepository<Enquiry_a, Long> {
}

