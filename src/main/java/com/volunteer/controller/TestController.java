package com.volunteer.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.volunteer.model.Activities;
import com.volunteer.model.Categories;
import com.volunteer.model.Cities;
import com.volunteer.model.Countries;
import com.volunteer.model.Faq;
import com.volunteer.model.ProjectIncludeChecks;
import com.volunteer.model.Projects;
import com.volunteer.services.IAdminService;

@RestController
public class TestController {
	
	@Autowired
	@Qualifier("objService")
	IAdminService objService;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@ResponseBody 
	@RequestMapping(value="/getCities", method=RequestMethod.POST)
	public Map getCities(ModelAndView model,HttpServletRequest req){
		int countryId=Integer.parseInt(req.getParameter("countryId"));
		List<Cities> citylst = objService.getAllCities(countryId);
		
		Map citymap = new HashMap();
		for(int i=0;i<citylst.size();i++){
			citymap.put(citylst.get(i).getId(),citylst.get(i).getName());
		}
		return citymap;
	}
	@SuppressWarnings({ "null" })
	@ResponseBody
	@RequestMapping(value="/AddCountry", method=RequestMethod.POST)
	public Countries AddCountry(@RequestParam("cname")String CountryName,@RequestParam("filedata") String CountryImageFile,@RequestParam("filename") String fileName) throws IOException{
		int i = objService.AddCountry(new Countries(CountryName,fileName));
		File imgfile = new File("D:\\Sahil\\Training\\Volunteer Overseas\\VolunteerOverseas\\src\\main\\webapp\\resources\\AdminUploads\\Images");
		byte[] bytes = Base64.getMimeDecoder().decode(CountryImageFile.split(",")[1]);  
		BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(  
		         new File(imgfile + File.separator + fileName)));
		stream.write(bytes);
	    stream.flush();  
	    stream.close();
		Countries country= objService.getCountrybyId(i);
		return country;
		/*Map countrymap= new HashMap();
		for(int i=0;i<countrylist.size();i++){
			countrymap.put(countrylist.get(i).getId(),countrylist.get(i).getName());
		}
		return countrymap;
		*///System.out.println("Controller : AddCountry : "+i);
		//return i;
	}
	@ResponseBody
	@RequestMapping("/AddGallery")
	public String AddGallery(@RequestParam("image")String name){
		/*int projectId =Integer.parseInt(request.getParameter("totalimages"));
		System.out.println(projectId);*/
		System.out.println(name);
		return name;
	}
	
	@ResponseBody
	@RequestMapping("/Gal")
	public String AdGal(@RequestParam("ie")String[] name){
		/*int projectId =Integer.parseInt(request.getParameter("totalimages"));
		System.out.println(projectId);*/
		System.out.println("IGal1");
		for(int i=0; i<name.length; i++)
			System.out.println(name[i]);
		System.out.println("IGal2");
		return "Hi";
	}
	
	@ResponseBody 
	@RequestMapping(value="/DeleteProject")
	public void DeleteProjects(@RequestParam("pid")int pid){
		objService.DeleteProject(pid);
	}
	
	@ResponseBody
	@RequestMapping(value="/EditActivity")
	public void EditActivity(HttpServletRequest req){
		System.out.print("edit Activity : ");
		int aId=Integer.parseInt(req.getParameter("pid"));
		String name = req.getParameter("name");
		System.out.println(aId);
		System.out.println(name);
		objService.addActivity(new Activities(aId,name));
	}
	
	@ResponseBody
	@RequestMapping("/DeleteActivity")
	public void DeleteActivity(@RequestParam("pid")int pid){
		objService.DeleteActivity(pid);
	}
	
	@ResponseBody
	@RequestMapping(value="/EditCategory")
	public void EditCategory(HttpServletRequest req){
		System.out.print("edit Category : ");
		int cid=Integer.parseInt(req.getParameter("pid"));
		String name = req.getParameter("name");
		System.out.println(cid);
		System.out.println(name);
		objService.addCategory(new Categories(cid,name));
	}
	
	@ResponseBody
	@RequestMapping("/DeleteCategory")
	public void DeleteCategory(@RequestParam("pid")int cid){
		objService.DeleteCategory(cid);
	}
	
	@ResponseBody
	@RequestMapping(value="addDesc",method=RequestMethod.POST)
	public ProjectIncludeChecks addDescription(@RequestParam("description")String description,@RequestParam("choose")String choose,
			@RequestParam("pid")int pid){
		Projects project = objService.getProjectbyId(pid);
		System.out.println(project.getOrganization().getProjectDetails().getClass());
		ProjectIncludeChecks projectIncludeChecks = new ProjectIncludeChecks(description,choose,project);
		objService.addProjectIncludeChecks(projectIncludeChecks);
		ProjectIncludeChecks projectIncludeChecks1 = objService.getProjectIncludeChecks(projectIncludeChecks.getId());
		System.out.println(projectIncludeChecks1.getId());
		return projectIncludeChecks1;
	
	}
	
	@ResponseBody
	@RequestMapping("removeDesc")
	public void removeDescription(@RequestParam("rid")int rid){
		objService.DeleteProjectIncludeChecks(rid);
	}
	
	@ResponseBody 
	@RequestMapping(value="/DeleteFAQ")
	public void DeleteFAQ(@RequestParam("pid")int pid){
		objService.DeleteFAQ(pid);
	}
	@ResponseBody
	@RequestMapping(value="/EditFAQ")
	public void EditFAQ(HttpServletRequest req){
		System.out.print("edit FAQ : ");
		int pid=Integer.parseInt(req.getParameter("pid"));
		String Question = req.getParameter("Question");
		String Answer = req.getParameter("Answer");
		int Sequence=Integer.parseInt(req.getParameter("Sequence"));
		System.out.println(pid);
		System.out.println(Question);
		System.out.println(Answer);
		System.out.println(Sequence);
		objService.addFAQ(new Faq(pid,Question,Answer,Sequence));
	}
	
	/*@ResponseBody
	@RequestMapping("/ProjectDetailsTest")
	public String ProjectDetails(){
		List<Projects> projectList= objService.getAllProjects();
		List<Countries> projectLocation= objService.getProjectLocation();
		String output = "";
		
		int projectsSize = projectList.size();
		if(projectsSize > 0){
			output += "<tr>"
					+ "<th>Project Name</th>"
					+ "<th>Location</th>"
				+ "</tr>";
		}
		
		
		for(int i = 0; i < projectsSize; i++){
			output += "<tr>";
				output += "<td class=\"col-right\">";
					output += projectList.get(i).getTitle();
				output += "</td>";
				output += "<td class=\"col-right\">";
					output += projectLocation.get(i).getName();
				output += "</td>";
				
				output += "<td class=\"col-right\">";
					output += "<a href=\"?pid=" + projectList.get(i).getId() + "&udid=" +   "\">Edit</a>";
				output += "</td>";
				output += "<td class=\"col-right delete\">";
					output += "<a href=\"?pid=" + projectList.get(i).getId() + "&uid=" +  "\">Delete</a>";
				output += "</td>";
			output += "</tr>";
		}
		
		return output;
	}*/
	
}
