package com.zyjz.site.service;

import com.zyjz.site.entity.SiteHourFlow;

import java.util.List;
import java.util.Map;

public interface SiteHourFlowService {
    int deleteByPrimaryKey(Integer id);

    int insert(SiteHourFlow record);

    int insertSelective(SiteHourFlow record);

    SiteHourFlow selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SiteHourFlow record);

    int updateByPrimaryKey(SiteHourFlow record);

    int selectCountByCodeAndTime(Map<String, Object> map);

    int updateByWaterCodeSelective(SiteHourFlow record);

    SiteHourFlow selectInfoByCodeAndTime(Map<String, Object> map);

    List<SiteHourFlow> selectCountByDayTime(Map<String, Object> map);

    List<SiteHourFlow> selectCountDayFlowPerHour(Map<String, Object> map);
}
