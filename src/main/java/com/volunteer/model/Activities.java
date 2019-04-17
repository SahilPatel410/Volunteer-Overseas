package com.volunteer.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Proxy;

@Entity
@Table(name="activities")
@Proxy(lazy=false)
public class Activities {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column
	private String name;
	
	@OneToMany(fetch = FetchType.EAGER,mappedBy = "activity", cascade = CascadeType.ALL)
	private Set<Projects> projectDetails;
	
	public Activities(){}
	public Activities(String name){
		this.name=name;
	}
	public Activities(int id,String name){
		this.id=id;
		this.name=name;
	}
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
	
}
