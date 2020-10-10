package com.zyjz.sysmanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.sysmanage.dao.SiteSluiceInfoMapper;
import com.zyjz.sysmanage.entity.SiteSluiceInfo;
import com.zyjz.sysmanage.service.SiteSluiceService;
@Service("SiteSluiceService")
public class SiteSluiceServiceImpl implements SiteSluiceService {

	@Autowired
	SiteSluiceInfoMapper siteSluiceInfoMapper;
	
	@Override
	public List<SiteSluiceInfo> findSiteSluiceInfoByCanalCode(
			String ssiCanalCode) {
		return siteSluiceInfoMapper.findSiteSluiceInfoByCanalCode(ssiCanalCode);
	}
	
	@Override
	public List<SiteSluiceInfo> findSiteSluiceInfoByCanalCodeJoin(
			String ssiCanalCode) {
		return siteSluiceInfoMapper.findSiteSluiceInfoByCanalCodeJoin(ssiCanalCode);
	}
	
	@Override
	public  List<SiteSluiceInfo> selectByPrimaryKey(List<String> canalCodes) {
		return siteSluiceInfoMapper.selectByPrimaryKey(canalCodes);
	}

	@Override
	public void insertSelective(SiteSluiceInfo record) {
		siteSluiceInfoMapper.insertSelective(record);
	}

	@Override
	public SiteSluiceInfo selectById(String id) {
		// TODO Auto-generated method stub
		return siteSluiceInfoMapper.selectById(id);
	}

	@Override
	public int updateByPrimaryKeySelective(SiteSluiceInfo record) {
		
		return siteSluiceInfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int deleteByPrimaryKey(String id) {
		return siteSluiceInfoMapper.deleteByPrimaryKey(id);
	}


	@Override
	public List<SiteSluiceInfo> findByCode(List<String> code) {
		return siteSluiceInfoMapper.findByCode(code);
	}

	@Override
	public List<SiteSluiceInfo> findSiteSluiceInfoByCanalCodeByCodeOrName(String canalCode, String deviceSluiceCode, String deviceSluiceName) {
		return siteSluiceInfoMapper.findSiteSluiceInfoByCanalCodeByCodeOrName(canalCode, deviceSluiceCode, deviceSluiceName);
	}
}
