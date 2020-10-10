package com.zyjz.sysmanage.service.impl;

import com.zyjz.sysmanage.dao.SiteDeviceModelMapper;
import com.zyjz.sysmanage.entity.SiteDeviceModel;
import com.zyjz.sysmanage.service.SiteDeviceModelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("SiteDeviceModelService")
public class SiteDeviceModelServiceImpl implements SiteDeviceModelService {

    @Autowired
    SiteDeviceModelMapper siteDeviceModelMapper;

    @Override
    public int deleteByPrimaryKey(String id) {
        return siteDeviceModelMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(SiteDeviceModel record) {
        return siteDeviceModelMapper.insert(record);
    }

    @Override
    public int insertSelective(SiteDeviceModel record) {
        return siteDeviceModelMapper.insertSelective(record);
    }

    @Override
    public SiteDeviceModel selectByPrimaryKey(String id) {
        return siteDeviceModelMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(SiteDeviceModel record) {
        return siteDeviceModelMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(SiteDeviceModel record) {
        return siteDeviceModelMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<SiteDeviceModel> selectAll() {
        return siteDeviceModelMapper.selectAll();
    }

    @Override
    public SiteDeviceModel selectByDeviceCode(Integer deviceCode) {
        return siteDeviceModelMapper.selectByDeviceCode(deviceCode);
    }
}
