package com.zyjz.plan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.plan.dao.WaterPlanNewMapper;
import com.zyjz.plan.entity.WaterPlanNew;
import com.zyjz.plan.service.WaterPlanNewService;

@Service("WaterPlanNewService")
public class WaterPlanNewServiceImpl implements WaterPlanNewService {
	@Autowired
	WaterPlanNewMapper waterPlanNewMapper;

	@Override
	public int addWaterPlanNew(WaterPlanNew waterPlan) {
		return waterPlanNewMapper.insertSelective(waterPlan);
	}

	@Override
	public List<WaterPlanNew> findWaterPlanByCanalCode(String canalCode) {
		return waterPlanNewMapper.findWaterPlanNewByCanalCode(canalCode);
	}

	@Override
	public List<WaterPlanNew> findWaterPlanNewByCanalCodeJoin(String canalCode) {
		return waterPlanNewMapper.findWaterPlanNewByCanalCodeJoin(canalCode);
	}
	
	@Override
	public List<WaterPlanNew> findWaterPlanNewsByCanalCodeAndStartYear(
			String canalCode, int startYear) {
		return waterPlanNewMapper.findWaterPlanNewsByCanalCodeAndStartYear(
				canalCode,startYear);
	}
}
