package com.zyjz.site.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;

public class SiteSluiceDynamicInfoExcel {

    @Excel(name="闸门站编码",height = 13, width = 15,orderNum="1")
    private String devicesluiceCode;

    @Excel(name="闸门站名称",height = 13, width = 20,orderNum="2")
    private String deviceSluiceName;

    @Excel(name="闸门编码",height = 13, width = 20,orderNum="3")
    private String ssdiSluiceGateCode;

    @Excel(name="设备状态",height = 13, width = 10,orderNum="4")
    private String ssdiNetState;

    @Excel(name="闸前水位",height = 13, width = 10,orderNum="5")
    private BigDecimal beforeWaterLevel;

    @Excel(name="闸后水位",height = 13, width = 10,orderNum="6")
    private BigDecimal afterWaterLevel;

    @Excel(name="瞬时流速",height = 13, width = 10,orderNum="7")
    private BigDecimal sluiceInstantSpeed;

    @Excel(name="瞬时流量",height = 13, width = 10,orderNum="8")
    private BigDecimal sluiceInstantFlow;

    @Excel(name="闸门开度",height = 13, width = 10,orderNum="9")
    private BigDecimal sluiceHeight;

    @Excel(name="闸门荷重A",height = 13, width = 10,orderNum="10")
    private BigDecimal gateLoada;

    @Excel(name="闸门荷重A",height = 13, width = 10,orderNum="11")
    private BigDecimal gateLoadb;

    @Excel(name="采集时间",height = 13,databaseFormat = "yyyy-MM-dd HH:mm:ss", format = "yyyy-MM-dd HH:mm:ss", width = 20,orderNum="12")
    private Date ssdiCollectTime;

    public SiteSluiceDynamicInfoExcel() {
        super();
    }

    public SiteSluiceDynamicInfoExcel(String devicesluiceCode, String deviceSluiceName, String ssdiSluiceGateCode, String ssdiNetState, BigDecimal beforeWaterLevel, BigDecimal afterWaterLevel, BigDecimal sluiceInstantSpeed, BigDecimal sluiceInstantFlow, BigDecimal sluiceHeight, BigDecimal gateLoada, BigDecimal gateLoadb, Date ssdiCollectTime) {
        this.devicesluiceCode = devicesluiceCode;
        this.deviceSluiceName = deviceSluiceName;
        this.ssdiSluiceGateCode = ssdiSluiceGateCode;
        this.ssdiNetState = ssdiNetState;
        this.beforeWaterLevel = beforeWaterLevel;
        this.afterWaterLevel = afterWaterLevel;
        this.sluiceInstantSpeed = sluiceInstantSpeed;
        this.sluiceInstantFlow = sluiceInstantFlow;
        this.sluiceHeight = sluiceHeight;
        this.gateLoada = gateLoada;
        this.gateLoadb = gateLoadb;
        this.ssdiCollectTime = ssdiCollectTime;
    }

    public String getDevicesluiceCode() {
        return devicesluiceCode;
    }

    public void setDevicesluiceCode(String devicesluiceCode) {
        this.devicesluiceCode = devicesluiceCode;
    }

    public String getDeviceSluiceName() {
        return deviceSluiceName;
    }

    public void setDeviceSluiceName(String deviceSluiceName) {
        this.deviceSluiceName = deviceSluiceName;
    }

    public String getSsdiSluiceGateCode() {
        return ssdiSluiceGateCode;
    }

    public void setSsdiSluiceGateCode(String ssdiSluiceGateCode) {
        this.ssdiSluiceGateCode = ssdiSluiceGateCode;
    }

    public String getSsdiNetState() {
        return ssdiNetState;
    }

    public void setSsdiNetState(String ssdiNetState) {
        this.ssdiNetState = ssdiNetState;
    }

    public BigDecimal getBeforeWaterLevel() {
        return beforeWaterLevel;
    }

    public void setBeforeWaterLevel(BigDecimal beforeWaterLevel) {
        this.beforeWaterLevel = beforeWaterLevel;
    }

    public BigDecimal getAfterWaterLevel() {
        return afterWaterLevel;
    }

    public void setAfterWaterLevel(BigDecimal afterWaterLevel) {
        this.afterWaterLevel = afterWaterLevel;
    }

    public BigDecimal getSluiceInstantSpeed() {
        return sluiceInstantSpeed;
    }

    public void setSluiceInstantSpeed(BigDecimal sluiceInstantSpeed) {
        this.sluiceInstantSpeed = sluiceInstantSpeed;
    }

    public BigDecimal getSluiceInstantFlow() {
        return sluiceInstantFlow;
    }

    public void setSluiceInstantFlow(BigDecimal sluiceInstantFlow) {
        this.sluiceInstantFlow = sluiceInstantFlow;
    }

    public BigDecimal getSluiceHeight() {
        return sluiceHeight;
    }

    public void setSluiceHeight(BigDecimal sluiceHeight) {
        this.sluiceHeight = sluiceHeight;
    }

    public BigDecimal getGateLoada() {
        return gateLoada;
    }

    public void setGateLoada(BigDecimal gateLoada) {
        this.gateLoada = gateLoada;
    }

    public BigDecimal getGateLoadb() {
        return gateLoadb;
    }

    public void setGateLoadb(BigDecimal gateLoadb) {
        this.gateLoadb = gateLoadb;
    }

    public Date getSsdiCollectTime() {
        return ssdiCollectTime;
    }

    public void setSsdiCollectTime(Date ssdiCollectTime) {
        this.ssdiCollectTime = ssdiCollectTime;
    }
}