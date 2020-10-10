package com.zyjz.watersupply.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.watersupply.dao.SynWaterworksMapper;
import com.zyjz.watersupply.entity.SynWaterworks;
import com.zyjz.watersupply.service.SynWaterworksService;
@Service("synWaterworks")
public class SynWaterworksServiceImpl implements SynWaterworksService {
	
	@Autowired
	private SynWaterworksMapper synWaterworksMapper;

	@Override
	public int deleteByPrimaryKey(String id) {
		
		return synWaterworksMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(SynWaterworks record) {
		
		return synWaterworksMapper.insert(record);
	}

	@Override
	public int insertSelective(SynWaterworks record) {
		
		return synWaterworksMapper.insertSelective(record);
	}

	@Override
	public SynWaterworks selectByPrimaryKey(String id) {
		
		return synWaterworksMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(SynWaterworks record) {
		
		return synWaterworksMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(SynWaterworks record) {
		
		return synWaterworksMapper.updateByPrimaryKey(record);
	}

}
