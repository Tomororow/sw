package com.zyjz.site.entity;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * @ClassName: AreaRainfallStation
 * @Description: 行政区域雨量站实体
 * @Author: zhaojx
 * @Date: 2018年3月4日 上午12:03:49
 */
public class AreaRainfallStation implements Serializable {
    private String id;

    private String sysareaId;

    private String siterainId;
    
    private String devicerainCode;

    private String areaCode;

    private String adName;

    private Integer arsLevel;

    private String parentAreaId;

    private Date arsCreateTime;

    private String arsRemark;

    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }
    
    public String getSysareaId() {
        return sysareaId;
    }

    public void setSysareaId(String sysareaId) {
        this.sysareaId = sysareaId == null ? null : sysareaId.trim();
    }

    public String getSiterainId() {
        return siterainId;
    }

    public void setSiterainId(String siterainId) {
        this.siterainId = siterainId == null ? null : siterainId.trim();
    }

    public String getDevicerainCode() {
        return devicerainCode;
    }

    public void setDevicerainCode(String devicerainCode) {
        this.devicerainCode = devicerainCode == null ? null : devicerainCode.trim();
    }

    public String getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode == null ? null : areaCode.trim();
    }

    public String getAdName() {
        return adName;
    }

    public void setAdName(String adName) {
        this.adName = adName == null ? null : adName.trim();
    }

    public Integer getArsLevel() {
        return arsLevel;
    }

    public void setArsLevel(Integer arsLevel) {
        this.arsLevel = arsLevel;
    }

    public String getParentAreaId() {
        return parentAreaId;
    }

    public void setParentAreaId(String parentAreaId) {
        this.parentAreaId = parentAreaId == null ? null : parentAreaId.trim();
    }

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getArsCreateTime() {
        return arsCreateTime;
    }

    public void setArsCreateTime(Date arsCreateTime) {
        this.arsCreateTime = arsCreateTime;
    }

    public String getArsRemark() {
        return arsRemark;
    }

    public void setArsRemark(String arsRemark) {
        this.arsRemark = arsRemark == null ? null : arsRemark.trim();
    }
    
}