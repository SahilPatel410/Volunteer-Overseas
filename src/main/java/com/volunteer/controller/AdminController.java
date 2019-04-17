package com.volunteer.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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

@Controller
public class AdminController{
	
	@Autowired
	@Qualifier("objService")
	IAdminService objService;
	
	public void setObjService(IAdminService objAdminService) {
		this.objService = objAdminService;
	}
	
	@RequestMapping("Country")
	public ModelAndView Country(){
		List<Cities> CityList=objService.getCities();
        return new ModelAndView("Country").addObject("CityList", CityList);
	}
	@RequestMapping("/Faq")
	public ModelAndView Faq(){
		List<Faq> faq=objService.getAllFaq();
		for(int i=0;i<faq.size();i++)
			System.out.println(faq.get(i));
        return new ModelAndView("FAQListing").addObject("faq", faq);
	}

	@RequestMapping("loadAddFAQ")
	public ModelAndView loadfaq(){
		return new ModelAndView("FAQ");
	}
	@RequestMapping(value="AddFAQ", method = RequestMethod.POST)
	public String addFAQ(@RequestParam("SequenceNo") int SequenceNumber,@RequestParam("Question") String Question,
							@RequestParam("Answer")String Answer, HttpServletRequest request) throws IOException{
		objService.addFAQ(new Faq(Question,Answer,SequenceNumber));
		return "redirect:/Faq";
	}
	@RequestMapping("index1")
	public ModelAndView login(){
		//return new ModelAndView("glyicon");
		return new ModelAndView("login");
	}
	
	@RequestMapping("login")
	public String addAdminPage(@RequestParam("email")String email,@RequestParam("password")String password,HttpServletRequest request){
		Users user = objService.AuthenticateUser(email,password);
		HttpSession session = request.getSession();
		if(user!= null)
		{
			session.setAttribute("UserName", email);
			session.setAttribute("isLogIn", true);
			return "redirect:/AdminOrganization";
		}
		else
			return "login";
	}
	
	@RequestMapping("/forgetPassword")
	public ModelAndView forgotpassword(){
		return new ModelAndView("ForgetPassword");
	}

	@RequestMapping("/AdminOrganization")
	public ModelAndView ShowAdminOrganization(ModelAndView model,HttpServletRequest request){
		HttpSession session= request.getSession();
		String userName= session.getAttribute("UserName").toString();
		if(!(Boolean) session.getAttribute("isLogIn")){
			System.out.println(userName);
			return new ModelAndView("login");}
		else
		{
			List<Users> userlst =objService.getAllUsers();
			model.addObject("UserList",userlst);
			model.setViewName("AdminOrganization");
			return model;
		}
	}
	
	@RequestMapping(value="AddOrganization", method = RequestMethod.POST)
	public String addOrganization(@RequestParam("userName") int userid,@RequestParam("organizationName") String orgname,
			@RequestParam("website")String website,@RequestParam("email")String email,@RequestParam("contact") String number,
			@RequestParam("organizationdesc") String orgdesc,@RequestParam("logo") MultipartFile logo,
			@RequestParam("video") MultipartFile video) throws IOException{
		System.out.println("AdminController : User id : "+userid);
		Users user=objService.getUserById(userid);
		objService.uploadFiles(logo,video);
		String filename=logo.getOriginalFilename();
		String videoname=video.getOriginalFilename();
		objService.addOrganization(user,orgname,website,email,number,orgdesc,filename,videoname);
		return "redirect:/AdminOrganization";
	}
	
