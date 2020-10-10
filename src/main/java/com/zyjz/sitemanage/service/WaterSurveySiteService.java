package com.zyjz.sitemanage.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zyjz.sitemanage.web.WaterTreeMenu;
import com.zyjz.sitemanage.entity.WaterSurveySite;

public interface WaterSurveySiteService {
	 int deleteByPrimaryKey(String id);

	int insert(WaterSurveySite record);

	int insertSelective(WaterSurveySite record);

	WaterSurveySite selectByPrimaryKey(String id);

	int updateByPrimaryKeySelective(WaterSurveySite record);

	int updateByPrimaryKey(WaterSurveySite record);

	List<WaterSurveySite> findIdList(Long id);

	List<WaterTreeMenu> seet();

	List<WaterSurveySite> findRiverwayCoding(List<String> canalCodes);

	List<WaterSurveySite> findRiverwayCodingJoin(String canalCode);

	/**
	 * 根据新政区code查询所有
	 * @param sysAreaCodeList
	 * @return
	 */
	List<WaterSurveySite> selectArea(List<String> sysAreaCodeList);
	    
}
