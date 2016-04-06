package com.moguichun.blog.dao;

import java.util.List;

import com.moguichun.blog.model.PostTag;

public interface PostTagDao {
	
	public List<PostTag> findAllPostTag();
	
	public PostTag findPostTagById(Integer id);
	
	public int insertPostTag(PostTag postTag);
	
	public void updatePostTag(PostTag postTag);
	
}
