package com.zyjz.plan.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ConsumerSoil implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;

    private String consumerId;

    private String soilName;

    private String canalCode;

    private String soilTypeCode;

    private BigDecimal x;

    private BigDecimal y;

    private BigDecimal z;

    private BigDecimal soilArea;

    private String address;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date contractStartYear;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date contractEndYear;

    private Date createTime;

    private Date updateTime;

    private String remake;

    private String comm1;

    //其他表字段
    //用水户名称
    private String distWaterPlanConsumerName;
    //渠道名称
    private String calCanalInfoName;
    //土地类型名称
    private String soilTypeInfoName;

    

    public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getConsumerId() {
        return consumerId;
    }

    public void setConsumerId(String consumerId) {
        this.consumerId = consumerId == null ? null : consumerId.trim();
    }

    public String getSoilName() {
        return soilName;
    }

    public void setSoilName(String soilName) {
        this.soilName = soilName == null ? null : soilName.trim();
    }

    public String getCanalCode() {
        return canalCode;
    }

    public void setCanalCode(String canalCode) {
        this.canalCode = canalCode == null ? null : canalCode.trim();
    }

    public String getSoilTypeCode() {
        return soilTypeCode;
    }

    public void setSoilTypeCode(String soilTypeCode) {
        this.soilTypeCode = soilTypeCode == null ? null : soilTypeCode.trim();
    }

    public BigDecimal getX() {
        return x;
    }

    public void setX(BigDecimal x) {
        this.x = x;
    }

    public BigDecimal getY() {
        return y;
    }

    public void setY(BigDecimal y) {
        this.y = y;
    }

    public BigDecimal getZ() {
        return z;
    }

    public void setZ(BigDecimal z) {
        this.z = z;
    }

    public BigDecimal getSoilArea() {
        return soilArea;
    }

    public void setSoilArea(BigDecimal soilArea) {
        this.soilArea = soilArea;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Date getContractStartYear() {
        return contractStartYear;
    }

    public void setContractStartYear(Date contractStartYear) {
        this.contractStartYear = contractStartYear;
    }

    public Date getContractEndYear() {
        return contractEndYear;
    }

    public void setContractEndYear(Date contractEndYear) {
        this.contractEndYear = contractEndYear;
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

    public String getRemake() {
        return remake;
    }

    public void setRemake(String remake) {
        this.remake = remake == null ? null : remake.trim();
    }

    public String getComm1() {
        return comm1;
    }

    public void setComm1(String comm1) {
        this.comm1 = comm1;
    }

    public String getDistWaterPlanConsumerName() {
        return distWaterPlanConsumerName;
    }

    public void setDistWaterPlanConsumerName(String distWaterPlanConsumerName) {
        this.distWaterPlanConsumerName = distWaterPlanConsumerName;
    }

    public String getCalCanalInfoName() {
        return calCanalInfoName;
    }

    public void setCalCanalInfoName(String calCanalInfoName) {
        this.calCanalInfoName = calCanalInfoName;
    }

    public String getSoilTypeInfoName() {
        return soilTypeInfoName;
    }

    public void setSoilTypeInfoName(String soilTypeInfoName) {
        this.soilTypeInfoName = soilTypeInfoName;
    }
}