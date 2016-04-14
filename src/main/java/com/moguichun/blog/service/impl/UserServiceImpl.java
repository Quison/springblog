package com.moguichun.blog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moguichun.blog.dao.UserDao;
import com.moguichun.blog.model.User;
import com.moguichun.blog.service.UserService;

@Service("UserService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;

	@Override
	public User findUserByUsername(String username) {
		return userDao.findUserByUsername(username);
	}

}
