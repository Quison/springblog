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
import com.moguichun.blog.dao.PostDetailDao;
import com.moguichun.blog.model.Post;
import com.moguichun.blog.model.PostDetailVo;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = Application.class)
@WebAppConfiguration
public class PostDetailDaoTest {
	
	@Autowired
	private PostDetailDao postDetailDao;
	
	@Test
	public void testGetSomePostInfo() {
		List<PostDetailVo> postDetailVos = postDetailDao.getSomePostDetail(2, 5);
		System.out.println(postDetailVos);
		assertNotNull(postDetailVos);
	}
	
	@Test
	public void testGetPostDetailById() {
		PostDetailVo postDetailVo = postDetailDao.getPostDetailById(2);
		System.out.println(postDetailVo.toString());
		assertNotNull(postDetailVo);
	}
}
