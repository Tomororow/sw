package com.zyjz.sysmanage.service;

import java.util.List;

import com.zyjz.sysmanage.entity.SiteFlowrateInfo;

public interface SiteFlowrateService {
	public List<SiteFlowrateInfo> findSiteFlowrateInfoByCanalCode(String canalCode);
	
	public int addSiteFlowrateInfo(SiteFlowrateInfo siteFlowrateInfo);
	
	public SiteFlowrateInfo findSiteFlowrateInfoById(String id);
	
	public int updateSiteFlowrateInfo(SiteFlowrateInfo siteFlowrateInfo);
	
	public int delete(String id);
}
