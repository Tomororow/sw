package com.zyjz.sitemanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.sitemanage.dao.DrivenSurveySiteMapper;
import com.zyjz.sitemanage.entity.DrivenSurveySite;
import com.zyjz.sitemanage.service.DrivenSurveySiteService;
@Service("drivenSurveySiteService")
public class DrivenSurveySiteServiceImpl implements DrivenSurveySiteService{
	
	@Autowired
	private DrivenSurveySiteMapper drivenSurveySiteMapper;

	@Override
	public int deleteByPrimaryKey(String id) {
		
		return drivenSurveySiteMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(DrivenSurveySite record) {
		
		return drivenSurveySiteMapper.insert(record);
	}

	@Override
	public int insertSelective(DrivenSurveySite record) {
		
		return drivenSurveySiteMapper.insertSelective(record);
	}

	@Override
	public DrivenSurveySite selectByPrimaryKey(String id) {
		
		return drivenSurveySiteMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(DrivenSurveySite record) {
		
		return drivenSurveySiteMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(DrivenSurveySite record) {
		
		return drivenSurveySiteMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<DrivenSurveySite> selectArea(String code) {
		
		return drivenSurveySiteMapper.selectArea(code);
	}

}
