package com.zyjz.sitemanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.sitemanage.dao.MoistureSurveySiteMapper;
import com.zyjz.sitemanage.entity.MoistureSurveySite;
import com.zyjz.sitemanage.service.MoistureSurveySiteService;
@Service("moistureSurveySiteService")
public class MoistureSurveySiteServiceImpl implements MoistureSurveySiteService {

	@Autowired
	private MoistureSurveySiteMapper moistureSurveySiteMapper;
	@Override
	public int deleteByPrimaryKey(String id) {
		
		return moistureSurveySiteMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(MoistureSurveySite record) {
		
		return moistureSurveySiteMapper.insert(record);
	}

	@Override
	public int insertSelective(MoistureSurveySite record) {
		
		return moistureSurveySiteMapper.insertSelective(record);
	}

	@Override
	public MoistureSurveySite selectByPrimaryKey(String id) {
		
		return moistureSurveySiteMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(MoistureSurveySite record) {
		
		return moistureSurveySiteMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(MoistureSurveySite record) {
		
		return moistureSurveySiteMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<MoistureSurveySite> selectArea(List<String> record) {
		
		return moistureSurveySiteMapper.selectArea(record);
	}

}
