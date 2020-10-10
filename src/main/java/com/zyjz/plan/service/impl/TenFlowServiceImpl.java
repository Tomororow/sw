package com.zyjz.plan.service.impl;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.plan.dao.TenFlowFrequencyMapper;
import com.zyjz.plan.entity.TenFlowFrequency;
import com.zyjz.plan.service.TenFlowService;

@Service("TenFlowService")
public class TenFlowServiceImpl implements TenFlowService {
	@Autowired
	TenFlowFrequencyMapper tenFlowFrequencyMapper;

	@Override
	public List<TenFlowFrequency> findTenFlowFrequencyByDate(int startMonth,int startDay,int endMonth,int endDay) {
		
		return tenFlowFrequencyMapper.findTenFlowFrequencyByDate(startMonth,startDay,endMonth,endDay);
	}

	@Override
	public List<TenFlowFrequency> findTenFlowFrequencyByDateAndRiversCode(
			int startMonth, int startDay, int endMonth, int endDay,
			String riversCode) {
		
		TenFlowFrequency  tenFlowFrequency = new TenFlowFrequency();
		tenFlowFrequency.setStartMonth(startMonth);
		tenFlowFrequency.setStartDay(startDay);
		tenFlowFrequency.setEndMonth(endMonth);
		tenFlowFrequency.setEndDay(endDay);
		tenFlowFrequency.setRiversCode(riversCode);
		
		List<TenFlowFrequency> list= tenFlowFrequencyMapper.findTenFlowFrequencyByDateAndRiversCode(tenFlowFrequency);
		
		return list;
	}

	@Override
	public List<TenFlowFrequency> findMsgByCurrentYear(int currentYear) {
		return tenFlowFrequencyMapper.findMsgByCurrentYear(currentYear);
	}

	@Override
	public List<TenFlowFrequency> findContrastYearByFlowAndRiversCode(BigDecimal tenFlow,int startMonth,int startDay,int endMonth,int day,String riversCode) {
		return tenFlowFrequencyMapper.findContrastYearByFlowAndRiversCode(tenFlow,startMonth,startDay,endMonth,day,riversCode);
	}

	@Override
	public int updateTenFlowFrequency(TenFlowFrequency tenFlowFrequency) {
		return tenFlowFrequencyMapper.updateByPrimaryKeySelective(tenFlowFrequency);
	}

	@Override
	public int addTenFlowFrequency(TenFlowFrequency tenFlowFrequency) {
		return tenFlowFrequencyMapper.insertSelective(tenFlowFrequency);
	}

	@Override
	public TenFlowFrequency findTenFlowFrequencyById(String id) {
		return tenFlowFrequencyMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<TenFlowFrequency> findTenFlowFrequencysByRiversCodeAndMonthAndDay(
			String canalCode, int month,int startDay) {
		return tenFlowFrequencyMapper.findTenFlowFrequencysByRiversCodeAndMonthAndDay(canalCode,month,startDay);
	}

}
