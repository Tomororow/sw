package com.zyjz.sysmanage.service.impl;

import com.zyjz.sysmanage.dao.SiteMiddleCanalMapper;
import com.zyjz.sysmanage.entity.SiteMiddleCanal;
import com.zyjz.sysmanage.service.SiteMiddleCanalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("siteMiddleCanalService")
public class SiteMiddleCanalServiceImpl implements SiteMiddleCanalService {

    @Autowired
    SiteMiddleCanalMapper siteMiddleCanalMapper;

    /**
     * 根据canalcode查询水位站编码
     * @param canalCode
     * @return
     */
    @Override
    public List<SiteMiddleCanal> findSiteWaterCodeByCanalCode(String canalCode) {
        return siteMiddleCanalMapper.findSiteWaterCodeByCanalCode(canalCode);
    }

    @Override
    public List<SiteMiddleCanal> selectCanalInfoByCodeIsNull(String canalCode, String columnName) {
        return siteMiddleCanalMapper.selectCanalInfoByCodeIsNull(canalCode, columnName);
    }

    @Override
    public int insertSelective(SiteMiddleCanal siteMiddleCanal) {
        return siteMiddleCanalMapper.insertSelective(siteMiddleCanal);
    }

    @Override
    public int updateByPrimaryKeySelective(SiteMiddleCanal siteMiddleCanal) {
        return siteMiddleCanalMapper.updateByPrimaryKeySelective(siteMiddleCanal);
    }

    @Override
    public List<SiteMiddleCanal> selectMiddleCanalInfoByCode(String code, String columnName) {
        return siteMiddleCanalMapper.selectMiddleCanalInfoByCode(code, columnName);
    }
}
