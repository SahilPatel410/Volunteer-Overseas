package com.volunteer.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.volunteer.model.Activities;
import com.volunteer.model.Categories;
import com.volunteer.model.Faq;
import com.volunteer.model.ProjectCarouselImages;
import com.volunteer.model.ProjectCosts;
import com.volunteer.model.ProjectIncludeChecks;
import com.volunteer.model.Projects;
import com.volunteer.services.IClientService;

@Controller
public class HomeController {
	
	@Autowired
	private IClientService clientService;
	
	@RequestMapping("contact")
	public ModelAndView contact_us(HttpServletRequest request){
		return new ModelAndView("contact_us");
	}
	
	@RequestMapping("work")
	public ModelAndView work()
	{
		return new ModelAndView("Work");
	}
	
	@RequestMapping("savecontact")
	public String saveContact(HttpServletRequest request){
		String name = request.getParameter("name");
		String mail = request.getParameter("mail");
		String message = request.getParameter("message");
		clientService.AddInquiry(name,mail,message);
		return "redirect:/contact";
	}
	
	@RequestMapping("faq")
	public ModelAndView faq(){
		List<Faq> faq = clientService.getAllFaq();
		return new ModelAndView("faq1").addObject("faq",faq).addObject("faqcount",faq.size());
	}
	
	@SuppressWarnings({ "unused", "unchecked", "rawtypes" })
	@RequestMapping("homepage")
	public ModelAndView home(){
		List<Categories> categories=clientService.getAllCategories();
		List<Activities> activities=clientService.getAllActivities();
		List<Projects> projectsTrending=clientService.getAllTrendingProjects();
		List<Projects> projectsMostAffordable = clientService.getAllAffordableProjects();
		List<Projects> projectFeaturedest = clientService.getAllFeatureDest();
		List<Integer> costProjectId = clientService.getAllAffordableCost(projectsMostAffordable);
		List<ProjectCosts> affordablecosts= clientService.getAllAffordableCostById(costProjectId);
		List<Integer> costId = clientService.getAllAffordableCost(projectsMostAffordable);
		List<ProjectCosts> Trendingcosts= clientService.getAllAffordableCostById(costId);
		List <Integer> getTotalProjects= new ArrayList();
		for(int i=0;i<projectFeaturedest.size();i++){
			int CountryId=projectFeaturedest.get(i).getCountry().getId();
			 int Totalcountry = clientService.getbyCountryId(CountryId);
			 getTotalProjects.add(Totalcountry);
		}
		return new ModelAndView("home").addObject("categories",categories)
				.addObject("activities",activities).addObject("projectsTrending",Trendingcosts)
				.addObject("projectsMostAffordable",affordablecosts)
				.addObject("projectFeaturedest", projectFeaturedest).addObject("PIN", getTotalProjects);
	}
	
	@RequestMapping("search_result/{pageid}")
	public ModelAndView search_result(HttpServletRequest request,@PathVariable int pageid){
		int total=6;
		int pi = pageid;
        if(pageid==1){}
        else{  
            pageid=(pageid-1)*total+1;  
        } 
		String Country=request.getParameter("searchbar-location");
		String Activity=request.getParameter("searchbar-activity");
		String Category=request.getParameter("searchbar-category");
		List<Categories> categories=clientService.getAllCategories();
		List<Activities> activities=clientService.getAllActivities();
		List<Projects> projects=clientService.getProjectByFilter(Category,Country,Activity);
		int size = projects.size();
		if(size == 0){
			int pages=0;
			return new ModelAndView("search_result","location",Country)
					.addObject("categories", categories).addObject("activities",activities)
					.addObject("activity",Activity)	
					.addObject("category",Category).addObject("size", size).addObject("pi", pi).
					addObject("pages",pages);
		}
		else{
			List<Integer> costProjectId = clientService.getAllAffordableCost(projects);
			List<ProjectCosts> costs= clientService.getAllAffordableCostById(costProjectId);
			List<ProjectCosts> pagination = clientService.getPageResults(costProjectId,pageid,total);
			int pages = (costs.size())/total;
	        if((costs.size()%total) != 0.00){
	        	pages += 1;
	        }
			size = costs.size();
			return new ModelAndView("search_result","location",Country)
				.addObject("categories", categories).addObject("activities",activities)
				.addObject("projects", pagination).addObject("activity",Activity)
				.addObject("category",Category).addObject("size", size).addObject("pi", pi).
				 addObject("pages",pages);
		}
	}
	@RequestMapping("search_FeaturResult/{pageid}")
	public ModelAndView featureResults(HttpServletRequest request,@PathVariable int pageid){
		int total=6;
		int pi = pageid;
        if(pageid==1){}
        else{  
            pageid=(pageid-1)*total+1;  
        } 
		int CountryId = Integer.parseInt(request.getParameter("countryId"));
		List<Projects> getProjectByCountry = clientService.getProjectByCountry(CountryId);
		List<Integer> costProjectId = clientService.getAllAffordableCost(getProjectByCountry);
		List<ProjectCosts> costs= clientService.getAllAffordableCostById(costProjectId);
		List<ProjectCosts> pagination = clientService.getPageResults(costProjectId,pageid,total);
		int pages = (costs.size())/total;
        if((costs.size()%total) != 0.00){
        	pages += 1;
        }
		int size = costs.size();
		return new ModelAndView("FeatureDestinationProjects","projects",pagination).addObject("size", size)
				.addObject("pi", pi).addObject("pages",pages).addObject("CountryId",CountryId);
	}
	
