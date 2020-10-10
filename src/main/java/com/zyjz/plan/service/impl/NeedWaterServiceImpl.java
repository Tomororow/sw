package com.zyjz.plan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.plan.dao.NeedWaterReportMapper;
import com.zyjz.plan.entity.NeedWaterReport;
import com.zyjz.plan.service.NeedWaterService;

@Service("NeedWaterService")
public class NeedWaterServiceImpl implements NeedWaterService {

	@Autowired
	NeedWaterReportMapper needWaterReportMapper;

	@Override
	public NeedWaterReport findNeedWaterReportByCanalCodeAndYearAndSoilTypeAndCropsType(
			String canalCode, int year,String soilType,String cropsType) {
		return needWaterReportMapper.findNeedWaterReportByCanalCodeAndYearAndSoilTypeAndCropsType(canalCode,year,soilType,cropsType);
	}

	@Override
	public int update(NeedWaterReport needWaterReport) {
		return needWaterReportMapper.updateByPrimaryKeySelective(needWaterReport);
	}

	@Override
	public int insert(NeedWaterReport needWaterReport) {
		return needWaterReportMapper.insertSelective(needWaterReport);
	}

	@Override
	public List<NeedWaterReport> findNeedWaterReportByCanalCodeAndYear(
			String canalCode, int year) {
		return needWaterReportMapper.findNeedWaterReportByCanalCodeAndYear(canalCode,year);
	}

	@Override
	public List<NeedWaterReport> findNeedWaterReportByCanalCodeAndYearJoin(
			String canalCode, int year) {
		return needWaterReportMapper.findNeedWaterReportByCanalCodeAndYearJoin(canalCode,year);
	}
	
	@Override
	public List<NeedWaterReport> findAll() {
		return needWaterReportMapper.findAll();
	}

	@Override
	public NeedWaterReport selectByPrimaryKey(String id) {
		return needWaterReportMapper.selectByPrimaryKey(id);
	}

	@Override
	public int deleteNeedWaterReportById(String id) {
		return needWaterReportMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<NeedWaterReport> findCanaCodeByNeedWaterReportList(
			String canaCode) {
		return needWaterReportMapper.findCanaCodeByNeedWaterReportList(canaCode);
	}

	@Override
	public List<NeedWaterReport> findNeedWaterReportByCanalCodeAndYearGroupByCropsType(
			String canalCode, int year) {
		return needWaterReportMapper.findNeedWaterReportByCanalCodeAndYearGroupByCropsType(canalCode, year);
	}

}
