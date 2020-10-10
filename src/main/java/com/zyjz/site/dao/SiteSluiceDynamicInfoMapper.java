package com.zyjz.site.dao;

import com.zyjz.site.entity.SiteSluiceDynamicInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface SiteSluiceDynamicInfoMapper {


    int deleteByPrimaryKey(String id);

    int insert(SiteSluiceDynamicInfo record);

    int insertSelective(SiteSluiceDynamicInfo record);

    SiteSluiceDynamicInfo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SiteSluiceDynamicInfo record);

    int updateByPrimaryKey(SiteSluiceDynamicInfo record);
    
    List<SiteSluiceDynamicInfo> selectCode(List<String> code);
    
    List<SiteSluiceDynamicInfo> selectDate(Map<String, Object> pageInfe);
    
    SiteSluiceDynamicInfo selectLimit(String deviceCode);
    int selectCodeLength(List<String> devicesluiceCode);

    List<SiteSluiceDynamicInfo> selectRealTimeDataList(String canalCode);

    List<SiteSluiceDynamicInfo> selectHistoryDataList(String ssdiSluiceGateCode);

    List<SiteSluiceDynamicInfo> selectSluiceDataByCodeOrName(@Param("canalCode") String canalCode, @Param("devicesluiceCode") String devicesluiceCode, @Param("deviceSluiceName")String deviceSluiceName);

    /**
     * 日报表定时任务查询
     * @return
     */
    List<SiteSluiceDynamicInfo> scheduledTaskSluiceOfDayFlow();
    /**
     * 月报表定时任务查询
     * @return
     */
    List<SiteSluiceDynamicInfo> scheduledTaskSluiceOfMonthFlow();
    /**
     * 年报表定时任务查询
     * @return
     */
    List<SiteSluiceDynamicInfo> scheduledTaskSluiceOfYearFlow();

    List<SiteSluiceDynamicInfo> selectNowDynamicInfo();
}