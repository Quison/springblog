package com.moguichun.blog.dao;

import java.util.List;

import com.moguichun.blog.model.Tag;

public interface TagDao {

	public List<Tag> findAllTag();

	public Tag findTagById(Integer id);
	
	public Integer findTagIdByTagName(String tagName);

	public Integer insertTag(Tag tag);

	public void updateTag(Tag tag);

}