	@RequestMapping("/project")
	public ModelAndView setupForm(ModelAndView model,HttpServletRequest request){
		if(request.getParameter("id") != null){
			Projects project = objService.getProjectbyId(Integer.parseInt(request.getParameter("id")));
			model.addObject("project",project);
		}
		else{
			model.addObject("project",null);
		}
		List<Organizations> orglst= objService.getAllOraganizations();
		List<Categories> catlst=objService.getAllCategories();
		List<Activities> actlst=objService.getAllActivities();
		List<Countries> countrylst = objService.getAllCountries();
		model.addObject("organizationList",orglst);
		model.addObject("CategoriesList",catlst);
		model.addObject("ActivitiesList",actlst);
		model.addObject("CountryList",countrylst);
		model.setViewName("Project");
		return model;
	}
	
	@RequestMapping("/ProjectListing")
		public ModelAndView ProjectListing(){
		return new ModelAndView("ProjectListing","projects",objService.getAllProjects());
	}
	
	@RequestMapping(value="AddProjectDetails", method = RequestMethod.POST)
	public ModelAndView addProject(HttpServletRequest request) throws ParseException{
		int organizationId=Integer.parseInt(request.getParameter("organization_id"));
		int activityId=Integer.parseInt(request.getParameter("activity_id"));
		int categoryId =Integer.parseInt(request.getParameter("category_id"));
		String title=request.getParameter("title");
		String image=request.getParameter("image");
		int minAge=Integer.parseInt(request.getParameter("min_age"));
		int maxAge=Integer.parseInt(request.getParameter("max_age"));
		String overviewDesc=request.getParameter("overview_description");
		String accomdationDesc=request.getParameter("accomodation_description");
		String impactDesc=request.getParameter("impact_description");
		String projectVideoUrl=request.getParameter("project_video_url");
		int countryId=Integer.parseInt(request.getParameter("country_id"));
		int cityId=Integer.parseInt(request.getParameter("city_id"));
		String volunteerHouseAddress=request.getParameter("volunteer_house_address");
		String volunteerHouseDescription=request.getParameter("volunteer_house_description");
		String volunteerWorkAddress=request.getParameter("volunteer_work_address");
		String volunteerWorkDescription=request.getParameter("volunteer_work_description");
		String nearestAirportAddress=request.getParameter("nearest_airport_address");
		String costDescription=request.getParameter("cost_description");
		String projectStartdateDescription=request.getParameter("project_startdate_description");
		String isAffordable=request.getParameter("is_affordable");
		int status=Integer.parseInt(request.getParameter("status"));
		System.out.println("Inside addProject : Value Gathering Done");
		
		DateFormat date=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");  
		Calendar cal = Calendar.getInstance();
		String date1=date.format(cal.getTime());
		
		Projects project = new Projects(objService.getOrganizationbyId(organizationId),objService.getActivitybyId(activityId),
				objService.getCategorybyId(categoryId),title,image,minAge,maxAge,overviewDesc,accomdationDesc,impactDesc,
				projectVideoUrl,objService.getCountrybyId(countryId),objService.getCitybyId(cityId),volunteerHouseAddress,
				volunteerHouseDescription,volunteerWorkAddress,volunteerWorkDescription,nearestAirportAddress,costDescription,
				projectStartdateDescription,isAffordable,status,date1,date1);
		System.out.println("Inside addProject : Project Object Created");
		objService.addProjects(project);
		System.out.println("Inside addProject : Project Added");
		return new ModelAndView("ProjectGallery","project",project);
	}
	
