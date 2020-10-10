package com.zyjz.video.entity;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class SiteVideoInfo {
    private String id;

    private String sviCanalCode;

    private Integer sitetypeCode;

    private String deviceVideoCode;

    private String deviceVideoName;

    private String sviDevicemodelCode;

    private String sviAddr;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date sviBuildTime;

    private BigDecimal sviLongitude;

    private BigDecimal sviLatitude;

    private String ezopenHdLive;

    private String ezopenLive;

    private String ezopenRecLive;

    private String rmtpUrl;

    private String hlsUrl;

    private String deviceSerial;

    private String sviPhotoBefore;

    private String sviPhotoAfter;

    private Date sviCreateTime;

    private Date sviEditTime;

    private String sviRemark;

    private String accesstoken;

    private String deviceChannelNumber;

    private String equipmentSequence;

    private String deviceType;

    private String comm1;

    private String comm2;

    private String comm3;

    private String comm4;

    private String comm5;

    private String devicemodelName;
    
    public String getSviDevicemodelCode() {
		return sviDevicemodelCode;
	}

	public void setSviDevicemodelCode(String sviDevicemodelCode) {
		this.sviDevicemodelCode = sviDevicemodelCode;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getSviCanalCode() {
        return sviCanalCode;
    }

    public void setSviCanalCode(String sviCanalCode) {
        this.sviCanalCode = sviCanalCode == null ? null : sviCanalCode.trim();
    }

    public Integer getSitetypeCode() {
        return sitetypeCode;
    }

    public void setSitetypeCode(Integer sitetypeCode) {
        this.sitetypeCode = sitetypeCode;
    }

    public String getDeviceVideoCode() {
        return deviceVideoCode;
    }

    public void setDeviceVideoCode(String deviceVideoCode) {
        this.deviceVideoCode = deviceVideoCode == null ? null : deviceVideoCode.trim();
    }

    public String getDeviceVideoName() {
        return deviceVideoName;
    }

    public void setDeviceVideoName(String deviceVideoName) {
        this.deviceVideoName = deviceVideoName == null ? null : deviceVideoName.trim();
    }


    public String getSviAddr() {
        return sviAddr;
    }

    public void setSviAddr(String sviAddr) {
        this.sviAddr = sviAddr == null ? null : sviAddr.trim();
    }

    @JsonFormat(pattern="yyyy-MM-dd", timezone="GMT+8")
    public Date getSviBuildTime() {
        return sviBuildTime;
    }

    public void setSviBuildTime(Date sviBuildTime) {
        this.sviBuildTime = sviBuildTime;
    }

    public BigDecimal getSviLongitude() {
        return sviLongitude;
    }

    public void setSviLongitude(BigDecimal sviLongitude) {
        this.sviLongitude = sviLongitude;
    }

    public BigDecimal getSviLatitude() {
        return sviLatitude;
    }

    public void setSviLatitude(BigDecimal sviLatitude) {
        this.sviLatitude = sviLatitude;
    }

    public String getEzopenHdLive() {
        return ezopenHdLive;
    }

    public void setEzopenHdLive(String ezopenHdLive) {
        this.ezopenHdLive = ezopenHdLive == null ? null : ezopenHdLive.trim();
    }

    public String getEzopenLive() {
        return ezopenLive;
    }

    public void setEzopenLive(String ezopenLive) {
        this.ezopenLive = ezopenLive == null ? null : ezopenLive.trim();
    }

    public String getEzopenRecLive() {
        return ezopenRecLive;
    }

    public void setEzopenRecLive(String ezopenRecLive) {
        this.ezopenRecLive = ezopenRecLive == null ? null : ezopenRecLive.trim();
    }

    public String getRmtpUrl() {
        return rmtpUrl;
    }

    public void setRmtpUrl(String rmtpUrl) {
        this.rmtpUrl = rmtpUrl == null ? null : rmtpUrl.trim();
    }

    public String getHlsUrl() {
        return hlsUrl;
    }

    public void setHlsUrl(String hlsUrl) {
        this.hlsUrl = hlsUrl == null ? null : hlsUrl.trim();
    }

    public String getDeviceSerial() {
        return deviceSerial;
    }

    public void setDeviceSerial(String deviceSerial) {
        this.deviceSerial = deviceSerial == null ? null : deviceSerial.trim();
    }

    public String getSviPhotoBefore() {
        return sviPhotoBefore;
    }

    public void setSviPhotoBefore(String sviPhotoBefore) {
        this.sviPhotoBefore = sviPhotoBefore == null ? null : sviPhotoBefore.trim();
    }

    public String getSviPhotoAfter() {
        return sviPhotoAfter;
    }

    public void setSviPhotoAfter(String sviPhotoAfter) {
        this.sviPhotoAfter = sviPhotoAfter == null ? null : sviPhotoAfter.trim();
    }

    public Date getSviCreateTime() {
        return sviCreateTime;
    }

    public void setSviCreateTime(Date sviCreateTime) {
        this.sviCreateTime = sviCreateTime;
    }

    public Date getSviEditTime() {
        return sviEditTime;
    }

    public void setSviEditTime(Date sviEditTime) {
        this.sviEditTime = sviEditTime;
    }

    public String getSviRemark() {
        return sviRemark;
    }

    public void setSviRemark(String sviRemark) {
        this.sviRemark = sviRemark == null ? null : sviRemark.trim();
    }

    public String getAccesstoken() {
        return accesstoken;
    }

    public void setAccesstoken(String accesstoken) {
        this.accesstoken = accesstoken == null ? null : accesstoken.trim();
    }

    public String getDeviceChannelNumber() {
        return deviceChannelNumber;
    }

    public void setDeviceChannelNumber(String deviceChannelNumber) {
        this.deviceChannelNumber = deviceChannelNumber == null ? null : deviceChannelNumber.trim();
    }

    public String getEquipmentSequence() {
        return equipmentSequence;
    }

    public void setEquipmentSequence(String equipmentSequence) {
        this.equipmentSequence = equipmentSequence == null ? null : equipmentSequence.trim();
    }

    public String getDeviceType() {
        return deviceType;
    }

    public void setDeviceType(String deviceType) {
        this.deviceType = deviceType;
    }

    public String getComm1() {
        return comm1;
    }

    public void setComm1(String comm1) {
        this.comm1 = comm1 == null ? null : comm1.trim();
    }

    public String getComm2() {
        return comm2;
    }

    public void setComm2(String comm2) {
        this.comm2 = comm2 == null ? null : comm2.trim();
    }

    public String getComm3() {
        return comm3;
    }

    public void setComm3(String comm3) {
        this.comm3 = comm3 == null ? null : comm3.trim();
    }

    public String getComm4() {
        return comm4;
    }

    public void setComm4(String comm4) {
        this.comm4 = comm4 == null ? null : comm4.trim();
    }

    public String getComm5() {
        return comm5;
    }

    public void setComm5(String comm5) {
        this.comm5 = comm5 == null ? null : comm5.trim();
    }

    public String getDevicemodelName() {
        return devicemodelName;
    }

    public void setDevicemodelName(String devicemodelName) {
        this.devicemodelName = devicemodelName;
    }
}