	@RequestMapping("/moreFilter/{pageid}")
	public ModelAndView moreFilters(HttpServletRequest request,Model modal,@PathVariable int pageid) throws ParseException{
		int total=6;
		int pi = pageid;
        if(pageid==1){}
        else{  
            pageid=(pageid-1)*total+1;  
        } 
		String month=request.getParameter("month");
		String day=request.getParameter("day");
		String year=request.getParameter("year");
		String lmonth=request.getParameter("lmonth");
		String lday=request.getParameter("lday");
		String lyear=request.getParameter("lyear");
		String modelcategory = request.getParameter("searchbar-category");
		String modellocation = request.getParameter("searchbar-location");
		String modelactivity = request.getParameter("searchbar-activity");
		String range = request.getParameter("amount");
		String startdate= year+"-"+ month+"-"+ day;
		String startdate2= lyear+"-"+ lmonth+"-"+ lday;
	    int minage = Integer.parseInt(request.getParameter("minage"));
	    List<Categories> categories=clientService.getAllCategories();
		List<Activities> activities=clientService.getAllActivities();
		List<Projects> projects=clientService.getProjectByFilter(modelcategory,modellocation,modelactivity,startdate,startdate2,range,minage);
	    if(projects == null){
	    	String size = "No";
	    	int pages=0;
	    	return new ModelAndView("search_result","size",size).
					addObject("location",modellocation).                            
					addObject("category",modelcategory).
					addObject("activity",modelactivity).
					addObject("categories",categories).
					addObject("activities",activities).addObject("pi", pi).
					addObject("pages",pages);
	    }else{ 
	    List<Integer> costProjectId = clientService.getAllAffordableCost(projects);
	    	if(costProjectId.size()!=0){
	    		List<ProjectCosts> costs= clientService.getAllAffordableCostById(costProjectId); 
	    		List<ProjectCosts> pagination = clientService.getPageResults(costProjectId,pageid,total);
	    		int pages = (costs.size())/total;
	            if((costs.size()%total) != 0.00){
	            	pages += 1;
	            }
	    		int size = costs.size();
			return new ModelAndView("search_result","projects",pagination).
					addObject("location",modellocation).                            
					addObject("category",modelcategory).
					addObject("activity",modelactivity).
					addObject("categories",categories).
					addObject("activities",activities).
					addObject("size", size).addObject("pi", pi).addObject("pages",pages);
	    	}else{
	    		String size = "No";
	    		int pages = 0;
		    	return new ModelAndView("search_result","size",size).
						addObject("location",modellocation).                            
						addObject("category",modelcategory).
						addObject("activity",modelactivity).
						addObject("categories",categories).
						addObject("activities",activities).addObject("pi", pi).
						addObject("pages",pages);
	    	}
	    }
	}
	@RequestMapping("signup")
	public ModelAndView apply_now(HttpServletRequest request) throws ParseException{
		int projectid=Integer.parseInt(request.getParameter("projectid"));
		String cost=request.getParameter("projectCost");
		String weeks=request.getParameter("projectWeeks");
		String Fullname = request.getParameter("Full_name");
		String sDate1=request.getParameter("datepicker1");
		Date date=(Date) new SimpleDateFormat("dd/MM/yyyy").parse(sDate1);
		int duration = Integer.parseInt(request.getParameter("dur1"));
		int phone = Integer.parseInt(request.getParameter("phone"));
		String email = request.getParameter("mail");
		clientService.addApp(Fullname,date,duration,phone,email,projectid);
		return new ModelAndView("redirect:/index","id",projectid)
				.addObject("cost",cost).addObject("weeks",weeks);
	}
	@RequestMapping("index")
	public ModelAndView project(HttpServletRequest request){
		int projectid=Integer.parseInt(request.getParameter("id"));
		String cost=request.getParameter("cost");
		String weeks=request.getParameter("weeks");
		Projects project=clientService.getProjectById(projectid);
		List<ProjectIncludeChecks> isInclude=clientService.getAllIncluded(projectid);
		List<ProjectIncludeChecks> isNotInclude=clientService.getAllNotIncluded(projectid);
		List<ProjectCosts> projectDuration = clientService.getProjectCost(projectid);												
		List<ProjectCarouselImages> gallery = clientService.getViewPhotoes(projectid);
		return new ModelAndView("index").addObject("project",project)
				.addObject("included",isInclude).addObject("notincluded",isNotInclude)
				.addObject("projectDurationCost",projectDuration).addObject("cost",cost)
				.addObject("weeks", weeks).addObject("gallery",gallery);
	}
	
}
