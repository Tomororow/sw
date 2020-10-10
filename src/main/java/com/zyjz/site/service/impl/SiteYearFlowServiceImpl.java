package com.zyjz.site.service.impl;

import com.zyjz.site.dao.SiteYearFlowMapper;
import com.zyjz.site.entity.SiteYearFlow;
import com.zyjz.site.service.SiteYearFlowService;
import com.zyjz.utils.dataSource.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("SiteYearFlowService")
public class SiteYearFlowServiceImpl implements SiteYearFlowService {

    @Autowired
    SiteYearFlowMapper siteYearMapper;

    @Override
    public int selectSYFWithCodeAndTime(String code, String time) {
        return siteYearMapper.selectSYFWithCodeAndTime(code, time);
    }

    @Override
    public int insertSYFWithCodeAndTime(SiteYearFlow siteYearFlow) {
        return siteYearMapper.insertSYFWithCodeAndTime(siteYearFlow);
    }

    @Override
    public int updateSYFWithCodeAndTime(SiteYearFlow siteYearFlow) {
        return siteYearMapper.updateSYFWithCodeAndTime(siteYearFlow);
    }

    @Override
    public List<SiteYearFlow> findSiteYearFlowList(String time, int number) {
        return siteYearMapper.findSiteYearFlowList(time, number);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return siteYearMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(SiteYearFlow record) {
        return siteYearMapper.insert(record);
    }

    @Override
    public int insertSelective(SiteYearFlow record) {
        return siteYearMapper.insertSelective(record);
    }

    @Override
    public SiteYearFlow selectByPrimaryKey(Integer id) {
        return siteYearMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(SiteYearFlow record) {
        return siteYearMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(SiteYearFlow record) {
        return siteYearMapper.updateByPrimaryKey(record);
    }

    @Override
    public SiteYearFlow selectInfoByCodeAndTime(Map<String, Object> map) {
        return siteYearMapper.selectInfoByCodeAndTime(map);
    }

    @Override
    public List<SiteYearFlow> selectSiteYearFlowListByCanalCode(Map<String, Object> map) {
        return siteYearMapper.selectSiteYearFlowListByCanalCode(map);
    }
}
