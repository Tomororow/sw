package com.zyjz.site.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class SiteRainDynamicInfo implements Serializable {
    private String id;

    private String devicerainCode;

    private Date srdiCollectTime;

    private Integer srdiNetState;

    private BigDecimal timeRainfall;

    private BigDecimal timeLong;

    private BigDecimal dayTotalRainfall;
    
    /** 站点名称 */
    private String deviceRainName;

    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getDevicerainCode() {
        return devicerainCode;
    }

    public void setDevicerainCode(String devicerainCode) {
        this.devicerainCode = devicerainCode == null ? null : devicerainCode.trim();
    }

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getSrdiCollectTime() {
        return srdiCollectTime;
    }

    public void setSrdiCollectTime(Date srdiCollectTime) {
        this.srdiCollectTime = srdiCollectTime;
    }

    public Integer getSrdiNetState() {
        return srdiNetState;
    }

    public void setSrdiNetState(Integer srdiNetState) {
        this.srdiNetState = srdiNetState;
    }

    public BigDecimal getTimeRainfall() {
        return timeRainfall;
    }

    public void setTimeRainfall(BigDecimal timeRainfall) {
        this.timeRainfall = timeRainfall;
    }

    public BigDecimal getTimeLong() {
        return timeLong;
    }

    public void setTimeLong(BigDecimal timeLong) {
        this.timeLong = timeLong;
    }

    public BigDecimal getDayTotalRainfall() {
        return dayTotalRainfall;
    }

    public void setDayTotalRainfall(BigDecimal dayTotalRainfall) {
        this.dayTotalRainfall = dayTotalRainfall;
    }
    
    public String getDeviceRainName() {
        return deviceRainName;
    }

    public void setDeviceRainName(String deviceRainName) {
        this.deviceRainName = deviceRainName == null ? null : deviceRainName.trim();
    }

}