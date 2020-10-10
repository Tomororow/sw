package com.zyjz.watersupply.dao;

import com.zyjz.watersupply.entity.SynPipeNetwork;
import org.apache.ibatis.annotations.Param;

public interface SynPipeNetworkMapper {


    int deleteByPrimaryKey(String id);

    int insert(SynPipeNetwork record);

    int insertSelective(SynPipeNetwork record);


    SynPipeNetwork selectByPrimaryKey(String id);


    int updateByPrimaryKeySelective(SynPipeNetwork record);

    int updateByPrimaryKey(SynPipeNetwork record);
}