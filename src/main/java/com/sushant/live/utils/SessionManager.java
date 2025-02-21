package com.sushant.live.utils;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;

import jakarta.servlet.http.HttpServletResponse;

public class SessionManager {

	    private static final SessionManager INSTANCE = new SessionManager();

	    private String username;

	   
	    private SessionManager() {}

	    
	    public static SessionManager getInstance() {
	        return INSTANCE;
	    }

	    // Method to set the username
	    public void setUsername(String username) {
	    	
	        this.username = username;
	    }

	    // Method to get the username
	    public String getUsername() {
	    	return username; 
	    }
}
