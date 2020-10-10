package com.zyjz.site.entity;

import java.math.BigDecimal;

public class DataSheet {
    private String id;

    private String waterName;

    private String waterCode;

    private BigDecimal january;

    private BigDecimal february;

    private BigDecimal march;

    private BigDecimal april;

    private BigDecimal may;

    private BigDecimal june;

    private BigDecimal july;

    private BigDecimal august;

    private BigDecimal september;

    private BigDecimal october;

    private BigDecimal november;

    private BigDecimal december;

    private BigDecimal commOne;

    private BigDecimal commTwo;

    private BigDecimal commThree;
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getWaterName() {
        return waterName;
    }

    public void setWaterName(String waterName) {
        this.waterName = waterName == null ? null : waterName.trim();
    }

    public String getWaterCode() {
        return waterCode;
    }

    public void setWaterCode(String waterCode) {
        this.waterCode = waterCode == null ? null : waterCode.trim();
    }

    public BigDecimal getJanuary() {
        return january;
    }

    public void setJanuary(BigDecimal january) {
        this.january = january;
    }

    public BigDecimal getFebruary() {
        return february;
    }

    public void setFebruary(BigDecimal february) {
        this.february = february;
    }

    public BigDecimal getMarch() {
        return march;
    }

    public void setMarch(BigDecimal march) {
        this.march = march;
    }

    public BigDecimal getApril() {
        return april;
    }

    public void setApril(BigDecimal april) {
        this.april = april;
    }

    public BigDecimal getMay() {
        return may;
    }

    public void setMay(BigDecimal may) {
        this.may = may;
    }

    public BigDecimal getJune() {
        return june;
    }

    public void setJune(BigDecimal june) {
        this.june = june;
    }

    public BigDecimal getJuly() {
        return july;
    }

    public void setJuly(BigDecimal july) {
        this.july = july;
    }

    public BigDecimal getAugust() {
        return august;
    }

    public void setAugust(BigDecimal august) {
        this.august = august;
    }

    public BigDecimal getSeptember() {
        return september;
    }

    public void setSeptember(BigDecimal september) {
        this.september = september;
    }

    public BigDecimal getOctober() {
        return october;
    }

    public void setOctober(BigDecimal october) {
        this.october = october;
    }

    public BigDecimal getNovember() {
        return november;
    }

    public void setNovember(BigDecimal november) {
        this.november = november;
    }

    public BigDecimal getDecember() {
        return december;
    }

    public void setDecember(BigDecimal december) {
        this.december = december;
    }

    public BigDecimal getCommOne() {
        return commOne;
    }

    public void setCommOne(BigDecimal commOne) {
        this.commOne = commOne;
    }

    public BigDecimal getCommTwo() {
        return commTwo;
    }

    public void setCommTwo(BigDecimal commTwo) {
        this.commTwo = commTwo;
    }

    public BigDecimal getCommThree() {
        return commThree;
    }

    public void setCommThree(BigDecimal commThree) {
        this.commThree = commThree;
    }

    
}