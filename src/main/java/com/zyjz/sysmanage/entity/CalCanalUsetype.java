package com.zyjz.sysmanage.entity;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CalCanalUsetype implements Serializable {
    private String id;

    private Integer canalUsetypeCode;

    private String canalUsetypeName;

    private Date ccuCreateTime;

    private Date ccuEditTime;

    private String ccuRemark;

    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Integer getCanalUsetypeCode() {
        return canalUsetypeCode;
    }

    public void setCanalUsetypeCode(Integer canalUsetypeCode) {
        this.canalUsetypeCode = canalUsetypeCode;
    }

    public String getCanalUsetypeName() {
        return canalUsetypeName;
    }

    public void setCanalUsetypeName(String canalUsetypeName) {
        this.canalUsetypeName = canalUsetypeName == null ? null : canalUsetypeName.trim();
    }
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getCcuCreateTime() {
        return ccuCreateTime;
    }

    public void setCcuCreateTime(Date ccuCreateTime) {
        this.ccuCreateTime = ccuCreateTime;
    }
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getCcuEditTime() {
        return ccuEditTime;
    }

    public void setCcuEditTime(Date ccuEditTime) {
        this.ccuEditTime = ccuEditTime;
    }

    public String getCcuRemark() {
        return ccuRemark;
    }

    public void setCcuRemark(String ccuRemark) {
        this.ccuRemark = ccuRemark == null ? null : ccuRemark.trim();
    }
}