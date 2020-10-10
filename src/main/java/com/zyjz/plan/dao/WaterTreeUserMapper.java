package com.zyjz.plan.dao;

import com.zyjz.plan.entity.WaterTreeUser;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

public interface WaterTreeUserMapper {

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