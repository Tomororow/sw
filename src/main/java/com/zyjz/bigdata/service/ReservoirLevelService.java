package com.zyjz.bigdata.service;

import com.zyjz.bigdata.entity.ReservoirLevel;

import java.util.List;

public interface ReservoirLevelService {

    int deleteByPrimaryKey(String id);

    int insert(ReservoirLevel record);

    int insertSelective(ReservoirLevel record);

    ReservoirLevel selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ReservoirLevel record);

    int updateByPrimaryKey(ReservoirLevel record);

    List<ReservoirLevel> selectLevelAndCapacityByCode(String reservoirCode,String createTime);
}
