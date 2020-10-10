package com.zyjz.watersupply.entity;

import java.math.BigDecimal;
import java.util.Date;

public class SynPipeNetwork {
    private String id;

    private String waterworksId;

    private String equipmentId;

    private String pumpingHouseId;

    private String pipeNetworkName;

    private String pipeNetworkNum;

    private String pipeNetworkParentId;

    private String pipeNetworkLevelCode;

    private String description;

    private BigDecimal pipeNetworkLength;

    private String pipeNetworkType;

    private Date pipeNetworkCreationTime;

    private Date pipeNetworkUpdateTime;

    private String pipeNetworkRemark;

    private String pipeNetworkComm1;

    private String pipeNetworkComm2;

    private String pipeNetworkComm3;

    private String pipeNetworkComm4;

    private String pipeNetworkComm5;

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

    public String getPumpingHouseId() {
        return pumpingHouseId;
    }

    public void setPumpingHouseId(String pumpingHouseId) {
        this.pumpingHouseId = pumpingHouseId == null ? null : pumpingHouseId.trim();
    }

    public String getPipeNetworkName() {
        return pipeNetworkName;
    }

    public void setPipeNetworkName(String pipeNetworkName) {
        this.pipeNetworkName = pipeNetworkName == null ? null : pipeNetworkName.trim();
    }

    public String getPipeNetworkNum() {
        return pipeNetworkNum;
    }

    public void setPipeNetworkNum(String pipeNetworkNum) {
        this.pipeNetworkNum = pipeNetworkNum == null ? null : pipeNetworkNum.trim();
    }

    public String getPipeNetworkParentId() {
        return pipeNetworkParentId;
    }

    public void setPipeNetworkParentId(String pipeNetworkParentId) {
        this.pipeNetworkParentId = pipeNetworkParentId == null ? null : pipeNetworkParentId.trim();
    }

    public String getPipeNetworkLevelCode() {
        return pipeNetworkLevelCode;
    }

    public void setPipeNetworkLevelCode(String pipeNetworkLevelCode) {
        this.pipeNetworkLevelCode = pipeNetworkLevelCode == null ? null : pipeNetworkLevelCode.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public BigDecimal getPipeNetworkLength() {
        return pipeNetworkLength;
    }

    public void setPipeNetworkLength(BigDecimal pipeNetworkLength) {
        this.pipeNetworkLength = pipeNetworkLength;
    }

    public String getPipeNetworkType() {
        return pipeNetworkType;
    }

    public void setPipeNetworkType(String pipeNetworkType) {
        this.pipeNetworkType = pipeNetworkType == null ? null : pipeNetworkType.trim();
    }

    public Date getPipeNetworkCreationTime() {
        return pipeNetworkCreationTime;
    }

    public void setPipeNetworkCreationTime(Date pipeNetworkCreationTime) {
        this.pipeNetworkCreationTime = pipeNetworkCreationTime;
    }

    public Date getPipeNetworkUpdateTime() {
        return pipeNetworkUpdateTime;
    }

    public void setPipeNetworkUpdateTime(Date pipeNetworkUpdateTime) {
        this.pipeNetworkUpdateTime = pipeNetworkUpdateTime;
    }

    public String getPipeNetworkRemark() {
        return pipeNetworkRemark;
    }

    public void setPipeNetworkRemark(String pipeNetworkRemark) {
        this.pipeNetworkRemark = pipeNetworkRemark == null ? null : pipeNetworkRemark.trim();
    }

    public String getPipeNetworkComm1() {
        return pipeNetworkComm1;
    }

    public void setPipeNetworkComm1(String pipeNetworkComm1) {
        this.pipeNetworkComm1 = pipeNetworkComm1 == null ? null : pipeNetworkComm1.trim();
    }

    public String getPipeNetworkComm2() {
        return pipeNetworkComm2;
    }

    public void setPipeNetworkComm2(String pipeNetworkComm2) {
        this.pipeNetworkComm2 = pipeNetworkComm2 == null ? null : pipeNetworkComm2.trim();
    }

    public String getPipeNetworkComm3() {
        return pipeNetworkComm3;
    }

    public void setPipeNetworkComm3(String pipeNetworkComm3) {
        this.pipeNetworkComm3 = pipeNetworkComm3 == null ? null : pipeNetworkComm3.trim();
    }

    public String getPipeNetworkComm4() {
        return pipeNetworkComm4;
    }

    public void setPipeNetworkComm4(String pipeNetworkComm4) {
        this.pipeNetworkComm4 = pipeNetworkComm4 == null ? null : pipeNetworkComm4.trim();
    }

    public String getPipeNetworkComm5() {
        return pipeNetworkComm5;
    }

    public void setPipeNetworkComm5(String pipeNetworkComm5) {
        this.pipeNetworkComm5 = pipeNetworkComm5 == null ? null : pipeNetworkComm5.trim();
    }
}