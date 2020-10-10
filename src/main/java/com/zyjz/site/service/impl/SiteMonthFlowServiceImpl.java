package com.zyjz.site.service.impl;

import com.zyjz.site.dao.SiteMonthFlowMapper;
import com.zyjz.site.entity.SiteMonthFlow;
import com.zyjz.site.service.SiteMonthFlowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("SiteMonthFlowService")
public class SiteMonthFlowServiceImpl implements SiteMonthFlowService {

    @Autowired
    SiteMonthFlowMapper siteMonthMapper;

    @Override
    public int selectSMFWithCodeAndTime(String code, String time) {
        return siteMonthMapper.selectSMFWithCodeAndTime(code, time);
    }

    @Override
    public int insertSMFWithCodeAndTime(SiteMonthFlow siteMonthFlow) {
        return siteMonthMapper.insertSMFWithCodeAndTime(siteMonthFlow);
    }

    @Override
    public int updateSMFWithCodeAndTime(SiteMonthFlow siteMonthFlow) {
        return siteMonthMapper.updateSMFWithCodeAndTime(siteMonthFlow);
    }

    @Override
    public List<SiteMonthFlow> findSiteMonthFlowList(String time, int number) {
        return siteMonthMapper.findSiteMonthFlowList(time,number);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return siteMonthMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(SiteMonthFlow record) {
        return siteMonthMapper.insert(record);
    }

    @Override
    public int insertSelective(SiteMonthFlow record) {
        return siteMonthMapper.insertSelective(record);
    }

    @Override
    public SiteMonthFlow selectByPrimaryKey(Integer id) {
        return siteMonthMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(SiteMonthFlow record) {
        return siteMonthMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(SiteMonthFlow record) {
        return siteMonthMapper.updateByPrimaryKey(record);
    }

    @Override
    public SiteMonthFlow selectInfoByCodeAndTime(Map<String, Object> map) {
        return siteMonthMapper.selectInfoByCodeAndTime(map);
    }

    @Override
    public List<SiteMonthFlow> selectCountByYearTime(Map<String, Object> map) {
        return siteMonthMapper.selectCountByYearTime(map);
    }

    @Override
    public List<SiteMonthFlow> selectCountYearFlowPerMonth(Map<String, Object> map) {
        return siteMonthMapper.selectCountYearFlowPerMonth(map);
    }

    @Override
    public List<SiteMonthFlow> selectCountYearFlowGroupByWaterCode(Map<String, Object> map) {
        return siteMonthMapper.selectCountYearFlowGroupByWaterCode(map);
    }

    @Override
    public List<SiteMonthFlow> selectSiteMonthFlowListByCanalCode(Map<String, Object> map) {
        return siteMonthMapper.selectSiteMonthFlowListByCanalCode(map);
    }

    @Override
    public List<SiteMonthFlow> selectReportDetailData(Map<String, Object> map) {
        return siteMonthMapper.selectReportDetailData(map);
    }
}
