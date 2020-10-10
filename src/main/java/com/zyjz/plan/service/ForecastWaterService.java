package com.zyjz.plan.service;

import java.util.List;

import com.zyjz.plan.entity.ForecastWater;
import com.zyjz.plan.entity.ForecastWaterTable;

public interface ForecastWaterService {
	public List<ForecastWater> findAllForecastWater();
	public List<ForecastWater> findForecastWaterByCanalCode(String canalCode);
	public int addForecastWater(ForecastWater forecastWater);
	public int addForecastWaterTable(ForecastWaterTable forecastWaterTable);
	public int updateForecastWaterTable(ForecastWaterTable forecastWaterTable);
	public int updateForecastWater(ForecastWater forecastWater);
	public ForecastWater findForecastWaterById(String id);
	public ForecastWaterTable findForecastWaterTableByForecastIdAndMonth(String forecastId, int month);
	
	public ForecastWaterTable findForecastWaterTable(int year, int month, String canalCode);
	
	int deleteForecastWaterById(String id);
	
	List<ForecastWaterTable> findForecastWaterTableByForecastId(String id);
	
	public int deleteForecastWaterTableByForecastId(String forecastId);
	
	
	
	
	
}
