package com.sushant.live.restcontroller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sushant.live.model.Enquiry_a;
import com.sushant.live.repository.EnquiryRepository;

@RestController
@RequestMapping("/api/enquiries")
public class EnquiryController {

    @Autowired
    private EnquiryRepository enquiryRepository;

    @PostMapping("/save")
    public ResponseEntity<String> saveEnquiry(@RequestBody Enquiry_a enquiry) {
    	enquiry.setE_date(LocalDate.now()+"");
        enquiryRepository.save(enquiry);
        return ResponseEntity.ok("Enquiry saved successfully!");
    }
    
    @GetMapping("/all")
    public ResponseEntity<List<Enquiry_a>> getAllEnquiries() {
        return ResponseEntity.ok(enquiryRepository.findAll());
    }
}
