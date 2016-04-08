package com.moguichun.blog.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.moguichun.blog.model.Post;

@Repository
public interface PostDao {
	
	public List<Post> findAllPost();
	
	public Post findPostById(Integer id);
	
	public int insertPost(Post post);
	
	public void updatePost(Post post);
	
	public Integer queryPostCount();

}
