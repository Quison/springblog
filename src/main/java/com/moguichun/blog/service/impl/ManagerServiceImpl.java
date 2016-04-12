package com.moguichun.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moguichun.blog.dao.TagDetailDao;
import com.moguichun.blog.model.TagDetailVo;
import com.moguichun.blog.service.ManagerService;

@Service("ManagerService")
public class ManagerServiceImpl implements ManagerService{
	
	@Autowired
	private TagDetailDao tagDetailDao;

	@Override
	public List<TagDetailVo> getAllTagDetail() {
		return tagDetailDao.getAllTagDetail();
	}

}
