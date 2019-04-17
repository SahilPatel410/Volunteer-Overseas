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
@Table(name="project_view_history")
@Proxy(lazy=false)
public class ProjectViewHistory {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column
	private Date view_date;
	
	@Column
	private String user_ip;
	
	@Column(name="project_id", insertable = true, updatable = true)
	private Integer project_id;
	
	@ManyToOne
	@JoinColumn(name="project_id",insertable = false, updatable = false)
	private Projects projectViewHistory;
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getView_date() {
		return view_date;
	}

	public void setView_date(Date view_date) {
		this.view_date = view_date;
	}

	public String getUser_ip() {
		return user_ip;
	}

	public void setUser_ip(String user_ip) {
		this.user_ip = user_ip;
	}

	public Projects getProjectViewHistory() {
		return projectViewHistory;
	}

	public void setProjectViewHistory(Projects projectViewHistory) {
		this.projectViewHistory = projectViewHistory;
	}
	public Integer getProject_id() {
		return project_id;
	}
	
	public void setProject_id(Integer project_id) {
		this.project_id = project_id;
	}
	
}
