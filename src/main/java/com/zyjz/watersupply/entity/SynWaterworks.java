package com.zyjz.watersupply.entity;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class SynWaterworks {
    private String id;

    private String sysareaCode;

    private String sysareaId;

    private String syswaterareaId;

    private String syswaterareaCode;

    private String waterworksCoding;

    private String waterFactoryName;

    private String addres;

    private BigDecimal longitude;

    private BigDecimal latitude;

    private BigDecimal elevation;

    private Integer headwatersSource;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date buildTime;

    private Date creationTime;

    private Date updateTime;

    private String simClip;

    private String simClipOperator;

    private String waterAddress;

    private String waterImages;

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

    public String getSysareaCode() {
        return sysareaCode;
    }

    public void setSysareaCode(String sysareaCode) {
        this.sysareaCode = sysareaCode == null ? null : sysareaCode.trim();
    }

    public String getSysareaId() {
        return sysareaId;
    }

    public void setSysareaId(String sysareaId) {
        this.sysareaId = sysareaId == null ? null : sysareaId.trim();
    }

    public String getSyswaterareaId() {
        return syswaterareaId;
    }

    public void setSyswaterareaId(String syswaterareaId) {
        this.syswaterareaId = syswaterareaId == null ? null : syswaterareaId.trim();
    }

    public String getSyswaterareaCode() {
        return syswaterareaCode;
    }

    public void setSyswaterareaCode(String syswaterareaCode) {
        this.syswaterareaCode = syswaterareaCode == null ? null : syswaterareaCode.trim();
    }

    public String getWaterworksCoding() {
        return waterworksCoding;
    }

    public void setWaterworksCoding(String waterworksCoding) {
        this.waterworksCoding = waterworksCoding == null ? null : waterworksCoding.trim();
    }

    public String getWaterFactoryName() {
        return waterFactoryName;
    }

    public void setWaterFactoryName(String waterFactoryName) {
        this.waterFactoryName = waterFactoryName == null ? null : waterFactoryName.trim();
    }

    public String getAddres() {
        return addres;
    }

    public void setAddres(String addres) {
        this.addres = addres == null ? null : addres.trim();
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

    public Integer getHeadwatersSource() {
        return headwatersSource;
    }

    public void setHeadwatersSource(Integer headwatersSource) {
        this.headwatersSource = headwatersSource;
    }
    @JsonFormat(pattern="yyyy-MM-dd", timezone="GMT+8")
    public Date getBuildTime() {
        return buildTime;
    }

    public void setBuildTime(Date buildTime) {
        this.buildTime = buildTime;
    }
    @JsonFormat(pattern="yyyy-MM-dd", timezone="GMT+8")
    public Date getCreationTime() {
        return creationTime;
    }

    public void setCreationTime(Date creationTime) {
        this.creationTime = creationTime;
    }
    @JsonFormat(pattern="yyyy-MM-dd", timezone="GMT+8")
    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
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

    public String getWaterAddress() {
        return waterAddress;
    }

    public void setWaterAddress(String waterAddress) {
        this.waterAddress = waterAddress == null ? null : waterAddress.trim();
    }

    public String getWaterImages() {
        return waterImages;
    }

    public void setWaterImages(String waterImages) {
        this.waterImages = waterImages == null ? null : waterImages.trim();
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
    
