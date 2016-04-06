package com.moguichun.blog.daotest;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.omg.CORBA.PRIVATE_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.moguichun.blog.Application;
import com.moguichun.blog.dao.PostTagDao;
import com.moguichun.blog.model.PostTag;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = Application.class)
@WebAppConfiguration
public class PostTagTest {
	
	@Autowired
	private PostTagDao postTagDao;
	
	@Test
	public void testFindAllPostTag() {
		List<PostTag> postTags = postTagDao.findAllPostTag();
		System.out.println(postTags.toString());
		assertNotNull(postTags);
	}
	
	@Test
	public void testFindPostTagById() {
		Integer id = 1;
		PostTag postTag = postTagDao.findPostTagById(id);
		System.out.println(postTag);
		assertNotNull(postTag);
	}
	
	@Test
	public void testInsertPostTag() {
		PostTag postTag = new PostTag();
		postTag.setPostId(2);
		postTag.setTagId(1);
		postTagDao.insertPostTag(postTag);
		int id = postTag.getId();
		System.out.println("id ======= " + id);
		assertTrue(id != 0);
	}
	
	@Test
	public void testUpdatePostTag() {
		PostTag postTag = new PostTag();
		postTag.setId(2);
		postTag.setPostId(4);
		postTag.setTagId(1);
		postTagDao.updatePostTag(postTag);
	}

}
