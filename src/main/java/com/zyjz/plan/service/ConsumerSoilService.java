package com.zyjz.plan.service;

import java.util.List;

import com.zyjz.plan.entity.ConsumerSoil;

public interface ConsumerSoilService {
	public List<ConsumerSoil> findConsumerSoilsByCanalCodes(List<String> canalCodeList);
	
	public List<ConsumerSoil> findConsumerSoilsByCanalCodesJoin(String canalCode);
	
	public int addConsumerSoil(ConsumerSoil consumerSoil);
	
	 ConsumerSoil selectByPrimaryKey(String id);
	 
	 int deleteByPrimaryKey(String id);
	 
	 int updateByPrimaryKeySelective(ConsumerSoil record);

	 int updateByPrimaryKey(ConsumerSoil record);
}
