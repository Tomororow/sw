package com.zyjz.sysmanage.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.zyjz.remotecontrol.entity.SiteSluiceControlOperationRecord;
import com.zyjz.remotecontrol.entity.SiteSluiceGateInfo;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class SiteSluiceInfo implements Serializable{
    
	private static final long serialVersionUID = 1L;

	private String id;

    private String ssiCanalCode;

    private Integer sitetypeCode;

    private String deviceSluiceCode;

    private String deviceSluiceName;

    private Integer sluicetypeCode;

    private String ssiDeviceNo;

    private Integer ssiDevicemodelCode;

    private String ssiAddr;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date ssiBuildTime;

    private String ssiSimcard;

    private String ssiSimoperator;

    private String ssiIpPort;

    private BigDecimal ssiLongitude;

    private BigDecimal ssiLatitude;
    
    private BigDecimal ssiHeight;
    
    private String sluiceBeforeSiteWaterId;
    
    private String sluiceAfterSiteWaterId;
    
    private String sluiceMovieSiteId;

    private String ssiPhotoBefore;

    private String ssiPhotoAfter;

    private Date ssiCreateTime;

    private Date ssiEditTime;

    private String ssiRemark;

    /** 闸门信息 */
    private List<SiteSluiceGateInfo> siteSluiceGateInfoList;
    /** 闸门操作记录 */
    private List<SiteSluiceControlOperationRecord> siteSluiceControlOperationRecordList;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getSsiCanalCode() {
        return ssiCanalCode;
    }

    public void setSsiCanalCode(String ssiCanalCode) {
        this.ssiCanalCode = ssiCanalCode == null ? null : ssiCanalCode.trim();
    }

    public Integer getSitetypeCode() {
        return sitetypeCode;
    }

    public void setSitetypeCode(Integer sitetypeCode) {
        this.sitetypeCode = sitetypeCode;
    }

    public String getDeviceSluiceCode() {
        return deviceSluiceCode;
    }

    public void setDeviceSluiceCode(String deviceSluiceCode) {
        this.deviceSluiceCode = deviceSluiceCode == null ? null : deviceSluiceCode.trim();
    }

    public String getDeviceSluiceName() {
        return deviceSluiceName;
    }

    public void setDeviceSluiceName(String deviceSluiceName) {
        this.deviceSluiceName = deviceSluiceName == null ? null : deviceSluiceName.trim();
    }

    public Integer getSluicetypeCode() {
        return sluicetypeCode;
    }

    public void setSluicetypeCode(Integer sluicetypeCode) {
        this.sluicetypeCode = sluicetypeCode;
    }

    public String getSsiDeviceNo() {
        return ssiDeviceNo;
    }

    public void setSsiDeviceNo(String ssiDeviceNo) {
        this.ssiDeviceNo = ssiDeviceNo == null ? null : ssiDeviceNo.trim();
    }

    public Integer getSsiDevicemodelCode() {
        return ssiDevicemodelCode;
    }

    public void setSsiDevicemodelCode(Integer ssiDevicemodelCode) {
        this.ssiDevicemodelCode = ssiDevicemodelCode;
    }

    public String getSsiAddr() {
        return ssiAddr;
    }

    public void setSsiAddr(String ssiAddr) {
        this.ssiAddr = ssiAddr == null ? null : ssiAddr.trim();
    }

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getSsiBuildTime() {
        return ssiBuildTime;
    }

    public void setSsiBuildTime(Date ssiBuildTime) {
        this.ssiBuildTime = ssiBuildTime;
    }

    public String getSsiSimcard() {
        return ssiSimcard;
    }

    public void setSsiSimcard(String ssiSimcard) {
        this.ssiSimcard = ssiSimcard == null ? null : ssiSimcard.trim();
    }

    public String getSsiSimoperator() {
        return ssiSimoperator;
    }

    public void setSsiSimoperator(String ssiSimoperator) {
        this.ssiSimoperator = ssiSimoperator == null ? null : ssiSimoperator.trim();
    }

    public String getSsiIpPort() {
        return ssiIpPort;
    }

    public void setSsiIpPort(String ssiIpPort) {
        this.ssiIpPort = ssiIpPort == null ? null : ssiIpPort.trim();
    }

    public BigDecimal getSsiLongitude() {
        return ssiLongitude;
    }

    public void setSsiLongitude(BigDecimal ssiLongitude) {
        this.ssiLongitude = ssiLongitude;
    }

    public BigDecimal getSsiLatitude() {
        return ssiLatitude;
    }

    public void setSsiLatitude(BigDecimal ssiLatitude) {
        this.ssiLatitude = ssiLatitude;
    }

    public String getSsiPhotoBefore() {
        return ssiPhotoBefore;
    }

    public void setSsiPhotoBefore(String ssiPhotoBefore) {
        this.ssiPhotoBefore = ssiPhotoBefore == null ? null : ssiPhotoBefore.trim();
    }

    public String getSsiPhotoAfter() {
        return ssiPhotoAfter;
    }

    public void setSsiPhotoAfter(String ssiPhotoAfter) {
        this.ssiPhotoAfter = ssiPhotoAfter == null ? null : ssiPhotoAfter.trim();
    }

    public Date getSsiCreateTime() {
        return ssiCreateTime;
    }

    public void setSsiCreateTime(Date ssiCreateTime) {
        this.ssiCreateTime = ssiCreateTime;
    }

    public Date getSsiEditTime() {
        return ssiEditTime;
    }

    public void setSsiEditTime(Date ssiEditTime) {
        this.ssiEditTime = ssiEditTime;
    }

    public String getSsiRemark() {
        return ssiRemark;
    }

    public void setSsiRemark(String ssiRemark) {
        this.ssiRemark = ssiRemark == null ? null : ssiRemark.trim();
    }

	public BigDecimal getSsiHeight() {
		return ssiHeight;
	}

	public void setSsiHeight(BigDecimal ssiHeight) {
		this.ssiHeight = ssiHeight;
	}

	public String getSluiceBeforeSiteWaterId() {
		return sluiceBeforeSiteWaterId;
	}

	public void setSluiceBeforeSiteWaterId(String sluiceBeforeSiteWaterId) {
		this.sluiceBeforeSiteWaterId = sluiceBeforeSiteWaterId;
	}

	public String getSluiceAfterSiteWaterId() {
		return sluiceAfterSiteWaterId;
	}

	public void setSluiceAfterSiteWaterId(String sluiceAfterSiteWaterId) {
		this.sluiceAfterSiteWaterId = sluiceAfterSiteWaterId;
	}

	public String getSluiceMovieSiteId() {
		return sluiceMovieSiteId;
	}

	public void setSluiceMovieSiteId(String sluiceMovieSiteId) {
		this.sluiceMovieSiteId = sluiceMovieSiteId;
	}

    public List<SiteSluiceGateInfo> getSiteSluiceGateInfoList() {
        return siteSluiceGateInfoList;
    }

    public void setSiteSluiceGateInfoList(List<SiteSluiceGateInfo> siteSluiceGateInfoList) {
        this.siteSluiceGateInfoList = siteSluiceGateInfoList;
    }

    public List<SiteSluiceControlOperationRecord> getSiteSluiceControlOperationRecordList() {
        return siteSluiceControlOperationRecordList;
    }

    public void setSiteSluiceControlOperationRecordList(List<SiteSluiceControlOperationRecord> siteSluiceControlOperationRecordList) {
        this.siteSluiceControlOperationRecordList = siteSluiceControlOperationRecordList;
    }
}