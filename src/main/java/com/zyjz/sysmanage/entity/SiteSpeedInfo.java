package com.zyjz.sysmanage.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class SiteSpeedInfo implements Serializable{
    
	private static final long serialVersionUID = 1L;

	private String id;

    private String ssiCanalCode;

    private String ssiCode;

    private String ssiName;

    private String ssiDeviceNo;

    private String ssiAddr;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date ssiBuildTime;

    private String ssiSimNumber;

    private String ssiSimoperator;

    private String ssiIpPort;

    private BigDecimal ssiLongitude;

    private BigDecimal ssiLatitude;

    private BigDecimal ssiHight;

    private String ssiPhotoBefore;

    private String ssiPhotoAfter;

    private Integer ssiDeviceCode;

    private Integer systemCode;

    private Date ssiCreateTime;

    private Date ssiEditTime;

    private String ssiRemark;

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

    public String getSsiCode() {
        return ssiCode;
    }

    public void setSsiCode(String ssiCode) {
        this.ssiCode = ssiCode == null ? null : ssiCode.trim();
    }

    public String getSsiName() {
        return ssiName;
    }

    public void setSsiName(String ssiName) {
        this.ssiName = ssiName == null ? null : ssiName.trim();
    }

    public String getSsiDeviceNo() {
        return ssiDeviceNo;
    }

    public void setSsiDeviceNo(String ssiDeviceNo) {
        this.ssiDeviceNo = ssiDeviceNo == null ? null : ssiDeviceNo.trim();
    }

    public String getSsiAddr() {
        return ssiAddr;
    }

    public void setSsiAddr(String ssiAddr) {
        this.ssiAddr = ssiAddr == null ? null : ssiAddr.trim();
    }

    public Date getSsiBuildTime() {
        return ssiBuildTime;
    }

    public void setSsiBuildTime(Date ssiBuildTime) {
        this.ssiBuildTime = ssiBuildTime;
    }

    public String getSsiSimNumber() {
        return ssiSimNumber;
    }

    public void setSsiSimNumber(String ssiSimNumber) {
        this.ssiSimNumber = ssiSimNumber == null ? null : ssiSimNumber.trim();
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

    public BigDecimal getSsiHight() {
        return ssiHight;
    }

    public void setSsiHight(BigDecimal ssiHight) {
        this.ssiHight = ssiHight;
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

    public Integer getSsiDeviceCode() {
        return ssiDeviceCode;
    }

    public void setSsiDeviceCode(Integer ssiDeviceCode) {
        this.ssiDeviceCode = ssiDeviceCode;
    }

    public Integer getSystemCode() {
        return systemCode;
    }

    public void setSystemCode(Integer systemCode) {
        this.systemCode = systemCode;
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
}