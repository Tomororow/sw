package com.zyjz.sysmanage.service;

import java.util.List;

import com.zyjz.sysmanage.entity.SiteSpeedInfo;

public interface SiteSpeedService {
	public List<SiteSpeedInfo> findSiteSpeedInfoByCanalCode(String canalCode);
	
	public int addSiteSpeedInfo(SiteSpeedInfo siteSpeedInfo);
	
	public SiteSpeedInfo findSiteSpeedInfoById(String id);
	
	public int updateSiteSpeedInfo(SiteSpeedInfo siteSpeedInfo);
	
	public int delete(String id);
}
