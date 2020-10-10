package com.zyjz.site.entity;

import java.util.Date;

public class DailyReport {
    private String deviceWaterName;

    private String deviceWaterCode;

    private Date createTime;

    private String totleFlow;

    private String year;

    private String month;

    private String day;

    public String getDeviceWaterName() {
        return deviceWaterName;
    }

    public void setDeviceWaterName(String deviceWaterName) {
        this.deviceWaterName = deviceWaterName == null ? null : deviceWaterName.trim();
    }

    public String getDeviceWaterCode() {
        return deviceWaterCode;
    }

    public void setDeviceWaterCode(String deviceWaterCode) {
        this.deviceWaterCode = deviceWaterCode == null ? null : deviceWaterCode.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getTotleFlow() {
        return totleFlow;
    }

    public void setTotleFlow(String totleFlow) {
        this.totleFlow = totleFlow == null ? null : totleFlow.trim();
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year == null ? null : year.trim();
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month == null ? null : month.trim();
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day == null ? null : day.trim();
    }
}