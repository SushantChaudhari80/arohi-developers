package com.sushant.live.model;
import jakarta.persistence.*;


@Entity
@Table(name = "projects")
public class Project {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String type;
    private String description;

    @Lob
    @Column(name = "image", columnDefinition = "MEDIUMBLOB")
    private byte[] image;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	public Project(Long id, String type, String description, byte[] image) {
		super();
		this.id = id;
		this.type = type;
		this.description = description;
		this.image = image;
	}

	public Project() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    
    
}



