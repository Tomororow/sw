package com.zyjz.sysmanage.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * @ClassName: SiteRainInfo
 * @Description: 雨量站管理实体类
 * @Author: zhaojx
 * @Date: 2018年3月14日 上午8:48:07
 */
public class SiteRainInfo implements Serializable {
    private String id;

    private String sysareaId;

    private Integer sriDevicemodelCode;

    private Integer systemCode;

    private String deviceRainCode;

    private String deviceRainName;

    private String sriAddr;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date sriBuildTime;

    private String sriIp;

    private BigDecimal sriLongitude;

    private BigDecimal sriLatitude;
    
    private BigDecimal sriHeight;

    private String sriPhotoBefore;

    private String sriPhotoAfter;

    private Date sriCreateTime;

    private Date sriEditTime;

    private String sriRemark;
    
    /** 测量设备类型信息 */
    private String deviceName;

    private String deviceBrand;

    private String deviceModel;
    
    /** 数据提取系统信息 */
    private String systemName;
    
    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getSysareaId() {
        return sysareaId;
    }

    public void setSysareaId(String sysareaId) {
        this.sysareaId = sysareaId == null ? null : sysareaId.trim();
    }

    public Integer getSriDevicemodelCode() {
        return sriDevicemodelCode;
    }

    public void setSriDevicemodelCode(Integer sriDevicemodelCode) {
        this.sriDevicemodelCode = sriDevicemodelCode;
    }

    public Integer getSystemCode() {
        return systemCode;
    }

    public void setSystemCode(Integer systemCode) {
        this.systemCode = systemCode;
    }

    public String getDeviceRainCode() {
        return deviceRainCode;
    }

    public void setDeviceRainCode(String deviceRainCode) {
        this.deviceRainCode = deviceRainCode == null ? null : deviceRainCode.trim();
    }

    public String getDeviceRainName() {
        return deviceRainName;
    }

    public void setDeviceRainName(String deviceRainName) {
        this.deviceRainName = deviceRainName == null ? null : deviceRainName.trim();
    }

    public String getSriAddr() {
        return sriAddr;
    }

    public void setSriAddr(String sriAddr) {
        this.sriAddr = sriAddr == null ? null : sriAddr.trim();
    }

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getSriBuildTime() {
        return sriBuildTime;
    }

    public void setSriBuildTime(Date sriBuildTime) {
        this.sriBuildTime = sriBuildTime;
    }

    public String getSriIp() {
        return sriIp;
    }

    public void setSriIp(String sriIp) {
        this.sriIp = sriIp == null ? null : sriIp.trim();
    }

    public BigDecimal getSriLongitude() {
        return sriLongitude;
    }

    public void setSriLongitude(BigDecimal sriLongitude) {
        this.sriLongitude = sriLongitude;
    }

    public BigDecimal getSriLatitude() {
        return sriLatitude;
    }

    public void setSriLatitude(BigDecimal sriLatitude) {
        this.sriLatitude = sriLatitude;
    }
    
    public BigDecimal getSriHeight() {
		return sriHeight;
	}

	public void setSriHeight(BigDecimal sriHeight) {
		this.sriHeight = sriHeight;
	}

	public String getSriPhotoBefore() {
        return sriPhotoBefore;
    }

    public void setSriPhotoBefore(String sriPhotoBefore) {
        this.sriPhotoBefore = sriPhotoBefore == null ? null : sriPhotoBefore.trim();
    }

    public String getSriPhotoAfter() {
        return sriPhotoAfter;
    }

    public void setSriPhotoAfter(String sriPhotoAfter) {
        this.sriPhotoAfter = sriPhotoAfter == null ? null : sriPhotoAfter.trim();
    }

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getSriCreateTime() {
        return sriCreateTime;
    }

    public void setSriCreateTime(Date sriCreateTime) {
        this.sriCreateTime = sriCreateTime;
    }

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getSriEditTime() {
        return sriEditTime;
    }

    public void setSriEditTime(Date sriEditTime) {
        this.sriEditTime = sriEditTime;
    }

    public String getSriRemark() {
        return sriRemark;
    }

    public void setSriRemark(String sriRemark) {
        this.sriRemark = sriRemark == null ? null : sriRemark.trim();
    }
    
    /** 测量设备类型信息 */
    public String getDeviceName() {
        return deviceName;
    }

    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName == null ? null : deviceName.trim();
    }

    public String getDeviceBrand() {
        return deviceBrand;
    }

    public void setDeviceBrand(String deviceBrand) {
        this.deviceBrand = deviceBrand == null ? null : deviceBrand.trim();
    }

    public String getDeviceModel() {
        return deviceModel;
    }

    public void setDeviceModel(String deviceModel) {
        this.deviceModel = deviceModel == null ? null : deviceModel.trim();
    }
    
    /** 数据提取系统信息 */
    public String getSystemName() {
        return systemName;
    }

    public void setSystemName(String systemName) {
        this.systemName = systemName == null ? null : systemName.trim();
    }
}