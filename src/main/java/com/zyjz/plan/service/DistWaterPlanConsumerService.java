package com.zyjz.plan.service;

import java.util.List;

import com.zyjz.plan.entity.DistWaterPlanConsumer;

public interface DistWaterPlanConsumerService {
	
	public List<DistWaterPlanConsumer>findDistWaterPlanConsumersByAreaCodes(List<String> areaCodes);
	public int addDistWaterPlanConsumer(DistWaterPlanConsumer distWaterPlanConsumer);
	
	DistWaterPlanConsumer selectByPrimaryKey(String id);
	
	int updateByPrimaryKeySelective(DistWaterPlanConsumer record);
	
	 int deleteByPrimaryKey(String id);
	 List<DistWaterPlanConsumer> getDistWaterPlanConsumersList();
	
	

}
