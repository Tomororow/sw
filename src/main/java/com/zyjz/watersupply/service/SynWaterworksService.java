package com.zyjz.watersupply.service;

import com.zyjz.watersupply.entity.SynWaterworks;

public interface SynWaterworksService {
	int deleteByPrimaryKey(String id);

    int insert(SynWaterworks record);

    int insertSelective(SynWaterworks record);

    SynWaterworks selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SynWaterworks record);

    int updateByPrimaryKey(SynWaterworks record);
    
    
}
