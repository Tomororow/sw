package com.zyjz.sysmanage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zyjz.sysmanage.entity.CalCanalBuilding;

public interface CalCanalBuildingMapper {

    int deleteByPrimaryKey(String id);

    int insert(CalCanalBuilding record);

    int insertSelective(CalCanalBuilding record);

    CalCanalBuilding selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(CalCanalBuilding record);

    int updateByPrimaryKey(CalCanalBuilding record);
    
    List<CalCanalBuilding>  selectCalCanalBuildingByCanalId(
            @Param("canalId") String canalId);
    
}
