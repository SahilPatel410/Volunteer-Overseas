package com.volunteer.dao;

import java.text.ParseException;
import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.volunteer.model.Activities;
import com.volunteer.model.Applications;
import com.volunteer.model.Categories;
import com.volunteer.model.Faq;
import com.volunteer.model.ProjectCarouselImages;
import com.volunteer.model.ProjectCosts;
import com.volunteer.model.ProjectIncludeChecks;
import com.volunteer.model.ProjectStartDates;
import com.volunteer.model.Projects;
@Repository
public interface IClient {

	public List<Categories> getAllCategories();
	public List<Activities> getAllActivities();
	public Projects getProjectById(int projectid);
	public List<Projects> getAllProjects();
	public List<Projects> getProjectByFilter(int category,int country,int activity);
	public int getCategoryId(String Category);
	public int getCountryId(String Country);
	public int getActivityId(String Activity);
	public void addApp(String fullname, Date date, int duration, int phone, String email,int projectid);
	public List<ProjectIncludeChecks> getAllIncluded(int projectid);
	public List<ProjectIncludeChecks> getAllNotIncluded(int projectid);
	public List<Projects> getAllTrendingProjects();
	public List<Projects> getAllAffordableProjects();
	public List<ProjectCosts> getProjectCost(int projectid);
	public ProjectCosts getProjectCostvalue(int id);
	public List<Projects> getAllFeatureDest();
	public void AddInquiry(String name, String mail, String message);
	public List<Integer> getStartdateId(String startdate, String startdate2) throws ParseException;
	public List<Integer> getRange(int range1, int range2);
	public List<Projects> getMoreFiltersProjects(int category, int country, int activity, List<Integer> startdateid,
			List<Integer> rangeArea, int minage);
	public List<ProjectCosts> getAllAffordableCostById(List<Integer> costProjectId);
	public List<Projects> getProjectsIn(List<Integer> featurecosts);
	public int getbyCountryId(int countryId);
	public List<ProjectCosts> getAllFeatureCostById(List<Integer> costProjectId);
	public List<Projects> getProjectByCountry(int countryId);
	public List<ProjectCosts> getPageResults(List<Integer> costProjectId, int pageid, int total);
	public List<ProjectCarouselImages> getViewPhotoes(int projectid);
	public List<Faq> getAllFaq();
}
