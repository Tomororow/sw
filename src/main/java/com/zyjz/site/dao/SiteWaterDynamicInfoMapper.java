package com.zyjz.site.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.zyjz.site.entity.SiteWaterDynamicInfo;

public interface SiteWaterDynamicInfoMapper {

    int deleteByPrimaryKey(String id);

    int insert(SiteWaterDynamicInfo record);

    int insertSelective(SiteWaterDynamicInfo record);


    SiteWaterDynamicInfo selectByPrimaryKey(String id);


    int updateByPrimaryKeySelective(SiteWaterDynamicInfo record);

    int updateByPrimaryKey(SiteWaterDynamicInfo record);
    
    SiteWaterDynamicInfo findCurrentDataByDevicewaterCode(String devicewaterCode);
    
    List<SiteWaterDynamicInfo> findOneDayDataByDevicewaterCode(
            @Param("devicewaterCode") String devicewaterCode, @Param("startDate") String startDate, @Param("endDate") String endDate);
    
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
   List<SiteWaterDynamicInfo> cycleData(String devicewaterCode);
   
   /*
    * 定时任务查询当天的累积流量
    * setCumulative
    */
   List<SiteWaterDynamicInfo> setCumulative(
           @Param("devicewaterCode") String devicewaterCode, @Param("startDate") String startDate, @Param("endDate") String endDate);

   List<SiteWaterDynamicInfo> findHistoryDynamicInfoList(
           @Param("devicewaterCode") String devicewaterCode, @Param("currentDate") String currentDate, @Param("afterDate") String afterDate);

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

    List<SiteWaterDynamicInfo> selectDailyDynamicInfo();


    List<SiteWaterDynamicInfo> selectNowDynamicInfo();

    List<SiteWaterDynamicInfo> selectPreHourDynamicInfo();

    List<SiteWaterDynamicInfo> selectPreFiveMinDynamicInfo();

    List<SiteWaterDynamicInfo> selectPreDayDynamicInfo();

    List<SiteWaterDynamicInfo> selectPreTwoDayDynamicInfo();
}