package com.moguichun.blog.dao;

import java.util.List;

import com.moguichun.blog.model.User;

public interface UserDao {

	public List<User> findAllUser();

	public User findUserById(Integer id);

	public Integer insertUser(User user);

	public void updateUser(User user);
	
	public User findUserByUsername(String username);
	
}