	@RequestMapping(value="ProjectGallery", method = RequestMethod.POST)
	public ModelAndView addGallery(@RequestParam("pid")int pid,HttpServletRequest request) throws IOException{
		System.out.println("Inside addGallery : Value Gathering.....");
		Projects project = objService.getProjectbyId(pid);
		System.out.println("Inside addGallery : Value Gathering Done  && Project Object Created");
		String totalImage = request.getParameter("totalimages");
		System.out.println("Inside addGallery : ImageCount : "+totalImage);
		File imgfile = new File("D:\\Sahil\\Training\\Volunteer Overseas\\VolunteerOverseas\\src\\main\\webapp\\resources\\AdminUploads\\Images");
		int totalimages=0;
		if(totalImage!=null)
			totalimages =Integer.parseInt(request.getParameter("totalimages"));
		for(int i=0;i<totalimages;i++){
			String name=request.getParameter("totalimages"+i);
			String bytename=request.getParameter("totalimages1"+i);
			System.out.println(name);
			
			byte[] bytes = Base64.getMimeDecoder().decode(bytename.split(",")[1]);
			BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(new File(imgfile + File.separator + name)));
			stream.write(bytes);
		    stream.flush();  
		    stream.close();
		   
		    objService.addGallery(new ProjectCarouselImages(name,project));
		}
		return new ModelAndView("ProjectCost","project",project);
	}
	
	@RequestMapping(value="ProjectCost", method = RequestMethod.POST)
	public ModelAndView addCosts(ModelAndView model,@RequestParam("pid")int pid,
			@RequestParam("numberOfWeeks")int numberOfWeeks,@RequestParam("cost")float cost){
		System.out.println("Inside addCosts : Value Gathering.....");
		Projects project = objService.getProjectbyId(pid);
		System.out.println("Inside addCosts : Value Gathering Done  && Project Object Created");
		objService.addProjectCosts(new ProjectCosts(numberOfWeeks,cost,project));
		System.out.println("Inside addCosts : Project Costs Added");
		List<ProjectIncludeChecks> projectIncludeChecks= objService.getAllProjectIncludeChecks(pid);
		System.out.println("Inside addCosts : ProjectIncludeChecks gathered");
		model.addObject("project", project);
		model.addObject("projectIncludeChecks", projectIncludeChecks);
		model.setViewName("ProjectIncludes");
		return model;
	}
	
	@RequestMapping(value="ProjectIncludes", method = RequestMethod.POST)
	public ModelAndView addIncludes(@RequestParam("pid")int pid,HttpServletRequest request){
			//@RequestParam("description")String description,@RequestParam("isIncluded")String isIncluded){
		Projects project = objService.getProjectbyId(pid);
		String description = request.getParameter("description");
		String isIncluded = request.getParameter("isIncluded");
		if(isIncluded != null && description != null){
			objService.addProjectIncludeChecks(new ProjectIncludeChecks(description,isIncluded,project));
		}
		return new ModelAndView("ProjectDate","project",project);
	}
	
	@RequestMapping(value="ProjectDate", method = RequestMethod.POST)
	public ModelAndView addDates(@RequestParam("pid")int pid,@RequestParam("datepicker1")String datepicker1) throws ParseException{
		System.out.println("Inside addDates : Value Gathering.....");
		Projects project = objService.getProjectbyId(pid);
		System.out.println("Inside addDates : Value Gathering Done  && Project Object Created");
		SimpleDateFormat date= new SimpleDateFormat("MM/dd/yyyy");
		Date d=date.parse(datepicker1);
		System.out.println(d);
		objService.addProjectStartDates(new ProjectStartDates(d,project));
		System.out.println("Inside addDates : Project StartDates Added");
		return new ModelAndView("ProjectAdded");
	}
	
	@RequestMapping(value="/ProjectListing/{pageid}")  
    public ModelAndView edit(@PathVariable int pageid){  
        int total=7;
        int pi = pageid;
        System.out.println("pi = " + pi);
        if(pageid==1){}
        else{  
            pageid=(pageid-1)*total+1;  
        }  
        System.out.println(pageid);
        List<Projects> projectlist=objService.getProjectByPage(pageid,total);
        int pages = (objService.getAllProjects().size())/total;
        if(((objService.getAllProjects().size())%total) != 0.00){
        	pages += 1;
        }
        System.out.println("objService.getAllProjects().size() : "+objService.getAllProjects().size());
        System.out.println("pages : "+pages);
        System.out.println("pi again : "+pi);
        return new ModelAndView("ProjectListing").addObject("projects", projectlist).addObject("pages",pages).addObject("pi",pi);
    }
	
	@RequestMapping(value="/UserListing/{pageid}")  
    public ModelAndView UserView(@PathVariable int pageid){  
        int total=10;
        int pi = pageid;
        if(pageid==1){}
        else{  
            pageid=(pageid-1)*total+1;  
        }  
        System.out.println(pageid);
        List<Users> userlist=objService.getUserByPage(pageid,total);
        int pages = (objService.getAllUsers().size())/total;
        if(((objService.getAllUsers().size())%total) != 0.00){
        	pages += 1;
        }
        System.out.println("objService.getAllUsers().size() : "+objService.getAllUsers().size());
        System.out.println("Users pages : "+pages);
        return new ModelAndView("User").addObject("users", userlist).addObject("pages",pages).addObject("pi",pi);
    }
	
	@RequestMapping("/Category/{pageid}")
	public ModelAndView addCategoryPage(ModelAndView model,@PathVariable int pageid){
		int total=7;
		int pi = pageid;
		if(pageid==1){}
        else{  
            pageid=(pageid-1)*total+1;  
        }  
        System.out.println(pageid);
        List<Categories> categorylist=objService.getCategoryByPage(pageid,total);
        int pages = (objService.getAllCategories().size())/total;
        if(((objService.getAllCategories().size())%total) != 0.00){
        	pages += 1;
        }
        System.out.println("objService.getAllCategories().size() : "+objService.getAllCategories().size());
        System.out.println("Category pages : "+pages);
        model.addObject("pi",pi);
        model.addObject("pages",pages);
        model.addObject("CatList",categorylist);
        model.setViewName("AdminCategory");
        return model;
	}
	
	@RequestMapping("/AddCategory")
	public String addCategory(@RequestParam("category")String category,@RequestParam("page")int pageid){
		objService.addCategory(new Categories(category));
		return "redirect:/Category/"+pageid;
	}
	
	@RequestMapping("/Activity/{pageid}")
	public ModelAndView addActivityPage(ModelAndView model,@PathVariable int pageid){
		int total=7;
		int pi = pageid;
		if(pageid==1){}
        else{  
            pageid=(pageid-1)*total+1;  
        }  
        System.out.println(pageid);
        List<Activities> activitylist=objService.getActivityByPage(pageid,total);
        int pages = (objService.getAllActivities().size())/total;
        if(((objService.getAllActivities().size())%total) != 0.00){
        	pages += 1;
        }
        System.out.println("objService.getAllActivities().size() : "+objService.getAllActivities().size());
        System.out.println("Activity pages : "+pages);
        model.addObject("pi",pi);
        model.addObject("pages",pages);
        model.addObject("ActList",activitylist);
        model.setViewName("AdminActivity");
        return model;
	}
	
	@RequestMapping("/AddActivity")
	public String addActivity(@RequestParam("activity")String activity,@RequestParam("page")int pageid){
		objService.addActivity(new Activities(activity));
		return "redirect:/Activity/"+pageid;
	}
	
	@RequestMapping(value="/ApplicationListing/{pageid}")  
    public ModelAndView ApplicationView(@PathVariable int pageid){
        int total=10; 
        if(pageid==1){}
        else{  
            pageid=(pageid-1)*total+1;  
        }  
        System.out.println(pageid);
        List<Applications> applicationlist=objService.getApplicationByPage(pageid,total);
        int pages = (objService.getAllApplications().size())/total;
        if(((objService.getAllApplications().size())%total) != 0.00){
        	pages += 1;
        }
        System.out.println("objService.getAllApplications().size() : "+objService.getAllApplications().size());
        System.out.println("Applications pages : "+pages);
        return new ModelAndView("Application").addObject("applications", applicationlist).addObject("pages",pages);
    }
	
	@RequestMapping("logout")
	public ModelAndView logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.invalidate();
		return new ModelAndView("login");
	}
}
