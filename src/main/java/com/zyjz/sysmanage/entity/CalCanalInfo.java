package com.zyjz.sysmanage.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CalCanalInfo implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private String id;

	    private String sysareaId;

	    private String syswaterareaId;

	    private String sysareaCode;

	    private String syswaterareaCode;

	    private String canalPhotoCode;

	    private String canalPhoto;

	    private String canalCode;

	    private String canalName;

	    private String aname;

	    private String wname;

	    private BigDecimal decisionArea;
	    
	    private BigDecimal mathing;

	    private BigDecimal canalLength;

	    private String canalParentId;

	    private Integer canallevelCode;

	    private String canalmaterialCode;

	    private Integer canaltypeCode;

	    private String canalusetypeCode;

	    private String irrigatedAreaName;

	    private BigDecimal canalDesignFlow;

	    private BigDecimal canalRealityFlow;

	    private BigDecimal canalIrrigatedAcreage;

	    private BigDecimal canalPerfectRate;

	    private BigDecimal canalRatio;
	    
	    @DateTimeFormat(pattern="yyyy-MM-dd")
	    private Date canalBuildTime;
	    
	    @DateTimeFormat(pattern="yyyy-MM-dd")
	    private Date canalRepairTime;

	    private String canalAddr;

	    private BigDecimal canalSlope;

	    private BigDecimal canalRough;

	    private BigDecimal canalAngle;

	    private BigDecimal canalHeight;

	    private BigDecimal canalWight;

	    private Date cciCreateTime;

	    private Date cciEditTime;

	    private String cciRemark;

		private List<CalCanalInfo> children;

		//渠道闸门
		private String canalId;//渠道与闸门站关联id

		private String sluiceCode;//闸门编码

		private String sluicePhoto;//照片
		//照片编码
		private String sluicePhotoNo;
	    //闸门类型
		private String sluiceType;
		private String sluiceid;//闸门站id
		//维修时间
		@DateTimeFormat(pattern="yyyy-MM-dd")
		private Date sluiceRepairTime;
		//修建时间
		@DateTimeFormat(pattern="yyyy-MM-dd")
		private Date sluiceBuildTime;
		//备注
		private String ccsulRemark;

		//渠道照片
		private String phtotcanalId;

		private String canalPhotoimg;

		private String ccphotoRemark;
		//渠道建筑物

	private String buildcanalId;

	private String buildingid;

	private String buildingCode;

	private String buildingPhoto;

	private String buildingPhotoNo;

	private String buildingName;

	private String buildingType;

	private String ccbremark;

	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date buildingBuildTime;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date buildingRepairTime;

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getWname() {
		return wname;
	}

	public void setWname(String wname) {
		this.wname = wname;
	}

	public String getSluiceid() {
		return sluiceid;
	}

	public void setSluiceid(String sluiceid) {
		this.sluiceid = sluiceid;
	}

	public String getBuildingid() {
		return buildingid;
	}

	public void setBuildingid(String buildingid) {
		this.buildingid = buildingid;
	}

	public String getBuildcanalId() {
		return buildcanalId;
	}

	public void setBuildcanalId(String buildcanalId) {
		this.buildcanalId = buildcanalId;
	}

	public String getBuildingCode() {
		return buildingCode;
	}

	public void setBuildingCode(String buildingCode) {
		this.buildingCode = buildingCode;
	}

	public String getBuildingPhoto() {
		return buildingPhoto;
	}

	public void setBuildingPhoto(String buildingPhoto) {
		this.buildingPhoto = buildingPhoto;
	}

	public String getBuildingPhotoNo() {
		return buildingPhotoNo;
	}

	public void setBuildingPhotoNo(String buildingPhotoNo) {
		this.buildingPhotoNo = buildingPhotoNo;
	}

	public String getBuildingName() {
		return buildingName;
	}

	public void setBuildingName(String buildingName) {
		this.buildingName = buildingName;
	}

	public String getBuildingType() {
		return buildingType;
	}

	public void setBuildingType(String buildingType) {
		this.buildingType = buildingType;
	}

	public String getCcbremark() {
		return ccbremark;
	}

	public void setCcbremark(String ccbremark) {
		this.ccbremark = ccbremark;
	}
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
	public Date getBuildingBuildTime() {
		return buildingBuildTime;
	}
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
	public void setBuildingBuildTime(Date buildingBuildTime) {
		this.buildingBuildTime = buildingBuildTime;
	}
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
	public Date getBuildingRepairTime() {
		return buildingRepairTime;
	}
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
	public void setBuildingRepairTime(Date buildingRepairTime) {
		this.buildingRepairTime = buildingRepairTime;
	}

	public String getPhtotcanalId() {
		return phtotcanalId;
	}

	public void setPhtotcanalId(String phtotcanalId) {
		this.phtotcanalId = phtotcanalId;
	}

	public String getCanalPhotoimg() {
		return canalPhotoimg;
	}

	public void setCanalPhotoimg(String canalPhotoimg) {
		this.canalPhotoimg = canalPhotoimg;
	}

	public String getCcphotoRemark() {
		return ccphotoRemark;
	}

	public void setCcphotoRemark(String ccphotoRemark) {
		this.ccphotoRemark = ccphotoRemark;
	}

	public String getCcsulRemark() {
		return ccsulRemark;
	}

	public void setCcsulRemark(String ccsulRemark) {
		this.ccsulRemark = ccsulRemark;
	}

	public String getCanalId() {
		return canalId;
	}

	public void setCanalId(String canalId) {
		this.canalId = canalId;
	}

	public String getSluiceCode() {
		return sluiceCode;
	}

	public void setSluiceCode(String sluiceCode) {
		this.sluiceCode = sluiceCode;
	}

	public String getSluicePhoto() {
		return sluicePhoto;
	}

	public void setSluicePhoto(String sluicePhoto) {
		this.sluicePhoto = sluicePhoto;
	}

	public String getSluicePhotoNo() {
		return sluicePhotoNo;
	}

	public void setSluicePhotoNo(String sluicePhotoNo) {
		this.sluicePhotoNo = sluicePhotoNo;
	}

	public String getSluiceType() {
		return sluiceType;
	}

	public void setSluiceType(String sluiceType) {
		this.sluiceType = sluiceType;
	}
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
	public Date getSluiceRepairTime() {
		return sluiceRepairTime;
	}
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
	public void setSluiceRepairTime(Date sluiceRepairTime) {
		this.sluiceRepairTime = sluiceRepairTime;
	}
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
	public Date getSluiceBuildTime() {
		return sluiceBuildTime;
	}
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
	public void setSluiceBuildTime(Date sluiceBuildTime) {
		this.sluiceBuildTime = sluiceBuildTime;
	}

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

	    public String getSyswaterareaId() {
	        return syswaterareaId;
	    }

	    public void setSyswaterareaId(String syswaterareaId) {
	        this.syswaterareaId = syswaterareaId == null ? null : syswaterareaId.trim();
	    }

	    public String getSysareaCode() {
	        return sysareaCode;
	    }

	    public void setSysareaCode(String sysareaCode) {
	        this.sysareaCode = sysareaCode == null ? null : sysareaCode.trim();
	    }

	    public String getSyswaterareaCode() {
	        return syswaterareaCode;
	    }

	    public void setSyswaterareaCode(String syswaterareaCode) {
	        this.syswaterareaCode = syswaterareaCode == null ? null : syswaterareaCode.trim();
	    }

	    public String getCanalPhotoCode() {
	        return canalPhotoCode;
	    }

	    public void setCanalPhotoCode(String canalPhotoCode) {
	        this.canalPhotoCode = canalPhotoCode == null ? null : canalPhotoCode.trim();
	    }

	    public String getCanalPhoto() {
	        return canalPhoto;
	    }

	    public void setCanalPhoto(String canalPhoto) {
	        this.canalPhoto = canalPhoto == null ? null : canalPhoto.trim();
	    }

	    public String getCanalCode() {
	        return canalCode;
	    }

	    public void setCanalCode(String canalCode) {
	        this.canalCode = canalCode == null ? null : canalCode.trim();
	    }

	    public String getCanalName() {
	        return canalName;
	    }

	    public void setCanalName(String canalName) {
	        this.canalName = canalName == null ? null : canalName.trim();
	    }
	    
	    public BigDecimal getDecisionArea() {
			return decisionArea;
		}

		public void setDecisionArea(BigDecimal decisionArea) {
			this.decisionArea = decisionArea;
		}
		
		public BigDecimal getMathing() {
			return mathing;
		}

		public void setMathing(BigDecimal mathing) {
			this.mathing = mathing;
		}

		public BigDecimal getCanalLength() {
	        return canalLength;
	    }

	    public void setCanalLength(BigDecimal canalLength) {
	        this.canalLength = canalLength;
	    }

	    public String getCanalParentId() {
	        return canalParentId;
	    }

	    public void setCanalParentId(String canalParentId) {
	        this.canalParentId = canalParentId == null ? null : canalParentId.trim();
	    }

	    public Integer getCanallevelCode() {
	        return canallevelCode;
	    }

	    public void setCanallevelCode(Integer canallevelCode) {
	        this.canallevelCode = canallevelCode;
	    }

	    public String getCanalmaterialCode() {
	        return canalmaterialCode;
	    }

	    public void setCanalmaterialCode(String canalmaterialCode) {
	        this.canalmaterialCode = canalmaterialCode == null ? null : canalmaterialCode.trim();
	    }

	    public Integer getCanaltypeCode() {
	        return canaltypeCode;
	    }

	    public void setCanaltypeCode(Integer canaltypeCode) {
	        this.canaltypeCode = canaltypeCode;
	    }

	    public String getCanalusetypeCode() {
	        return canalusetypeCode;
	    }

	    public void setCanalusetypeCode(String canalusetypeCode) {
	        this.canalusetypeCode = canalusetypeCode == null ? null : canalusetypeCode.trim();
	    }

	    public String getIrrigatedAreaName() {
	        return irrigatedAreaName;
	    }

	    public void setIrrigatedAreaName(String irrigatedAreaName) {
	        this.irrigatedAreaName = irrigatedAreaName == null ? null : irrigatedAreaName.trim();
	    }
	    
	    

	    public BigDecimal getCanalDesignFlow() {
	        return canalDesignFlow;
	    }

	    public void setCanalDesignFlow(BigDecimal canalDesignFlow) {
	        this.canalDesignFlow = canalDesignFlow;
	    }

	    public BigDecimal getCanalRealityFlow() {
	        return canalRealityFlow;
	    }

	    public void setCanalRealityFlow(BigDecimal canalRealityFlow) {
	        this.canalRealityFlow = canalRealityFlow;
	    }

	    public BigDecimal getCanalIrrigatedAcreage() {
	        return canalIrrigatedAcreage;
	    }

	    public void setCanalIrrigatedAcreage(BigDecimal canalIrrigatedAcreage) {
	        this.canalIrrigatedAcreage = canalIrrigatedAcreage;
	    }

	    public BigDecimal getCanalPerfectRate() {
	        return canalPerfectRate;
	    }

	    public void setCanalPerfectRate(BigDecimal canalPerfectRate) {
	        this.canalPerfectRate = canalPerfectRate;
	    }

	    public BigDecimal getCanalRatio() {
	        return canalRatio;
	    }

	    public void setCanalRatio(BigDecimal canalRatio) {
	        this.canalRatio = canalRatio;
	    }

	    public Date getCanalBuildTime() {
	        return canalBuildTime;
	    }

	    public void setCanalBuildTime(Date canalBuildTime) {
	        this.canalBuildTime = canalBuildTime;
	    }

	    public Date getCanalRepairTime() {
	        return canalRepairTime;
	    }

	    public void setCanalRepairTime(Date canalRepairTime) {
	        this.canalRepairTime = canalRepairTime;
	    }

	    public String getCanalAddr() {
	        return canalAddr;
	    }

	    public void setCanalAddr(String canalAddr) {
	        this.canalAddr = canalAddr == null ? null : canalAddr.trim();
	    }

	    public BigDecimal getCanalSlope() {
	        return canalSlope;
	    }

	    public void setCanalSlope(BigDecimal canalSlope) {
	        this.canalSlope = canalSlope;
	    }

	    public BigDecimal getCanalRough() {
	        return canalRough;
	    }

	    public void setCanalRough(BigDecimal canalRough) {
	        this.canalRough = canalRough;
	    }

	    public BigDecimal getCanalAngle() {
	        return canalAngle;
	    }

	    public void setCanalAngle(BigDecimal canalAngle) {
	        this.canalAngle = canalAngle;
	    }

	    public BigDecimal getCanalHeight() {
	        return canalHeight;
	    }

	    public void setCanalHeight(BigDecimal canalHeight) {
	        this.canalHeight = canalHeight;
	    }

	    public BigDecimal getCanalWight() {
	        return canalWight;
	    }

	    public void setCanalWight(BigDecimal canalWight) {
	        this.canalWight = canalWight;
	    }
	    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
	    public Date getCciCreateTime() {
	        return cciCreateTime;
	    }

	    public void setCciCreateTime(Date cciCreateTime) {
	        this.cciCreateTime = cciCreateTime;
	    }
	    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
	    public Date getCciEditTime() {
	        return cciEditTime;
	    }

	    public void setCciEditTime(Date cciEditTime) {
	        this.cciEditTime = cciEditTime;
	    }

	    public String getCciRemark() {
	        return cciRemark;
	    }

	    public void setCciRemark(String cciRemark) {
	        this.cciRemark = cciRemark == null ? null : cciRemark.trim();
	    }

	public List<CalCanalInfo> getChildren() {
		return children;
	}

	public void setChildren(List<CalCanalInfo> children) {
		this.children = children;
	}


}