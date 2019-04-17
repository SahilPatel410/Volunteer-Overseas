package com.volunteer.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.volunteer.model.ProjectCosts;
import com.volunteer.services.IClientService;

@RestController
public class AjaxConroller {
	@Autowired
	private IClientService clientService;
//	@ResponseBody 
	@RequestMapping("/index/ProjectCost")
	public float getcost(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		if(id==0){
			return 0;
		}else{
		ProjectCosts projectCost=clientService.getProjectCostvalue(id);
		float projectid=projectCost.getCost();
		return projectid;
		}
	}
}
