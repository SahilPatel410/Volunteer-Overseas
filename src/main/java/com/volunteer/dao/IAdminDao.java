package com.volunteer.dao;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.volunteer.model.Activities;
import com.volunteer.model.Applications;
import com.volunteer.model.Categories;
import com.volunteer.model.Cities;
import com.volunteer.model.Countries;
import com.volunteer.model.Faq;
import com.volunteer.model.Organizations;
import com.volunteer.model.ProjectCarouselImages;
import com.volunteer.model.ProjectCosts;
import com.volunteer.model.ProjectIncludeChecks;
import com.volunteer.model.ProjectStartDates;
import com.volunteer.model.Projects;
import com.volunteer.model.Users;

public interface IAdminDao {
	public Users AuthenticateUser(String UserName,String Password);
	public List<Organizations> getAllOraganizations();
	public List<Categories> getAllCategories();
	public List<Activities> getAllActivities();
	public List<Users> getAllUsers();
	public void addOrganization(Organizations org);
	public void uploadFiles(MultipartFile filename, MultipartFile videoname) throws IOException;
	public List<Cities> getAllCities(int countryid);
	public List<Countries> getAllCountries();
	public void addProjects(Projects projects);
	public List<Projects> getAllProjects();
	public List<Countries> getProjectLocation();
	public void deleteProjects(int projectId);
	public Projects getProjectbyID(int projectId);
	public Users getUsersById(int uid);
	public Organizations getOrganizationById(int oid);
	public Activities getActivityById(int uid);
	public Categories getCategoryById(int uid);
	public Countries getCountryById(int uid);
	public Cities getCityById(int uid);
	public void addCategory(Categories category);
	public void addActivity(Activities activity);
	public void addProjectCosts(ProjectCosts projectCosts);
	public void addProjectIncludeChecks(ProjectIncludeChecks projectIncludeChecks);
	public void addProjectStartDates(ProjectStartDates projectStartDates);
	public void DeleteActivity(int aid);
	public void DeleteCategory(int cid);
	public List<ProjectIncludeChecks> getAllProjectIncludeChecks(int pid);
	public void DeleteProjectIncludeChecks(int rid);
	public ProjectIncludeChecks getProjectIncludeChecks(int picid);
	public List<Projects> getProjectByPage(int pageid, int total);
	public List<Users> getUserByPage(int pageid, int total);
	public List<Activities> getActivityByPage(int pageid, int total);
	public List<Categories> getCategoryByPage(int pageid, int total);
	public void addGallery(ProjectCarouselImages projectCarouselImages);
	public List<Applications> getApplicationByPage(int pageid, int total);
	public List<Applications> getAllApplications();
	public List<Cities> getCities();
	public List<Faq> getAllFaq();
	public void DeleteFAQ(int pid);
	public void addFAQ(Faq faq);
	public int AddCountry(Countries countries);
}
