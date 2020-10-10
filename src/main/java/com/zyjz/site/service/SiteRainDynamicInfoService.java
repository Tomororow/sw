package com.zyjz.site.service;

import java.util.List;

import com.zyjz.site.entity.SiteRainDynamicInfo;

/**
 * @ClassName: SiteRainDynamicInfoService
 * @Description: 获取动态雨情信息service接口
 * @Author: zhaojx
 * @Date: 2018年3月5日 上午10:29:17
 */
public interface SiteRainDynamicInfoService {

	/**
	 * @Title: getInfoByDeviceCode
	 * @Description: 根据站点编码查询雨情信息
	 * @param: @return
	 * @return: List<SiteRainDynamicInfo>
	 */
	List<SiteRainDynamicInfo> getInfoByDeviceCode(String stationCode);
	
	List<SiteRainDynamicInfo> findOneDaySiteRainDynamicInfoByDevicerainCodeAndTime(String devicerainCode, String startTime, String endTime);
	
}
