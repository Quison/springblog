package com.moguichun.blog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.groovy.classgen.ReturnAdder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.moguichun.blog.service.ManagerService;

@Controller
@EnableAutoConfiguration
public class ManagerController {
	
	@Autowired
	@Qualifier("ManagerService")
	private ManagerService managerService;
	
	@RequestMapping("manager")
	public String manager() {
		return "manager/manager";
	}
	
	@RequestMapping(value="manager/getAllTagDetail", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, List> getAllTagDetail() {
		
		Map<String, List> map = new HashMap<>();
		map.put("tagDetails", managerService.getAllTagDetail());
		return map;
		
	}

}
