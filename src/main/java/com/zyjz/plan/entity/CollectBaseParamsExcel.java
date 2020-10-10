package com.zyjz.plan.entity;

import java.math.BigDecimal;

import cn.afterturn.easypoi.excel.annotation.Excel;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CollectBaseParamsExcel {

	@Excel(name="水位上限",orderNum="1")
    private BigDecimal levelMin;
	
	@Excel(name="水位下限",orderNum="2")
    private BigDecimal levelMax;
	
	@Excel(name="流量",orderNum="3")
    private BigDecimal flow;
	
	@Excel(name="水量",orderNum="4")
    private BigDecimal waterNum;
	

	public CollectBaseParamsExcel(BigDecimal levelMin, BigDecimal levelMax,
			BigDecimal flow, BigDecimal waterNum) {
		super();
		this.levelMin = levelMin;
		this.levelMax = levelMax;
		this.flow = flow;
		this.waterNum = waterNum;
	}

	public CollectBaseParamsExcel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BigDecimal getLevelMin() {
		return levelMin;
	}

	public void setLevelMin(BigDecimal levelMin) {
		this.levelMin = levelMin;
	}

	public BigDecimal getLevelMax() {
		return levelMax;
	}

	public void setLevelMax(BigDecimal levelMax) {
		this.levelMax = levelMax;
	}

	public BigDecimal getFlow() {
		return flow;
	}

	public void setFlow(BigDecimal flow) {
		this.flow = flow;
	}

	public BigDecimal getWaterNum() {
		return waterNum;
	}

	public void setWaterNum(BigDecimal waterNum) {
		this.waterNum = waterNum;
	}
	
	
    
}
