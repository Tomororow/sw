package com.zyjz.plan.dao;

import java.util.List;

import com.zyjz.plan.entity.SoilTypeInfo;

public interface SoilTypeInfoMapper {


    int deleteByPrimaryKey(String id);

    int insert(SoilTypeInfo record);

    int insertSelective(SoilTypeInfo record);


    SoilTypeInfo selectByPrimaryKey(String id);

    List<SoilTypeInfo> findAll();

    int updateByPrimaryKeySelective(SoilTypeInfo record);

    int updateByPrimaryKey(SoilTypeInfo record);
}