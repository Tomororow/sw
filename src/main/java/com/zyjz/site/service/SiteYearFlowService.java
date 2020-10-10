package com.zyjz.site.service;

import com.zyjz.site.entity.SiteMonthFlow;
import com.zyjz.site.entity.SiteYearFlow;

import java.util.List;
import java.util.Map;

public interface SiteYearFlowService {

    /**
     * 查询年流量
     * @param code
     * @param time
     * @return
     */
    int selectSYFWithCodeAndTime(String code, String time);

    /**
     * 新增年流量
     * @param siteYearFlow
     * @return
     */
    int insertSYFWithCodeAndTime(SiteYearFlow siteYearFlow);

    /**
     * 更新年流量
     * @param siteYearFlow
     * @return
     */
    int updateSYFWithCodeAndTime(SiteYearFlow siteYearFlow);

    /**
     * 查询指定年流量
     * @param time
     * @param number
     * @return
     */
    List<SiteYearFlow> findSiteYearFlowList(String time, int number);


    int deleteByPrimaryKey(Integer id);

    int insert(SiteYearFlow record);

    int insertSelective(SiteYearFlow record);

    SiteYearFlow selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SiteYearFlow record);

    int updateByPrimaryKey(SiteYearFlow record);

    SiteYearFlow selectInfoByCodeAndTime(Map<String, Object> map);

    List<SiteYearFlow> selectSiteYearFlowListByCanalCode(Map<String, Object> map);
}
