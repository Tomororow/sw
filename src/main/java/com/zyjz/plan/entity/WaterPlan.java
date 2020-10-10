package com.zyjz.plan.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class WaterPlan implements Serializable{
	private static final long serialVersionUID = 1L;

	private String id;

    private String canalCode;

    private Integer startYear;
    
    private Integer endYear;

    private String wateringName;

    private Integer turn;

    private Integer totalDays;

    private Integer startMonth;

    private Integer startDay;

    private Integer endMonth;

    private Integer endDay;

    private BigDecimal riverComeWater;

    private BigDecimal lastTurnCapacity;

    private BigDecimal canalDecisionArea;

    private BigDecimal matching;

    private BigDecimal realityArea;

    private BigDecimal waterDistributionQuota;

    private BigDecimal soilWaterNetAmount;

    private BigDecimal soilWaterNetAmountRatio;

    private BigDecimal soilWaterAllAmount;

    private BigDecimal needReservoirWaterAmount;

    private BigDecimal lifeWaterAmount;

    private BigDecimal machineWaterAmount;

    private BigDecimal forestWaterAmount;

    private BigDecimal otherWaterAmount;

    private BigDecimal ownTurnCapacity;

    private String createPeople;

    private Date createTime;

    private Date updateTime;

    private String remark;

    private String comm1;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getCanalCode() {
        return canalCode;
    }

    public void setCanalCode(String canalCode) {
        this.canalCode = canalCode == null ? null : canalCode.trim();
    }

    
   
    public Integer getStartYear() {
		return startYear;
	}

	public void setStartYear(Integer startYear) {
		this.startYear = startYear;
	}

	public Integer getEndYear() {
		return endYear;
	}

	public void setEndYear(Integer endYear) {
		this.endYear = endYear;
	}

	public String getWateringName() {
        return wateringName;
    }

    public void setWateringName(String wateringName) {
        this.wateringName = wateringName == null ? null : wateringName.trim();
    }

    public Integer getTurn() {
        return turn;
    }

    public void setTurn(Integer turn) {
        this.turn = turn;
    }

    public Integer getTotalDays() {
        return totalDays;
    }

    public void setTotalDays(Integer totalDays) {
        this.totalDays = totalDays;
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

    public BigDecimal getRiverComeWater() {
        return riverComeWater;
    }

    public void setRiverComeWater(BigDecimal riverComeWater) {
        this.riverComeWater = riverComeWater;
    }

    public BigDecimal getLastTurnCapacity() {
        return lastTurnCapacity;
    }

    public void setLastTurnCapacity(BigDecimal lastTurnCapacity) {
        this.lastTurnCapacity = lastTurnCapacity;
    }

    public BigDecimal getCanalDecisionArea() {
        return canalDecisionArea;
    }

    public void setCanalDecisionArea(BigDecimal canalDecisionArea) {
        this.canalDecisionArea = canalDecisionArea;
    }

    public BigDecimal getMatching() {
        return matching;
    }

    public void setMatching(BigDecimal matching) {
        this.matching = matching;
    }

    public BigDecimal getRealityArea() {
        return realityArea;
    }

    public void setRealityArea(BigDecimal realityArea) {
        this.realityArea = realityArea;
    }

    public BigDecimal getWaterDistributionQuota() {
        return waterDistributionQuota;
    }

    public void setWaterDistributionQuota(BigDecimal waterDistributionQuota) {
        this.waterDistributionQuota = waterDistributionQuota;
    }

    public BigDecimal getSoilWaterNetAmount() {
        return soilWaterNetAmount;
    }

    public void setSoilWaterNetAmount(BigDecimal soilWaterNetAmount) {
        this.soilWaterNetAmount = soilWaterNetAmount;
    }

    public BigDecimal getSoilWaterNetAmountRatio() {
        return soilWaterNetAmountRatio;
    }

    public void setSoilWaterNetAmountRatio(BigDecimal soilWaterNetAmountRatio) {
        this.soilWaterNetAmountRatio = soilWaterNetAmountRatio;
    }

    public BigDecimal getSoilWaterAllAmount() {
        return soilWaterAllAmount;
    }

    public void setSoilWaterAllAmount(BigDecimal soilWaterAllAmount) {
        this.soilWaterAllAmount = soilWaterAllAmount;
    }

    public BigDecimal getNeedReservoirWaterAmount() {
        return needReservoirWaterAmount;
    }

    public void setNeedReservoirWaterAmount(BigDecimal needReservoirWaterAmount) {
        this.needReservoirWaterAmount = needReservoirWaterAmount;
    }

    public BigDecimal getLifeWaterAmount() {
        return lifeWaterAmount;
    }

    public void setLifeWaterAmount(BigDecimal lifeWaterAmount) {
        this.lifeWaterAmount = lifeWaterAmount;
    }

    public BigDecimal getMachineWaterAmount() {
        return machineWaterAmount;
    }

    public void setMachineWaterAmount(BigDecimal machineWaterAmount) {
        this.machineWaterAmount = machineWaterAmount;
    }

    public BigDecimal getForestWaterAmount() {
        return forestWaterAmount;
    }

    public void setForestWaterAmount(BigDecimal forestWaterAmount) {
        this.forestWaterAmount = forestWaterAmount;
    }

    public BigDecimal getOtherWaterAmount() {
        return otherWaterAmount;
    }

    public void setOtherWaterAmount(BigDecimal otherWaterAmount) {
        this.otherWaterAmount = otherWaterAmount;
    }

    public BigDecimal getOwnTurnCapacity() {
        return ownTurnCapacity;
    }

    public void setOwnTurnCapacity(BigDecimal ownTurnCapacity) {
        this.ownTurnCapacity = ownTurnCapacity;
    }

    public String getCreatePeople() {
        return createPeople;
    }

    public void setCreatePeople(String createPeople) {
        this.createPeople = createPeople == null ? null : createPeople.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getComm1() {
        return comm1;
    }

    public void setComm1(String comm1) {
        this.comm1 = comm1;
    }
}