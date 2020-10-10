package com.zyjz.remotecontrol.service;

import com.zyjz.remotecontrol.entity.SiteSluiceJzMiddDevice;

public interface SiteSluiceJzMiddDeviceService {

    int deleteByPrimaryKey(Integer id);

    int insert(SiteSluiceJzMiddDevice record);

    int insertSelective(SiteSluiceJzMiddDevice record);

    SiteSluiceJzMiddDevice selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SiteSluiceJzMiddDevice record);

    int updateByPrimaryKey(SiteSluiceJzMiddDevice record);
}
