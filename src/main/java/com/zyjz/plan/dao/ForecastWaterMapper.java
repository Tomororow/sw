package com.zyjz.plan.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zyjz.plan.entity.ForecastWater;

public interface ForecastWaterMapper {


    int deleteByPrimaryKey(String id);

    int insert(ForecastWater record);

    int insertSelective(ForecastWater record);


    ForecastWater selectByPrimaryKey(String id);



    int updateByPrimaryKeySelective(ForecastWater record);

    int updateByPrimaryKey(ForecastWater record);
    
    List<ForecastWater> findAll();
    
    List<ForecastWater> findForecastWaterByCanalCode(@Param("canalCode") String canalCode);
    
  
    ForecastWater findForecastWaterByCanalCodeAndYear(@Param("canalCode") String canalCode, @Param("year") int year);
   
    
}