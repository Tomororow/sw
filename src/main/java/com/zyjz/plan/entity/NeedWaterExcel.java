package com.zyjz.plan.entity;

import java.math.BigDecimal;

import cn.afterturn.easypoi.excel.annotation.Excel;

/**
 * 
 * @ClassName: NeedWaterExcel
 * @Description: 
 * @Author: liuhainian
 * @Date: 2018年5月23日 上午8:13:14
 */
public class NeedWaterExcel{
   
	/*private String id;*/
	
	@Excel(name = "所属渠道", orderNum = "1")
    private String calDitch;
	
	@Excel(name = "渠道判定面积" , orderNum = "2")
    private BigDecimal canalDecisionArea;

	@Excel(name = "土质" , orderNum = "3")
	private String soilType;
	
	@Excel(name = "作物类型" , orderNum = "4")
	private String cropsType;
	
	@Excel(name = "面积" , orderNum = "5")
	private BigDecimal area;
	
	@Excel(name = "所属年份" , orderNum = "6")
	private Integer year;
	
	@Excel(name = "提报人姓名" , orderNum = "7")
	private String reportPeopleName;
	
	@Excel(name = "提报人电话" , orderNum = "8")
	private String phoneNumber;
	
	@Excel(name = "备注" , orderNum = "9")
	private String remark;

	
	
	public NeedWaterExcel(String calDitch, BigDecimal canalDecisionArea,
			String soilType, String cropsType, BigDecimal area, Integer year,
			String reportPeopleName, String phoneNumber, String remark) {
		super();
		this.calDitch = calDitch;
		this.canalDecisionArea = canalDecisionArea;
		this.soilType = soilType;
		this.cropsType = cropsType;
		this.area = area;
		this.year = year;
		this.reportPeopleName = reportPeopleName;
		this.phoneNumber = phoneNumber;
		this.remark = remark;
	}

	public NeedWaterExcel() {
        super();
    }

	public String getCalDitch() {
		return calDitch;
	}

	public void setCalDitch(String calDitch) {
		this.calDitch = calDitch;
	}

	public BigDecimal getCanalDecisionArea() {
		return canalDecisionArea;
	}

	public void setCanalDecisionArea(BigDecimal canalDecisionArea) {
		this.canalDecisionArea = canalDecisionArea;
	}

	public String getSoilType() {
		return soilType;
	}

	public void setSoilType(String soilType) {
		this.soilType = soilType;
	}

	public String getCropsType() {
		return cropsType;
	}

	public void setCropsType(String cropsType) {
		this.cropsType = cropsType;
	}

	public BigDecimal getArea() {
		return area;
	}

	public void setArea(BigDecimal area) {
		this.area = area;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public String getReportPeopleName() {
		return reportPeopleName;
	}

	public void setReportPeopleName(String reportPeopleName) {
		this.reportPeopleName = reportPeopleName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}


}