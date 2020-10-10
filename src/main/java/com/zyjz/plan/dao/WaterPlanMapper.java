package com.zyjz.plan.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zyjz.plan.entity.WaterPlan;

public interface WaterPlanMapper {

	
	int deleteByPrimaryKey(String id);
	
    int insert(WaterPlan record);

    int insertSelective(WaterPlan record);
    
    WaterPlan selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(WaterPlan record);

    int updateByPrimaryKey(WaterPlan record);
    
    List<WaterPlan> findWaterPlanByCanalCode(@Param("canalCode") String canalCode);
    
    List<WaterPlan> findWaterPlanByCanalCodeJoin(@Param("canalCode") String canalCode);
    
    public List<WaterPlan> findWaterPlansByCanalCodeAndStartYear(
            @Param("canalCode") String canalCode, @Param("startYear") int startYear) ;

}