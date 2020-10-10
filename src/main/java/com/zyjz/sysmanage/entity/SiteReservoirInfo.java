package com.zyjz.sysmanage.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class SiteReservoirInfo implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;

    private String sysareaCode;

    private String syswaterareaCode;

    private String deviceReservoirCode;

    private String deviceReservoirName;

    private String waterResourcesLevelCode;

    private String contactsPeople;

    private String contentPhone;

    private String belongsCanalCode;

    private String threeLevelAreaName;
    
    private String siteWaterId;

    private String code;

    private String engineeringLevel;

    private String sriDeviceNo;

    private Integer sriDevicemodelCode;

    private String sriAddr;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date sriBuildTime;

    private String sriSimcard;

    private String sriSimoperator;

    private String sriIpPort;

    private BigDecimal sriLongitude;

    private BigDecimal sriLatitude;

    private BigDecimal sriHeight;

    private BigDecimal reservoirCapacity;

    private BigDecimal thReservoirCapacity;

    private BigDecimal fhReservoirCapacity;

    private BigDecimal xlReservoirCapacity;

    private Integer waterMouth;

    private BigDecimal designWaterYearSupply;

    private String supplyObject;

    private String damFunction;

    private String damMaterialType;

    private String damStructureType;

    private String releaseFloodWatersBuilding;

    private BigDecimal damControlBasinArea;

    private BigDecimal damAverageFlowRate;

    private BigDecimal scazPeopleNumber;

    private BigDecimal bqazPeopleNumber;

    private String engineeringConstructionSituation;

    private String reservoirRegulationPerformance;

    private String mainDamLevel;

    private BigDecimal mainDamHeight;

    private BigDecimal mainDanLength;

    private BigDecimal maxReleaseFloodWaters;

    private String heightCoefficient;

    private BigDecimal damTopHeight;

    private Long sjhsbz;

    private Long jzhsbz;

    private BigDecimal sjhsw;

    private BigDecimal jzhsw;

    private BigDecimal fhgsw;

    private BigDecimal zcxsw;

    private BigDecimal fhxzsw;

    private BigDecimal ssw;

    private BigDecimal skr;

    private BigDecimal zcxswxysmmj;

    private String zybhdx;

    private String gxmc;

    private String skgkglbm;

    private Integer sfwchj;

    private Integer sfwcqq;

    private BigDecimal reservoirIrrigatedAcreage;

    private Integer reservoirtypeCode;

    private String reservoirusetypeCode;

    private String sriPhotoBefore;

    private String sriPhotoAfter;

    private Date sriCreateTime;

    private Date sriEditTime;

    private String sriRemark;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
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

    public String getDeviceReservoirCode() {
        return deviceReservoirCode;
    }

    public void setDeviceReservoirCode(String deviceReservoirCode) {
        this.deviceReservoirCode = deviceReservoirCode == null ? null : deviceReservoirCode.trim();
    }

    public String getDeviceReservoirName() {
        return deviceReservoirName;
    }

    public void setDeviceReservoirName(String deviceReservoirName) {
        this.deviceReservoirName = deviceReservoirName == null ? null : deviceReservoirName.trim();
    }

    public String getWaterResourcesLevelCode() {
        return waterResourcesLevelCode;
    }

    public void setWaterResourcesLevelCode(String waterResourcesLevelCode) {
        this.waterResourcesLevelCode = waterResourcesLevelCode == null ? null : waterResourcesLevelCode.trim();
    }

    public String getContactsPeople() {
        return contactsPeople;
    }

    public void setContactsPeople(String contactsPeople) {
        this.contactsPeople = contactsPeople == null ? null : contactsPeople.trim();
    }

    public String getContentPhone() {
        return contentPhone;
    }

    public void setContentPhone(String contentPhone) {
        this.contentPhone = contentPhone == null ? null : contentPhone.trim();
    }

    public String getBelongsCanalCode() {
        return belongsCanalCode;
    }

    public void setBelongsCanalCode(String belongsCanalCode) {
        this.belongsCanalCode = belongsCanalCode == null ? null : belongsCanalCode.trim();
    }

    public String getThreeLevelAreaName() {
        return threeLevelAreaName;
    }

    public void setThreeLevelAreaName(String threeLevelAreaName) {
        this.threeLevelAreaName = threeLevelAreaName == null ? null : threeLevelAreaName.trim();
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public String getEngineeringLevel() {
        return engineeringLevel;
    }

    public void setEngineeringLevel(String engineeringLevel) {
        this.engineeringLevel = engineeringLevel == null ? null : engineeringLevel.trim();
    }

    public String getSriDeviceNo() {
        return sriDeviceNo;
    }

    public void setSriDeviceNo(String sriDeviceNo) {
        this.sriDeviceNo = sriDeviceNo == null ? null : sriDeviceNo.trim();
    }

    public Integer getSriDevicemodelCode() {
        return sriDevicemodelCode;
    }

    public void setSriDevicemodelCode(Integer sriDevicemodelCode) {
        this.sriDevicemodelCode = sriDevicemodelCode;
    }

    public String getSriAddr() {
        return sriAddr;
    }

    public void setSriAddr(String sriAddr) {
        this.sriAddr = sriAddr == null ? null : sriAddr.trim();
    }
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getSriBuildTime() {
        return sriBuildTime;
    }

    public void setSriBuildTime(Date sriBuildTime) {
        this.sriBuildTime = sriBuildTime;
    }

    public String getSriSimcard() {
        return sriSimcard;
    }

    public void setSriSimcard(String sriSimcard) {
        this.sriSimcard = sriSimcard == null ? null : sriSimcard.trim();
    }

    public String getSriSimoperator() {
        return sriSimoperator;
    }

    public void setSriSimoperator(String sriSimoperator) {
        this.sriSimoperator = sriSimoperator == null ? null : sriSimoperator.trim();
    }

    public String getSriIpPort() {
        return sriIpPort;
    }

    public void setSriIpPort(String sriIpPort) {
        this.sriIpPort = sriIpPort == null ? null : sriIpPort.trim();
    }

    public BigDecimal getSriLongitude() {
        return sriLongitude;
    }

    public void setSriLongitude(BigDecimal sriLongitude) {
        this.sriLongitude = sriLongitude;
    }

    public BigDecimal getSriLatitude() {
        return sriLatitude;
    }

    public void setSriLatitude(BigDecimal sriLatitude) {
        this.sriLatitude = sriLatitude;
    }

    public BigDecimal getSriHeight() {
        return sriHeight;
    }

    public void setSriHeight(BigDecimal sriHeight) {
        this.sriHeight = sriHeight;
    }

    public BigDecimal getReservoirCapacity() {
        return reservoirCapacity;
    }

    public void setReservoirCapacity(BigDecimal reservoirCapacity) {
        this.reservoirCapacity = reservoirCapacity;
    }

    public BigDecimal getThReservoirCapacity() {
        return thReservoirCapacity;
    }

    public void setThReservoirCapacity(BigDecimal thReservoirCapacity) {
        this.thReservoirCapacity = thReservoirCapacity;
    }

    public BigDecimal getFhReservoirCapacity() {
        return fhReservoirCapacity;
    }

    public void setFhReservoirCapacity(BigDecimal fhReservoirCapacity) {
        this.fhReservoirCapacity = fhReservoirCapacity;
    }

    public BigDecimal getXlReservoirCapacity() {
        return xlReservoirCapacity;
    }

    public void setXlReservoirCapacity(BigDecimal xlReservoirCapacity) {
        this.xlReservoirCapacity = xlReservoirCapacity;
    }

    public Integer getWaterMouth() {
        return waterMouth;
    }

    public void setWaterMouth(Integer waterMouth) {
        this.waterMouth = waterMouth;
    }

    public BigDecimal getDesignWaterYearSupply() {
        return designWaterYearSupply;
    }

    public void setDesignWaterYearSupply(BigDecimal designWaterYearSupply) {
        this.designWaterYearSupply = designWaterYearSupply;
    }

    public String getSupplyObject() {
        return supplyObject;
    }

    public void setSupplyObject(String supplyObject) {
        this.supplyObject = supplyObject == null ? null : supplyObject.trim();
    }

    public String getDamFunction() {
        return damFunction;
    }

    public void setDamFunction(String damFunction) {
        this.damFunction = damFunction == null ? null : damFunction.trim();
    }

    public String getDamMaterialType() {
        return damMaterialType;
    }

    public void setDamMaterialType(String damMaterialType) {
        this.damMaterialType = damMaterialType == null ? null : damMaterialType.trim();
    }

    public String getDamStructureType() {
        return damStructureType;
    }

    public void setDamStructureType(String damStructureType) {
        this.damStructureType = damStructureType == null ? null : damStructureType.trim();
    }

    public String getReleaseFloodWatersBuilding() {
        return releaseFloodWatersBuilding;
    }

    public void setReleaseFloodWatersBuilding(String releaseFloodWatersBuilding) {
        this.releaseFloodWatersBuilding = releaseFloodWatersBuilding == null ? null : releaseFloodWatersBuilding.trim();
    }

    public BigDecimal getDamControlBasinArea() {
        return damControlBasinArea;
    }

    public void setDamControlBasinArea(BigDecimal damControlBasinArea) {
        this.damControlBasinArea = damControlBasinArea;
    }

    public BigDecimal getDamAverageFlowRate() {
        return damAverageFlowRate;
    }

    public void setDamAverageFlowRate(BigDecimal damAverageFlowRate) {
        this.damAverageFlowRate = damAverageFlowRate;
    }

    public BigDecimal getScazPeopleNumber() {
        return scazPeopleNumber;
    }

    public void setScazPeopleNumber(BigDecimal scazPeopleNumber) {
        this.scazPeopleNumber = scazPeopleNumber;
    }

    public BigDecimal getBqazPeopleNumber() {
        return bqazPeopleNumber;
    }

    public void setBqazPeopleNumber(BigDecimal bqazPeopleNumber) {
        this.bqazPeopleNumber = bqazPeopleNumber;
    }

    public String getEngineeringConstructionSituation() {
        return engineeringConstructionSituation;
    }

    public void setEngineeringConstructionSituation(String engineeringConstructionSituation) {
        this.engineeringConstructionSituation = engineeringConstructionSituation == null ? null : engineeringConstructionSituation.trim();
    }

    public String getReservoirRegulationPerformance() {
        return reservoirRegulationPerformance;
    }

    public void setReservoirRegulationPerformance(String reservoirRegulationPerformance) {
        this.reservoirRegulationPerformance = reservoirRegulationPerformance == null ? null : reservoirRegulationPerformance.trim();
    }

    public String getMainDamLevel() {
        return mainDamLevel;
    }

    public void setMainDamLevel(String mainDamLevel) {
        this.mainDamLevel = mainDamLevel == null ? null : mainDamLevel.trim();
    }

    public BigDecimal getMainDamHeight() {
        return mainDamHeight;
    }

    public void setMainDamHeight(BigDecimal mainDamHeight) {
        this.mainDamHeight = mainDamHeight;
    }

    public BigDecimal getMainDanLength() {
        return mainDanLength;
    }

    public void setMainDanLength(BigDecimal mainDanLength) {
        this.mainDanLength = mainDanLength;
    }

    public BigDecimal getMaxReleaseFloodWaters() {
        return maxReleaseFloodWaters;
    }

    public void setMaxReleaseFloodWaters(BigDecimal maxReleaseFloodWaters) {
        this.maxReleaseFloodWaters = maxReleaseFloodWaters;
    }

    public String getHeightCoefficient() {
        return heightCoefficient;
    }

    public void setHeightCoefficient(String heightCoefficient) {
        this.heightCoefficient = heightCoefficient == null ? null : heightCoefficient.trim();
    }

    public BigDecimal getDamTopHeight() {
        return damTopHeight;
    }

    public void setDamTopHeight(BigDecimal damTopHeight) {
        this.damTopHeight = damTopHeight;
    }

    public Long getSjhsbz() {
        return sjhsbz;
    }

    public void setSjhsbz(Long sjhsbz) {
        this.sjhsbz = sjhsbz;
    }

    public Long getJzhsbz() {
        return jzhsbz;
    }

    public void setJzhsbz(Long jzhsbz) {
        this.jzhsbz = jzhsbz;
    }

    public BigDecimal getSjhsw() {
        return sjhsw;
    }

    public void setSjhsw(BigDecimal sjhsw) {
        this.sjhsw = sjhsw;
    }

    public BigDecimal getJzhsw() {
        return jzhsw;
    }

    public void setJzhsw(BigDecimal jzhsw) {
        this.jzhsw = jzhsw;
    }

    public BigDecimal getFhgsw() {
        return fhgsw;
    }

    public void setFhgsw(BigDecimal fhgsw) {
        this.fhgsw = fhgsw;
    }

    public BigDecimal getZcxsw() {
        return zcxsw;
    }

    public void setZcxsw(BigDecimal zcxsw) {
        this.zcxsw = zcxsw;
    }

    public BigDecimal getFhxzsw() {
        return fhxzsw;
    }

    public void setFhxzsw(BigDecimal fhxzsw) {
        this.fhxzsw = fhxzsw;
    }

    public BigDecimal getSsw() {
        return ssw;
    }

    public void setSsw(BigDecimal ssw) {
        this.ssw = ssw;
    }

    public BigDecimal getSkr() {
        return skr;
    }

    public void setSkr(BigDecimal skr) {
        this.skr = skr;
    }

    public BigDecimal getZcxswxysmmj() {
        return zcxswxysmmj;
    }

    public void setZcxswxysmmj(BigDecimal zcxswxysmmj) {
        this.zcxswxysmmj = zcxswxysmmj;
    }

    public String getZybhdx() {
        return zybhdx;
    }

    public void setZybhdx(String zybhdx) {
        this.zybhdx = zybhdx == null ? null : zybhdx.trim();
    }

    public String getGxmc() {
        return gxmc;
    }

    public void setGxmc(String gxmc) {
        this.gxmc = gxmc == null ? null : gxmc.trim();
    }

    public String getSkgkglbm() {
        return skgkglbm;
    }

    public void setSkgkglbm(String skgkglbm) {
        this.skgkglbm = skgkglbm == null ? null : skgkglbm.trim();
    }

    public Integer getSfwchj() {
        return sfwchj;
    }

    public void setSfwchj(Integer sfwchj) {
        this.sfwchj = sfwchj;
    }

    public Integer getSfwcqq() {
        return sfwcqq;
    }

    public void setSfwcqq(Integer sfwcqq) {
        this.sfwcqq = sfwcqq;
    }

    public BigDecimal getReservoirIrrigatedAcreage() {
        return reservoirIrrigatedAcreage;
    }

    public void setReservoirIrrigatedAcreage(BigDecimal reservoirIrrigatedAcreage) {
        this.reservoirIrrigatedAcreage = reservoirIrrigatedAcreage;
    }

    public Integer getReservoirtypeCode() {
        return reservoirtypeCode;
    }

    public void setReservoirtypeCode(Integer reservoirtypeCode) {
        this.reservoirtypeCode = reservoirtypeCode;
    }

    public String getReservoirusetypeCode() {
        return reservoirusetypeCode;
    }

    public void setReservoirusetypeCode(String reservoirusetypeCode) {
        this.reservoirusetypeCode = reservoirusetypeCode == null ? null : reservoirusetypeCode.trim();
    }

    public String getSriPhotoBefore() {
        return sriPhotoBefore;
    }

    public void setSriPhotoBefore(String sriPhotoBefore) {
        this.sriPhotoBefore = sriPhotoBefore == null ? null : sriPhotoBefore.trim();
    }

    public String getSriPhotoAfter() {
        return sriPhotoAfter;
    }

    public void setSriPhotoAfter(String sriPhotoAfter) {
        this.sriPhotoAfter = sriPhotoAfter == null ? null : sriPhotoAfter.trim();
    }

    public Date getSriCreateTime() {
        return sriCreateTime;
    }

    public void setSriCreateTime(Date sriCreateTime) {
        this.sriCreateTime = sriCreateTime;
    }

    public Date getSriEditTime() {
        return sriEditTime;
    }

    public void setSriEditTime(Date sriEditTime) {
        this.sriEditTime = sriEditTime;
    }

    public String getSriRemark() {
        return sriRemark;
    }

    public void setSriRemark(String sriRemark) {
        this.sriRemark = sriRemark == null ? null : sriRemark.trim();
    }

	public String getSiteWaterId() {
		return siteWaterId;
	}

	public void setSiteWaterId(String siteWaterId) {
		this.siteWaterId = siteWaterId;
	}
    
}