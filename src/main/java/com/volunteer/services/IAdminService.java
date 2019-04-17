package com.volunteer.services;

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

public interface IAdminService {
	public Users AuthenticateUser(String UserName,String Password);
	public List<Organizations> getAllOraganizations();
	public List<Categories> getAllCategories();
	public List<Activities> getAllActivities();
	public List<Users> getAllUsers();
	public void addOrganization(Users user, String orgname, String website, String email, String number,
			String orgdesc, String logo, String video);
	public void uploadFiles(MultipartFile logo, MultipartFile video) throws IOException;
	public List<Cities> getAllCities(int countryid);
	public List<Countries> getAllCountries();
	public void addProjects(Projects projects);
	public List<Projects> getAllProjects();
	public List<Countries> getProjectLocation();
	public void DeleteProject(int projectId);
	public Projects getProjectbyId(int projectId);
	public Users getUserById(int userid);
	public void addCategory(Categories category);
    public void addActivity(Activities activity);
	public void DeleteActivity(int aid);
	public Activities getActivityById(int uid);
	public void DeleteCategory(int cid);
	public Organizations getOrganizationbyId(int organizationId);
	public Activities getActivitybyId(int activityId);
	public Categories getCategorybyId(int categoryId);
	public Countries getCountrybyId(int countryId);
	public Cities getCitybyId(int cityId);
	
	public void addProjectCosts(ProjectCosts projectCosts);
	public void addProjectIncludeChecks(ProjectIncludeChecks projectIncludeChecks);
	public void addProjectStartDates(ProjectStartDates projectStartDates);
	public List<ProjectIncludeChecks> getAllProjectIncludeChecks(int pid);
	public void DeleteProjectIncludeChecks(int rid);
	public ProjectIncludeChecks getProjectIncludeChecks(int picid);
	public List<Projects> getProjectByPage(int pageid, int total);
	public List<Users> getUserByPage(int pageid, int pageTotal);
	public List<Activities> getActivityByPage(int pageid, int pageTotal);
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
