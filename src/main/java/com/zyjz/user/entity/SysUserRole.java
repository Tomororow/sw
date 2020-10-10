package com.zyjz.user.entity;

import java.io.Serializable;
import java.util.Date;

public class SysUserRole implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;

    private String userId;

    private String roleId;

    private Date surCreateTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
    }

    public Date getSurCreateTime() {
        return surCreateTime;
    }

    public void setSurCreateTime(Date surCreateTime) {
        this.surCreateTime = surCreateTime;
    }
}