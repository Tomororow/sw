package com.zyjz.sysmanage.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class SysWaterArea implements Serializable {
	
	
    private String id;

    private String waterAreaCode;

    private String waterAreaName;

    private Integer waterAreaLevel;

    private String parentWaterareaId;

    private Date swaCreateTime;

    private Date swaEditTime;

    private String swaRemark;

    private String parentWaterAreaName;

    private List<SysWaterArea> children;

    public List<SysWaterArea> getChildren() {
        return children;
    }

    public void setChildren(List<SysWaterArea> children) {
        this.children = children;
    }

    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getWaterAreaCode() {
        return waterAreaCode;
    }

    public void setWaterAreaCode(String waterAreaCode) {
        this.waterAreaCode = waterAreaCode == null ? null : waterAreaCode.trim();
    }

    public String getWaterAreaName() {
        return waterAreaName;
    }

    public void setWaterAreaName(String waterAreaName) {
        this.waterAreaName = waterAreaName == null ? null : waterAreaName.trim();
    }

    public Integer getWaterAreaLevel() {
        return waterAreaLevel;
    }

    public void setWaterAreaLevel(Integer waterAreaLevel) {
        this.waterAreaLevel = waterAreaLevel;
    }

    public String getParentWaterareaId() {
        return parentWaterareaId;
    }

    public void setParentWaterareaId(String parentWaterareaId) {
        this.parentWaterareaId = parentWaterareaId == null ? null : parentWaterareaId.trim();
    }

    public Date getSwaCreateTime() {
        return swaCreateTime;
    }

    public void setSwaCreateTime(Date swaCreateTime) {
        this.swaCreateTime = swaCreateTime;
    }

    public Date getSwaEditTime() {
        return swaEditTime;
    }

    public void setSwaEditTime(Date swaEditTime) {
        this.swaEditTime = swaEditTime;
    }

    public String getSwaRemark() {
        return swaRemark;
    }

    public void setSwaRemark(String swaRemark) {
        this.swaRemark = swaRemark == null ? null : swaRemark.trim();
    }

    public String getParentWaterAreaName() {
        return parentWaterAreaName;
    }

    public void setParentWaterAreaName(String parentWaterAreaName) {
        this.parentWaterAreaName = parentWaterAreaName;
    }
}