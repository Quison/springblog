package com.moguichun.blog.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.moguichun.blog.model.Post;

@Repository
public interface PostDao {
	
	public List<Post> queryAllPost();
	
	public Post findPostById(Integer id);

}
