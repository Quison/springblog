package com.moguichun.blog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moguichun.blog.dao.PostDao;
import com.moguichun.blog.model.Post;
import com.moguichun.blog.service.PostService;

@Service("PostService")
public class PostServiceImpl implements PostService {

	@Autowired
	private PostDao postDao;

	@Override
	public Post getPostById(Integer id) {
		return postDao.findPostById(id);
	}

}
