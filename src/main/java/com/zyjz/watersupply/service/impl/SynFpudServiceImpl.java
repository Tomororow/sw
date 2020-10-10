package com.zyjz.watersupply.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.watersupply.dao.SynFpudMapper;
import com.zyjz.watersupply.entity.SynFpud;
import com.zyjz.watersupply.service.SynFpudService;
@Service("synFpudService")
public class SynFpudServiceImpl implements SynFpudService {
	
	@Autowired
	private SynFpudMapper synFpudMapper;

	@Override
	public int deleteByPrimaryKey(String id) {
		
		return synFpudMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(SynFpud record) {
		
		return synFpudMapper.insert(record);
	}

	@Override
	public int insertSelective(SynFpud record) {
		
		return synFpudMapper.insertSelective(record);
	}

	@Override
	public SynFpud selectByPrimaryKey(String id) {
		
		return synFpudMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(SynFpud record) {
		
		return synFpudMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(SynFpud record) {
		
		return synFpudMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<SynFpud> selectSysareaId(String id) {
		return synFpudMapper.selectSysareaId(id);
		
	}


}
