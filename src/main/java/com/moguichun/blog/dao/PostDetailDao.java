package com.moguichun.blog.dao;

import java.util.List;

import com.moguichun.blog.model.Post;
import com.moguichun.blog.model.PostDetailVo;

public interface PostDetailDao {
	
	public List<PostDetailVo> getSomePostDetail(Integer offset, Integer amount);
	
	public PostDetailVo getPostDetailById(Integer postId);

}
