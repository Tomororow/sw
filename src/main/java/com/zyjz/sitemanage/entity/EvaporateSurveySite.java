package com.zyjz.sitemanage.entity;

import java.math.BigDecimal;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class EvaporateSurveySite {
    private String id;

    private String evaporateName;

    private String coding;

    private String equipName;

    private String equipCoding;

    private String simClip;

    private String simClipOperator;

    private Date buildTime;

    private BigDecimal longitude;

    private BigDecimal latitude;

    private BigDecimal elevation;

    private String administrativeCoding;

    private Date createTime;

    private Date updateTime;

    private String dynamicId;

    private String evaporateAddress;

    private String evaporateImage;

    private String standbyOne;

    private String standbyTwo;

    private String standbyThree;

    private String standbyFour;

    private String standbyFive;

    private String standbySix;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getEvaporateName() {
        return evaporateName;
    }

    public void setEvaporateName(String evaporateName) {
        this.evaporateName = evaporateName == null ? null : evaporateName.trim();
    }

    public String getCoding() {
        return coding;
    }

    public void setCoding(String coding) {
        this.coding = coding == null ? null : coding.trim();
    }

    public String getEquipName() {
        return equipName;
    }

    public void setEquipName(String equipName) {
        this.equipName = equipName == null ? null : equipName.trim();
    }

    public String getEquipCoding() {
        return equipCoding;
    }

    public void setEquipCoding(String equipCoding) {
        this.equipCoding = equipCoding == null ? null : equipCoding.trim();
    }

    public String getSimClip() {
        return simClip;
    }

    public void setSimClip(String simClip) {
        this.simClip = simClip == null ? null : simClip.trim();
    }

    public String getSimClipOperator() {
        return simClipOperator;
    }

    public void setSimClipOperator(String simClipOperator) {
        this.simClipOperator = simClipOperator == null ? null : simClipOperator.trim();
    }
    @JsonFormat(pattern="yyyy-MM-dd", timezone="GMT+8")
    public Date getBuildTime() {
        return buildTime;
    }

    public void setBuildTime(Date buildTime) {
        this.buildTime = buildTime;
    }

    public BigDecimal getLongitude() {
        return longitude;
    }

    public void setLongitude(BigDecimal longitude) {
        this.longitude = longitude;
    }

    public BigDecimal getLatitude() {
        return latitude;
    }

    public void setLatitude(BigDecimal latitude) {
        this.latitude = latitude;
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

    public String getEvaporateAddress() {
        return evaporateAddress;
    }

    public void setEvaporateAddress(String evaporateAddress) {
        this.evaporateAddress = evaporateAddress == null ? null : evaporateAddress.trim();
    }

    public String getEvaporateImage() {
        return evaporateImage;
    }

    public void setEvaporateImage(String evaporateImage) {
        this.evaporateImage = evaporateImage == null ? null : evaporateImage.trim();
    }

    public String getStandbyOne() {
        return standbyOne;
    }

    public void setStandbyOne(String standbyOne) {
        this.standbyOne = standbyOne == null ? null : standbyOne.trim();
    }

    public String getStandbyTwo() {
        return standbyTwo;
    }

    public void setStandbyTwo(String standbyTwo) {
        this.standbyTwo = standbyTwo == null ? null : standbyTwo.trim();
    }

    public String getStandbyThree() {
        return standbyThree;
    }

    public void setStandbyThree(String standbyThree) {
        this.standbyThree = standbyThree == null ? null : standbyThree.trim();
    }

    public String getStandbyFour() {
        return standbyFour;
    }

    public void setStandbyFour(String standbyFour) {
        this.standbyFour = standbyFour == null ? null : standbyFour.trim();
    }

    public String getStandbyFive() {
        return standbyFive;
    }

    public void setStandbyFive(String standbyFive) {
        this.standbyFive = standbyFive == null ? null : standbyFive.trim();
    }

    public String getStandbySix() {
        return standbySix;
    }

    public void setStandbySix(String standbySix) {
        this.standbySix = standbySix == null ? null : standbySix.trim();
    }
}