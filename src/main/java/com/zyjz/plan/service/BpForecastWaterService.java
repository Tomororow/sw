package com.zyjz.plan.service;

import com.zyjz.plan.entity.BpForecastWater;

public interface BpForecastWaterService {

	int deleteByPrimaryKey(String id);

    int insert(BpForecastWater record);

    int insertSelective(BpForecastWater record);

    BpForecastWater selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(BpForecastWater record);

    int updateByPrimaryKey(BpForecastWater record);
}
