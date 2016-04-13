package com.moguichun.blog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.groovy.classgen.ReturnAdder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.moguichun.blog.service.ManagerService;
import com.moguichun.blog.service.PostService;

@Controller
@EnableAutoConfiguration
public class ManagerController {
	
	@Autowired
	@Qualifier("PostService")
	private PostService postService;
	
	@Autowired
	@Qualifier("ManagerService")
	private ManagerService managerService;
	
	@RequestMapping("manager")
	public String manager(Model model) {
		
		model.addAttribute("tagDetails", managerService.getAllTagDetail());
		model.addAttribute("postArchives", postService.getPostArchives());
		
		return "manager/manager";
	}
	

}
