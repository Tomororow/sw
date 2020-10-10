package com.zyjz.site.service.impl;

import com.zyjz.site.dao.SiteSluiceDynamicInfoMapper;
import com.zyjz.site.entity.SiteSluiceDynamicInfo;
import com.zyjz.site.service.SiteSluiceDynamicInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service("/siteSluiceDynamicInfo")
public class SiteSluiceDynamicInfoServiceImpl implements  SiteSluiceDynamicInfoService{
	
	@Autowired
	private SiteSluiceDynamicInfoMapper siteSluiceDynamicInfoMapper;

	@Override
	public int deleteByPrimaryKey(String id) {
		
		return siteSluiceDynamicInfoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(SiteSluiceDynamicInfo record) {
		
		return siteSluiceDynamicInfoMapper.insert(record);
	}

	@Override
	public int insertSelective(SiteSluiceDynamicInfo record) {
		
		return siteSluiceDynamicInfoMapper.insertSelective(record);
	}

	@Override
	public SiteSluiceDynamicInfo selectByPrimaryKey(String id) {
		
		return siteSluiceDynamicInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(SiteSluiceDynamicInfo record) {
		
		return siteSluiceDynamicInfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(SiteSluiceDynamicInfo record) {
		
		return siteSluiceDynamicInfoMapper.updateByPrimaryKey(record);
	}


	@Override
	public List<SiteSluiceDynamicInfo> selectCode(List<String> code) {
		return siteSluiceDynamicInfoMapper.selectCode(code);
	}

	@Override
	public List<SiteSluiceDynamicInfo> selectDate(Map<String, Object> pageInfe) {
		return siteSluiceDynamicInfoMapper.selectDate(pageInfe);
	}

	@Override
	public SiteSluiceDynamicInfo selectLimit(String deviceCode) {
		return siteSluiceDynamicInfoMapper.selectLimit(deviceCode);
	}

	@Override
	public int selectCodeLength(List<String> devicesluiceCode) {
		return siteSluiceDynamicInfoMapper.selectCodeLength(devicesluiceCode);
	}

	@Override
	public List<SiteSluiceDynamicInfo> selectRealTimeDataList(String canalCode) {
		return siteSluiceDynamicInfoMapper.selectRealTimeDataList(canalCode);
	}

	@Override
	public List<SiteSluiceDynamicInfo> selectHistoryDataList(String devicesluiceCode) {
		return siteSluiceDynamicInfoMapper.selectHistoryDataList(devicesluiceCode);
	}

    @Override
    public List<SiteSluiceDynamicInfo> selectSluiceDataByCodeOrName(String canalCode, String devicesluiceCode, String deviceSluiceName) {
        return siteSluiceDynamicInfoMapper.selectSluiceDataByCodeOrName(canalCode, devicesluiceCode, deviceSluiceName);
    }

	@Override
	public List<SiteSluiceDynamicInfo> scheduledTaskSluiceOfDayFlow() {
		return siteSluiceDynamicInfoMapper.scheduledTaskSluiceOfDayFlow();
	}

	@Override
	public List<SiteSluiceDynamicInfo> scheduledTaskSluiceOfMonthFlow() {
		return siteSluiceDynamicInfoMapper.scheduledTaskSluiceOfMonthFlow();
	}

	@Override
	public List<SiteSluiceDynamicInfo> scheduledTaskSluiceOfYearFlow() {
		return siteSluiceDynamicInfoMapper.scheduledTaskSluiceOfYearFlow();
	}

	@Override
	public List<SiteSluiceDynamicInfo> selectNowDynamicInfo() {
		return siteSluiceDynamicInfoMapper.selectNowDynamicInfo();
	}
}
