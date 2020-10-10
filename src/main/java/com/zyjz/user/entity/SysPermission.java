package com.zyjz.user.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

public class SysPermission implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;

    private Integer menuCode;

    private String menuName;
    
    private String menuNameCode;

    private Integer menuLevel;

    private Integer menuOrder;

    private String parentMenuId;

    private String menuHref;
    
    private int isMenu;
    
    private int isMable;

    private String menuIcon;

    private Date smCreateTime;

    private Date smEditTime;

    private String smRemark;

    private List<SysPermission> children;

    public List<SysPermission> getChildren() {
        return children;
    }

    public void setChildren(List<SysPermission> children) {
        this.children = children;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Integer getMenuCode() {
        return menuCode;
    }

    public void setMenuCode(Integer menuCode) {
        this.menuCode = menuCode;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName == null ? null : menuName.trim();
    }

    public Integer getMenuLevel() {
        return menuLevel;
    }

    public void setMenuLevel(Integer menuLevel) {
        this.menuLevel = menuLevel;
    }

    public Integer getMenuOrder() {
        return menuOrder;
    }

    public void setMenuOrder(Integer menuOrder) {
        this.menuOrder = menuOrder;
    }

    public String getParentMenuId() {
        return parentMenuId;
    }

    public void setParentMenuId(String parentMenuId) {
        this.parentMenuId = parentMenuId == null ? null : parentMenuId.trim();
    }

    
    
    public int getIsMenu() {
		return isMenu;
	}

	public void setIsMenu(int isMenu) {
		this.isMenu = isMenu;
	}

	public int getIsMable() {
		return isMable;
	}

	public void setIsMable(int isMable) {
		this.isMable = isMable;
	}

	public String getMenuHref() {
        return menuHref;
    }

    public void setMenuHref(String menuHref) {
        this.menuHref = menuHref == null ? null : menuHref.trim();
    }

    public String getMenuIcon() {
        return menuIcon;
    }

    public void setMenuIcon(String menuIcon) {
        this.menuIcon = menuIcon == null ? null : menuIcon.trim();
    }
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getSmCreateTime() {
        return smCreateTime;
    }

    public void setSmCreateTime(Date smCreateTime) {
        this.smCreateTime = smCreateTime;
    }
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getSmEditTime() {
        return smEditTime;
    }

    public void setSmEditTime(Date smEditTime) {
        this.smEditTime = smEditTime;
    }

    public String getSmRemark() {
        return smRemark;
    }

    public void setSmRemark(String smRemark) {
        this.smRemark = smRemark == null ? null : smRemark.trim();
    }

	public String getMenuNameCode() {
		return menuNameCode;
	}

	public void setMenuNameCode(String menuNameCode) {
		this.menuNameCode = menuNameCode;
	}
    
    
}