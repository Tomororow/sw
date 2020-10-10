package com.zyjz.sysmanage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zyjz.sysmanage.entity.CalCanalInfo;

public interface CalCanalInfoMapper {

    int deleteByPrimaryKey(String id);

    int insert(CalCanalInfo record);

    int insertSelective(CalCanalInfo record);

    CalCanalInfo findCanalById(String id);

    List<CalCanalInfo> selectByPrimaryKey(@Param("id") String id, @Param("canalCode") String canalCode);
    
    CalCanalInfo findCanalByCode(String canalCode);

    int updateByPrimaryKeySelective(CalCanalInfo record);

    int updateByPrimaryKey(CalCanalInfo record);
    
    List<CalCanalInfo> findAllCanal();

    List<CalCanalInfo> findCanalCode(String canalCode);
    
    CalCanalInfo findCanalByLevel(int level);
    
    List <CalCanalInfo>  selectCalCanalInfoById(
            @Param("id") String id,
            @Param("canalParentId") String canalParentId);
    
    List <CalCanalInfo> findCanalByPId(String canalParentId);
    
    List<CalCanalInfo> findCanalsByLevel(@Param("canallevelCode") int canallevelCode);
    
    List<CalCanalInfo> findAllCanalsByWaterAreaCode(@Param("waterAreaCode") String waterAreaCode);
    
    List<CalCanalInfo> findCanalsByIds(List<String> ids);
    
    CalCanalInfo findMinCode();
    
    CalCanalInfo slectMin();
    
    CalCanalInfo selectCanalName(String canalName);

    /**
     * 根据渠道编码和权限级别查找最后一个子行政区
     * @param code
     * @param level
     * @return
     */
    CalCanalInfo selectChildCalCanalByCode(@Param("code") String code, @Param("level") String level);
    //查询父id下子集
    List<CalCanalInfo> getcalList(List<String> list);
    //查询渠道闸门信息
    List<CalCanalInfo> getsluiceList(List<CalCanalInfo> list);
    //渠道照片信息
    List<CalCanalInfo> getphotoList(List<CalCanalInfo> list);
    //渠道建筑物信息
    List<CalCanalInfo> getbulidingList(List<CalCanalInfo> list);
    //根据水管区Id查询渠道信息
    List<CalCanalInfo> findCanalsBySysWaterAreaCode(List<String> sysWaterAreaIdList);

    //根据行政区Id查询渠道信息
    List<CalCanalInfo> findCanalsBySysAreaCode(List<String> sysAreaIdList);

    List<CalCanalInfo> findSubsetInfoByCanalCode(String canalCode);
}