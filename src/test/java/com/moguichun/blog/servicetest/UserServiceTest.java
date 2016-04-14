package com.moguichun.blog.servicetest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.moguichun.blog.Application;
import com.moguichun.blog.model.User;
import com.moguichun.blog.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = Application.class)
@WebAppConfiguration
public class UserServiceTest {
	
	@Autowired
	@Qualifier("UserService")
	private UserService userService;
	
	@Test
	public void testFindUserByUsername() {
		String username = "moguichun";
		User user = userService.findUserByUsername(username);
		System.out.println(user.toString());
	}
	
}
