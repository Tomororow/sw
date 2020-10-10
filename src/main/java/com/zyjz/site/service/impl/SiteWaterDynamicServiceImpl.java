package com.zyjz.site.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.site.dao.SiteWaterDynamicInfoMapper;
import com.zyjz.site.entity.SiteWaterDynamicInfo;
import com.zyjz.site.service.SiteWaterDynamicService;


@Service("SiteWaterDynamicService")
public class SiteWaterDynamicServiceImpl implements SiteWaterDynamicService {
	
	
	@Autowired
	private SiteWaterDynamicInfoMapper siteWaterDynamicInfoMapper;

	@Override
	public SiteWaterDynamicInfo findCurrentDataByDevicewaterCode(
			String devicewaterCode) {
		
		return siteWaterDynamicInfoMapper.findCurrentDataByDevicewaterCode(devicewaterCode);
	}

	@Override
	public List<SiteWaterDynamicInfo> findOneDayDataByDevicewaterCode(
			String devicewaterCode, String startDate, String endDate) {
		return siteWaterDynamicInfoMapper.findOneDayDataByDevicewaterCode(devicewaterCode,startDate,endDate);
	}


	@Override
	public List<SiteWaterDynamicInfo> selectDate(Map<String,Object> pageInfe) {
		
		return siteWaterDynamicInfoMapper.selectDate(pageInfe);
	}

	@Override
	public List<SiteWaterDynamicInfo> selectWaterCode(String devicewaterCode) {
		return siteWaterDynamicInfoMapper.selectWaterCode(devicewaterCode);
	}

	@Override
	public List<SiteWaterDynamicInfo> selectDevicewaterCode(List<String> code) {
		return siteWaterDynamicInfoMapper.selectDevicewaterCode(code);
	}

	@Override
	public int selectCodeLength(List<String> devicewaterCode) {
		return siteWaterDynamicInfoMapper.selectCodeLength(devicewaterCode);
	}

	@Override
	public List<SiteWaterDynamicInfo> cycleData(String devicewaterCode) {
		return siteWaterDynamicInfoMapper.cycleData(devicewaterCode);
	}

	@Override
	public List<SiteWaterDynamicInfo> selectDataAYFlow(
			Map<String, Object> pageInfe) {
		// TODO Auto-generated method stub
		return siteWaterDynamicInfoMapper.selectDataAYFlow(pageInfe);
	}

	@Override
	public List<SiteWaterDynamicInfo> selectDataMonFlow(
			Map<String, Object> pageInfe) {
		// TODO Auto-generated method stub
		return siteWaterDynamicInfoMapper.selectDataMonFlow(pageInfe);
	}

	@Override
	public List<SiteWaterDynamicInfo> selectDataYarFlow(
			Map<String, Object> pageInfe) {
		// TODO Auto-generated method stub
		return siteWaterDynamicInfoMapper.selectDataYarFlow(pageInfe);
	}

	@Override
	public int selectDateLength(Map<String,Object> pageInfe) {
		// TODO Auto-generated method stub
		return siteWaterDynamicInfoMapper.selectDateLength(pageInfe);
	}

	@Override
	public List<SiteWaterDynamicInfo> setCumulative(String devicewaterCode,
			String startDate, String endDate) {
		// TODO Auto-generated method stub
		return siteWaterDynamicInfoMapper.setCumulative(devicewaterCode, startDate, endDate);
	}

	@Override
	public List<SiteWaterDynamicInfo> findHistoryDynamicInfoList(String devicewaterCode, String currentDate, String afterDate) {
		return siteWaterDynamicInfoMapper.findHistoryDynamicInfoList(devicewaterCode,currentDate,afterDate);
	}

	@Override
	public List<SiteWaterDynamicInfo> exportSiteOfDayFlow() {
		return siteWaterDynamicInfoMapper.exportSiteOfDayFlow();
	}

	@Override
	public List<SiteWaterDynamicInfo> exportSiteOfMonthFlow() {
		return siteWaterDynamicInfoMapper.exportSiteOfMonthFlow();
	}

	@Override
	public List<SiteWaterDynamicInfo> exportSiteOfYearFlow() {
		return siteWaterDynamicInfoMapper.exportSiteOfYearFlow();
	}

	@Override
	public List<SiteWaterDynamicInfo> selectDailyDynamicInfo() {
		return siteWaterDynamicInfoMapper.selectDailyDynamicInfo();
	}

	@Override
	public List<SiteWaterDynamicInfo> selectNowDynamicInfo() {
		return siteWaterDynamicInfoMapper.selectNowDynamicInfo();
	}

	@Override
	public List<SiteWaterDynamicInfo> selectPreFiveMinDynamicInfo() {
		return siteWaterDynamicInfoMapper.selectPreFiveMinDynamicInfo();
	}

	@Override
	public List<SiteWaterDynamicInfo> selectPreHourDynamicInfo() {
		return siteWaterDynamicInfoMapper.selectPreHourDynamicInfo();
	}

	@Override
	public List<SiteWaterDynamicInfo> selectPreDayDynamicInfo() {
		return siteWaterDynamicInfoMapper.selectPreDayDynamicInfo();
	}

	@Override
	public List<SiteWaterDynamicInfo> selectPreTwoDayDynamicInfo() {
		return siteWaterDynamicInfoMapper.selectPreTwoDayDynamicInfo();
	}
}
