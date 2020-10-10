package com.zyjz.site.service;

import java.util.List;
import java.util.Map;

import com.zyjz.site.entity.SiteWaterDynamicInfo;

public interface SiteWaterDynamicService {
	
	public SiteWaterDynamicInfo findCurrentDataByDevicewaterCode(String devicewaterCode);
	
	public List<SiteWaterDynamicInfo> findOneDayDataByDevicewaterCode(String devicewaterCode, String startDate, String endDate);

	 List<SiteWaterDynamicInfo> selectDevicewaterCode(List<String> code);
	 
	//根据时间日期查询
	    List<SiteWaterDynamicInfo> selectDate(Map<String, Object> pageInfe);
	    
	    List<SiteWaterDynamicInfo> selectDataAYFlow(Map<String, Object> pageInfe);
	    
	    List<SiteWaterDynamicInfo> selectDataMonFlow(Map<String, Object> pageInfe);
	    
	    List<SiteWaterDynamicInfo> selectDataYarFlow(Map<String, Object> pageInfe);
	    
	    List<SiteWaterDynamicInfo>  selectWaterCode(String devicewaterCode);
	    
	    int selectCodeLength(List<String> devicewaterCode);
	    
	    int selectDateLength(Map<String, Object> pageInfe);

	    /**
	     * 查询实时水位
	     * @Title: cycleData
	     * @Description: 
	     * @param: @param devicewaterCode
	     * @param: @return
	     * @return: List<SiteWaterDynamicInfo>
	     * @throws
	     */
		public List<SiteWaterDynamicInfo> cycleData(String devicewaterCode);
		  /*
		    * 定时任务查询当天的累积流量
		    * setCumulative
		    */
		public List<SiteWaterDynamicInfo> setCumulative(String devicewaterCode, String startDate, String endDate);

	List<SiteWaterDynamicInfo> findHistoryDynamicInfoList(String devicewaterCode, String currentDate, String afterDate);

	/**
	 * 日报表定时任务查询
	 * @return
	 */
	List<SiteWaterDynamicInfo> exportSiteOfDayFlow();
	/**
	 * 月报表定时任务查询
	 * @return
	 */
	List<SiteWaterDynamicInfo> exportSiteOfMonthFlow();
	/**
	 * 年报表定时任务查询
	 * @return
	 */
	List<SiteWaterDynamicInfo> exportSiteOfYearFlow();

	/**
	 * 查询当前日期水位站水文信息
	 * @return
	 */
	List<SiteWaterDynamicInfo> selectDailyDynamicInfo();

	List<SiteWaterDynamicInfo> selectNowDynamicInfo();

	List<SiteWaterDynamicInfo> selectPreFiveMinDynamicInfo();

	List<SiteWaterDynamicInfo> selectPreHourDynamicInfo();

	List<SiteWaterDynamicInfo> selectPreDayDynamicInfo();

	List<SiteWaterDynamicInfo> selectPreTwoDayDynamicInfo();
}
