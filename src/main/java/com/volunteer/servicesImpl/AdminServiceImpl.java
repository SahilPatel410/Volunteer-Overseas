package com.volunteer.servicesImpl;

import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.volunteer.dao.IAdminDao;
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
import com.volunteer.services.IAdminService;

@Service
public class AdminServiceImpl implements IAdminService{

	IAdminDao userDao;
		
	public IAdminDao getUserDao() {
		return userDao;
	}

	public void setUserDao(IAdminDao userDao) {
		this.userDao = userDao;
	}

	@Transactional
	public Users AuthenticateUser(String UserName,String Password){
		return userDao.AuthenticateUser(UserName, Password);
	}
	@Transactional
	public List<Organizations> getAllOraganizations(){
		return userDao.getAllOraganizations();
	}
	@Transactional
	public List<Categories> getAllCategories(){
		return userDao.getAllCategories();
	}
	@Transactional
	public List<Activities> getAllActivities(){
		return userDao.getAllActivities();
	}
	@Transactional
	public List<Users> getAllUsers() {
		return userDao.getAllUsers();
	}
	@Transactional
	public Users getUserById(int userid) {
		return userDao.getUsersById(userid);
	}
	@Transactional
	public void addOrganization(Users user, String orgname, String website, String email, String number,
			String orgdesc, String logo, String video) {
		System.out.println("In ServiceImpl : "+user.getId()+" "+user.getEmail());
		userDao.addOrganization(new Organizations(user,orgname,website,email,number,orgdesc,logo,video));
	}
	@Transactional
	public void uploadFiles(MultipartFile logo, MultipartFile video) throws IOException {
		userDao.uploadFiles(logo,video);
	}
	@Transactional
	public List<Cities> getAllCities(int countryid) {
		return userDao.getAllCities(countryid);
	}
	@Transactional
	public List<Countries> getAllCountries() {
		return userDao.getAllCountries();
	}
	@Transactional
	public void addProjects(Projects projects) {
		userDao.addProjects(projects);
	}
	@Transactional
	public List<Projects> getAllProjects() {
		return userDao.getAllProjects();
	}
	@Transactional
	public List<Countries> getProjectLocation() {
		List<Countries> ProjectLocations = userDao.getProjectLocation();
		return ProjectLocations;
	}
	@Transactional
	public void DeleteProject(int projectId) {
		userDao.deleteProjects(projectId);
	}
	@Transactional
	public Projects getProjectbyId(int projectId) {
		return userDao.getProjectbyID(projectId);
	}
	@Transactional
	public void addCategory(Categories category) {
		userDao.addCategory(category);
	}
	@Transactional
	public void addActivity(Activities activity){
		userDao.addActivity(activity);
	}
	@Transactional
	public void DeleteActivity(int aid) {
		userDao.DeleteActivity(aid);
	}
	@Transactional
	public Activities getActivityById(int uid){
		return userDao.getActivityById(uid);
	}
	@Transactional
	public void DeleteCategory(int cid) {
		userDao.DeleteCategory(cid);		
	}
	@Transactional
	public Organizations getOrganizationbyId(int organizationId) {
		return userDao.getOrganizationById(organizationId);
	}
	@Transactional
	public Activities getActivitybyId(int activityId) {
		return userDao.getActivityById(activityId);
	}
	@Transactional
	public Categories getCategorybyId(int categoryId) {
		return userDao.getCategoryById(categoryId);
	}
	@Transactional
	public Countries getCountrybyId(int countryId) {
		return userDao.getCountryById(countryId);
	}
	@Transactional
	public Cities getCitybyId(int cityId) {
		return userDao.getCityById(cityId);
	}
	@Transactional
	public void addProjectCosts(ProjectCosts projectCosts) {
		userDao.addProjectCosts(projectCosts);
	}
	@Transactional
	public void addProjectIncludeChecks(ProjectIncludeChecks projectIncludeChecks) {
		userDao.addProjectIncludeChecks(projectIncludeChecks);
	}
	@Transactional
	public void addProjectStartDates(ProjectStartDates projectStartDates) {
		userDao.addProjectStartDates(projectStartDates);
	}
	@Transactional
	public List<ProjectIncludeChecks> getAllProjectIncludeChecks(int pid) {
		return userDao.getAllProjectIncludeChecks(pid);
	}
	@Transactional
	public void DeleteProjectIncludeChecks(int rid) {
		userDao.DeleteProjectIncludeChecks(rid);
	}
	@Transactional
	public ProjectIncludeChecks getProjectIncludeChecks(int picid) {
		return userDao.getProjectIncludeChecks(picid);
	}
	@Transactional
	public List<Projects> getProjectByPage(int pageid, int total) {
		return userDao.getProjectByPage(pageid,total);
	}
	@Transactional
	public List<Users> getUserByPage(int pageid, int total) {
		return userDao.getUserByPage(pageid,total);
	}
	@Transactional
	public List<Activities> getActivityByPage(int pageid, int total) {
		return userDao.getActivityByPage(pageid,total);
	}
	@Transactional
	public List<Categories> getCategoryByPage(int pageid, int total){
		return userDao.getCategoryByPage(pageid, total);
	}
	@Transactional
	public void addGallery(ProjectCarouselImages projectCarouselImages) {
		System.out.println("in servive gallery");
		userDao.addGallery(projectCarouselImages);
	}
	@Transactional
	public List<Applications> getApplicationByPage(int pageid, int total) {
		return userDao.getApplicationByPage(pageid,total);
	}
	@Transactional
	public List<Applications> getAllApplications() {
		return userDao.getAllApplications();
	}
	@Transactional
	public List<Cities> getCities() {
		return userDao.getCities();
	}
	@Transactional
	public List<Faq> getAllFaq(){
		return userDao.getAllFaq();
	}
	@Transactional
	public void DeleteFAQ(int pid) {
		userDao.DeleteFAQ(pid);
	}
	@Transactional
	public void addFAQ(Faq faq) {
		userDao.addFAQ(faq);
	}
	@Transactional
	public int AddCountry(Countries countries) {
		return userDao.AddCountry(countries);
	}
}
