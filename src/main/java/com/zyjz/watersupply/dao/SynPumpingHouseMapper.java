package com.zyjz.watersupply.dao;

import com.zyjz.watersupply.entity.SynPumpingHouse;
import org.apache.ibatis.annotations.Param;

public interface SynPumpingHouseMapper {


    int deleteByPrimaryKey(String id);

    int insert(SynPumpingHouse record);

    int insertSelective(SynPumpingHouse record);


    SynPumpingHouse selectByPrimaryKey(String id);



    int updateByPrimaryKeySelective(SynPumpingHouse record);

    int updateByPrimaryKey(SynPumpingHouse record);
}