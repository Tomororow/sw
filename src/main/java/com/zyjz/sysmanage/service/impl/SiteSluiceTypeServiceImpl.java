package com.zyjz.sysmanage.service.impl;

import com.zyjz.sysmanage.dao.SiteSluiceTypeMapper;
import com.zyjz.sysmanage.entity.SiteSluiceType;
import com.zyjz.sysmanage.service.SiteSluiceTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("siteSluiceTypeService")
public class SiteSluiceTypeServiceImpl implements SiteSluiceTypeService {

    @Autowired
    SiteSluiceTypeMapper siteSluiceTypeMapper;

    @Override
    public int deleteByPrimaryKey(String id) {
        return siteSluiceTypeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(SiteSluiceType record) {
        return siteSluiceTypeMapper.insert(record);
    }

    @Override
    public int insertSelective(SiteSluiceType record) {
        return siteSluiceTypeMapper.insertSelective(record);
    }

    @Override
    public SiteSluiceType selectByPrimaryKey(String id) {
        return siteSluiceTypeMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(SiteSluiceType record) {
        return siteSluiceTypeMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(SiteSluiceType record) {
        return siteSluiceTypeMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<SiteSluiceType> selectAll() {
        return siteSluiceTypeMapper.selectAll();
    }
}
