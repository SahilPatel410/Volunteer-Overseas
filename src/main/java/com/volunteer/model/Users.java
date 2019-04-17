package com.volunteer.model;

import java.sql.Date;
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

@Entity
@Table(name="users")
@Proxy(lazy=false)
public class Users{
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column
	private String email;
	
	@Column
	private String password;
	
	@Column
	private String role;
	
	@Column
	private int status;
	
	@Column
	private Date created_at;
	
	@Column
	private Date updated_at;
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private Set<Organizations> organizationDetails;
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
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

	public Set<Organizations> getOrganizationDetails() {
		return organizationDetails;
	}

	public void setOrganizationDetails(Set<Organizations> organizationDetails) {
		this.organizationDetails = organizationDetails;
	}
	
}
