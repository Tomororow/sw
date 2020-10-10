package com.zyjz.user.entity;

import java.util.List;

public class SysPermissionVO extends SysPermission{

	/** 
	 * @Fields: serialVersionUID: 
	 */ 
	
	private static final long serialVersionUID = 1L;
	
	private List<SysPermission> sysChildsPermissions;

	public List<SysPermission> getSysChildsPermissions() {
		return sysChildsPermissions;
	}

	public void setSysChildsPermissions(List<SysPermission> sysChildsPermissions) {
		this.sysChildsPermissions = sysChildsPermissions;
	}

	

	
	
}
