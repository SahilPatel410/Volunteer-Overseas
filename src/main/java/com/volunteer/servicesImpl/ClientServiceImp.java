package com.volunteer.servicesImpl;

import java.text.ParseException;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.volunteer.dao.IClient;
import com.volunteer.model.Activities;
import com.volunteer.model.Applications;
import com.volunteer.model.Categories;
import com.volunteer.model.Faq;
import com.volunteer.model.ProjectCarouselImages;
import com.volunteer.model.ProjectCosts;
import com.volunteer.model.ProjectIncludeChecks;
import com.volunteer.model.Projects;
import com.volunteer.services.IClientService;

@Service
@Transactional
public class ClientServiceImp implements IClientService {
	
	private IClient client;
	
	@Transactional
	public List<Categories> getAllCategories(){
		return client.getAllCategories();
	}

	@Transactional
	public List<Activities> getAllActivities(){
		return client.getAllActivities();
	}
	@Transactional
	public List<Projects> getAllProjects(){
		return client.getAllProjects();
	}
	@Transactional
	public Projects getProjectById(int projectid){
		Projects project= client.getProjectById(projectid);
		return project;
	}
	@Transactional
	public List<ProjectCarouselImages> getViewPhotoes(int projectid){
		return client.getViewPhotoes(projectid);
	}
	@Transactional
	public List<Projects> getProjectByFilter(String Category,String Country,String Activity){
		
		int category =client.getCategoryId(Category);
		int country =client.getCountryId(Country);
		int activity=client.getActivityId(Activity);
		if(category!=0 && country!=0 && activity!=0){
			List<Projects> project=client.getProjectByFilter(category,country,activity);
			return project;
		}
		else{
			return null;
		}	
	}
	@Transactional
	public List<Projects> getProjectByFilter(String modelcategory, String modellocation, String modelactivity,
			String startdate, String startdate2, String range, int minage) throws ParseException{
		int category =client.getCategoryId(modelcategory);
		int country =client.getCountryId(modellocation);
		int activity=client.getActivityId(modelactivity);
		List<Integer> startdateid = client.getStartdateId(startdate,startdate2);
		String str = range;
		String[] splitStr = str.split("\\s+");
		int range1 = Integer.parseInt(splitStr[0]);
		int range2 = Integer.parseInt(splitStr[2]);
		List<Integer> rangeArea = client.getRange(range1,range2);
		if(startdateid == null || rangeArea == null)
		{
			return null;
		}else{
		List<Projects> project = client.getMoreFiltersProjects(category,country,activity,startdateid,rangeArea,minage);
		return project;
		}
	}
	@Transactional
	public void addApp(String Fullname,Date date,int duration,int phone,String email,int projectid){
		client.addApp(Fullname,date,duration,phone,email,projectid);
	}
	@Transactional
	public IClient getClient() {
		return client;
	}
	@Transactional
	public void setClient(IClient client) {
		this.client = client;
	}
	@Transactional
	public List<ProjectIncludeChecks> getAllIncluded(int projectid){
		return client.getAllIncluded(projectid);
	}
	@Transactional
	public List<ProjectIncludeChecks> getAllNotIncluded(int projectid){
		return client.getAllNotIncluded(projectid);
	}
	@Transactional
	public List<Projects> getAllTrendingProjects(){
		return client.getAllTrendingProjects();
	}
	@Transactional
	public List<Projects> getAllAffordableProjects(){
		return client.getAllAffordableProjects();
	}
	@Transactional
	public List<ProjectCosts> getProjectCost(int projectid){
		return client.getProjectCost(projectid);
	}
	@Transactional
	public ProjectCosts getProjectCostvalue(int id){
		return client.getProjectCostvalue(id);
	}
	@Transactional
	public List<Projects> getAllFeatureDest(){
		return client.getAllFeatureDest();
	}
	@Transactional
	public List<Integer> getAllAffordableCost(List<Projects> projectsMostAffordable){
		List<Integer> projectIds = new ArrayList<Integer>();
		for(int i=0;i<projectsMostAffordable.size();i++){
			int projectId=projectsMostAffordable.get(i).getId();
			projectIds.add(projectId);
		}
		return projectIds;
	}
	@Transactional
	public List<Integer> getAllFeatureCost(List<Projects> projectsMostAffordable){
		List<Integer> projectIds = new ArrayList<Integer>();
		for(int i=0;i<projectsMostAffordable.size();i++){
			int projectId=projectsMostAffordable.get(i).getId();
			projectIds.add(projectId);
		}
		return projectIds;
	}
	@Transactional
	public List<ProjectCosts> getAllAffordableCostById(List<Integer> costProjectId){
		return client.getAllAffordableCostById(costProjectId);
	}
	@Transactional
	public List<ProjectCosts> getFeatureCostById(List<Integer> costProjectId){
		return client.getAllFeatureCostById(costProjectId);
	}
	@Transactional
	public void AddInquiry(String name, String mail, String message){
		client.AddInquiry(name,mail,message);
	}
	@Transactional
	public List<Projects> getProjectsIn(List<Integer> featurecosts){
		return client.getProjectsIn(featurecosts);
	}
	@Transactional
	public int getbyCountryId(int countryId){
		return client.getbyCountryId(countryId);
	}
	public List<Projects> getProjectByCountry(int countryId){
		return client.getProjectByCountry(countryId);
	}

	public List<ProjectCosts> getPageResults(List<Integer> costProjectId, int pageid, int total) {
		return client.getPageResults(costProjectId, pageid, total);
	}

	public List<Faq> getAllFaq() {
		return client.getAllFaq();
	}
}
