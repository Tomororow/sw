package com.zyjz.plan.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class NeedWaterReport implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;

    private String reportNo;

    private String canalCode;

    private BigDecimal canalDecisionArea;

    private String soilType;

    private String cropsType;

    private BigDecimal area;
    
    private int year;

    private Date createTime;

    private Date repairTime;

    private String reportPeopleName;

    private String phoneNumber;

    private String remark;
    
    
    private String soilName;//土地类型名称
    private String cropsName;//农作物类型名称
    
    
    

   public String getSoilName() {
		return soilName;
	}

	public void setSoilName(String soilName) {
		this.soilName = soilName;
	}

	public String getCropsName() {
		return cropsName;
	}

	public void setCropsName(String cropsName) {
		this.cropsName = cropsName;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getReportNo() {
        return reportNo;
    }

    public void setReportNo(String reportNo) {
        this.reportNo = reportNo == null ? null : reportNo.trim();
    }

    public String getCanalCode() {
        return canalCode;
    }

    public void setCanalCode(String canalCode) {
        this.canalCode = canalCode == null ? null : canalCode.trim();
    }

    public BigDecimal getCanalDecisionArea() {
        return canalDecisionArea;
    }
    
    public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public void setCanalDecisionArea(BigDecimal canalDecisionArea) {
        this.canalDecisionArea = canalDecisionArea;
    }

    public String getSoilType() {
        return soilType;
    }

    public void setSoilType(String soilType) {
        this.soilType = soilType == null ? null : soilType.trim();
    }

    public String getCropsType() {
        return cropsType;
    }

    public void setCropsType(String cropsType) {
        this.cropsType = cropsType == null ? null : cropsType.trim();
    }

    public BigDecimal getArea() {
        return area;
    }

    public void setArea(BigDecimal area) {
        this.area = area;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getRepairTime() {
        return repairTime;
    }

    public void setRepairTime(Date repairTime) {
        this.repairTime = repairTime;
    }

    public String getReportPeopleName() {
        return reportPeopleName;
    }

    public void setReportPeopleName(String reportPeopleName) {
        this.reportPeopleName = reportPeopleName == null ? null : reportPeopleName.trim();
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber == null ? null : phoneNumber.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}