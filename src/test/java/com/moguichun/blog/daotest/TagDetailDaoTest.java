package com.moguichun.blog.daotest;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.moguichun.blog.Application;
import com.moguichun.blog.dao.TagDetailDao;
import com.moguichun.blog.model.TagDetailVo;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = Application.class)
@WebAppConfiguration
public class TagDetailDaoTest {
	
	@Autowired
	private TagDetailDao tagDetailDao;
	
	@Test
	public void testGetAllTagDetail() {
		List<TagDetailVo> tagDetailVos = tagDetailDao.getAllTagDetail();
		System.out.println(tagDetailVos.toString());
	}
}
