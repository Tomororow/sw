package com.zyjz.plan.service;

import java.util.List;

import com.zyjz.plan.entity.BpTenFlowFrequency;

public interface BpTenFlowFrequencyService {
	int deleteByPrimaryKey(String id);

    int insert(BpTenFlowFrequency record);

    int insertSelective(BpTenFlowFrequency record);

    BpTenFlowFrequency selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(BpTenFlowFrequency record);

    int updateByPrimaryKey(BpTenFlowFrequency record);
    
    List<BpTenFlowFrequency> findBpTenFlowFrequencyByCanalCodes(List<String> canalCodes);
}
