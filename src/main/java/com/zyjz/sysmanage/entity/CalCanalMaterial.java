package com.zyjz.sysmanage.entity;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CalCanalMaterial implements Serializable {
	
    private String id;

    private Integer canalMaterialCode;

    private String canalMaterialName;

    private Date ccmCreateTime;

    private Date ccmEditTime;

    private String ccmRemark;

    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Integer getCanalMaterialCode() {
        return canalMaterialCode;
    }

    public void setCanalMaterialCode(Integer canalMaterialCode) {
        this.canalMaterialCode = canalMaterialCode;
    }

    public String getCanalMaterialName() {
        return canalMaterialName;
    }

    public void setCanalMaterialName(String canalMaterialName) {
        this.canalMaterialName = canalMaterialName == null ? null : canalMaterialName.trim();
    }
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getCcmCreateTime() {
        return ccmCreateTime;
    }

    public void setCcmCreateTime(Date ccmCreateTime) {
        this.ccmCreateTime = ccmCreateTime;
    }
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getCcmEditTime() {
        return ccmEditTime;
    }

    public void setCcmEditTime(Date ccmEditTime) {
        this.ccmEditTime = ccmEditTime;
    }

    public String getCcmRemark() {
        return ccmRemark;
    }

    public void setCcmRemark(String ccmRemark) {
        this.ccmRemark = ccmRemark == null ? null : ccmRemark.trim();
    }
}