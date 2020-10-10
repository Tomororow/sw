package com.zyjz.plan.dao;

import com.zyjz.plan.entity.BpTenFlowFrequency;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BpTenFlowFrequencyMapper {
    

    int deleteByPrimaryKey(String id);

    int insert(BpTenFlowFrequency record);

    int insertSelective(BpTenFlowFrequency record);

    BpTenFlowFrequency selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(BpTenFlowFrequency record);

    int updateByPrimaryKey(BpTenFlowFrequency record);
    
    List<BpTenFlowFrequency> findBpTenFlowFrequencyByCanalCodes(List<String> canalCodes);
}

