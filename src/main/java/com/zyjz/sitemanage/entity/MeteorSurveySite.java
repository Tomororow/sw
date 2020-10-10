package com.zyjz.sitemanage.entity;

import java.math.BigDecimal;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 
 * @ClassName: WaterSurveySite
 * @Description: 气象站
 * @Author: liuHaiian
 * @Date: 2018年4月24日 下午3:16:42
 */
public class MeteorSurveySite   {
    private String id;

    private String meteorName;

    private String coding;
    
    private String equipName;

    private String equipCoding;

    private String simClip;

    private String simClipOperator;

    private Date buildTime;

    private String longitudeLatitude;

    private BigDecimal elevation;

    private String administrativeCoding;

    private Date createTime;

    private Date updateTime;

    private String dynamicId;

    //可作为临时字段
    private String monitorEquipName;

    private String monitorAddress;

    private String monitorImage;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getMeteorName() {
        return meteorName;
    }

    public void setMeteorName(String meteorName) {
        this.meteorName = meteorName == null ? null : meteorName.trim();
    }

    public String getCoding() {
        return coding;
    }

    public void setCoding(String coding) {
        this.coding = coding == null ? null : coding.trim();
    }

    public String getLongitudeLatitude() {
        return longitudeLatitude;
    }

    public void setLongitudeLatitude(String longitudeLatitude) {
        this.longitudeLatitude = longitudeLatitude == null ? null : longitudeLatitude.trim();
    }

    public BigDecimal getElevation() {
        return elevation;
    }

    public void setElevation(BigDecimal elevation) {
        this.elevation = elevation;
    }

    public String getAdministrativeCoding() {
        return administrativeCoding;
    }

    public void setAdministrativeCoding(String administrativeCoding) {
        this.administrativeCoding = administrativeCoding == null ? null : administrativeCoding.trim();
    }
    @JsonFormat(pattern="yyyy-MM-dd", timezone="GMT+8")
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    @JsonFormat(pattern="yyyy-MM-dd", timezone="GMT+8")
    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getDynamicId() {
        return dynamicId;
    }

    public void setDynamicId(String dynamicId) {
        this.dynamicId = dynamicId == null ? null : dynamicId.trim();
    }

    public String getMonitorEquipName() {
        return monitorEquipName;
    }

    public void setMonitorEquipName(String monitorEquipName) {
        this.monitorEquipName = monitorEquipName == null ? null : monitorEquipName.trim();
    }

    public String getMonitorAddress() {
        return monitorAddress;
    }

    public void setMonitorAddress(String monitorAddress) {
        this.monitorAddress = monitorAddress == null ? null : monitorAddress.trim();
    }

    public String getMonitorImage() {
        return monitorImage;
    }

    public void setMonitorImage(String monitorImage) {
        this.monitorImage = monitorImage == null ? null : monitorImage.trim();
    }

	public String getEquipName() {
		return equipName;
	}

	public void setEquipName(String equipName) {
		this.equipName = equipName;
	}

	public String getEquipCoding() {
		return equipCoding;
	}

	public void setEquipCoding(String equipCoding) {
		this.equipCoding = equipCoding;
	}

	public String getSimClip() {
		return simClip;
	}

	public void setSimClip(String simClip) {
		this.simClip = simClip;
	}

	public String getSimClipOperator() {
		return simClipOperator;
	}

	public void setSimClipOperator(String simClipOperator) {
		this.simClipOperator = simClipOperator;
	}
	@JsonFormat(pattern="yyyy-MM-dd", timezone="GMT+8")
	public Date getBuildTime() {
		return buildTime;
	}

	public void setBuildTime(Date buildTime) {
		this.buildTime = buildTime;
	}
    
    

    
    
}