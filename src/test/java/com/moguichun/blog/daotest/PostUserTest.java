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
import com.moguichun.blog.dao.PostUserDao;
import com.moguichun.blog.model.PostUser;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = Application.class)
@WebAppConfiguration
public class PostUserTest {
	
	@Autowired
	private PostUserDao postUserDao;
	
	@Test
	public void testFindAllPostUser() {
		List<PostUser> postUsers = postUserDao.findAllPostUser();
		System.out.println(postUsers.toString());
		assertNotNull(postUsers);
	}
	
	@Test
	public void testFindPostUserById() {
		Integer id = 1;
		PostUser postUser = postUserDao.findPostUserById(id);
		System.out.println(postUser);
		assertNotNull(postUser);
	}
	
	@Test
	public void testInsertPostUser() {
		PostUser postUser = new PostUser();
		postUser.setPostId(4);
		postUser.setUserId(1);
		postUserDao.insertPostUser(postUser);
		int id = postUser.getId();
		System.out.println("id ====== " + id);
		assertTrue(id != 0);
	}
	
	@Test
	public void testUpdatePostUser() {
		PostUser postUser = new PostUser();
		postUser.setId(1);
		postUser.setPostId(3);
		postUser.setUserId(1);
		postUserDao.updatePostUser(postUser);
	}
}
