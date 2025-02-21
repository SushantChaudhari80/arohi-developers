package com.sushant.live.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StatsService {
	
	@Autowired
	ArohiCustomerService customerService;
	
	@Autowired
	ProjectService projectService;

	 public Map<String, Integer> getStats(){
		 Map<String, Integer> stats = new HashMap<>();

	        stats.put("happyCustomers", customerService.getAllCustomers().size());
	        stats.put("inProgressProjects", projectService.getAllProjects().size());
	        return stats;
	 }
	
}
