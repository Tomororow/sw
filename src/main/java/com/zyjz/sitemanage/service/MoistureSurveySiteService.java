package com.zyjz.sitemanage.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.zyjz.sitemanage.entity.MoistureSurveySite;

public interface MoistureSurveySiteService {
	
	 	int deleteByPrimaryKey(String id);

	    int insert(MoistureSurveySite record);

	    int insertSelective(MoistureSurveySite record);

	    MoistureSurveySite selectByPrimaryKey(String id);

	    int updateByPrimaryKeySelective(MoistureSurveySite record);

	    int updateByPrimaryKey(MoistureSurveySite record);
	    
	    List<MoistureSurveySite> selectArea(List<String> record);
}
