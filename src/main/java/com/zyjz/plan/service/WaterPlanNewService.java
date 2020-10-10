package com.zyjz.plan.service;

import java.util.List;

import com.zyjz.plan.entity.WaterPlanNew;

public interface WaterPlanNewService {
	public int addWaterPlanNew(WaterPlanNew waterPlan);
	public List<WaterPlanNew> findWaterPlanByCanalCode(String canalCode);
	public List<WaterPlanNew> findWaterPlanNewByCanalCodeJoin(String canalCode);
	List<WaterPlanNew> findWaterPlanNewsByCanalCodeAndStartYear(String canalCode, int startYear);
	
}
