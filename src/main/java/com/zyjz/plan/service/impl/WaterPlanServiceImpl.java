package com.zyjz.plan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.plan.dao.WaterPlanMapper;
import com.zyjz.plan.entity.WaterPlan;
import com.zyjz.plan.service.WaterPlanService;

@Service("WaterPlanService")
public class WaterPlanServiceImpl implements WaterPlanService {
	@Autowired
	WaterPlanMapper waterPlanMapper;

	@Override
	public int addWaterPlan(WaterPlan waterPlan) {
		return waterPlanMapper.insertSelective(waterPlan);
	}

	@Override
	public List<WaterPlan> findWaterPlanByCanalCode(String canalCode) {
		return waterPlanMapper.findWaterPlanByCanalCode(canalCode);
	}

	@Override
	public List<WaterPlan> findWaterPlanByCanalCodeJoin(String canalCode) {
		return waterPlanMapper.findWaterPlanByCanalCodeJoin(canalCode);
	}
	
	@Override
	public List<WaterPlan> findWaterPlansByCanalCodeAndStartYear(
			String canalCode, int startYear) {
		return waterPlanMapper.findWaterPlansByCanalCodeAndStartYear(
				canalCode,startYear);
	}
	
	
}
