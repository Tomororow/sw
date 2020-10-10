package com.zyjz.sitemanage.service;

import java.util.List;

import com.zyjz.sitemanage.entity.EvaporateSurveySite;

public interface EvaporateSurveySiteService {
	 int deleteByPrimaryKey(String id);

	    int insert(EvaporateSurveySite record);

	    int insertSelective(EvaporateSurveySite record);

	    EvaporateSurveySite selectByPrimaryKey(String id);

	    int updateByPrimaryKeySelective(EvaporateSurveySite record);

	    int updateByPrimaryKey(EvaporateSurveySite record);
	    
	    List<EvaporateSurveySite> selectArea(List<String> record);
}
