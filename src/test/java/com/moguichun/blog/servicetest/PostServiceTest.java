package com.moguichun.blog.servicetest;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.moguichun.blog.Application;
import com.moguichun.blog.model.PostDetailVo;
import com.moguichun.blog.service.PostService;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = Application.class)
@WebAppConfiguration
public class PostServiceTest {
	
	@Autowired
	@Qualifier("PostService")
	private PostService postsService;
	
	@Test
	public void testFindPostById() {
		Integer id = 2;
		PostDetailVo postDetailVo = postsService.getPostDetailById(id);
		
		System.out.println(postDetailVo.toString());
		
		assertNotNull(postDetailVo);
	}
	
	@Test
	public void testGetPostDetailByPaging() {
		List<PostDetailVo>postDetailVos = postsService.getPostDetailByPaging(0, 3);
		System.out.println(postDetailVos);
	}
}
