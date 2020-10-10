package com.zyjz.plan.service;

import java.util.List;

import com.zyjz.plan.entity.WaterTreeUser;

public interface WaterTreeUserService {
	int deleteByPrimaryKey(String id);

    int insert(WaterTreeUser record);

    int insertSelective(WaterTreeUser record);

    WaterTreeUser selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(WaterTreeUser record);

    int updateByPrimaryKey(WaterTreeUser record);
    
    List<WaterTreeUser> selectAll();
    
    List<WaterTreeUser> selectParentId(String parentId);
    
    WaterTreeUser selectMin();
    
    List<WaterTreeUser> selectByAllId(String Id);
    
    WaterTreeUser selectTreeName(String treeName);
}
