package com.zyjz.plan.dao;

import com.zyjz.plan.entity.CollectBaseParams;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface CollectBaseParamsMapper {

    int deleteByPrimaryKey(String id);

    int insert(CollectBaseParams record);

    int insertSelective(CollectBaseParams record);

    CollectBaseParams selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(CollectBaseParams record);

    int updateByPrimaryKey(CollectBaseParams record);
    
    List<CollectBaseParams> selectBaseInclude();
    
    CollectBaseParams selectByPrimaryBaseName(String baseName);
    
    CollectBaseParams selectByPrimaryBaseOne(@Param("baseName") String baseName, @Param("level") String level);
    
    List<CollectBaseParams> selectAll(String activeName);
}