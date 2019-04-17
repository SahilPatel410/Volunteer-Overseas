package com.volunteer.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Proxy;

@Entity
@Table(name="cities")
@Proxy(lazy=false)
public class Cities {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column
	private String name;
	
	@OneToMany(fetch = FetchType.EAGER,mappedBy = "city", cascade = CascadeType.ALL)
    private Set<Projects> projectDetails;
	
	@ManyToOne
	@JoinColumn(name="country_id")
	private Countries countryCity;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<Projects> getProjectDetails() {
		return projectDetails;
	}

	public void setProjectDetails(Set<Projects> projectDetails) {
		this.projectDetails = projectDetails;
	}

	public Countries getCountryCity() {
		return countryCity;
	}

	public void setCountryCity(Countries countryCity) {
		this.countryCity = countryCity;
	}
	
}
