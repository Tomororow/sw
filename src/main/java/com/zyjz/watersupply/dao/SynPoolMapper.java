package com.zyjz.watersupply.dao;

import com.zyjz.watersupply.entity.SynPool;
import org.apache.ibatis.annotations.Param;

public interface SynPoolMapper {


    int deleteByPrimaryKey(String id);

    int insert(SynPool record);

    int insertSelective(SynPool record);


    SynPool selectByPrimaryKey(String id);


    int updateByPrimaryKey(SynPool record);
}