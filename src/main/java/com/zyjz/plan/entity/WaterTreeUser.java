package com.zyjz.plan.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class WaterTreeUser {
    private String id;

    private String treeName;

    private String treeCode;

    private Double treeLevel;

    private String parentLevelId;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date creationTime;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updationTime;

    private String treeRemark;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getTreeName() {
        return treeName;
    }

    public void setTreeName(String treeName) {
        this.treeName = treeName == null ? null : treeName.trim();
    }

    public String getTreeCode() {
        return treeCode;
    }

    public void setTreeCode(String treeCode) {
        this.treeCode = treeCode == null ? null : treeCode.trim();
    }

    public Double getTreeLevel() {
        return treeLevel;
    }

    public void setTreeLevel(Double treeLevel) {
        this.treeLevel = treeLevel;
    }

    public String getParentLevelId() {
        return parentLevelId;
    }

    public void setParentLevelId(String parentLevelId) {
        this.parentLevelId = parentLevelId == null ? null : parentLevelId.trim();
    }
    @JsonFormat(pattern="yyyy-MM-dd", timezone="GMT+8")
    public Date getCreationTime() {
        return creationTime;
    }

    public void setCreationTime(Date creationTime) {
        this.creationTime = creationTime;
    }
    @JsonFormat(pattern="yyyy-MM-dd", timezone="GMT+8")
    public Date getUpdationTime() {
        return updationTime;
    }

    public void setUpdationTime(Date updationTime) {
        this.updationTime = updationTime;
    }

    public String getTreeRemark() {
        return treeRemark;
    }

    public void setTreeRemark(String treeRemark) {
        this.treeRemark = treeRemark == null ? null : treeRemark.trim();
    }
}