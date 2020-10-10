package com.zyjz.sysmanage.service;

import java.math.BigDecimal;
import java.util.List;

import com.zyjz.sysmanage.entity.CanalFlowHight;

public interface CanalFlowHightService {
	
	public int addCanalFlowHight(CanalFlowHight canalFlowHight);
	
	List<CanalFlowHight> findCanalFlowHightsByWaterSiteId(String waterSiteId);
	
	 List<CanalFlowHight> selectIdList(List<String> id);
	 
	 int insertSelective(CanalFlowHight record);
	 
	 int updateByPrimaryKeySelective(CanalFlowHight record);

	List<CanalFlowHight> findInfoByWaterSiteIdAndLevel( String waterSiteId, BigDecimal waterLevel);
}
