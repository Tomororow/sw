package com.zyjz.user.entity;

import java.io.Serializable;
import java.util.Date;

public class SysRolePermission implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;

    private String roleId;

    private String menuId;

    private Date spCreateTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
    }

    public String getMenuId() {
        return menuId;
    }

    public void setMenuId(String menuId) {
        this.menuId = menuId == null ? null : menuId.trim();
    }

    public Date getSpCreateTime() {
        return spCreateTime;
    }

    public void setSpCreateTime(Date spCreateTime) {
        this.spCreateTime = spCreateTime;
    }
}