package com.zyjz.sysmanage.entity;

import java.io.Serializable;

public class SiteMiddleCanal implements Serializable {

    private static final long serialVersionUID = 1L;

    //id
    private String id;
    //canalCode
    private String canalCode;
    //水位站编码
    private String siteWaterCode;
    //闸门站编码
    private String deviceSluiceCode;
    //视频站编码
    private String deviceVideoCode;
    //在线水质监测站编码
    private String waterSurveyCode;

    private String planCode;

    private String planNewCode;
    //需水提报编码
    private String reportNo;
    //土地管理编码
    private String consumerId;
    //水库编码
    private String deviceReservoirCode;
    //气象站编码
    private String meteorSurveyCode;

    private String remark;

    private String standby1;

    private String standby2;

    private String standby3;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCanalCode() {
        return canalCode;
    }

    public void setCanalCode(String canalCode) {
        this.canalCode = canalCode;
    }

    public String getSiteWaterCode() {
        return siteWaterCode;
    }

    public void setSiteWaterCode(String siteWaterCode) {
        this.siteWaterCode = siteWaterCode;
    }

    public String getDeviceSluiceCode() {
        return deviceSluiceCode;
    }

    public void setDeviceSluiceCode(String deviceSluiceCode) {
        this.deviceSluiceCode = deviceSluiceCode;
    }

    public String getDeviceVideoCode() {
        return deviceVideoCode;
    }

    public void setDeviceVideoCode(String deviceVideoCode) {
        this.deviceVideoCode = deviceVideoCode;
    }

    public String getWaterSurveyCode() {
        return waterSurveyCode;
    }

    public void setWaterSurveyCode(String waterSurveyCode) {
        this.waterSurveyCode = waterSurveyCode;
    }

    public String getPlanCode() {
        return planCode;
    }

    public void setPlanCode(String planCode) {
        this.planCode = planCode;
    }

    public String getPlanNewCode() {
        return planNewCode;
    }

    public void setPlanNewCode(String planNewCode) {
        this.planNewCode = planNewCode;
    }

    public String getReportNo() {
        return reportNo;
    }

    public void setReportNo(String reportNo) {
        this.reportNo = reportNo;
    }

    public String getConsumerId() {
        return consumerId;
    }

    public void setConsumerId(String consumerId) {
        this.consumerId = consumerId;
    }

    public String getDeviceReservoirCode() {
        return deviceReservoirCode;
    }

    public void setDeviceReservoirCode(String deviceReservoirCode) {
        this.deviceReservoirCode = deviceReservoirCode;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getStandby1() {
        return standby1;
    }

    public void setStandby1(String standby1) {
        this.standby1 = standby1;
    }

    public String getStandby2() {
        return standby2;
    }

    public void setStandby2(String standby2) {
        this.standby2 = standby2;
    }

    public String getStandby3() {
        return standby3;
    }

    public void setStandby3(String standby3) {
        this.standby3 = standby3;
    }

    public String getMeteorSurveyCode() {
        return meteorSurveyCode;
    }

    public void setMeteorSurveyCode(String meteorSurveyCode) {
        this.meteorSurveyCode = meteorSurveyCode;
    }
}
