package com.sushant.live.restcontroller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sushant.live.service.StatsService;

@RestController
@RequestMapping("/api/stats")
public class StatsController {
	
   @Autowired 
   StatsService service;
   
    @GetMapping("/getDetails")
    public Map<String, Integer> getProjectStats() {
       
    return service.getStats();
       
    }
}
