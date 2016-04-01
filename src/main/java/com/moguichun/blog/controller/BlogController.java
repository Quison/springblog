package com.moguichun.blog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.moguichun.blog.service.PostsService;
import com.moguichun.blog.service.impl.PostsServiceImpl;

@Controller
@EnableAutoConfiguration
public class BlogController {
	
	@Autowired
	private PostsService postsService;
	
	@ResponseBody
	@RequestMapping("/")
	public String home() {
		return "hello world!";
	}
	
	@RequestMapping("/post/{id}")
	public String post(@PathVariable("id") int id, Model model) {
		
		model.addAttribute("post", postsService.getPostById(id));
		
		return "post";
	}
}
