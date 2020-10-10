package com.zyjz.remotecontrol.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;

import java.math.BigDecimal;
import java.util.Date;

public class SiteSluiceControlOperationRecordExcel {
    private int id;

    @Excel(name="闸门编码",height = 13, width = 15,orderNum="1")
    private String sscorSluiceCode;

    @Excel(name="闸门名称",height = 13, width = 25,orderNum="2")
    private String sscorSluiceName;

    @Excel(name="闸门变化前开度",height = 13, width = 10,orderNum="3")
    private BigDecimal sluiceHeightChangeBefore;

    @Excel(name="闸门变化后开度",height = 13, width = 10,orderNum="4")
    private BigDecimal sluiceHeightChangeAfter;

    @Excel(name="变化状态",height = 13, width = 10,orderNum="5")
    private String sluiceChangeType;

    @Excel(name="操作员",height = 13, width = 15,orderNum="6")
    private String sluiceOperatorName;

    @Excel(name="操作来源ip",height = 13, width = 15,orderNum="7")
    private String operatorIp;

    @Excel(name="操作来源",height = 13, width = 10,orderNum="8")
    private String operatorSource;

    @Excel(name="操作闸门时间",height = 13,databaseFormat = "yyyy-MM-dd HH:mm:ss", format = "yyyy-MM-dd HH:mm:ss", width = 20,orderNum="9")
    private Date sscorCreateTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSscorSluiceCode() {
        return sscorSluiceCode;
    }

    public void setSscorSluiceCode(String sscorSluiceCode) {
        this.sscorSluiceCode = sscorSluiceCode == null ? null : sscorSluiceCode.trim();
    }

    public String getSscorSluiceName() {
        return sscorSluiceName;
    }

    public void setSscorSluiceName(String sscorSluiceName) {
        this.sscorSluiceName = sscorSluiceName == null ? null : sscorSluiceName.trim();
    }

    public BigDecimal getSluiceHeightChangeBefore() {
        return sluiceHeightChangeBefore;
    }

    public void setSluiceHeightChangeBefore(BigDecimal sluiceHeightChangeBefore) {
        this.sluiceHeightChangeBefore = sluiceHeightChangeBefore;
    }

    public BigDecimal getSluiceHeightChangeAfter() {
        return sluiceHeightChangeAfter;
    }

    public void setSluiceHeightChangeAfter(BigDecimal sluiceHeightChangeAfter) {
        this.sluiceHeightChangeAfter = sluiceHeightChangeAfter;
    }

    public String getSluiceChangeType() {
        return sluiceChangeType;
    }

    public void setSluiceChangeType(String sluiceChangeType) {
        this.sluiceChangeType = sluiceChangeType;
    }

    public String getSluiceOperatorName() {
        return sluiceOperatorName;
    }

    public void setSluiceOperatorName(String sluiceOperatorName) {
        this.sluiceOperatorName = sluiceOperatorName;
    }

    public String getOperatorIp() {
        return operatorIp;
    }

    public void setOperatorIp(String operatorIp) {
        this.operatorIp = operatorIp;
    }

    public String getOperatorSource() {
        return operatorSource;
    }

    public void setOperatorSource(String operatorSource) {
        this.operatorSource = operatorSource;
    }

    public Date getSscorCreateTime() {
        return sscorCreateTime;
    }

    public void setSscorCreateTime(Date sscorCreateTime) {
        this.sscorCreateTime = sscorCreateTime;
    }
}
