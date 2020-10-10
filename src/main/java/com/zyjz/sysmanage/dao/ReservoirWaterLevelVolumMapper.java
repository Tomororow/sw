package com.zyjz.sysmanage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zyjz.sysmanage.entity.ReservoirWaterLevelVolum;

public interface ReservoirWaterLevelVolumMapper {


    int deleteByPrimaryKey(String id);

    int insert(ReservoirWaterLevelVolum record);

    int insertSelective(ReservoirWaterLevelVolum record);

    ReservoirWaterLevelVolum selectByPrimaryKey(String id);


    int updateByPrimaryKeySelective(ReservoirWaterLevelVolum record);

    int updateByPrimaryKey(ReservoirWaterLevelVolum record);
    
    public List<ReservoirWaterLevelVolum> findAllReservoirWaterLevelVolumsByReservoirCode(
            @Param("reservoirCode") String reservoirCode);
}