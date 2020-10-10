package com.zyjz.plan.entity;

import java.io.Serializable;
import java.math.BigDecimal;

public class ForecastWaterTable implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;

    private String forecastId;

    private Integer year;

    private Integer month;

    private BigDecimal earlyTen;

    private Integer earlyTenYear;

    private BigDecimal middleTen;

    private Integer middleTenYear;

    private BigDecimal lastTen;

    private Integer lastTenYear;

    private BigDecimal frequency;

    private String remarks;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getForecastId() {
        return forecastId;
    }

    public void setForecastId(String forecastId) {
        this.forecastId = forecastId == null ? null : forecastId.trim();
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public Integer getMonth() {
        return month;
    }

    public void setMonth(Integer month) {
        this.month = month;
    }

    public BigDecimal getEarlyTen() {
        return earlyTen;
    }

    public void setEarlyTen(BigDecimal earlyTen) {
        this.earlyTen = earlyTen;
    }

    public Integer getEarlyTenYear() {
        return earlyTenYear;
    }

    public void setEarlyTenYear(Integer earlyTenYear) {
        this.earlyTenYear = earlyTenYear;
    }

    public BigDecimal getMiddleTen() {
        return middleTen;
    }

    public void setMiddleTen(BigDecimal middleTen) {
        this.middleTen = middleTen;
    }

    public Integer getMiddleTenYear() {
        return middleTenYear;
    }

    public void setMiddleTenYear(Integer middleTenYear) {
        this.middleTenYear = middleTenYear;
    }

    public BigDecimal getLastTen() {
        return lastTen;
    }

    public void setLastTen(BigDecimal lastTen) {
        this.lastTen = lastTen;
    }

    public Integer getLastTenYear() {
        return lastTenYear;
    }

    public void setLastTenYear(Integer lastTenYear) {
        this.lastTenYear = lastTenYear;
    }

    public BigDecimal getFrequency() {
        return frequency;
    }

    public void setFrequency(BigDecimal frequency) {
        this.frequency = frequency;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }
}