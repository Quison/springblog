package com.moguichun.blog.service;

import java.util.List;

import com.moguichun.blog.model.PostArchiveVo;
import com.moguichun.blog.model.PostCreateInfo;
import com.moguichun.blog.model.PostDetailVo;
import com.moguichun.blog.model.TagDetailVo;

public interface PostService {

	public PostDetailVo getPostDetailById(Integer id);
	
	public List<PostDetailVo> getPostDetailByPaging(Integer start, Integer offset);
	
	public Integer createPost(PostCreateInfo postCreateInfo);
	
	public Integer getPostCount();
	
	public List<PostArchiveVo> getPostArchives();
	
	public List<TagDetailVo> getAllTagDetail();

}
