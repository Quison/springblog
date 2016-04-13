package com.moguichun.blog.model;

import java.util.Date;

public class PostArchiveVo {

	private Date createDate;
	private Integer postCount;

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Integer getPostCount() {
		return postCount;
	}

	public void setPostCount(Integer postCount) {
		this.postCount = postCount;
	}

	@Override
	public String toString() {
		return "PostArchiveVo [createDate=" + createDate + ", postCount=" + postCount + "]";
	}

}
