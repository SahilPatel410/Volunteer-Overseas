package com.volunteer.daoImpl;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

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

@Repository
@SuppressWarnings({"rawtypes","unchecked","resource"})
public class AdminDaoImpl implements IAdminDao{

	SessionFactory sFactory;
	
	public SessionFactory getsFactory() {
		return sFactory;
	}
	public void setsFactory(SessionFactory sFactory) {
		this.sFactory = sFactory;
	}
	
	@Transactional
	public Users AuthenticateUser(String UserName,String Password){
		Session session=this.sFactory.getCurrentSession();
		Query<Users> query=session.createQuery("from Users where email = :UserName and password = :Password");
		query.setParameter("UserName",UserName);
		query.setParameter("Password", Password);
		Users user=query.uniqueResult();
		return user;
	}
	
	public List<Organizations> getAllOraganizations() {
		Session session= sFactory.getCurrentSession();
		Query query= session.createQuery("from Organizations");
		List<Organizations> org=query.list();
		return org;
	}
	public List<Categories> getAllCategories(){
		Session session= sFactory.getCurrentSession();
		Query query= session.createQuery("from Categories");
		List<Categories> category=query.list();
		return category;
	}
	public List<Activities> getAllActivities(){
		Session session= sFactory.getCurrentSession();
		Query query= session.createQuery("from Activities");
		List<Activities> act=query.list();
		return act;
	}
	@Transactional
	public List<Users> getAllUsers() {
		Session session= sFactory.getCurrentSession();
		Query query= session.createQuery("from Users");
		List<Users> user=query.list();
		return user;
	}
	@Transactional
	public Users getUsersById(int uid) {
		Session session= sFactory.getCurrentSession();
		Query query= session.createQuery("from Users where id =:uid");
		query.setParameter("uid",uid);
		Users user=(Users) query.uniqueResult();
		return user;
	}
	@Transactional
	public Organizations getOrganizationById(int oid) {
		Session session= sFactory.getCurrentSession();
		Query query= session.createQuery("from Organizations where id =:oid");
		query.setParameter("oid",oid);
		Organizations organization=(Organizations) query.uniqueResult();
		return organization;
	}
	@Transactional
	public Activities getActivityById(int uid) {
		Session session= sFactory.getCurrentSession();
		Query query= session.createQuery("from Activities where id =:uid");
		query.setParameter("uid",uid);
		Activities activities=(Activities) query.uniqueResult();
		return activities;
	}
	@Transactional
	public Categories getCategoryById(int uid) {
		Session session= sFactory.getCurrentSession();
		Query query= session.createQuery("from Categories where id =:uid");
		query.setParameter("uid",uid);
		Categories category=(Categories) query.uniqueResult();
		return category;
	}
	@Transactional
	public Countries getCountryById(int uid) {
		Session session= sFactory.getCurrentSession();
		Query query= session.createQuery("from Countries where id =:uid");
		query.setParameter("uid",uid);
		Countries country=(Countries) query.uniqueResult();
		return country;
	}
	@Transactional
	public Cities getCityById(int uid) {
		Session session= sFactory.getCurrentSession();
		Query query= session.createQuery("from Cities where id =:uid");
		query.setParameter("uid",uid);
		Cities city=(Cities) query.uniqueResult();
		return city;
	}
	public void addOrganization(Organizations org){
		Session session=sFactory.getCurrentSession();
		session.save(org);
	}
	public void addCategory(Categories category){
		Session session=sFactory.getCurrentSession();
		session.saveOrUpdate(category);
	}
	public void addActivity(Activities activity){
		Session session=sFactory.getCurrentSession();
		session.saveOrUpdate(activity);
	}
	public void uploadFiles(MultipartFile logo, MultipartFile video) throws IOException {
		String filename = logo.getOriginalFilename();  
		String videoname=video.getOriginalFilename();
			
		File imgfile = new File("D:\\Sahil\\Training\\Volunteer Overseas\\VolunteerOverseas\\src\\main\\webapp\\resources\\AdminUploads\\Images");
		File videofile = new File("D:\\Sahil\\Training\\Volunteer Overseas\\VolunteerOverseas\\src\\main\\webapp\\resources\\AdminUploads\\Video");
        if (!imgfile.exists()) {
			if (imgfile.mkdir()) {
			    System.out.println("Directory is created!");
			} else {
			    System.out.println("Failed to create directory!");
			}
        }
        if (!videofile.exists()) {
            if (videofile.mkdir()) {
                System.out.println("Directory is created!");
            } else {
                System.out.println("Failed to create directory!");
            }
        }
	    byte[] bytes = logo.getBytes();
	    byte[] videobytes = video.getBytes();
	    BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(new File(imgfile + File.separator + filename)));
	    BufferedOutputStream stream1 =new BufferedOutputStream(new FileOutputStream(new File(videofile + File.separator + videoname)));
	    stream.write(bytes);  
	    stream1.write(videobytes);
	    stream.flush();  
	    stream.close();  
	}
	
	public List<Cities> getAllCities(int countryid) {
		Session session=sFactory.getCurrentSession();
		Query q = session.createQuery("from Cities where country_id=:countryid");
		q.setParameter("countryid", countryid);
		List<Cities> citylst=q.list();
		return citylst;
	}
	public List<Countries> getAllCountries() {
		Session session= sFactory.getCurrentSession();
		Query q = session.createQuery("from Countries");
		List<Countries> countrylst=q.list();
		return countrylst;
	}
	public void addProjects(Projects projects) {
		Session session = sFactory.getCurrentSession();
		session.save(projects);
	}
	public List<Projects> getAllProjects() {
		Session session= sFactory.getCurrentSession();
		Query query= session.createQuery("from Projects");
		List<Projects> projects=query.list();
		int i=0;
		while(projects.isEmpty()){
			System.out.println(projects.get(i));
			i++;
		}
		return projects;
	}
	public List<Countries> getProjectLocation() {
		Session session =sFactory.getCurrentSession();
		Query q = session.createQuery("select countries.id,countries.name from Countries countries INNER JOIN Projects projects ON countries.id=projects.country.id");
		List<Countries> countryList= q.list();
		return countryList;
	}	
	public void deleteProjects(int projectId) {
		Session session = sFactory.getCurrentSession();
		session.clear();
		session.createQuery("delete from Projects where id =:Id").setParameter("Id", projectId).executeUpdate();
	}
	public Projects getProjectbyID(int projectId) {
		Session session= sFactory.getCurrentSession();
		return (Projects)session.get(Projects.class, projectId);
	}
	public void DeleteActivity(int aid) {
		Session session =sFactory.getCurrentSession();
		session.delete(getActivityById(aid));
	}
	public void DeleteCategory(int cid) {
		Session session =sFactory.getCurrentSession();
		session.clear();
		session.delete(getCategoryById(cid));
	}
	public void addProjectCosts(ProjectCosts projectCosts) {
		Session session=sFactory.getCurrentSession();
		session.saveOrUpdate(projectCosts);
	}
	public void addProjectIncludeChecks(ProjectIncludeChecks projectIncludeChecks) {
		Session session=sFactory.getCurrentSession();
		session.saveOrUpdate(projectIncludeChecks);
	}
	public void addProjectStartDates(ProjectStartDates projectStartDates) {
		Session session=sFactory.getCurrentSession();
		session.saveOrUpdate(projectStartDates);
	}
	@Transactional
	public List<ProjectIncludeChecks> getAllProjectIncludeChecks(int pid){
		Session session=sFactory.getCurrentSession();
		Query q = session.createQuery("from ProjectIncludeChecks where project_id=:pid");
		q.setParameter("pid", pid);
		List<ProjectIncludeChecks> projectIncludeChecks = q.list();
		return projectIncludeChecks;
	}
	@Transactional
	public void DeleteProjectIncludeChecks(int rid) {
		Session session =sFactory.getCurrentSession();
		session.delete((ProjectIncludeChecks)session.load(ProjectIncludeChecks.class, rid));
	}
	@Transactional
	public ProjectIncludeChecks getProjectIncludeChecks(int picid) {
		Session session=sFactory.getCurrentSession();
		return (ProjectIncludeChecks)session.load(ProjectIncludeChecks.class, picid);
	}
	@Transactional
	public List<Projects> getProjectByPage(int pageid, int total) {
		Session session =sFactory.getCurrentSession();
	    Query q= session.createQuery("from Projects");
	    q.setFirstResult(pageid-1);
	    q.setMaxResults(total);
	    List<Projects> projects = q.list();
		return projects;
	}
	@Transactional
	public List<Users> getUserByPage(int pageid, int total) {
		Session session =sFactory.getCurrentSession();
	    Query q= session.createQuery("from Users");
	    q.setFirstResult(pageid-1);
	    q.setMaxResults(total);
	    List<Users> users = q.list();
		return users;
	}
	@Transactional
	public List<Activities> getActivityByPage(int pageid, int total) {
		Session session =sFactory.getCurrentSession();
	    Query q= session.createQuery("from Activities");
	    q.setFirstResult(pageid-1);
	    q.setMaxResults(total);
	    List<Activities> activity = q.list();
		return activity;
	}
	@Transactional
	public List<Categories> getCategoryByPage(int pageid, int total) {
		Session session =sFactory.getCurrentSession();
	    Query q= session.createQuery("from Categories");
	    q.setFirstResult(pageid-1);
	    q.setMaxResults(total);
	    List<Categories> category = q.list();
		return category;
	}
	@Transactional
	public List<Applications> getApplicationByPage(int pageid, int total) {
		Session session =sFactory.getCurrentSession();
		Query q= session.createQuery("from Applications");
		q.setFirstResult(pageid-1);
		q.setMaxResults(total);
		List<Applications> applications = q.list();
		return applications;
	}
	public void addGallery(ProjectCarouselImages projectCarouselImages) {
		Session session = sFactory.getCurrentSession();
		session.save(projectCarouselImages);
	}
	@Transactional
	public List<Applications> getAllApplications() {
		Session session= sFactory.getCurrentSession();
		Query query= session.createQuery("from Applications");
		List<Applications> applications=query.list();
		return applications;
	}
	@Transactional
	public List<Cities> getCities() {
		Session session= sFactory.getCurrentSession();
		Query query= session.createQuery("from Cities");
		List<Cities> cities=query.list();
		return cities;
	}
	@Transactional
	public List<Faq> getAllFaq() {
		Session session= sFactory.getCurrentSession();
		Query query= session.createQuery("from Faq");
		List<Faq> faq=query.list();
		return faq;
	}
	public void DeleteFAQ(int pid) {
		Session session =sFactory.getCurrentSession();
		session.delete((Faq)session.load(Faq.class, pid));
	}
	public void addFAQ(Faq faq) {
		Session session=sFactory.getCurrentSession();
		session.saveOrUpdate(faq);
	}
	/*public int AddCountry(Countries countries) {
		Session session =sFactory.getCurrentSession();
		Integer i = session.save(countries);
		return (int)session.saveOrUpdate(countries);
	}*/
	public int AddCountry(Countries countries) {
		Session session =sFactory.getCurrentSession();
		int i= (Integer)session.save(countries);
		return i;
	}
}
