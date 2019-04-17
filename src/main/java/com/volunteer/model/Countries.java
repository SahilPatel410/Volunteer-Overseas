package com.volunteer.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Proxy;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="countries")
@Proxy(lazy=false)
public class Countries {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column
	private String name;
	
	@Column
	private String image;
	
	@JsonIgnore
	@OneToMany(mappedBy = "country", cascade = CascadeType.ALL)
    private Set<Projects> projectDetails;
	
	@JsonIgnore
	@OneToMany(mappedBy = "countryCity", cascade = CascadeType.ALL)
    private Set<Cities> cityDetails;
	public Countries(){}
	public Countries(String countryName, String fileName) {
		this.name=countryName;
		this.image=fileName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public Set<Cities> getCityDetails() {
		return cityDetails;
	}
	
	public void setCityDetails(Set<Cities> cityDetails) {
		this.cityDetails = cityDetails;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Set<Projects> getProjectDetails() {
		return projectDetails;
	}

	public void setProjectDetails(Set<Projects> projectDetails) {
		this.projectDetails = projectDetails;
	}
	
	
}
