package com.zyjz.site.dao;

import com.zyjz.site.entity.SiteDayFlow;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface SiteDayFlowMapper {

    /**
     * 查询日流量
     * @param code
     * @param time
     * @return
     */
    int selectSDFWithCodeAndTime(@Param("code")String code, @Param("time")String time);

    /**
     * 新增日流量
     * @param siteDayFlow
     * @return
     */
    int insertSDFWithCodeAndTime(SiteDayFlow siteDayFlow);

    /**
     * 更新日流量
     * @param siteDayFlow
     * @return
     */
    int updateSDFWithCodeAndTime(SiteDayFlow siteDayFlow);

    /**
     * 查询指定日流量
     * @param time
     * @param number
     * @return
     */
    List<SiteDayFlow> findSiteDayFlowList(@Param("time") String time, @Param("number") int number);



    int deleteByPrimaryKey(Integer id);

    int insert(SiteDayFlow record);

    int insertSelective(SiteDayFlow record);

    SiteDayFlow selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SiteDayFlow record);

    int updateByPrimaryKey(SiteDayFlow record);

    SiteDayFlow selectInfoByCodeAndTime(Map<String, Object> map);

    List<SiteDayFlow> selectCountByMonthTime(Map<String, Object> map);

    List<SiteDayFlow> selectCountMonthFlowPerDay(Map<String, Object> map);

    List<SiteDayFlow> selectSiteDayFlowListByCanalCode(Map<String, Object> map);

    List<SiteDayFlow> selectReportDetailData(Map<String, Object> map);
}
