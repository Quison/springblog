package com.moguichun.blog.daotest;

import static org.junit.Assert.*;

import java.util.List;

import javax.sql.rowset.serial.SerialArray;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.moguichun.blog.Application;
import com.moguichun.blog.dao.UserDao;
import com.moguichun.blog.model.User;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = Application.class)
@WebAppConfiguration
public class UserDaoTest {
	
	@Autowired
	private UserDao userDao;
	
	@Test
	public void testFindAllUser() {
		List<User> users = userDao.findAllUser();
		System.out.println(users.toString());
		assertNotNull(users);
	}
	
	@Test
	public void testFindUserById() {
		User user = userDao.findUserById(1);
		System.out.println(user.toString());
		assertNotNull(user);
	}
	
	@Test
	public void testInsertUser() {
		User user = new User();
		user.setUsername("admin");
		user.setPassword("admin");
		user.setEmail("mguichun@foxmail.com");
		userDao.insertUser(user);
		int id = user.getId();
		System.out.println("id ===== " + id);
		assertTrue(id > 1);
	}
	
	@Test
	public void testUpdateUser() {
		User user = new User();
		user.setId(2);
		user.setUsername("admin");
		user.setPassword("admin");
		user.setEmail("admin@foxmail.com");
		userDao.updateUser(user);
	}
	
	@Test
	public void testFindUserByUsername() {
		User user = userDao.findUserByUsername("admin");
		System.out.println(user.toString());
	}
}
