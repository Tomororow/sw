package com.zyjz.sysmanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.sysmanage.dao.SiteSpeedInfoMapper;
import com.zyjz.sysmanage.entity.SiteSpeedInfo;
import com.zyjz.sysmanage.service.SiteSpeedService;

@Service("SiteSpeedService")
public class SiteSpeedServiceImpl implements SiteSpeedService {
	
	@Autowired
	SiteSpeedInfoMapper siteSpeedInfoMapper;
	
	@Override
	public List<SiteSpeedInfo> findSiteSpeedInfoByCanalCode(String canalCode) {
		return siteSpeedInfoMapper.findSiteSpeedInfoByCanalCode(canalCode);
	}

	@Override
	public int addSiteSpeedInfo(SiteSpeedInfo siteSpeedInfo) {
		return siteSpeedInfoMapper.insertSelective(siteSpeedInfo);
	}

	@Override
	public SiteSpeedInfo findSiteSpeedInfoById(String id) {
		return siteSpeedInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateSiteSpeedInfo(SiteSpeedInfo siteSpeedInfo) {
		return siteSpeedInfoMapper.updateByPrimaryKeySelective(siteSpeedInfo);
	}

	@Override
	public int delete(String id) {
		return siteSpeedInfoMapper.deleteByPrimaryKey(id);
	}

}
