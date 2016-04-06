package com.moguichun.blog.dao;

import java.util.List;

import com.moguichun.blog.model.PostUser;

public interface PostUserDao {
	
	public List<PostUser> findAllPostUser();
	
	public PostUser findPostUserById(Integer id);
	
	public Integer insertPostUser(PostUser postUser);
	
	public void updatePostUser(PostUser postUser);
}
