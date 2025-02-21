package com.sushant.live.model;
import jakarta.persistence.*;

@Entity
@Table(name = "ArohiCustomer")
public class ArohiCustomer {


	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;

	    private String name;
	    private String email;
	    private String phone;
	    private String plotNumber;
	    private String status;

	    // Constructors
	    public ArohiCustomer() {}

	    public ArohiCustomer(String name, String email, String phone, String plotNumber, String status) {
	        this.name = name;
	        this.email = email;
	        this.phone = phone;
	        this.plotNumber = plotNumber;
	        this.status = status;
	    }

	    // Getters and Setters
	    public Long getId() { return id; }
	    public void setId(Long id) { this.id = id; }

	    public String getName() { return name; }
	    public void setName(String name) { this.name = name; }

	    public String getEmail() { return email; }
	    public void setEmail(String email) { this.email = email; }

	    public String getPhone() { return phone; }
	    public void setPhone(String phone) { this.phone = phone; }

	    public String getPlotNumber() { return plotNumber; }
	    public void setPlotNumber(String plotNumber) { this.plotNumber = plotNumber; }

	    public String getStatus() { return status; }
	    public void setStatus(String status) { this.status = status; }
	}

