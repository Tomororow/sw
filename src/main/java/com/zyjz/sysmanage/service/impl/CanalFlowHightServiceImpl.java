package com.zyjz.sysmanage.service.impl;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.sysmanage.dao.CanalFlowHightMapper;
import com.zyjz.sysmanage.entity.CanalFlowHight;
import com.zyjz.sysmanage.service.CanalFlowHightService;

@Service("CanalFlowHightService")
public class CanalFlowHightServiceImpl implements CanalFlowHightService {
	
	@Autowired
	CanalFlowHightMapper canalFlowHightMapper;

	@Override
	public int addCanalFlowHight(CanalFlowHight canalFlowHight) {
		return canalFlowHightMapper.insertSelective(canalFlowHight);
	}

	@Override
	public List<CanalFlowHight> findCanalFlowHightsByWaterSiteId(
			String waterSiteId) {
		return canalFlowHightMapper.findCanalFlowHightsByWaterSiteId(
				waterSiteId) ;
	}

	@Override
	public List<CanalFlowHight> selectIdList(List<String> id) {
		return canalFlowHightMapper.selectIdList(id);
	}

	@Override
	public int insertSelective(CanalFlowHight record) {
		return canalFlowHightMapper.insertSelective(record);
	}
	
	@Override
	public int updateByPrimaryKeySelective(CanalFlowHight record) {
		return canalFlowHightMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public List<CanalFlowHight> findInfoByWaterSiteIdAndLevel(String waterSiteId, BigDecimal waterLevel) {
		return canalFlowHightMapper.findInfoByWaterSiteIdAndLevel(waterSiteId,waterLevel);
	}

}
