package com.zyjz.sysmanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.sysmanage.dao.SiteFlowrateInfoMapper;
import com.zyjz.sysmanage.entity.SiteFlowrateInfo;
import com.zyjz.sysmanage.service.SiteFlowrateService;

@Service("SiteFlowrateService")
public class SiteFlowrateServiceImpl implements SiteFlowrateService {
	@Autowired
	SiteFlowrateInfoMapper siteFlowrateInfoMapper;
	
	@Override
	public List<SiteFlowrateInfo> findSiteFlowrateInfoByCanalCode(
			String canalCode) {
		return siteFlowrateInfoMapper.findSiteFlowrateInfoByCanalCode(canalCode);
	}

	@Override
	public int addSiteFlowrateInfo(SiteFlowrateInfo siteFlowrateInfo) {
		return siteFlowrateInfoMapper.insertSelective(siteFlowrateInfo);
	}

	@Override
	public SiteFlowrateInfo findSiteFlowrateInfoById(String id) {
		return siteFlowrateInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateSiteFlowrateInfo(SiteFlowrateInfo siteFlowrateInfo) {
		return siteFlowrateInfoMapper.updateByPrimaryKeySelective(siteFlowrateInfo);
	}

	@Override
	public int delete(String id) {
		return siteFlowrateInfoMapper.deleteByPrimaryKey(id);
	}

}
