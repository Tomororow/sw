package com.zyjz.remotecontrol.service.impl;

import com.zyjz.remotecontrol.dao.SiteSluiceGateInfoMapper;
import com.zyjz.remotecontrol.entity.SiteSluiceGateInfo;
import com.zyjz.remotecontrol.service.SiteSluiceGateInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("siteSluiceGateInfoService")
public class SiteSluiceGateInfoServiceImpl implements SiteSluiceGateInfoService {

    @Autowired
    SiteSluiceGateInfoMapper siteSluiceGateInfoMapper;

    @Override
    public int deleteByPrimaryKey(String id) {
        return siteSluiceGateInfoMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(SiteSluiceGateInfo record) {
        return siteSluiceGateInfoMapper.insert(record);
    }

    @Override
    public int insertSelective(SiteSluiceGateInfo record) {
        return siteSluiceGateInfoMapper.insertSelective(record);
    }

    @Override
    public SiteSluiceGateInfo selectByPrimaryKey(String id) {
        return siteSluiceGateInfoMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(SiteSluiceGateInfo record) {
        return siteSluiceGateInfoMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(SiteSluiceGateInfo record) {
        return siteSluiceGateInfoMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<SiteSluiceGateInfo> findSluiceGateAndSluiceJzMiddDevice() {
        return siteSluiceGateInfoMapper.findSluiceGateAndSluiceJzMiddDevice();
    }

    @Override
    public List<SiteSluiceGateInfo> selectAll() {
        return siteSluiceGateInfoMapper.selectAll();
    }
}
