package com.zyjz.user.entity;

import java.io.Serializable;
import java.util.Date;

public class SysUser implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;

    private String roleId;
	
	private String sysareaId;

    private String syswaterareaId;

    private String sysareaCode;

    private String syswaterareaCode;

    private Integer systemCode;
    
    private String canalCode;

    private Integer userCode;

    private String userName;

    private String userPwd;

    private String pwdMing;

    private String realName;

    private String mobile;

    private String otherContactWay;

    private String address;

    private String lastLoginIp;

    private Date lastLoginTime;

    private Date suCreateTime;

    private Date suEditTime;

    private String suRemark;

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
        this.roleId = roleId;
    }

    public String getSysareaId() {
		return sysareaId;
	}

	public void setSysareaId(String sysareaId) {
		this.sysareaId = sysareaId;
	}

	public String getSyswaterareaId() {
		return syswaterareaId;
	}

	public void setSyswaterareaId(String syswaterareaId) {
		this.syswaterareaId = syswaterareaId;
	}

	public String getSysareaCode() {
		return sysareaCode;
	}

	public void setSysareaCode(String sysareaCode) {
		this.sysareaCode = sysareaCode;
	}

	public String getSyswaterareaCode() {
		return syswaterareaCode;
	}

	public void setSyswaterareaCode(String syswaterareaCode) {
		this.syswaterareaCode = syswaterareaCode;
	}

	public Integer getSystemCode() {
        return systemCode;
    }

    public void setSystemCode(Integer systemCode) {
        this.systemCode = systemCode;
    }

    public String getCanalCode() {
		return canalCode;
	}

	public void setCanalCode(String canalCode) {
		this.canalCode = canalCode;
	}

	public Integer getUserCode() {
        return userCode;
    }

    public void setUserCode(Integer userCode) {
        this.userCode = userCode;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd == null ? null : userPwd.trim();
    }

    public String getPwdMing() {
        return pwdMing;
    }

    public void setPwdMing(String pwdMing) {
        this.pwdMing = pwdMing == null ? null : pwdMing.trim();
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName == null ? null : realName.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getOtherContactWay() {
        return otherContactWay;
    }

    public void setOtherContactWay(String otherContactWay) {
        this.otherContactWay = otherContactWay == null ? null : otherContactWay.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getLastLoginIp() {
        return lastLoginIp;
    }

    public void setLastLoginIp(String lastLoginIp) {
        this.lastLoginIp = lastLoginIp == null ? null : lastLoginIp.trim();
    }

    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public Date getSuCreateTime() {
        return suCreateTime;
    }

    public void setSuCreateTime(Date suCreateTime) {
        this.suCreateTime = suCreateTime;
    }

    public Date getSuEditTime() {
        return suEditTime;
    }

    public void setSuEditTime(Date suEditTime) {
        this.suEditTime = suEditTime;
    }

    public String getSuRemark() {
        return suRemark;
    }

    public void setSuRemark(String suRemark) {
        this.suRemark = suRemark == null ? null : suRemark.trim();
    }
}