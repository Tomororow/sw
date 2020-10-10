package com.zyjz.plan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.plan.dao.ForecastWaterMapper;
import com.zyjz.plan.dao.ForecastWaterTableMapper;
import com.zyjz.plan.entity.ForecastWater;
import com.zyjz.plan.entity.ForecastWaterTable;
import com.zyjz.plan.service.ForecastWaterService;

@Service("ForecastWaterService")
public class ForecastWaterServiceImpl implements ForecastWaterService {

	@Autowired
	ForecastWaterMapper forecastWaterMapper;

	@Autowired
	ForecastWaterTableMapper forecastWaterTableMapper;

	@Override
	public List<ForecastWater> findAllForecastWater() {
		return forecastWaterMapper.findAll();
	}

	@Override
	public List<ForecastWater> findForecastWaterByCanalCode(String canalCode) {
		return forecastWaterMapper.findForecastWaterByCanalCode(canalCode);
	}

	@Override
	public int addForecastWater(ForecastWater forecastWater) {
		return forecastWaterMapper.insertSelective(forecastWater);
	}

	@Override
	public int addForecastWaterTable(ForecastWaterTable forecastWaterTable) {
		return forecastWaterTableMapper.insertSelective(forecastWaterTable);
	}

	@Override
	public int updateForecastWaterTable(ForecastWaterTable forecastWaterTable){
		return forecastWaterTableMapper.updateByPrimaryKeySelective(forecastWaterTable);
	}

	@Override
	public ForecastWater findForecastWaterById(String id) {
		return forecastWaterMapper.selectByPrimaryKey(id);
	}

	@Override
	public ForecastWaterTable findForecastWaterTableByForecastIdAndMonth(
			String forecastId, int month) {
		return forecastWaterTableMapper.findForecastWaterTableByForecastIdAndMonth(forecastId,month);
	}

	@Override
	public ForecastWaterTable findForecastWaterTable(int year, int month,
			String canalCode) {

		System.out.println("@@@@@@@@@@@@@@@@@@@@@@"+year+"@@@@@@@@@@@@@@@@@@@@@@@"+month+"@@@@@@@@@@@@@@@@@@@@@@"+canalCode);
		ForecastWater forecastWater = forecastWaterMapper.findForecastWaterByCanalCodeAndYear(canalCode,year);

		System.out.println("@@@@@@@@@@@@@@@@@@@@@forecastWater"+forecastWater);
		if(forecastWater != null){
			ForecastWaterTable forecastWaterTable = forecastWaterTableMapper.findForecastWaterTableByForecastIdAndYearAndMonth(forecastWater.getId(), year,month);
			return forecastWaterTable;
		}
		return null;
	}

	@Override
	public int updateForecastWater(ForecastWater forecastWater) {
		return forecastWaterMapper.updateByPrimaryKeySelective(forecastWater);
	}

	@Override
	public int deleteForecastWaterById(String id) {
		return forecastWaterMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<ForecastWaterTable> findForecastWaterTableByForecastId(String id) {
		return forecastWaterTableMapper.findForecastWaterTableByForecastId(id);
	}

	@Override
	public int deleteForecastWaterTableByForecastId(String forecastId) {
		return forecastWaterTableMapper.deleteByPrimaryKey(forecastId);
	}


}
