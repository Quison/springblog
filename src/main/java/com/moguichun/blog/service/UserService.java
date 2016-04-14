package com.moguichun.blog.service;

import com.moguichun.blog.model.User;

public interface UserService {
	
	public User findUserByUsername(String username);
	
}
