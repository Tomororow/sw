package com.zyjz.site.service.impl;

import com.zyjz.site.dao.SiteDayFlowMapper;
import com.zyjz.site.entity.SiteDayFlow;
import com.zyjz.site.service.SiteDayFlowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("SiteDayFlowService")
public class SiteDayFlowServiceImpl implements SiteDayFlowService {

    @Autowired
    SiteDayFlowMapper siteDayFlowMapper;

    @Override
    public int selectSDFWithCodeAndTime(String code, String time) {
        return siteDayFlowMapper.selectSDFWithCodeAndTime(code,time);
    }

    @Override
    public int insertSDFWithCodeAndTime(SiteDayFlow siteDayFlow) {
        return siteDayFlowMapper.insertSDFWithCodeAndTime(siteDayFlow);
    }

    @Override
    public int updateSDFWithCodeAndTime(SiteDayFlow siteDayFlow) {
        return siteDayFlowMapper.updateSDFWithCodeAndTime(siteDayFlow);
    }

    @Override
    public List<SiteDayFlow> findSiteDayFlowList(String time, int number) {
        return siteDayFlowMapper.findSiteDayFlowList(time, number);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return siteDayFlowMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(SiteDayFlow record) {
        return siteDayFlowMapper.insert(record);
    }

    @Override
    public int insertSelective(SiteDayFlow record) {
        return siteDayFlowMapper.insertSelective(record);
    }

    @Override
    public SiteDayFlow selectByPrimaryKey(Integer id) {
        return siteDayFlowMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(SiteDayFlow record) {
        return siteDayFlowMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(SiteDayFlow record) {
        return siteDayFlowMapper.updateByPrimaryKey(record);
    }

    @Override
    public SiteDayFlow selectInfoByCodeAndTime(Map<String, Object> map) {
        return siteDayFlowMapper.selectInfoByCodeAndTime(map);
    }

    @Override
    public List<SiteDayFlow> selectCountByMonthTime(Map<String, Object> map) {
        return siteDayFlowMapper.selectCountByMonthTime(map);
    }

    @Override
    public List<SiteDayFlow> selectCountMonthFlowPerDay(Map<String, Object> map) {
        return siteDayFlowMapper.selectCountMonthFlowPerDay(map);
    }

    @Override
    public List<SiteDayFlow> selectSiteDayFlowListByCanalCode(Map<String, Object> map) {
        return siteDayFlowMapper.selectSiteDayFlowListByCanalCode(map);
    }

    @Override
    public List<SiteDayFlow> selectReportDetailData(Map<String, Object> map) {
        return siteDayFlowMapper.selectReportDetailData(map);
    }
}
