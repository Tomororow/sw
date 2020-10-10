package com.zyjz.sysmanage.entity;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * @ClassName: SiteDeviceModel
 * @Description: 站点测量设备实体类
 * @Author: zhaojx
 * @Date: 2018年3月14日 上午10:04:16
 */
public class SiteDeviceModel implements Serializable{
	
	private static final long serialVersionUID = 1L;

	private String id;

    private Integer deviceCode;

    private String deviceName;

    private String deviceBrand;

    private String deviceModel;

    private Date sdmCreateTime;

    private Date sdmEditTime;

    private String sdmRemark;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Integer getDeviceCode() {
        return deviceCode;
    }

    public void setDeviceCode(Integer deviceCode) {
        this.deviceCode = deviceCode;
    }

    public String getDeviceName() {
        return deviceName;
    }

    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName == null ? null : deviceName.trim();
    }

    public String getDeviceBrand() {
        return deviceBrand;
    }

    public void setDeviceBrand(String deviceBrand) {
        this.deviceBrand = deviceBrand == null ? null : deviceBrand.trim();
    }

    public String getDeviceModel() {
        return deviceModel;
    }

    public void setDeviceModel(String deviceModel) {
        this.deviceModel = deviceModel == null ? null : deviceModel.trim();
    }

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getSdmCreateTime() {
        return sdmCreateTime;
    }

    public void setSdmCreateTime(Date sdmCreateTime) {
        this.sdmCreateTime = sdmCreateTime;
    }

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getSdmEditTime() {
        return sdmEditTime;
    }

    public void setSdmEditTime(Date sdmEditTime) {
        this.sdmEditTime = sdmEditTime;
    }

    public String getSdmRemark() {
        return sdmRemark;
    }

    public void setSdmRemark(String sdmRemark) {
        this.sdmRemark = sdmRemark == null ? null : sdmRemark.trim();
    }
}