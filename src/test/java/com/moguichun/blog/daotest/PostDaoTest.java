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
import com.moguichun.blog.model.PostArchiveVo;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = Application.class)
@WebAppConfiguration
public class PostDaoTest {
	
	@Autowired
	private PostDao postDao;
	
	@Test
	public void testFindAllPosts() {
		List<Post> posts = postDao.findAllPost();	
		assertNotNull(posts);
	}
	
	@Test
	public void testFindPostsById() {
		Integer id = 1;
		Post post = postDao.findPostById(id);	
		assertNotNull(post);
	}
	
	@Test
	public void testInsertPost() {
		Post post = new Post();
		post.setTitle("插入测试标题！");
		post.setContent("插入测试内容！");
		postDao.insertPost(post);
		int id = post.getId();
		System.out.println("id ===== " + id);
		assertTrue(id != 0);
	}
	
	@Test
	public void testUpdatePost() {
		Post post = new Post();
		post.setId(2);
		post.setTitle("更改测试标题！");
		post.setContent("更改测试内容！");
		postDao.updatePost(post);
	}
	
	@Test
	public void testQueryPostCount() {
		int count = postDao.queryPostCount();
		System.out.println("count =========== " + count);
		assertTrue((count > 0) );
	}
	
	@Test
	public void testGetPostArchives() {
		List<PostArchiveVo> postArchiveVos = postDao.getPostArchives();
		System.out.println(postArchiveVos.toString());
	}
}
