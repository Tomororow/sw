package com.zyjz.site.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.site.dao.SiteRainDynamicInfoMapper;
import com.zyjz.site.entity.SiteRainDynamicInfo;
import com.zyjz.site.service.SiteRainDynamicInfoService;

/**
 * @ClassName: SiteRainDynamicInfoServiceImpl
 * @Description: 获取动态雨情信息service实现
 * @Author: zhaojx
 * @Date: 2018年3月5日 上午10:29:45
 */
@Service("siteRainDynamicInfoService")
public class SiteRainDynamicInfoServiceImpl implements SiteRainDynamicInfoService{

	@Autowired
	private SiteRainDynamicInfoMapper siteRainDynamicInfoMapper;
	
	@Override
	public List<SiteRainDynamicInfo> getInfoByDeviceCode(String stationCode) {
		return siteRainDynamicInfoMapper.getInfoByDeviceCode(stationCode);
	}

	@Override
	public List<SiteRainDynamicInfo> findOneDaySiteRainDynamicInfoByDevicerainCodeAndTime(
			String devicerainCode, String startTime, String endTime) {
		
		System.out.println("service:"+devicerainCode+"-startTime:"+startTime+"-endTime:"+endTime);
		return siteRainDynamicInfoMapper.findOneDaySiteRainDynamicInfoByDevicerainCodeAndTime(devicerainCode,startTime,endTime);
	}
}
