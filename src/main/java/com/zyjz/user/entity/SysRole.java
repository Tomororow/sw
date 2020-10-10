package com.zyjz.user.entity;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class SysRole implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;

    private Integer roleCode;

    private String roleName;

    private Date srCreateTime;

    private Date srEditTime;

    private String srRemark;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Integer getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(Integer roleCode) {
        this.roleCode = roleCode;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getSrCreateTime() {
        return srCreateTime;
    }

    public void setSrCreateTime(Date srCreateTime) {
        this.srCreateTime = srCreateTime;
    }
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getSrEditTime() {
        return srEditTime;
    }

    public void setSrEditTime(Date srEditTime) {
        this.srEditTime = srEditTime;
    }

    public String getSrRemark() {
        return srRemark;
    }

    public void setSrRemark(String srRemark) {
        this.srRemark = srRemark == null ? null : srRemark.trim();
    }
}