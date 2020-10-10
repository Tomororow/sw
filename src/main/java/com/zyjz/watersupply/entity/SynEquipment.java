package com.zyjz.watersupply.entity;

import java.util.Date;

/**
 * 设备信息表
 * @ClassName: SynEquipment
 * @Description: 
 * @Author: liyue
 * @Date: 2018年5月14日 上午11:20:29
 */
public class SynEquipment {
    private String id;

    private String deviceTypeId;

    private String waterworksId;

    private String poolId;

    private String pumpingHouseId;

    private String pipeNetworkId;

    private String equipmenCode;

    private String equipmenName;

    private String equipmentManufacturers;

    private String equipmentSupportshone;

    private Date equipmentReleaseTime;

    private Date equipmentTimeBuying;

    private Date equipmentCreationTime;

    private Date equipmentUpdateTime;

    private String equipmentComm1;

    private String equipmentComm2;

    private String equipmentComm3;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getDeviceTypeId() {
        return deviceTypeId;
    }

    public void setDeviceTypeId(String deviceTypeId) {
        this.deviceTypeId = deviceTypeId == null ? null : deviceTypeId.trim();
    }

    public String getWaterworksId() {
        return waterworksId;
    }

    public void setWaterworksId(String waterworksId) {
        this.waterworksId = waterworksId == null ? null : waterworksId.trim();
    }

    public String getPoolId() {
        return poolId;
    }

    public void setPoolId(String poolId) {
        this.poolId = poolId == null ? null : poolId.trim();
    }

    public String getPumpingHouseId() {
        return pumpingHouseId;
    }

    public void setPumpingHouseId(String pumpingHouseId) {
        this.pumpingHouseId = pumpingHouseId == null ? null : pumpingHouseId.trim();
    }

    public String getPipeNetworkId() {
        return pipeNetworkId;
    }

    public void setPipeNetworkId(String pipeNetworkId) {
        this.pipeNetworkId = pipeNetworkId == null ? null : pipeNetworkId.trim();
    }

    public String getEquipmenCode() {
        return equipmenCode;
    }

    public void setEquipmenCode(String equipmenCode) {
        this.equipmenCode = equipmenCode == null ? null : equipmenCode.trim();
    }

    public String getEquipmenName() {
        return equipmenName;
    }

    public void setEquipmenName(String equipmenName) {
        this.equipmenName = equipmenName == null ? null : equipmenName.trim();
    }

    public String getEquipmentManufacturers() {
        return equipmentManufacturers;
    }

    public void setEquipmentManufacturers(String equipmentManufacturers) {
        this.equipmentManufacturers = equipmentManufacturers == null ? null : equipmentManufacturers.trim();
    }

    public String getEquipmentSupportshone() {
        return equipmentSupportshone;
    }

    public void setEquipmentSupportshone(String equipmentSupportshone) {
        this.equipmentSupportshone = equipmentSupportshone == null ? null : equipmentSupportshone.trim();
    }

    public Date getEquipmentReleaseTime() {
        return equipmentReleaseTime;
    }

    public void setEquipmentReleaseTime(Date equipmentReleaseTime) {
        this.equipmentReleaseTime = equipmentReleaseTime;
    }

    public Date getEquipmentTimeBuying() {
        return equipmentTimeBuying;
    }

    public void setEquipmentTimeBuying(Date equipmentTimeBuying) {
        this.equipmentTimeBuying = equipmentTimeBuying;
    }

    public Date getEquipmentCreationTime() {
        return equipmentCreationTime;
    }

    public void setEquipmentCreationTime(Date equipmentCreationTime) {
        this.equipmentCreationTime = equipmentCreationTime;
    }

    public Date getEquipmentUpdateTime() {
        return equipmentUpdateTime;
    }

    public void setEquipmentUpdateTime(Date equipmentUpdateTime) {
        this.equipmentUpdateTime = equipmentUpdateTime;
    }

    public String getEquipmentComm1() {
        return equipmentComm1;
    }

    public void setEquipmentComm1(String equipmentComm1) {
        this.equipmentComm1 = equipmentComm1 == null ? null : equipmentComm1.trim();
    }

    public String getEquipmentComm2() {
        return equipmentComm2;
    }

    public void setEquipmentComm2(String equipmentComm2) {
        this.equipmentComm2 = equipmentComm2 == null ? null : equipmentComm2.trim();
    }

    public String getEquipmentComm3() {
        return equipmentComm3;
    }

    public void setEquipmentComm3(String equipmentComm3) {
        this.equipmentComm3 = equipmentComm3 == null ? null : equipmentComm3.trim();
    }
}