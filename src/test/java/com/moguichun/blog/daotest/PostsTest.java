package com.moguichun.blog.daotest;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.moguichun.blog.Application;
import com.moguichun.blog.dao.PostDao;
import com.moguichun.blog.model.Post;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = Application.class)
@WebAppConfiguration
public class PostsTest {
	
	@Autowired
	private PostDao postsDao;
	
	@Test
	public void testQueryAllPosts() {
		List<Post> posts = postsDao.queryAllPost();
		
		System.out.println(posts.toString());
		
		assertNotNull(posts);
	}
	
	@Test
	public void testFindPostsById() {
		Integer id = 1;
		Post post = postsDao.findPostById(id);
		System.out.println(post.toString());
		assertNotNull(post);
	}
}
