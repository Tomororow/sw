package com.zyjz.watersupply.dao;

import java.util.List;

import com.zyjz.watersupply.entity.WaterTreeStructure;
import org.springframework.stereotype.Repository;

public interface WaterTreeStructureMapper {

    int deleteByPrimaryKey(String id);

    int insert(WaterTreeStructure record);

    int insertSelective(WaterTreeStructure record);

    WaterTreeStructure selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(WaterTreeStructure record);

    int updateByPrimaryKey(WaterTreeStructure record);
    
    List<WaterTreeStructure> selectCode(String record);
    
    List<WaterTreeStructure> selectAll();
    
    WaterTreeStructure selectMin();
}