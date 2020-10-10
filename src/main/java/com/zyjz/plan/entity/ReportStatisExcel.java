package com.zyjz.plan.entity;

import java.math.BigDecimal;

import org.springframework.format.annotation.DateTimeFormat;

import cn.afterturn.easypoi.excel.annotation.Excel;

public class ReportStatisExcel {
	
	@Excel(name="渠道名称", height = 13, width = 20, orderNum = "1")
    private String canclName;
	
	@Excel(name="渠道编码", height = 13, width = 20, orderNum = "2")
    private String canclCode;
	
	@Excel(name="平均流量", height = 13, width = 20, orderNum = "3")
    private BigDecimal avgFlow;
	
	@Excel(name="总引水量", height = 13, width = 20, orderNum = "4")
    private BigDecimal sumFlow;
	
	@Excel(name="设备状态", height = 13, width = 20, orderNum = "5")
    private String deviceState;
	
	@Excel(name="查询时间", height = 13, width = 20, orderNum = "6")
    private String createTime;

	public ReportStatisExcel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReportStatisExcel(String canclName, String canclCode,
			BigDecimal avgFlow, BigDecimal sumFlow, String deviceState,
			String createTime) {
		super();
		this.canclName = canclName;
		this.canclCode = canclCode;
		this.avgFlow = avgFlow;
		this.sumFlow = sumFlow;
		this.deviceState = deviceState;
		this.createTime = createTime;
	}

	public String getCanclName() {
		return canclName;
	}

	public void setCanclName(String canclName) {
		this.canclName = canclName;
	}

	public String getCanclCode() {
		return canclCode;
	}

	public void setCanclCode(String canclCode) {
		this.canclCode = canclCode;
	}

	public BigDecimal getAvgFlow() {
		return avgFlow;
	}

	public void setAvgFlow(BigDecimal avgFlow) {
		this.avgFlow = avgFlow;
	}

	public BigDecimal getSumFlow() {
		return sumFlow;
	}

	public void setSumFlow(BigDecimal sumFlow) {
		this.sumFlow = sumFlow;
	}

	public String getDeviceState() {
		return deviceState;
	}

	public void setDeviceState(String deviceState) {
		this.deviceState = deviceState;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	
	

	
}
