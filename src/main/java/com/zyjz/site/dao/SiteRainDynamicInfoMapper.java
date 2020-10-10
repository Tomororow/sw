package com.zyjz.site.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zyjz.site.entity.SiteRainDynamicInfo;

/**
 * @ClassName: SiteRainDynamicInfoMapper
 * @Description: 获取动态雨情信息dao接口
 * @Author: zhaojx
 * @Date: 2018年3月5日 上午10:27:25
 */
public interface SiteRainDynamicInfoMapper {

	/**
	 * @Title: getInfoByDeviceCode
	 * @Description: 根据站点编码查询雨情信息
	 * @param: @return
	 * @return: List<SiteRainDynamicInfo>
	 */
	List<SiteRainDynamicInfo> getInfoByDeviceCode(String stationCode);
	
	List<SiteRainDynamicInfo> findOneDaySiteRainDynamicInfoByDevicerainCodeAndTime(
            @Param("devicerainCode") String devicerainCode, @Param("startTime") String startTime, @Param("endTime") String endTime);
}
