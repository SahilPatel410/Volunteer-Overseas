package com.volunteer.services;

import java.text.ParseException;
import java.sql.Date;
import java.util.List;

import com.volunteer.model.Faq;
import com.volunteer.model.Activities;
import com.volunteer.model.Applications;
import com.volunteer.model.Categories;
import com.volunteer.model.ProjectCarouselImages;
import com.volunteer.model.ProjectCosts;
import com.volunteer.model.ProjectIncludeChecks;
import com.volunteer.model.Projects;

public interface IClientService {
	public List<Categories> getAllCategories();
	public List<Activities> getAllActivities();
	public Projects getProjectById(int projectid);
	public List<Projects> getAllProjects();
	public List<Projects> getProjectByFilter(String Category,String Country,String Activity);
	public void addApp(String Fullname,Date date,int duration,int phone,String email,int projectid);
	public List<ProjectIncludeChecks> getAllIncluded(int projectid); 
	public List<ProjectIncludeChecks> getAllNotIncluded(int projectid);
	public List<Projects> getAllTrendingProjects();
	public List<Projects> getAllAffordableProjects();
	public List<ProjectCosts> getProjectCost(int projectid); 
	public ProjectCosts getProjectCostvalue(int id);
	public List<Projects> getAllFeatureDest();
	public List<Integer> getAllAffordableCost(List<Projects> projectsMostAffordable);
	public void AddInquiry(String name, String mail, String message);
	public List<Projects> getProjectByFilter(String modelcategory, String modellocation, String modelactivity,
			String startdate, String startdate2, String range, int minage) throws ParseException;
	public List<ProjectCosts> getAllAffordableCostById(List<Integer> costProjectId);
	public List<Projects> getProjectsIn(List<Integer> projectIns);
	public int getbyCountryId(int countryId);
    public List<Integer> getAllFeatureCost(List<Projects> projectsMostAffordable);
	public List<ProjectCosts> getFeatureCostById(List<Integer> costProjectId);
	public List<Projects> getProjectByCountry(int countryId);
	public List<ProjectCosts> getPageResults(List<Integer> costProjectId, int pageid, int total);
	public List<ProjectCarouselImages> getViewPhotoes(int projectid);
	public List<Faq> getAllFaq();
}
