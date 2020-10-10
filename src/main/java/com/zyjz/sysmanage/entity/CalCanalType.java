package com.zyjz.sysmanage.entity;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CalCanalType implements Serializable {
    private String id;

    private Integer canalTypeCode;

    private String canalTypeName;

    private Date cctCreateTime;

    private Date cctEditTime;

    private String cctRemark;

    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Integer getCanalTypeCode() {
        return canalTypeCode;
    }

    public void setCanalTypeCode(Integer canalTypeCode) {
        this.canalTypeCode = canalTypeCode;
    }

    public String getCanalTypeName() {
        return canalTypeName;
    }

    public void setCanalTypeName(String canalTypeName) {
        this.canalTypeName = canalTypeName == null ? null : canalTypeName.trim();
    }
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getCctCreateTime() {
        return cctCreateTime;
    }

    public void setCctCreateTime(Date cctCreateTime) {
        this.cctCreateTime = cctCreateTime;
    }
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getCctEditTime() {
        return cctEditTime;
    }

    public void setCctEditTime(Date cctEditTime) {
        this.cctEditTime = cctEditTime;
    }

    public String getCctRemark() {
        return cctRemark;
    }

    public void setCctRemark(String cctRemark) {
        this.cctRemark = cctRemark == null ? null : cctRemark.trim();
    }
}