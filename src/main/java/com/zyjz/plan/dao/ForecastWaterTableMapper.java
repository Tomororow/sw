package com.zyjz.plan.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zyjz.plan.entity.ForecastWaterTable;

public interface ForecastWaterTableMapper {


    int deleteByPrimaryKey(String id);

    int insert(ForecastWaterTable record);

    int insertSelective(ForecastWaterTable record);


    ForecastWaterTable selectByPrimaryKey(String id);


    int updateByPrimaryKeySelective(ForecastWaterTable record);

    int updateByPrimaryKey(ForecastWaterTable record);
    

    ForecastWaterTable findForecastWaterTableByForecastIdAndMonth(
            @Param("forecastId") String forecastId, @Param("month") int month);
    
    ForecastWaterTable findForecastWaterTableByForecastIdAndYearAndMonth(@Param("forecastId") String forecastId, @Param("year") int year, @Param("month") int month);
    
    List<ForecastWaterTable> findForecastWaterTableByForecastId(String forecastId);
    
   
    
}