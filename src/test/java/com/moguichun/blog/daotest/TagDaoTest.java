package com.moguichun.blog.daotest;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.moguichun.blog.Application;
import com.moguichun.blog.dao.TagDao;
import com.moguichun.blog.model.Tag;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = Application.class)
@WebAppConfiguration
public class TagDaoTest {
	
	@Autowired
	private TagDao tagDao;
	
	@Test
	public void testFindAllTag() {
		List<Tag> tags = tagDao.findAllTag();
		System.out.println(tags.toString());
		assertNotNull(tags);
	}
	
	@Test
	public void testFindTagById() {
		int id = 1;
		Tag tag = tagDao.findTagById(id);
		System.out.println(tag.toString());
		assertNotNull(tag);
	}
	
	@Test
	public void testInsertTag() {
		Tag tag = new Tag();
		tag.setTagName("JenKins");
		tagDao.insertTag(tag);
		int id = tag.getId();
		System.out.println("id ====== " + id);
		assertTrue(id != 0);
	}
	
	@Test
	public void testUpdateTag() {
		Tag tag = new Tag();
		tag.setId(2);
		tag.setTagName("Exception");
		tagDao.updateTag(tag);
	}
	
	@Test
	public void testFindTagIdByTagName() {
		int id = tagDao.findTagIdByTagName("Excepstion");
		System.out.println("id ========= " + id);
		assertEquals(2, id);
	}
}
