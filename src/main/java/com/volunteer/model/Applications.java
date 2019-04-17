package com.volunteer.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Proxy;

@Entity
@Table(name="applications")
@Proxy(lazy=false)
public class Applications {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column
	private String name;
	
	@Column
	private Date project_startdate;
	
	@Column
	private int duration;
	
	@Column
	private String email;
	
	@Column
	private int phone;
	
	@Column
	private Date created_at;
	
	@Column
	private Date updated_at;
	
	@ManyToOne
    @JoinColumn(name = "project_id")
    private Projects projectApplication;
	
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

	public Date getProject_startdate() {
		return project_startdate;
	}

	public void setProject_startdate(Date project_startdate) {
		this.project_startdate = project_startdate;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	public Date getUpdated_at() {
		return updated_at;
	}

	public void setUpdated_at(Date updated_at) {
		this.updated_at = updated_at;
	}

	public Projects getProjectApplication() {
		return projectApplication;
	}

	public void setProjectApplication(Projects projectApplication) {
		this.projectApplication = projectApplication;
	}
	
}
