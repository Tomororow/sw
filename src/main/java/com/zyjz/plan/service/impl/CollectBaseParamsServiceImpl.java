package com.zyjz.plan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.plan.dao.CollectBaseParamsMapper;
import com.zyjz.plan.entity.CollectBaseParams;
import com.zyjz.plan.service.CollectBaseParamsService;

@Service
public class CollectBaseParamsServiceImpl implements CollectBaseParamsService {

	@Autowired
	CollectBaseParamsMapper collectBaseParamsMapper;
	@Override
	public int deleteByPrimaryKey(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(CollectBaseParams record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(CollectBaseParams record) {
		// TODO Auto-generated method stub
		return collectBaseParamsMapper.insertSelective(record);
	}

	@Override
	public CollectBaseParams selectByPrimaryKey(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(CollectBaseParams record) {
		// TODO Auto-generated method stub
		return collectBaseParamsMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(CollectBaseParams record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CollectBaseParams> selectBaseInclude() {
		// TODO Auto-generated method stub
		return collectBaseParamsMapper.selectBaseInclude();
	}

	@Override
	public CollectBaseParams selectByPrimaryBaseName(String baseName) {
		// TODO Auto-generated method stub
		return collectBaseParamsMapper.selectByPrimaryBaseName(baseName);
	}

	@Override
	public CollectBaseParams selectByPrimaryBaseOne(String baseName,
			String level) {
		// TODO Auto-generated method stub
		return collectBaseParamsMapper.selectByPrimaryBaseOne(baseName, level);
	}

	@Override
	public List<CollectBaseParams> selectAll(String activeName) {
		// TODO Auto-generated method stub
		return collectBaseParamsMapper.selectAll(activeName);
	}

}
