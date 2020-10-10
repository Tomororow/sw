package com.zyjz.sysmanage.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * @ClassName: SysArea 
 * @Description: 行政区域实体类
 * @Author: zhaojx
 * @Date: 2017年12月21日 上午10:10:50
 */
public class SysArea implements Serializable {
    
	// 主键ID
	private String id;
	// 行政区域编码
    private String areaCode;
    // 行政区域名称
    private String areaName;
    // 行政区域级别
    private Integer areaLevel;
    // 所属父行政区域
    private String parentAreaId;
    //临时字段（可忽略不计）
    private List<SysArea> children = new ArrayList<>();
    // 创建时间
    private Date saCreateTime;
    // 上次修改时间
    private Date saEditTime;
    // 备注
    private String saRemark;
    // 行政区域名称    自定义包装
    private String parentAreaName;
    

    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode == null ? null : areaCode.trim();
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName == null ? null : areaName.trim();
    }

    public Integer getAreaLevel() {
        return areaLevel;
    }

    public void setAreaLevel(Integer areaLevel) {
        this.areaLevel = areaLevel;
    }

    public String getParentAreaId() {
        return parentAreaId;
    }

    public void setParentAreaId(String parentAreaId) {
        this.parentAreaId = parentAreaId == null ? null : parentAreaId.trim();
    }

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getSaCreateTime() {
        return saCreateTime;
    }

    public void setSaCreateTime(Date saCreateTime) {
        this.saCreateTime = saCreateTime;
    }

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getSaEditTime() {
        return saEditTime;
    }

    public void setSaEditTime(Date saEditTime) {
        this.saEditTime = saEditTime;
    }

    public String getSaRemark() {
        return saRemark;
    }

    public void setSaRemark(String saRemark) {
        this.saRemark = saRemark == null ? null : saRemark.trim();
    }

	public String getParentAreaName() {
		return parentAreaName;
	}

	public void setParentAreaName(String parentAreaName) {
		this.parentAreaName = parentAreaName;
	}

	public List<SysArea> getChildren() {
		return children;
	}

	public void setChildren(List<SysArea> children) {
		this.children = children;
	}
	
	
    
}