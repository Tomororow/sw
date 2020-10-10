package com.zyjz.sitemanage.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
/**
 * 
 * @ClassName: WaterSurveySite
 * @Description: 水质监测站
 * @Author: liuHaiian
 * @Date: 2018年4月24日 下午3:16:42
 */
public class WaterSurveySite implements Serializable {
  
	private static final long serialVersionUID = 1L;

	private String id;

    private String monitorName;

    private String coding;
    
    private String equipCoding;
    
    private String simClip;
    
    private String simClipOperator;
    
    private Date buildTime;

    private String longitudeLatitude;

    private BigDecimal elevation;

    private String administrativeCoding;

    private String riverwayCoding;
    
    private Date createTime;
    
    private Date updateTime;

    private String dynamicId;

    private String waterGrade;

    private String monitorAddress;
    
    private String waterImage;
    
    

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMonitorName() {
        return monitorName;
    }

    public void setMonitorName(String monitorName) {
        this.monitorName = monitorName == null ? null : monitorName.trim();
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
        this.longitudeLatitude = longitudeLatitude;
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

    public String getRiverwayCoding() {
        return riverwayCoding;
    }

    public void setRiverwayCoding(String riverwayCoding) {
        this.riverwayCoding = riverwayCoding == null ? null : riverwayCoding.trim();
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
        this.dynamicId = dynamicId;
    }

    public String getWaterGrade() {
        return waterGrade;
    }

    public void setWaterGrade(String waterGrade) {
        this.waterGrade = waterGrade == null ? null : waterGrade.trim();
    }

    public String getMonitorAddress() {
        return monitorAddress;
    }

    public void setMonitorAddress(String monitorAddress) {
        this.monitorAddress = monitorAddress == null ? null : monitorAddress.trim();
    }

	public String getWaterImage() {
		return waterImage;
	}

	public void setWaterImage(String waterImage) {
		this.waterImage = waterImage;
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
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
	public Date getBuildTime() {
		return buildTime;
	}

	public void setBuildTime(Date buildTime) {
		this.buildTime = buildTime;
	}
	
	
    
    
    
}