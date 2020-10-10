package com.zyjz.site.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.site.dao.AreaRainfallStationMapper;
import com.zyjz.site.entity.AreaRainfallStation;
import com.zyjz.site.service.AreaRainfallStationService;

/**
 * @ClassName: AreaRainfallStationServiceImpl
 * @Description: 行政区域雨量站service实现类
 * @Author: zhaojx
 * @Date: 2018年3月4日 上午12:07:08
 */
@Service("areaRainfallStationService")
public class AreaRainfallStationServiceImpl implements AreaRainfallStationService {

	@Autowired
	private AreaRainfallStationMapper areaRainfallStationMapper;

	@Override
	public int deleteByPrimaryKey(String id) {
		return areaRainfallStationMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(AreaRainfallStation record) {
		return areaRainfallStationMapper.insert(record);
	}

	@Override
	public int insertSelective(AreaRainfallStation record) {
		return areaRainfallStationMapper.insertSelective(record);
	}

	@Override
	public AreaRainfallStation selectByPrimaryKey(String id) {
		return areaRainfallStationMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(AreaRainfallStation record) {
		return areaRainfallStationMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(AreaRainfallStation record) {
		return areaRainfallStationMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<AreaRainfallStation> getAreaRainfallStationInfo() {
		return areaRainfallStationMapper.getAreaRainfallStationInfo();
	}
	
}