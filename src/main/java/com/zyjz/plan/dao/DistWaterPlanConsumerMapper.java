package com.zyjz.plan.dao;

import java.util.List;

import com.zyjz.plan.entity.DistWaterPlanConsumer;

public interface DistWaterPlanConsumerMapper {


    int deleteByPrimaryKey(String id);

    int insert(DistWaterPlanConsumer record);

    int insertSelective(DistWaterPlanConsumer record);


    DistWaterPlanConsumer selectByPrimaryKey(String id);


    int updateByPrimaryKeySelective(DistWaterPlanConsumer record);

    int updateByPrimaryKey(DistWaterPlanConsumer record);
    
    List<DistWaterPlanConsumer> findDistWaterPlanConsumersByAreaCodes(
            List<String> areaCodes);
    
    List<DistWaterPlanConsumer> getDistWaterPlanConsumersList();
}