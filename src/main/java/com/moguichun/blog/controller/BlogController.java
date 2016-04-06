package com.moguichun.blog.controller;

import org.pegdown.Extensions;
import org.pegdown.PegDownProcessor;
import org.pegdown.plugins.PegDownPlugins;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.moguichun.blog.model.Post;
import com.moguichun.blog.service.PostService;
import com.moguichun.blog.service.impl.PostServiceImpl;

@Controller
@EnableAutoConfiguration
public class BlogController {
	
	@Autowired
	@Qualifier("PostService")
	private PostService postService;
	
	@ResponseBody
	@RequestMapping("/")
	public String home() {
		return "hello world!";
	}
	
	@RequestMapping("/post/{id}")
	public String post(@PathVariable("id") int id, Model model) {
		Post post = postService.getPostById(id);
		
		
		PegDownProcessor pegDownProcessor = new PegDownProcessor(Extensions.ALL);
		String html = pegDownProcessor.markdownToHtml(post.getContent());
		
		model.addAttribute("post", post);
		model.addAttribute("content", html);
		
		return "markdown";
	}
}
