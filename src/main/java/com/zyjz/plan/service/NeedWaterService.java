package com.zyjz.plan.service;

import java.util.List;

import com.zyjz.plan.entity.NeedWaterReport;

public interface NeedWaterService {
	public NeedWaterReport findNeedWaterReportByCanalCodeAndYearAndSoilTypeAndCropsType(String canalCode, int year, String soilType, String cropsType);
	public int update(NeedWaterReport needWaterReport);
	public int insert(NeedWaterReport needWaterReport);
	public List<NeedWaterReport> findNeedWaterReportByCanalCodeAndYear(String canalCode, int year);
	public List<NeedWaterReport> findNeedWaterReportByCanalCodeAndYearJoin(String canalCode, int year);
	public List<NeedWaterReport> findAll();
	//public List<NeedWaterReport> findNeedWaterReportByCanalCodeAndYear(String canalCode,int year);
	
	 NeedWaterReport selectByPrimaryKey(String id);
	 
	 int deleteNeedWaterReportById(String id);
	 
	 
	 List<NeedWaterReport> findNeedWaterReportByCanalCodeAndYearGroupByCropsType(String canalCode, int year);
	 
	 /**
	     * 根据渠道id查询该渠道下所有的需水提报
	     * @Title: findCanaCodeByNeedWaterReportList
	     * @Description: 
	     * @param: @param canaCode
	     * @param: @return
	     * @return: List<NeedWaterReport>
	     * @throws
	     */
	    List<NeedWaterReport> findCanaCodeByNeedWaterReportList(String canaCode);
}
