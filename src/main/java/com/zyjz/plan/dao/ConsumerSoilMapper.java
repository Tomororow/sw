package com.zyjz.plan.dao;

import java.util.List;

import com.zyjz.plan.entity.ConsumerSoil;

public interface ConsumerSoilMapper {


    int deleteByPrimaryKey(String id);

    int insert(ConsumerSoil record);

    int insertSelective(ConsumerSoil record);

    ConsumerSoil selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ConsumerSoil record);

    int updateByPrimaryKey(ConsumerSoil record);
    
    List<ConsumerSoil> findConsumerSoilsByCanalCodes(List<String> canalCodeList); 
    
    List<ConsumerSoil> findConsumerSoilsByCanalCodesJoin(String canalCode);
}