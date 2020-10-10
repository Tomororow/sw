package com.zyjz.sysmanage.entity;

import java.io.Serializable;
import java.util.Date;

public class SoilTypeInfo implements Serializable {
    
	private static final long serialVersionUID = 1L;

	private String id;

    private String cropsId;

    private Integer soilCode;

    private String soilName;

    private String description;

    private Date stiCreateTime;

    private Date stiEditTime;

    private String stiRemark;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getCropsId() {
        return cropsId;
    }

    public void setCropsId(String cropsId) {
        this.cropsId = cropsId == null ? null : cropsId.trim();
    }

    public Integer getSoilCode() {
        return soilCode;
    }

    public void setSoilCode(Integer soilCode) {
        this.soilCode = soilCode;
    }

    public String getSoilName() {
        return soilName;
    }

    public void setSoilName(String soilName) {
        this.soilName = soilName == null ? null : soilName.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Date getStiCreateTime() {
        return stiCreateTime;
    }

    public void setStiCreateTime(Date stiCreateTime) {
        this.stiCreateTime = stiCreateTime;
    }

    public Date getStiEditTime() {
        return stiEditTime;
    }

    public void setStiEditTime(Date stiEditTime) {
        this.stiEditTime = stiEditTime;
    }

    public String getStiRemark() {
        return stiRemark;
    }

    public void setStiRemark(String stiRemark) {
        this.stiRemark = stiRemark == null ? null : stiRemark.trim();
    }
}