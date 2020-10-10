package com.zyjz.remotecontrol.service;

import com.zyjz.remotecontrol.entity.SiteSluiceGateInfo;

import java.util.List;

public interface SiteSluiceGateInfoService {

    int deleteByPrimaryKey(String id);

    int insert(SiteSluiceGateInfo record);

    int insertSelective(SiteSluiceGateInfo record);

    SiteSluiceGateInfo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SiteSluiceGateInfo record);

    int updateByPrimaryKey(SiteSluiceGateInfo record);

    List<SiteSluiceGateInfo> findSluiceGateAndSluiceJzMiddDevice();

    List<SiteSluiceGateInfo> selectAll();
}
