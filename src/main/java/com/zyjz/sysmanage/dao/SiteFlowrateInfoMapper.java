package com.zyjz.sysmanage.dao;

import java.util.List;

import com.zyjz.sysmanage.entity.SiteFlowrateInfo;

public interface SiteFlowrateInfoMapper {

    int deleteByPrimaryKey(String id);

    int insert(SiteFlowrateInfo record);

    int insertSelective(SiteFlowrateInfo record);


    SiteFlowrateInfo selectByPrimaryKey(String id);


    int updateByPrimaryKeySelective(SiteFlowrateInfo record);

    int updateByPrimaryKey(SiteFlowrateInfo record);
    
    List<SiteFlowrateInfo> findSiteFlowrateInfoByCanalCode(String canalCode);
}