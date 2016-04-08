package com.moguichun.blog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.moguichun.blog.model.PostDetailVo;
import com.moguichun.blog.service.PostService;

@Controller
@EnableAutoConfiguration
public class PostController {

	@Autowired
	@Qualifier("PostService")
	private PostService postService;

	/**
	 * 
	 * @Title: showPost
	 * @Description: 根据Id显示某篇文章
	 * @param id
	 * @param model
	 * @return   
	 * @return String   
	 * @throws
	 */
	@RequestMapping(value="/post/show/{id}", method=RequestMethod.GET)
	public String showPost(@PathVariable("id") int id, Model model) {
		PostDetailVo postDetailVo = postService.getPostDetailById(id);
		model.addAttribute("postDetailVo", postDetailVo);
		return "post";
	}
	
	/**
	 * 
	 * @Title: createPost
	 * @Description: 跳转到文章创建页面
	 * @return   
	 * @return String   
	 * @throws
	 */
	@RequestMapping(value="/post/create", method=RequestMethod.GET)
	public String createPost() {
		return "create";
	}

}