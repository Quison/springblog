package com.moguichun.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moguichun.blog.dao.PostDao;
import com.moguichun.blog.dao.PostDetailDao;
import com.moguichun.blog.dao.TagDao;
import com.moguichun.blog.model.Post;
import com.moguichun.blog.model.PostCreateInfo;
import com.moguichun.blog.model.PostDetailVo;
import com.moguichun.blog.service.PostService;

@Service("PostService")
@Transactional
public class PostServiceImpl implements PostService {

	@Autowired
	private TagDao tagDao;
	private PostDao postDao;
	private PostDetailDao postDetailDao;

	@Override
	public PostDetailVo getPostDetailById(Integer id) {
		return postDetailDao.getPostDetailById(id);
	}

	@Override
	public Integer createPost(PostCreateInfo postCreateInfo) {
		Post post = new Post();
		post.setTitle(postCreateInfo.getTitle());
		post.setContent(postCreateInfo.getContent());
		postDao.insertPost(post);
		int postId = post.getId();
		
		// 遍历所有标签，标签已存在，那么直接插入past_tag表中，否则生成在插入
		List<String> tagNames = postCreateInfo.getTags();
		for(String tagName : tagNames) {
			int tagId = tagDao.findTagIdByTagName(tagName);
			if (tagId != 0) {
				// 直接插入
			} else {
				// 创建在插入
			}
		}
		
		return postId;
	}

}
