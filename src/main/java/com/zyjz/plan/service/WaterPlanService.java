package com.zyjz.plan.service;

import java.util.List;

import com.zyjz.plan.entity.WaterPlan;

public interface WaterPlanService {
	public int addWaterPlan(WaterPlan waterPlan);
	public List<WaterPlan> findWaterPlanByCanalCode(String canalCode);
	public List<WaterPlan> findWaterPlanByCanalCodeJoin(String canalCode);
	List<WaterPlan> findWaterPlansByCanalCodeAndStartYear(String canalCode, int startYear);
}
