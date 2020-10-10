package com.zyjz.sysmanage.service.impl;

import java.util.List;

import com.zyjz.sysmanage.entity.SiteWaterInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.sysmanage.dao.SiteWaterInfoMapper;
import com.zyjz.sysmanage.service.SiteWaterService;

@Service("SiteWaterService")
public class SiteWaterServiceImpl implements SiteWaterService {
	@Autowired
	SiteWaterInfoMapper siteWaterInfoMapper;
	
	@Override
	public List<SiteWaterInfo> findSiteWaterInfoByCanalCode(String swiCanalCode) {
		return siteWaterInfoMapper.findSiteWaterInfoByCanalCode(swiCanalCode);
	}
	
	public int addSiteWaterInfo(SiteWaterInfo siteWaterInfo){
		return siteWaterInfoMapper.insertSelective(siteWaterInfo);
	}

	@Override
	public SiteWaterInfo findSiteWaterInfoById(String id) {
		return siteWaterInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateSiteWaterInfo(SiteWaterInfo siteWaterInfo) {
		return siteWaterInfoMapper.updateByPrimaryKeySelective(siteWaterInfo);
	}

	@Override
	public int delete(String id) {
		return siteWaterInfoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<SiteWaterInfo> findAllSiteWater() {
		return siteWaterInfoMapper.selectAll();
	}

	@Override
	public List<SiteWaterInfo> findSiteWaterByCanalCodes(List<String> canalCodes) {
		return siteWaterInfoMapper.findSiteWaterByCanalCodes(canalCodes);
	}
	@Override
	public List<SiteWaterInfo> findSiteWaterByCanalCodesJoin(String canalCode) {
		return siteWaterInfoMapper.findSiteWaterByCanalCodesJoin(canalCode);
	}

	@Override
	public SiteWaterInfo findSiteWaterInfoByCode(String devicewaterCode) {
		return siteWaterInfoMapper.findSiteWaterInfoByCode(devicewaterCode);
	}


	@Override
	public List<SiteWaterInfo> selectCodetype(List<String> swiCanalCode, String swiDevicemodelCode) {
		return siteWaterInfoMapper.selectCodetype(swiCanalCode,swiDevicemodelCode);
	}

	@Override
	public SiteWaterInfo selectName(String deviceWaterName) {
		return siteWaterInfoMapper.selectName(deviceWaterName);
	}

	@Override
	public List<String> findSiteWaterByCanalString(List<String> canalCodes) {
		// TODO Auto-generated method stub
		return siteWaterInfoMapper.findSiteWaterByCanalString(canalCodes);
	}

	@Override
	public Integer findSiteWaterCount(List<String> canalCodes) {
		// TODO Auto-generated method stub
		return siteWaterInfoMapper.findSiteWaterCount(canalCodes);
	}
	
	@Override
	public List<SiteWaterInfo> selectCode(List<String> code) {
		// TODO Auto-generated method stub
		return siteWaterInfoMapper.selectCode(code);
	}

	@Override
	public List<SiteWaterInfo> selectCodecanal(List<String> code) {
		// TODO Auto-generated method stub
		return siteWaterInfoMapper.selectCodecanal(code);
	}

	@Override
	public List<SiteWaterInfo> selectAll() {
		// TODO Auto-generated method stub
		return siteWaterInfoMapper.selectAll();
	}

	@Override
	public Integer findSiteWaterByCanalCodeJoinCount(String canalCode) {
		// TODO Auto-generated method stub
		return siteWaterInfoMapper.findSiteWaterByCanalCodeJoinCount(canalCode);
	}

	@Override
	public List<SiteWaterInfo> findSiteWaterJoinSiteMiddleCanal(String canalCode) {
		return siteWaterInfoMapper.findSiteWaterJoinSiteMiddleCanal(canalCode);
	}
}
