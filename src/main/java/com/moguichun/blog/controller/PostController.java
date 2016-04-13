package com.moguichun.blog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.moguichun.blog.model.PostCreateInfo;
import com.moguichun.blog.model.PostDetailVo;
import com.moguichun.blog.service.ManagerService;
import com.moguichun.blog.service.PostService;


@Controller
@EnableAutoConfiguration
public class PostController {

	@Autowired
	@Qualifier("PostService")
	private PostService postService;
	
	@Autowired
	@Qualifier("ManagerService")
	private ManagerService managerService;
	
	@RequestMapping(value="/")
	public String index(Model model) {
		// 首页显示5篇文章
		List<PostDetailVo> postDetailVos = postService.getPostDetailByPaging(0, 5);
		int postCount = postService.getPostCount();
		model.addAttribute("postDetailVos",postDetailVos);
		model.addAttribute("postCount", postCount);
		model.addAttribute("tagDetails", managerService.getAllTagDetail());
		model.addAttribute("postArchives", postService.getPostArchives());
		return "home/index";
	}

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
	@ResponseBody
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
	@RequestMapping(value="/post/create", method=RequestMethod.POST)
	public String createPost(PostCreateInfo postCreateInfo, HttpServletRequest request) {
		System.out.println(postCreateInfo.toString());
		int postId = postService.createPost(postCreateInfo);
		return "/post/show/" + postId;
	}

}
