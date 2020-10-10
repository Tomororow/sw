package com.zyjz.site.entity;

import java.math.BigDecimal;
import java.util.Date;

public class SiteMonthFlow {
    /**  */
    private Integer id;

    /** 设备编码 */
    private String waterCode;

    /** 测站名称 */
    private String waterName;

    /** 月累计流量 */
    private BigDecimal monthFlow;

    /** 数据上报时间 */
    private Date createTime;

    /** 入库年 */
    private Integer inYear;

    /** 入库月 */
    private Integer inMonth;

    /** 设备类型：0：雷达；1：明渠 */
    private String deviceType;

    /** 临时字段 */
    private String temp1;

    /** 临时字段 */
    private String temp2;

    /** 临时字段 */
    private String temp3;

    /** 临时字段 */
    private String temp4;

    /** 其他字段*/
    /** 年总流量 */
    private BigDecimal yearSumFlow;

    /** 每月总引水量*/
    private BigDecimal totalFlowPerMonth;

    /** 占灌区年用水量百分比*/
    private String percentage;

    /** 月均流量 */
    private BigDecimal avgMonthFlow;

    /**
     * 
     * @return ID 
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
     * 设备编码
     * @return WATER_CODE 设备编码
     */
    public String getWaterCode() {
        return waterCode;
    }

    /**
     * 设备编码
     * @param waterCode 设备编码
     */
    public void setWaterCode(String waterCode) {
        this.waterCode = waterCode == null ? null : waterCode.trim();
    }

    /**
     * 测站名称
     * @return WATER__NAME 测站名称
     */
    public String getWaterName() {
        return waterName;
    }

    /**
     * 测站名称
     * @param waterName 测站名称
     */
    public void setWaterName(String waterName) {
        this.waterName = waterName == null ? null : waterName.trim();
    }

    /**
     * 月累计流量
     * @return MONTH_FLOW 月累计流量
     */
    public BigDecimal getMonthFlow() {
        return monthFlow;
    }

    /**
     * 月累计流量
     * @param monthFlow 月累计流量
     */
    public void setMonthFlow(BigDecimal monthFlow) {
        this.monthFlow = monthFlow;
    }

    /**
     * 数据上报时间
     * @return CREATE_TIME 数据上报时间
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 数据上报时间
     * @param createTime 数据上报时间
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * 入库年
     * @return IN_YEAR 入库年
     */
    public Integer getInYear() {
        return inYear;
    }

    /**
     * 入库年
     * @param inYear 入库年
     */
    public void setInYear(Integer inYear) {
        this.inYear = inYear;
    }

    /**
     * 入库月
     * @return IN_MONTH 入库月
     */
    public Integer getInMonth() {
        return inMonth;
    }

    /**
     * 入库月
     * @param inMonth 入库月
     */
    public void setInMonth(Integer inMonth) {
        this.inMonth = inMonth;
    }

    /**
     * 设备类型：0：雷达；1：明渠
     * @return DEVICE_TYPE 设备类型：0：雷达；1：明渠
     */
    public String getDeviceType() {
        return deviceType;
    }

    /**
     * 设备类型：0：雷达；1：明渠
     * @param deviceType 设备类型：0：雷达；1：明渠
     */
    public void setDeviceType(String deviceType) {
        this.deviceType = deviceType == null ? null : deviceType.trim();
    }

    /**
     * 临时字段
     * @return TEMP1 临时字段
     */
    public String getTemp1() {
        return temp1;
    }

    /**
     * 临时字段
     * @param temp1 临时字段
     */
    public void setTemp1(String temp1) {
        this.temp1 = temp1 == null ? null : temp1.trim();
    }

    /**
     * 临时字段
     * @return TEMP2 临时字段
     */
    public String getTemp2() {
        return temp2;
    }

    /**
     * 临时字段
     * @param temp2 临时字段
     */
    public void setTemp2(String temp2) {
        this.temp2 = temp2 == null ? null : temp2.trim();
    }

    /**
     * 临时字段
     * @return TEMP3 临时字段
     */
    public String getTemp3() {
        return temp3;
    }

    /**
     * 临时字段
     * @param temp3 临时字段
     */
    public void setTemp3(String temp3) {
        this.temp3 = temp3 == null ? null : temp3.trim();
    }

    /**
     * 临时字段
     * @return TEMP4 临时字段
     */
    public String getTemp4() {
        return temp4;
    }

    /**
     * 临时字段
     * @param temp4 临时字段
     */
    public void setTemp4(String temp4) {
        this.temp4 = temp4 == null ? null : temp4.trim();
    }

    public BigDecimal getYearSumFlow() {
        return yearSumFlow;
    }

    public void setYearSumFlow(BigDecimal yearSumFlow) {
        this.yearSumFlow = yearSumFlow;
    }

    public BigDecimal getTotalFlowPerMonth() {
        return totalFlowPerMonth;
    }

    public void setTotalFlowPerMonth(BigDecimal totalFlowPerMonth) {
        this.totalFlowPerMonth = totalFlowPerMonth;
    }

    public String getPercentage() {
        return percentage;
    }

    public void setPercentage(String percentage) {
        this.percentage = percentage;
    }

    public BigDecimal getAvgMonthFlow() {
        return avgMonthFlow;
    }

    public void setAvgMonthFlow(BigDecimal avgMonthFlow) {
        this.avgMonthFlow = avgMonthFlow;
    }
}