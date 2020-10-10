package com.zyjz.sitemanage.web;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
public class WaterTreeMenu {
	private String id;

    private String sysareaId;

    private String syswaterareaId;

    private String sysareaCode;

    private String syswaterareaCode;

    private String canalPhotoCode;

    private String canalPhoto;

    private String canalCode;

    private String label;
    
    private BigDecimal decisionArea;
    
    private BigDecimal mathing;

    private BigDecimal canalLength;

    private String canalParentId;

    private Integer canallevelCode;

    private String canalmaterialCode;

    private Integer canaltypeCode;

    private String canalusetypeCode;

    private String irrigatedAreaName;

    private BigDecimal canalDesignFlow;

    private BigDecimal canalRealityFlow;

    private BigDecimal canalIrrigatedAcreage;

    private BigDecimal canalPerfectRate;

    private BigDecimal canalRatio;
    
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date canalBuildTime;
    
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date canalRepairTime;

    private String canalAddr;

    private BigDecimal canalSlope;

    private BigDecimal canalRough;

    private BigDecimal canalAngle;

    private BigDecimal canalHeight;

    private BigDecimal canalWight;

    private Date cciCreateTime;

    private Date cciEditTime;

    private String cciRemark;

    private List<WaterTreeMenu> children;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSysareaId() {
		return sysareaId;
	}

	public void setSysareaId(String sysareaId) {
		this.sysareaId = sysareaId;
	}

	public String getSyswaterareaId() {
		return syswaterareaId;
	}

	public void setSyswaterareaId(String syswaterareaId) {
		this.syswaterareaId = syswaterareaId;
	}

	public String getSysareaCode() {
		return sysareaCode;
	}

	public void setSysareaCode(String sysareaCode) {
		this.sysareaCode = sysareaCode;
	}

	public String getSyswaterareaCode() {
		return syswaterareaCode;
	}

	public void setSyswaterareaCode(String syswaterareaCode) {
		this.syswaterareaCode = syswaterareaCode;
	}

	public String getCanalPhotoCode() {
		return canalPhotoCode;
	}

	public void setCanalPhotoCode(String canalPhotoCode) {
		this.canalPhotoCode = canalPhotoCode;
	}

	public String getCanalPhoto() {
		return canalPhoto;
	}

	public void setCanalPhoto(String canalPhoto) {
		this.canalPhoto = canalPhoto;
	}

	public String getCanalCode() {
		return canalCode;
	}

	public void setCanalCode(String canalCode) {
		this.canalCode = canalCode;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public BigDecimal getDecisionArea() {
		return decisionArea;
	}

	public void setDecisionArea(BigDecimal decisionArea) {
		this.decisionArea = decisionArea;
	}

	public BigDecimal getMathing() {
		return mathing;
	}

	public void setMathing(BigDecimal mathing) {
		this.mathing = mathing;
	}

	public BigDecimal getCanalLength() {
		return canalLength;
	}

	public void setCanalLength(BigDecimal canalLength) {
		this.canalLength = canalLength;
	}

	public String getCanalParentId() {
		return canalParentId;
	}

	public void setCanalParentId(String canalParentId) {
		this.canalParentId = canalParentId;
	}

	public Integer getCanallevelCode() {
		return canallevelCode;
	}

	public void setCanallevelCode(Integer canallevelCode) {
		this.canallevelCode = canallevelCode;
	}

	public String getCanalmaterialCode() {
		return canalmaterialCode;
	}

	public void setCanalmaterialCode(String canalmaterialCode) {
		this.canalmaterialCode = canalmaterialCode;
	}

	public Integer getCanaltypeCode() {
		return canaltypeCode;
	}

	public void setCanaltypeCode(Integer canaltypeCode) {
		this.canaltypeCode = canaltypeCode;
	}

	public String getCanalusetypeCode() {
		return canalusetypeCode;
	}

	public void setCanalusetypeCode(String canalusetypeCode) {
		this.canalusetypeCode = canalusetypeCode;
	}

	public String getIrrigatedAreaName() {
		return irrigatedAreaName;
	}

	public void setIrrigatedAreaName(String irrigatedAreaName) {
		this.irrigatedAreaName = irrigatedAreaName;
	}

	public BigDecimal getCanalDesignFlow() {
		return canalDesignFlow;
	}

	public void setCanalDesignFlow(BigDecimal canalDesignFlow) {
		this.canalDesignFlow = canalDesignFlow;
	}

	public BigDecimal getCanalRealityFlow() {
		return canalRealityFlow;
	}

	public void setCanalRealityFlow(BigDecimal canalRealityFlow) {
		this.canalRealityFlow = canalRealityFlow;
	}

	public BigDecimal getCanalIrrigatedAcreage() {
		return canalIrrigatedAcreage;
	}

	public void setCanalIrrigatedAcreage(BigDecimal canalIrrigatedAcreage) {
		this.canalIrrigatedAcreage = canalIrrigatedAcreage;
	}

	public BigDecimal getCanalPerfectRate() {
		return canalPerfectRate;
	}

	public void setCanalPerfectRate(BigDecimal canalPerfectRate) {
		this.canalPerfectRate = canalPerfectRate;
	}

	public BigDecimal getCanalRatio() {
		return canalRatio;
	}

	public void setCanalRatio(BigDecimal canalRatio) {
		this.canalRatio = canalRatio;
	}

	public Date getCanalBuildTime() {
		return canalBuildTime;
	}

	public void setCanalBuildTime(Date canalBuildTime) {
		this.canalBuildTime = canalBuildTime;
	}

	public Date getCanalRepairTime() {
		return canalRepairTime;
	}

	public void setCanalRepairTime(Date canalRepairTime) {
		this.canalRepairTime = canalRepairTime;
	}

	public String getCanalAddr() {
		return canalAddr;
	}

	public void setCanalAddr(String canalAddr) {
		this.canalAddr = canalAddr;
	}

	public BigDecimal getCanalSlope() {
		return canalSlope;
	}

	public void setCanalSlope(BigDecimal canalSlope) {
		this.canalSlope = canalSlope;
	}

	public BigDecimal getCanalRough() {
		return canalRough;
	}

	public void setCanalRough(BigDecimal canalRough) {
		this.canalRough = canalRough;
	}

	public BigDecimal getCanalAngle() {
		return canalAngle;
	}

	public void setCanalAngle(BigDecimal canalAngle) {
		this.canalAngle = canalAngle;
	}

	public BigDecimal getCanalHeight() {
		return canalHeight;
	}

	public void setCanalHeight(BigDecimal canalHeight) {
		this.canalHeight = canalHeight;
	}

	public BigDecimal getCanalWight() {
		return canalWight;
	}

	public void setCanalWight(BigDecimal canalWight) {
		this.canalWight = canalWight;
	}

	public Date getCciCreateTime() {
		return cciCreateTime;
	}

	public void setCciCreateTime(Date cciCreateTime) {
		this.cciCreateTime = cciCreateTime;
	}

	public Date getCciEditTime() {
		return cciEditTime;
	}

	public void setCciEditTime(Date cciEditTime) {
		this.cciEditTime = cciEditTime;
	}

	public String getCciRemark() {
		return cciRemark;
	}

	public void setCciRemark(String cciRemark) {
		this.cciRemark = cciRemark;
	}

	public List<WaterTreeMenu> getChildren() {
		return children;
	}

	public void setChildren(List<WaterTreeMenu> children) {
		this.children = children;
	}

	
    
    

	

	
}
