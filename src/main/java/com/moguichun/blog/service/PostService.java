package com.moguichun.blog.service;

import com.moguichun.blog.model.PostCreateInfo;
import com.moguichun.blog.model.PostDetailVo;

public interface PostService {

	public PostDetailVo getPostDetailById(Integer id);
	
	public Integer createPost(PostCreateInfo postCreateInfo);

}
