package com.zyjz.watersupply.entity;

import java.math.BigDecimal;
import java.util.Date;

public class SynPumpingHouse {
    private String id;

    private String waterworksId;

    private String equipmentId;

    private String pumpingName;

    private String pumpingNum;

    private String pumpingGrade;

    private String pumpingPhoto;

    private String pumpingSim;

    private String pumpingSimOperator;

    private BigDecimal pumpingLongitude;

    private BigDecimal pumpingLatitude;

    private Date pumpingCreationTime;

    private Date pumpingUpdateTime;

    private String pumpingRemark;

    private String pumpingComm1;

    private String pumpingComm2;

    private String pumpingComm3;

    private String pumpingComm4;

    private String pumpingComm5;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getWaterworksId() {
        return waterworksId;
    }

    public void setWaterworksId(String waterworksId) {
        this.waterworksId = waterworksId == null ? null : waterworksId.trim();
    }

    public String getEquipmentId() {
        return equipmentId;
    }

    public void setEquipmentId(String equipmentId) {
        this.equipmentId = equipmentId == null ? null : equipmentId.trim();
    }

    public String getPumpingName() {
        return pumpingName;
    }

    public void setPumpingName(String pumpingName) {
        this.pumpingName = pumpingName == null ? null : pumpingName.trim();
    }

    public String getPumpingNum() {
        return pumpingNum;
    }

    public void setPumpingNum(String pumpingNum) {
        this.pumpingNum = pumpingNum == null ? null : pumpingNum.trim();
    }

    public String getPumpingGrade() {
        return pumpingGrade;
    }

    public void setPumpingGrade(String pumpingGrade) {
        this.pumpingGrade = pumpingGrade == null ? null : pumpingGrade.trim();
    }

    public String getPumpingPhoto() {
        return pumpingPhoto;
    }

    public void setPumpingPhoto(String pumpingPhoto) {
        this.pumpingPhoto = pumpingPhoto == null ? null : pumpingPhoto.trim();
    }

    public String getPumpingSim() {
        return pumpingSim;
    }

    public void setPumpingSim(String pumpingSim) {
        this.pumpingSim = pumpingSim == null ? null : pumpingSim.trim();
    }

    public String getPumpingSimOperator() {
        return pumpingSimOperator;
    }

    public void setPumpingSimOperator(String pumpingSimOperator) {
        this.pumpingSimOperator = pumpingSimOperator == null ? null : pumpingSimOperator.trim();
    }

    public BigDecimal getPumpingLongitude() {
        return pumpingLongitude;
    }

    public void setPumpingLongitude(BigDecimal pumpingLongitude) {
        this.pumpingLongitude = pumpingLongitude;
    }

    public BigDecimal getPumpingLatitude() {
        return pumpingLatitude;
    }

    public void setPumpingLatitude(BigDecimal pumpingLatitude) {
        this.pumpingLatitude = pumpingLatitude;
    }

    public Date getPumpingCreationTime() {
        return pumpingCreationTime;
    }

    public void setPumpingCreationTime(Date pumpingCreationTime) {
        this.pumpingCreationTime = pumpingCreationTime;
    }

    public Date getPumpingUpdateTime() {
        return pumpingUpdateTime;
    }

    public void setPumpingUpdateTime(Date pumpingUpdateTime) {
        this.pumpingUpdateTime = pumpingUpdateTime;
    }

    public String getPumpingRemark() {
        return pumpingRemark;
    }

    public void setPumpingRemark(String pumpingRemark) {
        this.pumpingRemark = pumpingRemark == null ? null : pumpingRemark.trim();
    }

    public String getPumpingComm1() {
        return pumpingComm1;
    }

    public void setPumpingComm1(String pumpingComm1) {
        this.pumpingComm1 = pumpingComm1 == null ? null : pumpingComm1.trim();
    }

    public String getPumpingComm2() {
        return pumpingComm2;
    }

    public void setPumpingComm2(String pumpingComm2) {
        this.pumpingComm2 = pumpingComm2 == null ? null : pumpingComm2.trim();
    }

    public String getPumpingComm3() {
        return pumpingComm3;
    }

    public void setPumpingComm3(String pumpingComm3) {
        this.pumpingComm3 = pumpingComm3 == null ? null : pumpingComm3.trim();
    }

    public String getPumpingComm4() {
        return pumpingComm4;
    }

    public void setPumpingComm4(String pumpingComm4) {
        this.pumpingComm4 = pumpingComm4 == null ? null : pumpingComm4.trim();
    }

    public String getPumpingComm5() {
        return pumpingComm5;
    }

    public void setPumpingComm5(String pumpingComm5) {
        this.pumpingComm5 = pumpingComm5 == null ? null : pumpingComm5.trim();
    }
}