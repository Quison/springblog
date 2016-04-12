package com.moguichun.blog.model;

import java.util.List;

public class PostCreateInfo {

	private String title;
	private String content;
	private String renderContent;
	private List<String> tags;
	private List<Integer> authors;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public String getRenderContent() {
		return renderContent;
	}

	public void setRenderContent(String renderContent) {
		this.renderContent = renderContent;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public List<String> getTags() {
		return tags;
	}

	public void setTags(List<String> tags) {
		this.tags = tags;
	}

	public List<Integer> getAuthors() {
		return authors;
	}

	public void setAuthors(List<Integer> authors) {
		this.authors = authors;
	}

	@Override
	public String toString() {
		return "[title=" + title + ", content=" + content + ", renderContent=" + renderContent
				+ ", tags=" + tags + ", authors=" + authors + "]";
	}

}
