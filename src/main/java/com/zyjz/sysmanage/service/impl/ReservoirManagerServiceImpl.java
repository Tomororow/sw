package com.zyjz.sysmanage.service.impl;

import java.util.List;

import com.zyjz.utils.dataSource.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.sysmanage.dao.SiteReservoirInfoMapper;
import com.zyjz.sysmanage.entity.SiteReservoirInfo;
import com.zyjz.sysmanage.service.ReservoirManagerService;


@Service("ReservoirManagerService")
public class ReservoirManagerServiceImpl implements ReservoirManagerService {

	@Autowired
	SiteReservoirInfoMapper siteReservoirInfoMapper;
	
	@Override
	public List<SiteReservoirInfo> findAllReservoir() {
		return siteReservoirInfoMapper.findAllReservoir();
	}

	@Override
	public SiteReservoirInfo findSiteReservoirInfoById(String id) {
		return siteReservoirInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<SiteReservoirInfo> findSiteReservoirInfoBySyswaterareaCode(
			String syswaterareaCode) {
		return null;
	}

	@Override
	public int addSiteReservoirInfo(SiteReservoirInfo siteReservoirInfo) {
		return siteReservoirInfoMapper.insertSelective(siteReservoirInfo);
	}

	@Override
	public int updateByPrimaryKeySelective(SiteReservoirInfo record) {
		// TODO Auto-generated method stub
		return siteReservoirInfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int deleteByPrimaryKey(String id) {
		// TODO Auto-generated method stub
		return siteReservoirInfoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<SiteReservoirInfo> selectReservoirList(String canalCode) {
		return siteReservoirInfoMapper.selectReservoirList(canalCode);
	}
}
