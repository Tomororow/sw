package com.zyjz.plan.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.plan.dao.BpForecastWaterMapper;
import com.zyjz.plan.entity.BpForecastWater;
import com.zyjz.plan.service.BpForecastWaterService;

@Service("bpForecastWaterService")
public class BpForecastWaterServiceImpl implements BpForecastWaterService {

	@Autowired
	private BpForecastWaterMapper bpForecastWaterMapper;
	
	@Override
	public int deleteByPrimaryKey(String id) {
		return bpForecastWaterMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(BpForecastWater record) {
		return bpForecastWaterMapper.insert(record);
	}

	@Override
	public int insertSelective(BpForecastWater record) {
		return bpForecastWaterMapper.insertSelective(record);
	}

	@Override
	public BpForecastWater selectByPrimaryKey(String id) {
		return bpForecastWaterMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(BpForecastWater record) {
		return bpForecastWaterMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(BpForecastWater record) {
		return bpForecastWaterMapper.updateByPrimaryKey(record);
	}

}
