package com.moguichun.blog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moguichun.blog.dao.PostDao;
import com.moguichun.blog.model.Post;
import com.moguichun.blog.service.PostsService;

@Service
public class PostsServiceImpl implements PostsService {

	@Autowired
	private PostDao postDao;

	@Override
	public Post getPostById(Integer id) {
		return postDao.findPostById(id);
	}

}
