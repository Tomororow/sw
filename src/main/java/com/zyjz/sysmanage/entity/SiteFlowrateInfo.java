package com.zyjz.sysmanage.entity;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class SiteFlowrateInfo implements Serializable{
    
	private static final long serialVersionUID = 1L;

	private String id;

    private String fsiCanalCode;

    private String fsiFlowrateCode;

    private String fsiFlowrateName;

    private String fsiFlowrateAddr;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date fsiBuildTime;

    private String fsiSpeedCode;

    private String fsiWaterCode;

    private Date fsiCreateTime;

    private Date fsiEditTime;

    private String fsiRemark;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getFsiCanalCode() {
        return fsiCanalCode;
    }

    public void setFsiCanalCode(String fsiCanalCode) {
        this.fsiCanalCode = fsiCanalCode == null ? null : fsiCanalCode.trim();
    }

    public String getFsiFlowrateCode() {
        return fsiFlowrateCode;
    }

    public void setFsiFlowrateCode(String fsiFlowrateCode) {
        this.fsiFlowrateCode = fsiFlowrateCode == null ? null : fsiFlowrateCode.trim();
    }

    public String getFsiFlowrateName() {
        return fsiFlowrateName;
    }

    public void setFsiFlowrateName(String fsiFlowrateName) {
        this.fsiFlowrateName = fsiFlowrateName == null ? null : fsiFlowrateName.trim();
    }

    public String getFsiFlowrateAddr() {
        return fsiFlowrateAddr;
    }

    public void setFsiFlowrateAddr(String fsiFlowrateAddr) {
        this.fsiFlowrateAddr = fsiFlowrateAddr == null ? null : fsiFlowrateAddr.trim();
    }

    public Date getFsiBuildTime() {
        return fsiBuildTime;
    }

    public void setFsiBuildTime(Date fsiBuildTime) {
        this.fsiBuildTime = fsiBuildTime;
    }

    public String getFsiSpeedCode() {
        return fsiSpeedCode;
    }

    public void setFsiSpeedCode(String fsiSpeedCode) {
        this.fsiSpeedCode = fsiSpeedCode == null ? null : fsiSpeedCode.trim();
    }

    public String getFsiWaterCode() {
        return fsiWaterCode;
    }

    public void setFsiWaterCode(String fsiWaterCode) {
        this.fsiWaterCode = fsiWaterCode == null ? null : fsiWaterCode.trim();
    }

    public Date getFsiCreateTime() {
        return fsiCreateTime;
    }

    public void setFsiCreateTime(Date fsiCreateTime) {
        this.fsiCreateTime = fsiCreateTime;
    }

    public Date getFsiEditTime() {
        return fsiEditTime;
    }

    public void setFsiEditTime(Date fsiEditTime) {
        this.fsiEditTime = fsiEditTime;
    }

    public String getFsiRemark() {
        return fsiRemark;
    }

    public void setFsiRemark(String fsiRemark) {
        this.fsiRemark = fsiRemark == null ? null : fsiRemark.trim();
    }
}