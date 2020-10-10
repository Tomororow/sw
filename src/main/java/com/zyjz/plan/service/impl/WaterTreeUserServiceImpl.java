package com.zyjz.plan.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.plan.dao.WaterTreeUserMapper;
import com.zyjz.plan.entity.WaterTreeUser;
import com.zyjz.plan.service.WaterTreeUserService;
@Service("waterTreeUserService")
public class WaterTreeUserServiceImpl implements WaterTreeUserService {
	
	@Autowired
	private WaterTreeUserMapper waterTreeUserMapper;

	@Override
	public int deleteByPrimaryKey(String id) {
		
		return waterTreeUserMapper.deleteByPrimaryKey(id);
	}
	@Override
	public int insert(WaterTreeUser record) {
		
		return waterTreeUserMapper.insert(record);
	}
	@Override
	public int insertSelective(WaterTreeUser record) {
		
		return waterTreeUserMapper.insertSelective(record);
	}
	@Override
	public WaterTreeUser selectByPrimaryKey(String id) {
		
		return waterTreeUserMapper.selectByPrimaryKey(id);
	}
	@Override
	public int updateByPrimaryKeySelective(WaterTreeUser record) {
		
		return waterTreeUserMapper.updateByPrimaryKeySelective(record);
	}
	@Override
	public int updateByPrimaryKey(WaterTreeUser record) {
		
		return waterTreeUserMapper.updateByPrimaryKey(record);
	}
	@Override
	public List<WaterTreeUser> selectAll() {
		return waterTreeUserMapper.selectAll();
	}
	@Override
	public List<WaterTreeUser> selectParentId(String parentId) {
		return waterTreeUserMapper.selectParentId(parentId);
	}
	@Override
	public WaterTreeUser selectMin() {
		return waterTreeUserMapper.selectMin();
	}
	@Override
	public List<WaterTreeUser> selectByAllId(String Id) {
		return waterTreeUserMapper.selectByAllId(Id);
	}
	@Override
	public WaterTreeUser selectTreeName(String treeName) {
		return waterTreeUserMapper.selectTreeName(treeName);
	}

	

}
