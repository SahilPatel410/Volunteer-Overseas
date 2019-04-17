package com.volunteer.model;

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
@Table(name="project_carousel_images")
@Proxy(lazy=false)
public class ProjectCarouselImages {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column
	private String images;

	@ManyToOne
	@JoinColumn(name="project_id")
	private Projects projectCarouselImage;
	
	public ProjectCarouselImages() {}
	public ProjectCarouselImages(String name,Projects project){
		this.images=name;
		this.projectCarouselImage=project;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	public Projects getProjectCarouselImage() {
		return projectCarouselImage;
	}

	public void setProjectCarouselImage(Projects projectCarouselImage) {
		this.projectCarouselImage = projectCarouselImage;
	}
}
