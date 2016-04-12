package com.moguichun.blog.model;

public class TagDetailVo {

	private Integer tagId;
	private String tagName;
	private Integer postCountOfTag;

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

	@Override
	public String toString() {
		return "TagDetailVo [tagId=" + tagId + ", tagName=" + tagName + ", postCountOfTag=" + postCountOfTag + "]";
	}

}
