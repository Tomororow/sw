package com.zyjz.sysmanage.service;

import java.util.List;

import com.zyjz.sysmanage.entity.SiteReservoirInfo;


public interface ReservoirManagerService {

	public List<SiteReservoirInfo> findAllReservoir();
	
	public SiteReservoirInfo findSiteReservoirInfoById(String id);
	
	public List<SiteReservoirInfo> findSiteReservoirInfoBySyswaterareaCode(String syswaterareaCode);
	
	public int addSiteReservoirInfo(SiteReservoirInfo siteReservoirInfo);
	
	 int updateByPrimaryKeySelective(SiteReservoirInfo record);
	 
	 int deleteByPrimaryKey(String id);

	List<SiteReservoirInfo> selectReservoirList(String canalCode);
}
