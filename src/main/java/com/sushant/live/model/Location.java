package com.sushant.live.model;


import jakarta.persistence.*;


@Entity
@Table(name = "locations")
public class Location {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String siteName;
    private String address;
    private String facilities;
    private String mapLink;
    @Lob
    @Column(name = "image", columnDefinition = "MEDIUMBLOB")
    private byte[] image;
    
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getSiteName() {
		return siteName;
	}
	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getFacilities() {
		return facilities;
	}
	public void setFacilities(String facilities) {
		this.facilities = facilities;
	}
	public String getMapLink() {
		return mapLink;
	}
	public void setMapLink(String mapLink) {
		this.mapLink = mapLink;
	}
	
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
	
	
	public Location(Long id, String siteName, String address, String facilities, String mapLink, byte[] image) {
		super();
		this.id = id;
		this.siteName = siteName;
		this.address = address;
		this.facilities = facilities;
		this.mapLink = mapLink;
		this.image = image;
	}
	public Location() {
		super();
		// TODO Auto-generated constructor stub
	}

    
}

