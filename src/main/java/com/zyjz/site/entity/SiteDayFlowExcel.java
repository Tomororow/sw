package com.zyjz.site.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 日流量表
 * @Date 2020/06/11
 */
public class SiteDayFlowExcel implements Serializable {

    private static final long serialVersionUID = 1L;
    //设备id
    private String id;
    //设备编码
    @Excel(name="渠道编码", height = 13, width = 20, orderNum = "2")
    private String waterCode;
    //设备名称
    @Excel(name="渠道名称", height = 13, width = 20, orderNum = "1")
    private String waterName;
    //设备日总流量
    @Excel(name="总引水量", height = 13, width = 20, orderNum = "4")
    private BigDecimal dayFlow;
    //设备日均流量
    @Excel(name="平均流量", height = 13, width = 20, orderNum = "3")
    private BigDecimal avgDayFlow;
    //设备编辑时间
    @Excel(name="查询时间", height = 13, width = 20, orderNum = "5", databaseFormat = "yyyyMMdd", format = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;
    // 入库年
    private Integer inYear;
    //入库月
    private Integer inMonth;
    // 入库日
    private Integer inDay;
    //设备类型
    private String deviceType;
    //临时字段
    private String temp1;
    //临时字段
    private String temp2;
    //临时字段
    private String temp3;
    //临时字段
    private String temp4;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getWaterCode() {
        return waterCode;
    }

    public void setWaterCode(String waterCode) {
        this.waterCode = waterCode;
    }

    public String getWaterName() {
        return waterName;
    }

    public void setWaterName(String waterName) {
        this.waterName = waterName;
    }

    public BigDecimal getDayFlow() {
        return dayFlow;
    }

    public void setDayFlow(BigDecimal dayFlow) {
        this.dayFlow = dayFlow;
    }

    public BigDecimal getAvgDayFlow() {
        return avgDayFlow;
    }

    public void setAvgDayFlow(BigDecimal avgDayFlow) {
        this.avgDayFlow = avgDayFlow;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getInYear() {
        return inYear;
    }

    public void setInYear(Integer inYear) {
        this.inYear = inYear;
    }

    public Integer getInMonth() {
        return inMonth;
    }

    public void setInMonth(Integer inMonth) {
        this.inMonth = inMonth;
    }

    public Integer getInDay() {
        return inDay;
    }

    public void setInDay(Integer inDay) {
        this.inDay = inDay;
    }

    public String getDeviceType() {
        return deviceType;
    }

    public void setDeviceType(String deviceType) {
        this.deviceType = deviceType;
    }

    public String getTemp1() {
        return temp1;
    }

    public void setTemp1(String temp1) {
        this.temp1 = temp1;
    }

    public String getTemp2() {
        return temp2;
    }

    public void setTemp2(String temp2) {
        this.temp2 = temp2;
    }

    public String getTemp3() {
        return temp3;
    }

    public void setTemp3(String temp3) {
        this.temp3 = temp3;
    }

    public String getTemp4() {
        return temp4;
    }

    public void setTemp4(String temp4) {
        this.temp4 = temp4;
    }
}
