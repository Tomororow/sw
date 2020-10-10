package com.zyjz.remotecontrol.service.impl;

import com.zyjz.remotecontrol.dao.SiteSluiceJzMiddDeviceMapper;
import com.zyjz.remotecontrol.entity.SiteSluiceJzMiddDevice;
import com.zyjz.remotecontrol.service.SiteSluiceJzMiddDeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("siteSluiceJzMiddDeviceService")
public class SiteSluiceJzMiddDeviceServiceImpl implements SiteSluiceJzMiddDeviceService {

    @Autowired
    SiteSluiceJzMiddDeviceMapper siteSluiceJzMiddDeviceMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return siteSluiceJzMiddDeviceMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(SiteSluiceJzMiddDevice record) {
        return siteSluiceJzMiddDeviceMapper.insert(record);
    }

    @Override
    public int insertSelective(SiteSluiceJzMiddDevice record) {
        return siteSluiceJzMiddDeviceMapper.insertSelective(record);
    }

    @Override
    public SiteSluiceJzMiddDevice selectByPrimaryKey(Integer id) {
        return siteSluiceJzMiddDeviceMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(SiteSluiceJzMiddDevice record) {
        return siteSluiceJzMiddDeviceMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(SiteSluiceJzMiddDevice record) {
        return siteSluiceJzMiddDeviceMapper.updateByPrimaryKey(record);
    }
}
