package com.moguichun.blog.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PostTag {

	private Integer id;
	private Integer postId;
	private Integer tagId;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createDate;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updateDate;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getPostId() {
		return postId;
	}

	public void setPostId(Integer postId) {
		this.postId = postId;
	}

	public Integer getTagId() {
		return tagId;
	}

	public void setTagId(Integer tagId) {
		this.tagId = tagId;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@Override
	public String toString() {
		return "PostTag [id=" + id + ", postId=" + postId + ", tagId=" + tagId + ", createDate=" + createDate
				+ ", updateDate=" + updateDate + "]";
	}

}
