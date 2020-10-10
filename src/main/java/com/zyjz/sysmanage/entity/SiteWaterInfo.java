
package com.zyjz.sysmanage.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class SiteWaterInfo implements Serializable{
    /** 
	 * @Fields: serialVersionUID: 
	 */ 
	
	private static final long serialVersionUID = 1L;

	private String id;

    private String swiCanalCode;

    private String sitetypeCode;

    private String deviceWaterCode;

    private String deviceWaterName;

    private String swiDeviceNo;

    private String swiAddr;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date swiBuildTime;

    private String swiSimcard;

    private String swiSimoperator;

    private String swiIpPort;

    private BigDecimal swiLongitude;

    private BigDecimal swiLatitude;

    private BigDecimal swiHeight;

    private BigDecimal siteDepth;

    private BigDecimal siteRadius;

    private BigDecimal siteCanalBottomLenth;

    private BigDecimal siteCanalBottomUHeight;

    private BigDecimal siteCanalWellpaperAngle;

    private BigDecimal siteCanalBottomUR;

    private BigDecimal siteCanalBottomHeight;

    private String fractureAppearanceCode;

    private BigDecimal hydraulicSlope;

    private BigDecimal rounghness;

    private BigDecimal ratio;
    
    private String flowFunctionCode;

    private Integer swiDevicemodelCode;

    private BigDecimal deviceHeight;

    private String swiPhotoBefore;

    private String swiPhotoAfter;

    private Integer systemCode;

    private Date swiCreateTime;

    private Date swiEditTime;

    private String swiRemark;
    
    private Integer swiEquipState;
    
    private Integer tierNum;

    private String ezopenHdLive;

    private String ezopenLive;

    private String ezopenRecLive;

    private String deviceSerial;

    private String accessToken;

    private BigDecimal swiDeadWaterLevel;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date swiMeasureUpperTime;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date swiMeasureLowerTime;


    /**
     * 其他字段
     */
    /*jz_midd_device  表的字段*/
    private int type;

    private BigDecimal meptyHing;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date uploadTime;

    private int siteType;

    private BigDecimal waterLevel;

    private BigDecimal instantSpeend;

    private BigDecimal instantFlow;

    private BigDecimal testHeight;

    private BigDecimal totleFlow;

    private String trenChier1;

    private String trenChier2;

    private String trenChier3;

    private String trenChier4;

    public Integer getTierNum() {
		return tierNum;
	}

	public void setTierNum(Integer tierNum) {
		this.tierNum = tierNum;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getSwiCanalCode() {
        return swiCanalCode;
    }

    public void setSwiCanalCode(String swiCanalCode) {
        this.swiCanalCode = swiCanalCode == null ? null : swiCanalCode.trim();
    }

    public String getSitetypeCode() {
        return sitetypeCode;
    }

    public void setSitetypeCode(String sitetypeCode) {
        this.sitetypeCode = sitetypeCode == null ? null : sitetypeCode.trim();
    }

    public String getDeviceWaterCode() {
        return deviceWaterCode;
    }

    public void setDeviceWaterCode(String deviceWaterCode) {
        this.deviceWaterCode = deviceWaterCode == null ? null : deviceWaterCode.trim();
    }

    public String getDeviceWaterName() {
        return deviceWaterName;
    }

    public void setDeviceWaterName(String deviceWaterName) {
        this.deviceWaterName = deviceWaterName == null ? null : deviceWaterName.trim();
    }

    public String getSwiDeviceNo() {
        return swiDeviceNo;
    }

    public void setSwiDeviceNo(String swiDeviceNo) {
        this.swiDeviceNo = swiDeviceNo == null ? null : swiDeviceNo.trim();
    }

    public String getSwiAddr() {
        return swiAddr;
    }

    public void setSwiAddr(String swiAddr) {
        this.swiAddr = swiAddr == null ? null : swiAddr.trim();
    }

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getSwiBuildTime() {
        return swiBuildTime;
    }

    public void setSwiBuildTime(Date swiBuildTime) {
        this.swiBuildTime = swiBuildTime;
    }

    public String getSwiSimcard() {
        return swiSimcard;
    }

    public void setSwiSimcard(String swiSimcard) {
        this.swiSimcard = swiSimcard == null ? null : swiSimcard.trim();
    }

    public String getSwiSimoperator() {
        return swiSimoperator;
    }

    public void setSwiSimoperator(String swiSimoperator) {
        this.swiSimoperator = swiSimoperator == null ? null : swiSimoperator.trim();
    }

    public String getSwiIpPort() {
        return swiIpPort;
    }

    public void setSwiIpPort(String swiIpPort) {
        this.swiIpPort = swiIpPort == null ? null : swiIpPort.trim();
    }

    public BigDecimal getSwiLongitude() {
        return swiLongitude;
    }

    public void setSwiLongitude(BigDecimal swiLongitude) {
        this.swiLongitude = swiLongitude;
    }

    public BigDecimal getSwiLatitude() {
        return swiLatitude;
    }

    public void setSwiLatitude(BigDecimal swiLatitude) {
        this.swiLatitude = swiLatitude;
    }

    public BigDecimal getSwiHeight() {
        return swiHeight;
    }

    public void setSwiHeight(BigDecimal swiHeight) {
        this.swiHeight = swiHeight;
    }

    public BigDecimal getSiteDepth() {
        return siteDepth;
    }

    public void setSiteDepth(BigDecimal siteDepth) {
        this.siteDepth = siteDepth;
    }

    public BigDecimal getSiteRadius() {
        return siteRadius;
    }

    public void setSiteRadius(BigDecimal siteRadius) {
        this.siteRadius = siteRadius;
    }

    public BigDecimal getSiteCanalBottomLenth() {
        return siteCanalBottomLenth;
    }

    public void setSiteCanalBottomLenth(BigDecimal siteCanalBottomLenth) {
        this.siteCanalBottomLenth = siteCanalBottomLenth;
    }

    public BigDecimal getSiteCanalBottomUHeight() {
        return siteCanalBottomUHeight;
    }

    public void setSiteCanalBottomUHeight(BigDecimal siteCanalBottomUHeight) {
        this.siteCanalBottomUHeight = siteCanalBottomUHeight;
    }

    public BigDecimal getSiteCanalWellpaperAngle() {
        return siteCanalWellpaperAngle;
    }

    public void setSiteCanalWellpaperAngle(BigDecimal siteCanalWellpaperAngle) {
        this.siteCanalWellpaperAngle = siteCanalWellpaperAngle;
    }

    public BigDecimal getSiteCanalBottomUR() {
        return siteCanalBottomUR;
    }

    public void setSiteCanalBottomUR(BigDecimal siteCanalBottomUR) {
        this.siteCanalBottomUR = siteCanalBottomUR;
    }

    public BigDecimal getSiteCanalBottomHeight() {
        return siteCanalBottomHeight;
    }

    public void setSiteCanalBottomHeight(BigDecimal siteCanalBottomHeight) {
        this.siteCanalBottomHeight = siteCanalBottomHeight;
    }

    public String getFractureAppearanceCode() {
        return fractureAppearanceCode;
    }

    public void setFractureAppearanceCode(String fractureAppearanceCode) {
        this.fractureAppearanceCode = fractureAppearanceCode == null ? null : fractureAppearanceCode.trim();
    }

    public BigDecimal getHydraulicSlope() {
        return hydraulicSlope;
    }

    public void setHydraulicSlope(BigDecimal hydraulicSlope) {
        this.hydraulicSlope = hydraulicSlope;
    }

    public BigDecimal getRounghness() {
        return rounghness;
    }

    public void setRounghness(BigDecimal rounghness) {
        this.rounghness = rounghness;
    }

    public BigDecimal getRatio() {
        return ratio;
    }

    public void setRatio(BigDecimal ratio) {
        this.ratio = ratio;
    }

    public Integer getSwiDevicemodelCode() {
        return swiDevicemodelCode;
    }

    public void setSwiDevicemodelCode(Integer swiDevicemodelCode) {
        this.swiDevicemodelCode = swiDevicemodelCode;
    }

    public BigDecimal getDeviceHeight() {
        return deviceHeight;
    }

    public void setDeviceHeight(BigDecimal deviceHeight) {
        this.deviceHeight = deviceHeight;
    }

    public String getSwiPhotoBefore() {
        return swiPhotoBefore;
    }

    public void setSwiPhotoBefore(String swiPhotoBefore) {
        this.swiPhotoBefore = swiPhotoBefore == null ? null : swiPhotoBefore.trim();
    }

    public String getSwiPhotoAfter() {
        return swiPhotoAfter;
    }

    public void setSwiPhotoAfter(String swiPhotoAfter) {
        this.swiPhotoAfter = swiPhotoAfter == null ? null : swiPhotoAfter.trim();
    }

    public Integer getSystemCode() {
        return systemCode;
    }

    public void setSystemCode(Integer systemCode) {
        this.systemCode = systemCode;
    }

    public Date getSwiCreateTime() {
        return swiCreateTime;
    }

    public void setSwiCreateTime(Date swiCreateTime) {
        this.swiCreateTime = swiCreateTime;
    }

    public Date getSwiEditTime() {
        return swiEditTime;
    }

    public void setSwiEditTime(Date swiEditTime) {
        this.swiEditTime = swiEditTime;
    }

    public String getSwiRemark() {
        return swiRemark;
    }

    public void setSwiRemark(String swiRemark) {
        this.swiRemark = swiRemark == null ? null : swiRemark.trim();
    }

	public String getFlowFunctionCode() {
		return flowFunctionCode;
	}

	public void setFlowFunctionCode(String flowFunctionCode) {
		this.flowFunctionCode = flowFunctionCode;
	}

	public Integer getSwiEquipState() {
		return swiEquipState;
	}

	public void setSwiEquipState(Integer swiEquipState) {
		this.swiEquipState = swiEquipState;
	}

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public Date getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Date uploadTime) {
        this.uploadTime = uploadTime;
    }

    public int getSiteType() {
        return siteType;
    }

    public void setSiteType(int siteType) {
        this.siteType = siteType;
    }

    public BigDecimal getWaterLevel() {
        return waterLevel;
    }

    public void setWaterLevel(BigDecimal waterLevel) {
        this.waterLevel = waterLevel;
    }

    public BigDecimal getInstantSpeend() {
        return instantSpeend;
    }

    public void setInstantSpeend(BigDecimal instantSpeend) {
        this.instantSpeend = instantSpeend;
    }

    public BigDecimal getInstantFlow() {
        return instantFlow;
    }

    public void setInstantFlow(BigDecimal instantFlow) {
        this.instantFlow = instantFlow;
    }

    public BigDecimal getTestHeight() {
        return testHeight;
    }

    public void setTestHeight(BigDecimal testHeight) {
        this.testHeight = testHeight;
    }

    public BigDecimal getTotleFlow() {
        return totleFlow;
    }

    public void setTotleFlow(BigDecimal totleFlow) {
        this.totleFlow = totleFlow;
    }

    public String getEzopenHdLive() {
        return ezopenHdLive;
    }

    public void setEzopenHdLive(String ezopenHdLive) {
        this.ezopenHdLive = ezopenHdLive;
    }

    public String getEzopenLive() {
        return ezopenLive;
    }

    public void setEzopenLive(String ezopenLive) {
        this.ezopenLive = ezopenLive;
    }

    public String getEzopenRecLive() {
        return ezopenRecLive;
    }

    public void setEzopenRecLive(String ezopenRecLive) {
        this.ezopenRecLive = ezopenRecLive;
    }

    public String getDeviceSerial() {
        return deviceSerial;
    }

    public void setDeviceSerial(String deviceSerial) {
        this.deviceSerial = deviceSerial;
    }

    public String getAccessToken() {
        return accessToken;
    }

    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }

    public BigDecimal getSwiDeadWaterLevel() {
        return swiDeadWaterLevel;
    }

    public void setSwiDeadWaterLevel(BigDecimal swiDeadWaterLevel) {
        this.swiDeadWaterLevel = swiDeadWaterLevel;
    }

    public Date getSwiMeasureUpperTime() {
        return swiMeasureUpperTime;
    }

    public void setSwiMeasureUpperTime(Date swiMeasureUpperTime) {
        this.swiMeasureUpperTime = swiMeasureUpperTime;
    }

    public Date getSwiMeasureLowerTime() {
        return swiMeasureLowerTime;
    }

    public void setSwiMeasureLowerTime(Date swiMeasureLowerTime) {
        this.swiMeasureLowerTime = swiMeasureLowerTime;
    }

    public BigDecimal getMeptyHing() {
        return meptyHing;
    }

    public void setMeptyHing(BigDecimal meptyHing) {
        this.meptyHing = meptyHing;
    }
    public String getTrenChier1() {
        return trenChier1;
    }

    public void setTrenChier1(String trenChier1) {
        this.trenChier1 = trenChier1;
    }

    public String getTrenChier2() {
        return trenChier2;
    }

    public void setTrenChier2(String trenChier2) {
        this.trenChier2 = trenChier2;
    }

    public String getTrenChier3() {
        return trenChier3;
    }

    public void setTrenChier3(String trenChier3) {
        this.trenChier3 = trenChier3;
    }

    public String getTrenChier4() {
        return trenChier4;
    }

    public void setTrenChier4(String trenChier4) {
        this.trenChier4 = trenChier4;
    }
}