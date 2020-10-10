package com.zyjz.sysmanage.entity;

import java.io.Serializable;
import java.math.BigDecimal;

public class CalCanalLengthCalssify implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;

    private String canalId;

    private BigDecimal highStandardOne;

    private BigDecimal highStandardTwo;

    private BigDecimal highStandardThree;

    private BigDecimal dryMasonry;

    private BigDecimal earthCanal;

    private BigDecimal other;

    private String cclcRemark;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getCanalId() {
        return canalId;
    }

    public void setCanalId(String canalId) {
        this.canalId = canalId == null ? null : canalId.trim();
    }

    public BigDecimal getHighStandardOne() {
        return highStandardOne;
    }

    public void setHighStandardOne(BigDecimal highStandardOne) {
        this.highStandardOne = highStandardOne;
    }

    public BigDecimal getHighStandardTwo() {
        return highStandardTwo;
    }

    public void setHighStandardTwo(BigDecimal highStandardTwo) {
        this.highStandardTwo = highStandardTwo;
    }

    public BigDecimal getHighStandardThree() {
        return highStandardThree;
    }

    public void setHighStandardThree(BigDecimal highStandardThree) {
        this.highStandardThree = highStandardThree;
    }

    public BigDecimal getDryMasonry() {
        return dryMasonry;
    }

    public void setDryMasonry(BigDecimal dryMasonry) {
        this.dryMasonry = dryMasonry;
    }

    public BigDecimal getEarthCanal() {
        return earthCanal;
    }

    public void setEarthCanal(BigDecimal earthCanal) {
        this.earthCanal = earthCanal;
    }

    public BigDecimal getOther() {
        return other;
    }

    public void setOther(BigDecimal other) {
        this.other = other;
    }

    public String getCclcRemark() {
        return cclcRemark;
    }

    public void setCclcRemark(String cclcRemark) {
        this.cclcRemark = cclcRemark == null ? null : cclcRemark.trim();
    }
}