package com.moguichun.blog.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.moguichun.blog.model.User;
import com.moguichun.blog.service.UserService;

@Controller
@EnableAutoConfiguration
public class LoginController {
	
	@Autowired
	@Qualifier("UserService")
	private UserService userService;
	
	@RequestMapping(value="/manager/login")
	public String loginPage() {
		return "manager/login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView login(String username, String password, HttpSession session) {
		User user = userService.findUserByUsername(username);
		
		// 用户不存在
		if((null == user) || !(user.getPassword().equals(password))) {
			return new ModelAndView("manager/login","error","用户名或密码错误!");
		} else {
			session.setAttribute("userId", user.getId());
			session.setAttribute("username", user.getUsername());
		}
		
		return new ModelAndView("manager/manager", "user", user);
	}
	
}
