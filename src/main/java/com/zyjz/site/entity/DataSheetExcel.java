package com.zyjz.site.entity;

import java.math.BigDecimal;

import cn.afterturn.easypoi.excel.annotation.Excel;

public class DataSheetExcel {
	
	@Excel(name="渠道名称",height = 13, width = 15,orderNum="1")
    private String waterName;
	
	@Excel(name="1月",height = 13, width =15,orderNum="2")
    private BigDecimal january;
	
	@Excel(name="2月",height = 13, width =15,orderNum="3")
    private BigDecimal february;
	
	@Excel(name="3月",height = 13, width = 15,orderNum="4")
    private BigDecimal march;
	
	@Excel(name="4月",height = 13, width = 15,orderNum="5")
    private BigDecimal april;
	
	@Excel(name="5月",height = 13, width = 15,orderNum="6")
    private BigDecimal may;
	
	@Excel(name="6月",height = 13, width = 15,orderNum="7")
    private BigDecimal june;
	
	@Excel(name="7月",height = 13, width = 15,orderNum="8")
    private BigDecimal july;
	
	@Excel(name="8月",height = 13, width = 15,orderNum="9")
    private BigDecimal august;
	
	@Excel(name="9月",height = 13, width = 15,orderNum="10")
    private BigDecimal september;
	
	@Excel(name="10月",height = 13, width = 15,orderNum="11")
    private BigDecimal october;
	
	@Excel(name="11月",height = 13, width = 15,orderNum="12")
    private BigDecimal november;
	
	@Excel(name="12月",height = 13, width = 15,orderNum="13")
    private BigDecimal december;
	
	@Excel(name="全年总流量",height = 13, width = 15,orderNum="14")
    private BigDecimal totleFlow;

	public DataSheetExcel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DataSheetExcel(String waterName, BigDecimal january,
			BigDecimal february, BigDecimal march, BigDecimal april,
			BigDecimal may, BigDecimal june, BigDecimal july,
			BigDecimal august, BigDecimal september, BigDecimal october,
			BigDecimal november, BigDecimal december, BigDecimal totleFlow) {
		super();
		this.waterName = waterName;
		this.january = january;
		this.february = february;
		this.march = march;
		this.april = april;
		this.may = may;
		this.june = june;
		this.july = july;
		this.august = august;
		this.september = september;
		this.october = october;
		this.november = november;
		this.december = december;
		this.totleFlow = totleFlow;
	}

	public String getWaterName() {
		return waterName;
	}

	public void setWaterName(String waterName) {
		this.waterName = waterName;
	}

	public BigDecimal getJanuary() {
		return january;
	}

	public void setJanuary(BigDecimal january) {
		this.january = january;
	}

	public BigDecimal getFebruary() {
		return february;
	}

	public void setFebruary(BigDecimal february) {
		this.february = february;
	}

	public BigDecimal getMarch() {
		return march;
	}

	public void setMarch(BigDecimal march) {
		this.march = march;
	}

	public BigDecimal getApril() {
		return april;
	}

	public void setApril(BigDecimal april) {
		this.april = april;
	}

	public BigDecimal getMay() {
		return may;
	}

	public void setMay(BigDecimal may) {
		this.may = may;
	}

	public BigDecimal getJune() {
		return june;
	}

	public void setJune(BigDecimal june) {
		this.june = june;
	}

	public BigDecimal getJuly() {
		return july;
	}

	public void setJuly(BigDecimal july) {
		this.july = july;
	}

	public BigDecimal getAugust() {
		return august;
	}

	public void setAugust(BigDecimal august) {
		this.august = august;
	}

	public BigDecimal getSeptember() {
		return september;
	}

	public void setSeptember(BigDecimal september) {
		this.september = september;
	}

	public BigDecimal getOctober() {
		return october;
	}

	public void setOctober(BigDecimal october) {
		this.october = october;
	}

	public BigDecimal getNovember() {
		return november;
	}

	public void setNovember(BigDecimal november) {
		this.november = november;
	}

	public BigDecimal getDecember() {
		return december;
	}

	public void setDecember(BigDecimal december) {
		this.december = december;
	}

	public BigDecimal getTotleFlow() {
		return totleFlow;
	}

	public void setTotleFlow(BigDecimal totleFlow) {
		this.totleFlow = totleFlow;
	}
	
    



}