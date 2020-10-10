package com.zyjz.plan.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zyjz.plan.entity.NeedWaterReport;

public interface NeedWaterReportMapper {


    int deleteByPrimaryKey(String id);

    int insert(NeedWaterReport record);

    int insertSelective(NeedWaterReport record);


    NeedWaterReport selectByPrimaryKey(String id);



    int updateByPrimaryKeySelective(NeedWaterReport record);

    int updateByPrimaryKey(NeedWaterReport record);
    
    NeedWaterReport findNeedWaterReportByCanalCodeAndYearAndSoilTypeAndCropsType(
            @Param("canalCode") String canalCode,
            @Param("year") int year,
            @Param("soilType") String soilType,
            @Param("cropsType") String cropsType);
    List<NeedWaterReport> findNeedWaterReportByCanalCodeAndYear(
            @Param("canalCode") String canalCode,
            @Param("year") int year);
    
    List<NeedWaterReport> findNeedWaterReportByCanalCodeAndYearJoin(
            @Param("canalCode") String canalCode,
            @Param("year") int year);
    List<NeedWaterReport> findAll();
    
    /**
     * 根据渠道id查询该渠道下所有的需水提报
     * @Title: findCanaCodeByNeedWaterReportList
     * @Description: 
     * @param: @param canaCode
     * @param: @return
     * @return: List<NeedWaterReport>
     * @throws
     */
    List<NeedWaterReport> findCanaCodeByNeedWaterReportList(String canaCode);
    
    List<NeedWaterReport> findNeedWaterReportByCanalCodeAndYearGroupByCropsType(@Param("canalCode") String canalCode, @Param("year") int year);
    
    
}