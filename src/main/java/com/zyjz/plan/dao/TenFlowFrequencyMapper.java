package com.zyjz.plan.dao;


import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zyjz.plan.entity.TenFlowFrequency;

public interface TenFlowFrequencyMapper {

    int deleteByPrimaryKey(String id);

    int insert(TenFlowFrequency record);

    int insertSelective(TenFlowFrequency record);


    TenFlowFrequency selectByPrimaryKey(String id);


    int updateByPrimaryKeySelective(TenFlowFrequency record);

    int updateByPrimaryKey(TenFlowFrequency record);
    
    List<TenFlowFrequency> findTenFlowFrequencyByDate(@Param("startMonth") int startMonth, @Param("startDay") int startDay, @Param("endMonth") int endMonth, @Param("endDay") int endDay);

    List<TenFlowFrequency> findTenFlowFrequencyByDateAndRiversCode(
            TenFlowFrequency tenFlowFrequency

    );
    
    
    List<TenFlowFrequency> findMsgByCurrentYear(int currentYear);
    
    List<TenFlowFrequency> findContrastYearByFlowAndRiversCode(@Param("tenFlow") BigDecimal tenFlow, @Param("startMonth") int startMonth, @Param("startDay") int startDay, @Param("endMonth") int endMonth, @Param("endDay") int endDay, @Param("riversCode") String riversCode);
    
    List<TenFlowFrequency> findTenFlowFrequencysByRiversCodeAndMonthAndDay(@Param("riversCode") String riversCode, @Param("startMonth") int startMonth, @Param("startDay") int startDay);

}