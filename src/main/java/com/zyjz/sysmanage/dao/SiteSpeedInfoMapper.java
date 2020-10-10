package com.zyjz.sysmanage.dao;

import java.util.List;

import com.zyjz.sysmanage.entity.SiteSpeedInfo;

public interface SiteSpeedInfoMapper {

    int deleteByPrimaryKey(String id);

    int insert(SiteSpeedInfo record);

    int insertSelective(SiteSpeedInfo record);

    SiteSpeedInfo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SiteSpeedInfo record);

    int updateByPrimaryKey(SiteSpeedInfo record);
    
    List<SiteSpeedInfo> findSiteSpeedInfoByCanalCode(String canalCode);
}