package com.moguichun.blog.servicetest;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.moguichun.blog.Application;
import com.moguichun.blog.model.PostCreateInfo;
import com.moguichun.blog.model.PostDetailVo;
import com.moguichun.blog.service.PostService;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = Application.class)
@WebAppConfiguration
public class PostServiceTest {
	
	@Autowired
	@Qualifier("PostService")
	private PostService postService;
	
	@Test
	public void testFindPostById() {
		Integer id = 2;
		PostDetailVo postDetailVo = postService.getPostDetailById(id);
		
		System.out.println(postDetailVo.toString());
		
		assertNotNull(postDetailVo);
	}
	
	@Test
	public void testGetPostDetailByPaging() {
		List<PostDetailVo>postDetailVos = postService.getPostDetailByPaging(0, 3);
		System.out.println(postDetailVos);
	}
	
	@Test
	public void testCreatePost() {
		PostCreateInfo postCreateInfo = new PostCreateInfo();
		List<Integer> authors = new ArrayList<>();
		authors.add(1);
		authors.add(2);
		postCreateInfo.setAuthors(authors);
		
		List<String> tags = new ArrayList<>();
		tags.add("创建文章分类3");
		tags.add("创建文章分类4");
		postCreateInfo.setTags(tags);
		
		postCreateInfo.setTitle("创建文章函数全重构后测试标题");
		postCreateInfo.setContent("测试创建文章的内容等等的那里睡大觉发牢骚的开发就爱上");
		
		int postId = postService.createPost(postCreateInfo);
		System.out.println("id ========= " + postId);
	}
}
