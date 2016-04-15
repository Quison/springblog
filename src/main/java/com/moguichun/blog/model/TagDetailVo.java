package com.moguichun.blog.model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler" })
public class TagDetailVo {
	
	private Integer tagId;
	private String tagName;
	private Integer postCountOfTag;
	private List<Post> postsOfTag;

	public Integer getTagId() {
		return tagId;
	}

	public void setTagId(Integer tagId) {
		this.tagId = tagId;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public Integer getPostCountOfTag() {
		return postCountOfTag;
	}

	public void setPostCountOfTag(Integer postCountOfTag) {
		this.postCountOfTag = postCountOfTag;
	}

	public List<Post> getPostsOfTag() {
		return postsOfTag;
	}

	public void setPostsOfTag(List<Post> postsOfTag) {
		this.postsOfTag = postsOfTag;
	}

	@Override
	public String toString() {
		return "TagDetailVo [tagId=" + tagId + ", tagName=" + tagName + ", postCountOfTag=" + postCountOfTag
				+ ", postsOfTag=" + postsOfTag + "]";
	}

}
