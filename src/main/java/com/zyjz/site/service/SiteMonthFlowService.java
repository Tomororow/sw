package com.zyjz.site.service;

import com.zyjz.site.entity.SiteMonthFlow;

import java.util.List;
import java.util.Map;

public interface SiteMonthFlowService {

    /**
     * 查询月流量
     * @param code
     * @param time
     * @return
     */
    int selectSMFWithCodeAndTime(String code, String time);

    /**
     * 新增月流量
     * @param siteMonthFlow
     * @return
     */
    int insertSMFWithCodeAndTime(SiteMonthFlow siteMonthFlow);

    /**
     * 更新月流量
     * @param siteMonthFlow
     * @return
     */
    int updateSMFWithCodeAndTime(SiteMonthFlow siteMonthFlow);

    /**
     * 查询指定月流量
     * @param time
     * @param number
     * @return
     */
    List<SiteMonthFlow > findSiteMonthFlowList(String time, int number);

    int deleteByPrimaryKey(Integer id);

    int insert(SiteMonthFlow record);

    int insertSelective(SiteMonthFlow record);

    SiteMonthFlow selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SiteMonthFlow record);

    int updateByPrimaryKey(SiteMonthFlow record);

    SiteMonthFlow selectInfoByCodeAndTime(Map<String, Object> map);

    List<SiteMonthFlow > selectCountByYearTime(Map<String, Object> map);

    List<SiteMonthFlow > selectCountYearFlowPerMonth(Map<String, Object> map);

    List<SiteMonthFlow > selectCountYearFlowGroupByWaterCode(Map<String, Object> map);

    List<SiteMonthFlow > selectSiteMonthFlowListByCanalCode(Map<String, Object> map);

    List<SiteMonthFlow > selectReportDetailData(Map<String, Object> map);
}
