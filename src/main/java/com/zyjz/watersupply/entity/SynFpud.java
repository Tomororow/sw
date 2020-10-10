package com.zyjz.watersupply.entity;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class SynFpud {
    private String id;
    
    private String waterworksId;

    private String sysareaId;

    private String sysareaCode;

    private String fpudNumber;

    private String fpudName;

    private String photos;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date buildTime;

    private BigDecimal longitude;

    private BigDecimal latitude;

    private BigDecimal elevation;

    private String address;

    private String simClip;

    private String simClipOperator;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date creationTime;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updateTime;

    private String comm1;

    private String comm2;

    private String comm3;

    private String comm4;

    private String comm5;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getWaterworksId() {
        return waterworksId;
    }

    public void setWaterworksId(String waterworksId) {
        this.waterworksId = waterworksId == null ? null : waterworksId.trim();
    }

    public String getSysareaId() {
        return sysareaId;
    }

    public void setSysareaId(String sysareaId) {
        this.sysareaId = sysareaId == null ? null : sysareaId.trim();
    }

    public String getSysareaCode() {
        return sysareaCode;
    }

    public void setSysareaCode(String sysareaCode) {
        this.sysareaCode = sysareaCode == null ? null : sysareaCode.trim();
    }

    public String getFpudNumber() {
        return fpudNumber;
    }

    public void setFpudNumber(String fpudNumber) {
        this.fpudNumber = fpudNumber == null ? null : fpudNumber.trim();
    }

    public String getFpudName() {
        return fpudName;
    }

    public void setFpudName(String fpudName) {
        this.fpudName = fpudName == null ? null : fpudName.trim();
    }

    public String getPhotos() {
        return photos;
    }

    public void setPhotos(String photos) {
        this.photos = photos == null ? null : photos.trim();
    }
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getBuildTime() {
        return buildTime;
    }

    public void setBuildTime(Date buildTime) {
        this.buildTime = buildTime;
    }

    public BigDecimal getLongitude() {
        return longitude;
    }

    public void setLongitude(BigDecimal longitude) {
        this.longitude = longitude;
    }

    public BigDecimal getLatitude() {
        return latitude;
    }

    public void setLatitude(BigDecimal latitude) {
        this.latitude = latitude;
    }

    public BigDecimal getElevation() {
        return elevation;
    }

    public void setElevation(BigDecimal elevation) {
        this.elevation = elevation;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getSimClip() {
        return simClip;
    }

    public void setSimClip(String simClip) {
        this.simClip = simClip == null ? null : simClip.trim();
    }

    public String getSimClipOperator() {
        return simClipOperator;
    }

    public void setSimClipOperator(String simClipOperator) {
        this.simClipOperator = simClipOperator == null ? null : simClipOperator.trim();
    }
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getCreationTime() {
        return creationTime;
    }

    public void setCreationTime(Date creationTime) {
        this.creationTime = creationTime;
    }
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
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
}