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
@Table(name="project_costs")
@Proxy(lazy=false)
public class ProjectCosts {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column
	private int number_of_weeks;
	
	@Column
	private float cost;
	
	@ManyToOne
	@JoinColumn(name="project_id")
	private Projects projectCost;
	
	public ProjectCosts(){}
	public ProjectCosts(int number_of_weeks,float cost,Projects projectCost){
		this.number_of_weeks=number_of_weeks;
		this.cost=cost;
		this.projectCost=projectCost;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getNumber_of_weeks() {
		return number_of_weeks;
	}

	public void setNumber_of_weeks(int number_of_weeks) {
		this.number_of_weeks = number_of_weeks;
	}

	public float getCost() {
		return cost;
	}

	public void setCost(float cost) {
		this.cost = cost;
	}

	public Projects getProjectCost() {
		return projectCost;
	}

	public void setProjectCost(Projects projectCost) {
		this.projectCost = projectCost;
	}
}
