package com.zyjz.remotecontrol.entity;

import java.math.BigDecimal;
import java.util.Date;

public class SiteSluiceControlOperationRecord {

    /**  id */
    private Integer id;

    /** 闸门编码 sscor_sluice_code */
    private String sscorSluiceCode;

    /** 闸门名称 sscor_sluice_name */
    private String sscorSluiceName;

    /** 闸门变化前开度 sluice_height_change_before */
    private BigDecimal sluiceHeightChangeBefore;

    /** 闸门变化后开度 sluice_height_change_after */
    private BigDecimal sluiceHeightChangeAfter;

    /** 闸门变化状态：0：下降；1上升 sluice_change_type */
    private String sluiceChangeType;

    /** 操作来源ip operator_ip */
    private String operatorIp;

    /** 操作者名字 sluice_operator_name */
    private String sluiceOperatorName;

    /** 操作者账号 sluice_operator_code */
    private String sluiceOperatorCode;

    /** 创建时间 sscor_create_time */
    private Date sscorCreateTime;

    /** 操作来源（0：web，1:微信，2：c/s） operator_source */
    private Integer operatorSource;

    /** 备用字段1 back_one */
    private String backOne;

    /** 备用字段2 back_two */
    private String backTwo;

    /** 备用字段3 back_three */
    private String backThree;

    /** 备注 remark */
    private String remark;

    private SiteSluiceGateInfo siteSluiceGateInfo;

    /**
     *
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     *
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 闸门编码
     * @return sscor_sluice_code 闸门编码
     */
    public String getSscorSluiceCode() {
        return sscorSluiceCode;
    }

    /**
     * 闸门编码
     * @param sscorSluiceCode 闸门编码
     */
    public void setSscorSluiceCode(String sscorSluiceCode) {
        this.sscorSluiceCode = sscorSluiceCode == null ? null : sscorSluiceCode.trim();
    }

    /**
     * 闸门名称
     * @return sscor_sluice_name 闸门名称
     */
    public String getSscorSluiceName() {
        return sscorSluiceName;
    }

    /**
     * 闸门名称
     * @param sscorSluiceName 闸门名称
     */
    public void setSscorSluiceName(String sscorSluiceName) {
        this.sscorSluiceName = sscorSluiceName == null ? null : sscorSluiceName.trim();
    }

    /**
     * 闸门变化前开度
     * @return sluice_height_change_before 闸门变化前开度
     */
    public BigDecimal getSluiceHeightChangeBefore() {
        return sluiceHeightChangeBefore;
    }

    /**
     * 闸门变化前开度
     * @param sluiceHeightChangeBefore 闸门变化前开度
     */
    public void setSluiceHeightChangeBefore(BigDecimal sluiceHeightChangeBefore) {
        this.sluiceHeightChangeBefore = sluiceHeightChangeBefore;
    }

    /**
     * 闸门变化后开度
     * @return sluice_height_change_after 闸门变化后开度
     */
    public BigDecimal getSluiceHeightChangeAfter() {
        return sluiceHeightChangeAfter;
    }

    /**
     * 闸门变化后开度
     * @param sluiceHeightChangeAfter 闸门变化后开度
     */
    public void setSluiceHeightChangeAfter(BigDecimal sluiceHeightChangeAfter) {
        this.sluiceHeightChangeAfter = sluiceHeightChangeAfter;
    }

    /**
     * 闸门变化状态：0：下降；1上升
     * @return sluice_change_type 闸门变化状态：0：下降；1上升
     */
    public String getSluiceChangeType() {
        return sluiceChangeType;
    }

    /**
     * 闸门变化状态：0：下降；1上升
     * @param sluiceChangeType 闸门变化状态：0：下降；1上升
     */
    public void setSluiceChangeType(String sluiceChangeType) {
        this.sluiceChangeType = sluiceChangeType == null ? null : sluiceChangeType.trim();
    }

    /**
     * 操作来源ip
     * @return operator_ip 操作来源ip
     */
    public String getOperatorIp() {
        return operatorIp;
    }

    /**
     * 操作来源ip
     * @param operatorIp 操作来源ip
     */
    public void setOperatorIp(String operatorIp) {
        this.operatorIp = operatorIp == null ? null : operatorIp.trim();
    }

    /**
     * 操作者名字
     * @return sluice_operator_name 操作者名字
     */
    public String getSluiceOperatorName() {
        return sluiceOperatorName;
    }

    /**
     * 操作者名字
     * @param sluiceOperatorName 操作者名字
     */
    public void setSluiceOperatorName(String sluiceOperatorName) {
        this.sluiceOperatorName = sluiceOperatorName == null ? null : sluiceOperatorName.trim();
    }

    /**
     * 操作者账号
     * @return sluice_operator_code 操作者账号
     */
    public String getSluiceOperatorCode() {
        return sluiceOperatorCode;
    }

    /**
     * 操作者账号
     * @param sluiceOperatorCode 操作者账号
     */
    public void setSluiceOperatorCode(String sluiceOperatorCode) {
        this.sluiceOperatorCode = sluiceOperatorCode == null ? null : sluiceOperatorCode.trim();
    }

    /**
     * 创建时间
     * @return sscor_create_time 创建时间
     */
    public Date getSscorCreateTime() {
        return sscorCreateTime;
    }

    /**
     * 创建时间
     * @param sscorCreateTime 创建时间
     */
    public void setSscorCreateTime(Date sscorCreateTime) {
        this.sscorCreateTime = sscorCreateTime;
    }

    /**
     * 操作来源（0：web，1:微信，2：c/s）
     * @return operator_source 操作来源（0：web，1:微信，2：c/s）
     */
    public Integer getOperatorSource() {
        return operatorSource;
    }

    /**
     * 操作来源（0：web，1:微信，2：c/s）
     * @param operatorSource 操作来源（0：web，1:微信，2：c/s）
     */
    public void setOperatorSource(Integer operatorSource) {
        this.operatorSource = operatorSource;
    }

    /**
     * 备用字段1
     * @return back_one 备用字段1
     */
    public String getBackOne() {
        return backOne;
    }

    /**
     * 备用字段1
     * @param backOne 备用字段1
     */
    public void setBackOne(String backOne) {
        this.backOne = backOne == null ? null : backOne.trim();
    }

    /**
     * 备用字段2
     * @return back_two 备用字段2
     */
    public String getBackTwo() {
        return backTwo;
    }

    /**
     * 备用字段2
     * @param backTwo 备用字段2
     */
    public void setBackTwo(String backTwo) {
        this.backTwo = backTwo == null ? null : backTwo.trim();
    }

    /**
     * 备用字段3
     * @return back_three 备用字段3
     */
    public String getBackThree() {
        return backThree;
    }

    /**
     * 备用字段3
     * @param backThree 备用字段3
     */
    public void setBackThree(String backThree) {
        this.backThree = backThree == null ? null : backThree.trim();
    }

    /**
     * 备注
     * @return remark 备注
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 备注
     * @param remark 备注
     */
    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public SiteSluiceGateInfo getSiteSluiceGateInfo() {
        return siteSluiceGateInfo;
    }

    public void setSiteSluiceGateInfo(SiteSluiceGateInfo siteSluiceGateInfo) {
        this.siteSluiceGateInfo = siteSluiceGateInfo;
    }
}
