package com.zyjz.sitemanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.sitemanage.dao.EvaporateSurveySiteMapper;
import com.zyjz.sitemanage.entity.EvaporateSurveySite;
import com.zyjz.sitemanage.service.EvaporateSurveySiteService;
@Service("evaporateSurveySite")
public class EvaporateSurveySiteServiceImpl implements EvaporateSurveySiteService {
	@Autowired
	private EvaporateSurveySiteMapper  evaporateSurveySiteMapper;
	@Override
	public int deleteByPrimaryKey(String id) {
		
		return evaporateSurveySiteMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(EvaporateSurveySite record) {
		
		return evaporateSurveySiteMapper.insert(record);
	}

	@Override
	public int insertSelective(EvaporateSurveySite record) {
		
		return evaporateSurveySiteMapper.insertSelective(record);
	}

	@Override
	public EvaporateSurveySite selectByPrimaryKey(String id) {
		
		return evaporateSurveySiteMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(EvaporateSurveySite record) {
		
		return evaporateSurveySiteMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(EvaporateSurveySite record) {
		
		return evaporateSurveySiteMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<EvaporateSurveySite> selectArea(List<String> record) {
		return evaporateSurveySiteMapper.selectArea(record);
	}

}
