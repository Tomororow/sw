package com.zyjz.watersupply.service;

import java.util.List;

import com.zyjz.watersupply.entity.WaterTreeStructure;

public interface WaterTreeStructureService {
	int deleteByPrimaryKey(String id);

    int insert(WaterTreeStructure record);

    int insertSelective(WaterTreeStructure record);

    WaterTreeStructure selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(WaterTreeStructure record);

    int updateByPrimaryKey(WaterTreeStructure record);
    
    List<WaterTreeStructure> selectCode(String record);

	List<WaterTreeStructure> selectTree();
	
	List<WaterTreeStructure> selectAll();
	
	WaterTreeStructure selectMin();
}
