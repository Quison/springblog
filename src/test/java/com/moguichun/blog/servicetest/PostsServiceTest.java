package com.moguichun.blog.servicetest;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.moguichun.blog.Application;
import com.moguichun.blog.model.Post;
import com.moguichun.blog.model.PostDetailVo;
import com.moguichun.blog.service.impl.PostServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = Application.class)
@WebAppConfiguration
public class PostsServiceTest {
	
	@Autowired
	private PostServiceImpl postsService;
	
	@Test
	public void testFindPostById() {
		Integer id = 1;
		PostDetailVo postDetailVo = postsService.getPostDetailById(id);
		
		System.out.println(postDetailVo.toString());
		
		assertNotNull(postDetailVo);
	}
}
