package com.zyjz.plan.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class TenFlowFrequency implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;

    private String riversCode;

    private String riversName;

    private Integer currentYear;

    private Integer startMonth;

    private Integer startDay;

    private Integer endMonth;

    private Integer endDay;

    private String tenName;

    private BigDecimal tenFlow;

    private Integer no;

    private BigDecimal descendingArrangement;

    private BigDecimal frequency;

    private Integer contrastYear;

    private Date createTime;

    private String createPeople;

    private String remarks;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getRiversCode() {
        return riversCode;
    }

    public void setRiversCode(String riversCode) {
        this.riversCode = riversCode == null ? null : riversCode.trim();
    }

    public String getRiversName() {
        return riversName;
    }

    public void setRiversName(String riversName) {
        this.riversName = riversName == null ? null : riversName.trim();
    }

    public Integer getCurrentYear() {
        return currentYear;
    }

    public void setCurrentYear(Integer currentYear) {
        this.currentYear = currentYear;
    }

    public Integer getStartMonth() {
        return startMonth;
    }

    public void setStartMonth(Integer startMonth) {
        this.startMonth = startMonth;
    }

    public Integer getStartDay() {
        return startDay;
    }

    public void setStartDay(Integer startDay) {
        this.startDay = startDay;
    }

    public Integer getEndMonth() {
        return endMonth;
    }

    public void setEndMonth(Integer endMonth) {
        this.endMonth = endMonth;
    }

    public Integer getEndDay() {
        return endDay;
    }

    public void setEndDay(Integer endDay) {
        this.endDay = endDay;
    }

    public String getTenName() {
        return tenName;
    }

    public void setTenName(String tenName) {
        this.tenName = tenName == null ? null : tenName.trim();
    }

    public BigDecimal getTenFlow() {
        return tenFlow;
    }

    public void setTenFlow(BigDecimal tenFlow) {
        this.tenFlow = tenFlow;
    }

    public Integer getNo() {
        return no;
    }

    public void setNo(Integer no) {
        this.no = no;
    }

    public BigDecimal getDescendingArrangement() {
        return descendingArrangement;
    }

    public void setDescendingArrangement(BigDecimal descendingArrangement) {
        this.descendingArrangement = descendingArrangement;
    }

    public BigDecimal getFrequency() {
        return frequency;
    }

    public void setFrequency(BigDecimal frequency) {
        this.frequency = frequency;
    }

    public Integer getContrastYear() {
        return contrastYear;
    }

    public void setContrastYear(Integer contrastYear) {
        this.contrastYear = contrastYear;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCreatePeople() {
        return createPeople;
    }

    public void setCreatePeople(String createPeople) {
        this.createPeople = createPeople == null ? null : createPeople.trim();
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }
}