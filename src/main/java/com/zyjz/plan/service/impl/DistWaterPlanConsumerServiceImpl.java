package com.zyjz.plan.service.impl;

import com.zyjz.plan.dao.DistWaterPlanConsumerMapper;
import com.zyjz.plan.entity.DistWaterPlanConsumer;
import com.zyjz.plan.service.DistWaterPlanConsumerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("DistWaterPlanConsumerService")
public class DistWaterPlanConsumerServiceImpl implements DistWaterPlanConsumerService {

	@Autowired
	DistWaterPlanConsumerMapper distWaterPlanConsumerMapper;
	
	@Override
	public List<DistWaterPlanConsumer> findDistWaterPlanConsumersByAreaCodes(
			List<String> areaCodes) {
		return distWaterPlanConsumerMapper.findDistWaterPlanConsumersByAreaCodes(areaCodes);
	}

	@Override
	public int addDistWaterPlanConsumer(
			DistWaterPlanConsumer distWaterPlanConsumer) {
		// TODO Auto-generated method stub
		return distWaterPlanConsumerMapper.insertSelective(distWaterPlanConsumer);
	}

	@Override
	public DistWaterPlanConsumer selectByPrimaryKey(String id) {
		// TODO Auto-generated method stub
		return distWaterPlanConsumerMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(DistWaterPlanConsumer record) {
		return distWaterPlanConsumerMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int deleteByPrimaryKey(String id) {
		return distWaterPlanConsumerMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<DistWaterPlanConsumer> getDistWaterPlanConsumersList() {
		return distWaterPlanConsumerMapper.getDistWaterPlanConsumersList();
	}

		
}
