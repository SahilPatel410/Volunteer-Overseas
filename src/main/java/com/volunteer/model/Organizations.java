package com.volunteer.model;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
@Table(name="organizations")
@Proxy(lazy=false)
public class Organizations {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column
	private String name;
	
	@Column
	private String logo;
	
	@Column
	private String email;
	
	@Column
	private String description;
	
	@Column
	private String video;
	
	@Column
	private String website;
	
	@Column
	private String contact_name;
	
	@Column
	private String created_at;
	
	@Column
	private Date updated_at;

	@ManyToOne(cascade=CascadeType.ALL)
    @JoinColumn(name = "user_id")
    private Users user;
	
	@OneToMany(mappedBy = "organization", cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    private Set<Projects> projectDetails;
	
	public Organizations(){
		
	}
	public Organizations(Users user, String orgname, String website2, String email2, String number, String orgdesc,
			String logo2, String video2) {
		this.user=user;
		System.out.println("In Organization : "+user.getId()+" "+user.getEmail());
		this.name=orgname;
		this.website=website2;
		this.email=email2;
		this.contact_name=number;
		this.description=orgdesc;
		this.logo=logo2;
		this.video=video2;
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		System.out.println(dateFormat.format(cal.getTime()));
		this.created_at=dateFormat.format(cal.getTime());
	}

	
	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public Set<Projects> getProjectDetails() {
		return projectDetails;
	}

	public void setProjectDetails(Set<Projects> projectDetails) {
		this.projectDetails = projectDetails;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getContact_name() {
		return contact_name;
	}

	public void setContact_name(String contact_name) {
		this.contact_name = contact_name;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}

	public Date getUpdated_at() {
		return updated_at;
	}

	public void setUpdated_at(Date updated_at) {
		this.updated_at = updated_at;
	}
	
}
