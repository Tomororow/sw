package com.zyjz.sysmanage.service;

import com.zyjz.sysmanage.entity.SiteWaterInfo;

import java.util.List;

public interface SiteWaterService {
	
	public List<SiteWaterInfo> findSiteWaterInfoByCanalCode(String swiCanalCode);
	
	public int addSiteWaterInfo(SiteWaterInfo siteWaterInfo);
	
	public SiteWaterInfo findSiteWaterInfoById(String id);
	
	public int updateSiteWaterInfo(SiteWaterInfo siteWaterInfo);

	public int delete(String id);
	
	 List<SiteWaterInfo> selectAll();
	
	public List<SiteWaterInfo> findAllSiteWater();
	
	List<SiteWaterInfo> findSiteWaterByCanalCodes(List<String> canalCodes);
	
	List<SiteWaterInfo> findSiteWaterByCanalCodesJoin(String canalCode);
	
	SiteWaterInfo findSiteWaterInfoByCode(String devicewaterCode);
	
	List<SiteWaterInfo> selectCodetype(List<String> swiCanalCode, String swiDevicemodelCode);
	
	List<SiteWaterInfo> selectCode(List<String> code);
	
	List<SiteWaterInfo> selectCodecanal(List<String> code);
	
	SiteWaterInfo selectName(String deviceWaterName);
	
	List<String> findSiteWaterByCanalString(List<String> canalCodes);
	
	Integer findSiteWaterCount(List<String> canalCodes);
	
	Integer findSiteWaterByCanalCodeJoinCount(String canalCode);


	List<SiteWaterInfo> findSiteWaterJoinSiteMiddleCanal(String canalCode);
	
}
