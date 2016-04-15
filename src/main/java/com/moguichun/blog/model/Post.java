package com.moguichun.blog.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
    
public class Post {

	private Integer id;
	private String title;
	private String content;
	private String renderContent;

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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRenderContent() {
		return renderContent;
	}

	public void setRenderContent(String renderContent) {
		this.renderContent = renderContent;
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
		return "[id=" + id + ", title=" + title + ", content=" + content + ", renderContent=" + renderContent
				+ ", createDate=" + createDate + ", updateDate=" + updateDate + "]";
	}

}
