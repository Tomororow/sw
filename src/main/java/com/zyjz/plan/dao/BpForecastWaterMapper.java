package com.zyjz.plan.dao;

import com.zyjz.plan.entity.BpForecastWater;
import org.apache.ibatis.annotations.Param;

public interface BpForecastWaterMapper {


    int deleteByPrimaryKey(String id);

    int insert(BpForecastWater record);

    int insertSelective(BpForecastWater record);

    BpForecastWater selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(BpForecastWater record);

    int updateByPrimaryKey(BpForecastWater record);
    
    
}