package com.zyjz.sysmanage.dao;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zyjz.sysmanage.entity.CanalFlowHight;

public interface CanalFlowHightMapper {


    int deleteByPrimaryKey(String id);

    int insert(CanalFlowHight record);

    int insertSelective(CanalFlowHight record);

    CanalFlowHight selectByPrimaryKey(String id);



    int updateByPrimaryKeySelective(CanalFlowHight record);

    int updateByPrimaryKey(CanalFlowHight record);
    
    List<CanalFlowHight> findCanalFlowHightsByWaterSiteId(String waterSiteId);
    
    List<CanalFlowHight> selectIdList(List<String> id);

    List<CanalFlowHight> findInfoByWaterSiteIdAndLevel(@Param("waterSiteId") String waterSiteId,@Param("waterLevel") BigDecimal waterLevel);
}