package com.zyjz.watersupply.dao;

import com.zyjz.watersupply.entity.SynWaterworks;

public interface SynWaterworksMapper {

    int deleteByPrimaryKey(String id);

    int insert(SynWaterworks record);

    int insertSelective(SynWaterworks record);

    SynWaterworks selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SynWaterworks record);

    int updateByPrimaryKey(SynWaterworks record);
}
