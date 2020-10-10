package com.zyjz.site.entity;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class JzMiddDevice {
    private Integer id;

    private String deviveId;

    private String deviveType;

    private String deviveCode;

    private String terminalMsg;

    private String cmnctType;

    private String terminalName;

    private String simCode;

    private Integer type;

    private Date time;

    private String lanip;

    private String ip;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date amendTime;

    private String meptyHing;

    private Integer pause;

    private BigDecimal waterLevel;

    private BigDecimal instantSpeed;

    private BigDecimal instantFlow;

    private BigDecimal testHeight;

    private BigDecimal totleFlow;

    private String swiAddr;

    private BigDecimal swiLatitude;

    private BigDecimal swiLongitude;

    private String trenChier1;

    private String trenChier2;

    private String trenChier3;

    private String trenChier4;

    private String trenChier5;

    private String trenChier6;

    private String trenChier7;
    
    private Integer swiDevicemodelCode;

    private String ezopenLive;

    //采集数据的时间
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createtime;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getCreatetime() {
        return createtime;
    }
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDeviveId() {
        return deviveId;
    }

    public void setDeviveId(String deviveId) {
        this.deviveId = deviveId == null ? null : deviveId.trim();
    }

    public String getDeviveType() {
        return deviveType;
    }

    public void setDeviveType(String deviveType) {
        this.deviveType = deviveType == null ? null : deviveType.trim();
    }

    public String getDeviveCode() {
        return deviveCode;
    }

    public void setDeviveCode(String deviveCode) {
        this.deviveCode = deviveCode == null ? null : deviveCode.trim();
    }

    public String getTerminalMsg() {
        return terminalMsg;
    }

    public void setTerminalMsg(String terminalMsg) {
        this.terminalMsg = terminalMsg == null ? null : terminalMsg.trim();
    }

    public String getCmnctType() {
        return cmnctType;
    }

    public void setCmnctType(String cmnctType) {
        this.cmnctType = cmnctType == null ? null : cmnctType.trim();
    }

    public String getTerminalName() {
        return terminalName;
    }

    public void setTerminalName(String terminalName) {
        this.terminalName = terminalName == null ? null : terminalName.trim();
    }

    public String getSimCode() {
        return simCode;
    }

    public void setSimCode(String simCode) {
        this.simCode = simCode == null ? null : simCode.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getLanip() {
        return lanip;
    }

    public void setLanip(String lanip) {
        this.lanip = lanip == null ? null : lanip.trim();
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getAmendTime() {
        return amendTime;
    }

    public void setAmendTime(Date amendTime) {
        this.amendTime = amendTime;
    }

    public String getMeptyHing() {
        return meptyHing;
    }

    public void setMeptyHing(String meptyHing) {
        this.meptyHing = meptyHing == null ? null : meptyHing.trim();
    }

    public Integer getPause() {
        return pause;
    }

    public void setPause(Integer pause) {
        this.pause = pause;
    }

    public BigDecimal getWaterLevel() {
        return waterLevel;
    }

    public void setWaterLevel(BigDecimal waterLevel) {
        this.waterLevel = waterLevel;
    }

    public BigDecimal getInstantSpeed() {
        return instantSpeed;
    }

    public void setInstantSpeed(BigDecimal instantSpeed) {
        this.instantSpeed = instantSpeed;
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

    public String getSwiAddr() {
        return swiAddr;
    }

    public void setSwiAddr(String swiAddr) {
        this.swiAddr = swiAddr == null ? null : swiAddr.trim();
    }

    public BigDecimal getSwiLatitude() {
        return swiLatitude;
    }

    public void setSwiLatitude(BigDecimal swiLatitude) {
        this.swiLatitude = swiLatitude;
    }

    public BigDecimal getSwiLongitude() {
        return swiLongitude;
    }

    public void setSwiLongitude(BigDecimal swiLongitude) {
        this.swiLongitude = swiLongitude;
    }

    public String getTrenChier1() {
        return trenChier1;
    }

    public void setTrenChier1(String trenChier1) {
        this.trenChier1 = trenChier1 == null ? null : trenChier1.trim();
    }

    public String getTrenChier2() {
        return trenChier2;
    }

    public void setTrenChier2(String trenChier2) {
        this.trenChier2 = trenChier2 == null ? null : trenChier2.trim();
    }

    public String getTrenChier3() {
        return trenChier3;
    }

    public void setTrenChier3(String trenChier3) {
        this.trenChier3 = trenChier3 == null ? null : trenChier3.trim();
    }

    public String getTrenChier4() {
        return trenChier4;
    }

    public void setTrenChier4(String trenChier4) {
        this.trenChier4 = trenChier4 == null ? null : trenChier4.trim();
    }

    public String getTrenChier5() {
        return trenChier5;
    }

    public void setTrenChier5(String trenChier5) {
        this.trenChier5 = trenChier5 == null ? null : trenChier5.trim();
    }

    public String getTrenChier6() {
        return trenChier6;
    }

    public void setTrenChier6(String trenChier6) {
        this.trenChier6 = trenChier6 == null ? null : trenChier6.trim();
    }

    public String getTrenChier7() {
        return trenChier7;
    }

    public void setTrenChier7(String trenChier7) {
        this.trenChier7 = trenChier7 == null ? null : trenChier7.trim();
    }
    
    public Integer getSwiDevicemodelCode() {
        return swiDevicemodelCode;
    }

    public void setSwiDevicemodelCode(Integer swiDevicemodelCode) {
        this.swiDevicemodelCode = swiDevicemodelCode;
    }

    public String getEzopenLive() {
        return ezopenLive;
    }

    public void setEzopenLive(String ezopenLive) {
        this.ezopenLive = ezopenLive;
    }
}