package com.zyjz.site.service.impl;

import com.zyjz.site.dao.SiteHourFlowMapper;
import com.zyjz.site.dao.SiteYearFlowMapper;
import com.zyjz.site.entity.SiteHourFlow;
import com.zyjz.site.service.SiteHourFlowService;
import com.zyjz.utils.dataSource.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("SiteHourFlowService")
public class SiteHourFlowServiceImpl implements SiteHourFlowService {

    @Autowired
    SiteHourFlowMapper siteHourFlowMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return siteHourFlowMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(SiteHourFlow record) {
        return siteHourFlowMapper.insert(record);
    }

    @Override
    public int insertSelective(SiteHourFlow record) {
        return siteHourFlowMapper.insertSelective(record);
    }

    @Override
    public SiteHourFlow selectByPrimaryKey(Integer id) {
        return siteHourFlowMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(SiteHourFlow record) {
        return siteHourFlowMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(SiteHourFlow record) {
        return siteHourFlowMapper.updateByPrimaryKey(record);
    }

    @Override
    public int selectCountByCodeAndTime(Map<String, Object> map) {
        return siteHourFlowMapper.selectCountByCodeAndTime(map);
    }

    @Override
    public int updateByWaterCodeSelective(SiteHourFlow record) {
        return siteHourFlowMapper.updateByWaterCodeSelective(record);
    }

    @Override
    public SiteHourFlow selectInfoByCodeAndTime(Map<String, Object> map) {
        return siteHourFlowMapper.selectInfoByCodeAndTime(map);
    }

    @Override
    public List<SiteHourFlow> selectCountByDayTime(Map<String, Object> map) {
        return siteHourFlowMapper.selectCountByDayTime(map);
    }

    @Override
    public List<SiteHourFlow> selectCountDayFlowPerHour(Map<String, Object> map) {
        return siteHourFlowMapper.selectCountDayFlowPerHour(map);
    }
}
