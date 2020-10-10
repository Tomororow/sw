package com.zyjz.sysmanage.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CalCanalSluice implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;

    private String canalId;
    
    private String sluiceCode;

    private String sluicePhoto;
    
    private String sluicePhotoNo;

    private String sluiceType;

    private BigDecimal sluiceLongitude;

    private BigDecimal sluiceLatitude;

    private BigDecimal sluiceHeight;

    private String sluiceMianFunction;

    private String openCloseForm;

    private Integer holeNumber;

    private Integer openCloseNumber;

    private Integer flashboardNumber;

    private Integer leadScrewNumber;

    private Integer machineCapNumber;

    private Integer machineBaseNumber;

    private Integer copperSheathingNumber;

    private Integer fixScrewNumber;
    
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date sluiceRepairTime;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date sluiceBuildTime;
    
    private Date createTime;

    private String sluicePerfectType;

    private String ccsRemark;

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

    public String getSluicePhoto() {
        return sluicePhoto;
    }

    public void setSluicePhoto(String sluicePhoto) {
        this.sluicePhoto = sluicePhoto == null ? null : sluicePhoto.trim();
    }

    public String getSluicePhotoNo() {
        return sluicePhotoNo;
    }

    public void setSluicePhotoNo(String sluicePhotoNo) {
        this.sluicePhotoNo = sluicePhotoNo == null ? null : sluicePhotoNo.trim();
    }

    public String getSluiceType() {
        return sluiceType;
    }

    public void setSluiceType(String sluiceType) {
        this.sluiceType = sluiceType == null ? null : sluiceType.trim();
    }

    public BigDecimal getSluiceLongitude() {
        return sluiceLongitude;
    }

    public void setSluiceLongitude(BigDecimal sluiceLongitude) {
        this.sluiceLongitude = sluiceLongitude;
    }

    public BigDecimal getSluiceLatitude() {
        return sluiceLatitude;
    }

    public void setSluiceLatitude(BigDecimal sluiceLatitude) {
        this.sluiceLatitude = sluiceLatitude;
    }

    public BigDecimal getSluiceHeight() {
        return sluiceHeight;
    }

    public void setSluiceHeight(BigDecimal sluiceHeight) {
        this.sluiceHeight = sluiceHeight;
    }

    public String getSluiceMianFunction() {
        return sluiceMianFunction;
    }

    public void setSluiceMianFunction(String sluiceMianFunction) {
        this.sluiceMianFunction = sluiceMianFunction == null ? null : sluiceMianFunction.trim();
    }

    public String getOpenCloseForm() {
        return openCloseForm;
    }

    public void setOpenCloseForm(String openCloseForm) {
        this.openCloseForm = openCloseForm == null ? null : openCloseForm.trim();
    }

    public Integer getHoleNumber() {
        return holeNumber;
    }

    public void setHoleNumber(Integer holeNumber) {
        this.holeNumber = holeNumber;
    }

    public Integer getOpenCloseNumber() {
        return openCloseNumber;
    }

    public void setOpenCloseNumber(Integer openCloseNumber) {
        this.openCloseNumber = openCloseNumber;
    }

    public Integer getFlashboardNumber() {
        return flashboardNumber;
    }

    public void setFlashboardNumber(Integer flashboardNumber) {
        this.flashboardNumber = flashboardNumber;
    }

    public Integer getLeadScrewNumber() {
        return leadScrewNumber;
    }

    public void setLeadScrewNumber(Integer leadScrewNumber) {
        this.leadScrewNumber = leadScrewNumber;
    }

    public Integer getMachineCapNumber() {
        return machineCapNumber;
    }

    public void setMachineCapNumber(Integer machineCapNumber) {
        this.machineCapNumber = machineCapNumber;
    }

    public Integer getMachineBaseNumber() {
        return machineBaseNumber;
    }

    public void setMachineBaseNumber(Integer machineBaseNumber) {
        this.machineBaseNumber = machineBaseNumber;
    }

    public Integer getCopperSheathingNumber() {
        return copperSheathingNumber;
    }

    public void setCopperSheathingNumber(Integer copperSheathingNumber) {
        this.copperSheathingNumber = copperSheathingNumber;
    }

    public Integer getFixScrewNumber() {
        return fixScrewNumber;
    }

    public void setFixScrewNumber(Integer fixScrewNumber) {
        this.fixScrewNumber = fixScrewNumber;
    }

    public String getSluicePerfectType() {
        return sluicePerfectType;
    }

    public void setSluicePerfectType(String sluicePerfectType) {
        this.sluicePerfectType = sluicePerfectType == null ? null : sluicePerfectType.trim();
    }

    public String getCcsRemark() {
        return ccsRemark;
    }

    public void setCcsRemark(String ccsRemark) {
        this.ccsRemark = ccsRemark == null ? null : ccsRemark.trim();
    }

	public String getSluiceCode() {
		return sluiceCode;
	}

	public void setSluiceCode(String sluiceCode) {
		this.sluiceCode = sluiceCode;
	}

	public Date getSluiceRepairTime() {
		return sluiceRepairTime;
	}

	public void setSluiceRepairTime(Date sluiceRepairTime) {
		this.sluiceRepairTime = sluiceRepairTime;
	}

	public Date getSluiceBuildTime() {
		return sluiceBuildTime;
	}

	public void setSluiceBuildTime(Date sluiceBuildTime) {
		this.sluiceBuildTime = sluiceBuildTime;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
    
    
}