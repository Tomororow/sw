package com.zyjz.plan.service;

import java.math.BigDecimal;
import java.util.List;

import com.zyjz.plan.entity.TenFlowFrequency;

public interface TenFlowService {
	
	public List<TenFlowFrequency> findTenFlowFrequencyByDate(int startMonth, int startDay, int endMonth, int endDay);
	
	public List<TenFlowFrequency> findTenFlowFrequencyByDateAndRiversCode(int startMonth, int startDay, int endMonth, int endDay, String riversCode);

	public List<TenFlowFrequency> findMsgByCurrentYear(int currentYear);
	
	public List<TenFlowFrequency> findContrastYearByFlowAndRiversCode(BigDecimal tenFlow, int startMonth, int startDay, int endMonth, int day, String riversCode);
	
	public int updateTenFlowFrequency(TenFlowFrequency tenFlowFrequency);
	
	public int addTenFlowFrequency(TenFlowFrequency tenFlowFrequency);
	
	public TenFlowFrequency findTenFlowFrequencyById(String id);
	
	public List<TenFlowFrequency> findTenFlowFrequencysByRiversCodeAndMonthAndDay(String canalCode, int month, int startDay);
}
