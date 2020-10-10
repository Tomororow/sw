package com.zyjz.plan.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class DistWaterPlanConsumer implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;

    private String name;

    private String areaCode;

    private String phonenumber;

    private String account;

    private String password;

    private BigDecimal waterRightArea;

    private BigDecimal realArea;

    private String address;

    private Date dwpcCreateTime;

    private Date dwpcEditTime;

    private String dwpcRemark;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode == null ? null : areaCode.trim();
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber == null ? null : phonenumber.trim();
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account == null ? null : account.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public BigDecimal getWaterRightArea() {
        return waterRightArea;
    }

    public void setWaterRightArea(BigDecimal waterRightArea) {
        this.waterRightArea = waterRightArea;
    }

    public BigDecimal getRealArea() {
        return realArea;
    }

    public void setRealArea(BigDecimal realArea) {
        this.realArea = realArea;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Date getDwpcCreateTime() {
        return dwpcCreateTime;
    }

    public void setDwpcCreateTime(Date dwpcCreateTime) {
        this.dwpcCreateTime = dwpcCreateTime;
    }

    public Date getDwpcEditTime() {
        return dwpcEditTime;
    }

    public void setDwpcEditTime(Date dwpcEditTime) {
        this.dwpcEditTime = dwpcEditTime;
    }

    public String getDwpcRemark() {
        return dwpcRemark;
    }

    public void setDwpcRemark(String dwpcRemark) {
        this.dwpcRemark = dwpcRemark == null ? null : dwpcRemark.trim();
    }
}