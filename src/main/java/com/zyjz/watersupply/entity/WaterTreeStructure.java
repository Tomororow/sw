package com.zyjz.watersupply.entity;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

public class WaterTreeStructure {
    private String id;

    private String label;

    private String treeCode;

    private Double treeLevel;

    private String parentLevelId;

    private Date creationTime;

    private Date updationTime;

    private String treeRemark;
    
  //临时字段（可忽略不计）
    private List<WaterTreeStructure> children;
    
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public String getTreeCode() {
		return treeCode;
	}
	public void setTreeCode(String treeCode) {
		this.treeCode = treeCode;
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
		this.parentLevelId = parentLevelId;
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
		this.treeRemark = treeRemark;
	}
	public List<WaterTreeStructure> getChildren() {
		return children;
	}
	public void setChildren(List<WaterTreeStructure> children) {
		this.children = children;
	}
	
	
	
    
   
    
}