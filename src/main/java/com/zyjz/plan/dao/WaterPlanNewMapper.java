package com.zyjz.plan.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zyjz.plan.entity.WaterPlanNew;

public interface WaterPlanNewMapper {

	
	int deleteByPrimaryKey(String id);
	
    int insert(WaterPlanNew record);

    int insertSelective(WaterPlanNew record);
    
    WaterPlanNew selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(WaterPlanNew record);

    int updateByPrimaryKey(WaterPlanNew record);
    
    List<WaterPlanNew> findWaterPlanNewByCanalCode(@Param("canalCode") String canalCode);
    
    List<WaterPlanNew> findWaterPlanNewByCanalCodeJoin(@Param("canalCode") String canalCode);
    
    public List<WaterPlanNew> findWaterPlanNewsByCanalCodeAndStartYear(
            @Param("canalCode") String canalCode, @Param("startYear") int startYear) ;

}