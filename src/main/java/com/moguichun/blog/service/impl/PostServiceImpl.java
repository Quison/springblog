package com.moguichun.blog.service.impl;

import java.util.List;

import org.pegdown.Extensions;
import org.pegdown.PegDownProcessor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moguichun.blog.dao.PostDao;
import com.moguichun.blog.dao.PostDetailDao;
import com.moguichun.blog.dao.PostTagDao;
import com.moguichun.blog.dao.TagDao;
import com.moguichun.blog.dao.TagDetailDao;
import com.moguichun.blog.dao.UserDao;
import com.moguichun.blog.model.Post;
import com.moguichun.blog.model.PostArchiveVo;
import com.moguichun.blog.model.PostCreateInfo;
import com.moguichun.blog.model.PostDetailVo;
import com.moguichun.blog.model.PostTag;
import com.moguichun.blog.model.Tag;
import com.moguichun.blog.model.TagDetailVo;
import com.moguichun.blog.model.User;
import com.moguichun.blog.service.PostService;

@Service("PostService")
@Transactional
public class PostServiceImpl implements PostService {

	@Autowired
	private TagDao tagDao;

	@Autowired
	private PostDao postDao;

	@Autowired
	private PostDetailDao postDetailDao;

	@Autowired
	private PostTagDao postTagDao;

	@Autowired
	private TagDetailDao tagDetailDao;
	
	@Override
	public PostDetailVo getPostDetailById(Integer id) {
		return postDetailDao.getPostDetailById(id);
	}

	@Override
	public List<PostDetailVo> getPostDetailByPaging(Integer start, Integer offset) {
		List<PostDetailVo> postDetailVos = postDetailDao.getPostDetailByPaging(start, offset);
		if (postDetailVos == null || postDetailVos.size() == 0) {
			return null;
		}
		return postDetailVos;
	}

	@Override
	public Integer createPost(PostCreateInfo postCreateInfo) {
		Post post = insertPost(postCreateInfo);
		int postId = post.getId();
		insertTags(postId, postCreateInfo.getTags());
		return postId;
	}

	private Post insertPost(PostCreateInfo postCreateInfo) {
		Post post = new Post();
		post.setTitle(postCreateInfo.getTitle());
		post.setContent(postCreateInfo.getContent());
		post.setRenderContent(postCreateInfo.getRenderContent());
		postDao.insertPost(post);
		return post;
	}

	/**
	 * 
	 * @Title: insertTags
	 * @Description: 遍历插入标签 
	 * @param postId
	 * @param tagNames
     * @return void 
     * @throws
	 */
	private void insertTags(int postId, List<String> tagNames) {
		for (String tagName : tagNames) {
			int tagId = tagDao.findTagIdByTagName(tagName);
			if (tagId == 0) {
				Tag tag = new Tag();
				tag.setTagName(tagName);
				tagDao.insertTag(tag);
				tagId = tag.getId();
			}
			PostTag postTag = new PostTag();
			postTag.setPostId(postId);
			postTag.setTagId(tagId);
			postTagDao.insertPostTag(postTag);
		}
	}

	@Override
	public Integer getPostCount() {
		return postDao.queryPostCount();
	}

	@Override
	public List<PostArchiveVo> getPostArchives() {
		return postDao.getPostArchives();
	}
	
	@Override
	public List<TagDetailVo> getAllTagDetail() {
		return tagDetailDao.getAllTagDetail();
	}

}
