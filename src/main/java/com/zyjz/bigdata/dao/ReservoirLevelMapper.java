package com.zyjz.bigdata.dao;

import com.zyjz.bigdata.entity.ReservoirLevel;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface ReservoirLevelMapper {

    int deleteByPrimaryKey(String id);

    int insert(ReservoirLevel record);

    int insertSelective(ReservoirLevel record);

    ReservoirLevel selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ReservoirLevel record);

    int updateByPrimaryKey(ReservoirLevel record);

    List<ReservoirLevel> selectLevelAndCapacityByCode(@Param("reservoirCode") String reservoirCode,@Param("createTime") String createTime);
}