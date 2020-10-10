package com.zyjz.sysmanage.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CalCanalBuilding implements Serializable{
	private static final long serialVersionUID = 1L;

	private String id;

    private String canalId;
    
    private String buildingCode;

    private String buildingPhoto;

    private String buildingPhotoNo;

    private String buildingName;
    
    private String buildingType;
    
    private BigDecimal buildingLongitude;

    private BigDecimal buildingLatitude;

    private BigDecimal buildingHeight;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date buildingBuildTime;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date buildingRepairTime;

    private Integer buildingOne;

    private Integer buildingTwo;

    private Integer buildingThree;
    
    private Date ccbCreateTime;

    private Integer other;

    private String ccbRemark;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getCanalId() {
        return canalId;
    }

    public void setCanalId(String canalId) {
        this.canalId = canalId == null ? null : canalId.trim();
    }

    public String getBuildingPhoto() {
        return buildingPhoto;
    }

    public void setBuildingPhoto(String buildingPhoto) {
        this.buildingPhoto = buildingPhoto == null ? null : buildingPhoto.trim();
    }
    
    

    public String getBuildingType() {
		return buildingType;
	}

	public void setBuildingType(String buildingType) {
		this.buildingType = buildingType;
	}

	public String getBuildingPhotoNo() {
        return buildingPhotoNo;
    }

    public void setBuildingPhotoNo(String buildingPhotoNo) {
        this.buildingPhotoNo = buildingPhotoNo == null ? null : buildingPhotoNo.trim();
    }

    public String getBuildingName() {
        return buildingName;
    }

    public void setBuildingName(String buildingName) {
        this.buildingName = buildingName == null ? null : buildingName.trim();
    }

    public Integer getBuildingOne() {
        return buildingOne;
    }

    public void setBuildingOne(Integer buildingOne) {
        this.buildingOne = buildingOne;
    }

    public Integer getBuildingTwo() {
        return buildingTwo;
    }

    public void setBuildingTwo(Integer buildingTwo) {
        this.buildingTwo = buildingTwo;
    }

    public Integer getBuildingThree() {
        return buildingThree;
    }

    public void setBuildingThree(Integer buildingThree) {
        this.buildingThree = buildingThree;
    }

    public Integer getOther() {
        return other;
    }

    public void setOther(Integer other) {
        this.other = other;
    }

    public String getCcbRemark() {
        return ccbRemark;
    }

    public void setCcbRemark(String ccbRemark) {
        this.ccbRemark = ccbRemark == null ? null : ccbRemark.trim();
    }

	public String getBuildingCode() {
		return buildingCode;
	}

	public void setBuildingCode(String buildingCode) {
		this.buildingCode = buildingCode;
	}

	public BigDecimal getBuildingLongitude() {
		return buildingLongitude;
	}

	public void setBuildingLongitude(BigDecimal buildingLongitude) {
		this.buildingLongitude = buildingLongitude;
	}

	public BigDecimal getBuildingLatitude() {
		return buildingLatitude;
	}

	public void setBuildingLatitude(BigDecimal buildingLatitude) {
		this.buildingLatitude = buildingLatitude;
	}

	

	public BigDecimal getBuildingHeight() {
		return buildingHeight;
	}

	public void setBuildingHeight(BigDecimal buildingHeight) {
		this.buildingHeight = buildingHeight;
	}

	public Date getBuildingBuildTime() {
		return buildingBuildTime;
	}

	public void setBuildingBuildTime(Date buildingBuildTime) {
		this.buildingBuildTime = buildingBuildTime;
	}

	public Date getBuildingRepairTime() {
		return buildingRepairTime;
	}

	public void setBuildingRepairTime(Date buildingRepairTime) {
		this.buildingRepairTime = buildingRepairTime;
	}

	public Date getCcbCreateTime() {
		return ccbCreateTime;
	}

	public void setCcbCreateTime(Date ccbCreateTime) {
		this.ccbCreateTime = ccbCreateTime;
	}

	
    
    
}