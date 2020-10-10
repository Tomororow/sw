package com.zyjz.watersupply.entity;

import java.math.BigDecimal;
import java.util.Date;

public class SynPool {
    private String id;

    private String waterworksId;

    private String equipmentId;

    private String poolName;

    private String poolNum;

    private BigDecimal length;

    private BigDecimal wide;

    private BigDecimal tall;

    private BigDecimal bulk;

    private BigDecimal maxPondage;

    private BigDecimal poolLongitude;

    private BigDecimal poolLatitude;

    private String poolAddress;

    private String poolPhotos;

    private Date poolBuildtime;

    private String poolSim;

    private String poolSimOperator;

    private Date poolCreationTime;

    private Date poolUpdateTime;

    private String poolRemark;

    private String poolComm1;

    private String poolComm2;

    private String poolComm3;

    private String poolComm4;

    private String poolComm5;

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

    public String getPoolName() {
        return poolName;
    }

    public void setPoolName(String poolName) {
        this.poolName = poolName == null ? null : poolName.trim();
    }

    public String getPoolNum() {
        return poolNum;
    }

    public void setPoolNum(String poolNum) {
        this.poolNum = poolNum == null ? null : poolNum.trim();
    }

    public BigDecimal getLength() {
        return length;
    }

    public void setLength(BigDecimal length) {
        this.length = length;
    }

    public BigDecimal getWide() {
        return wide;
    }

    public void setWide(BigDecimal wide) {
        this.wide = wide;
    }

    public BigDecimal getTall() {
        return tall;
    }

    public void setTall(BigDecimal tall) {
        this.tall = tall;
    }

    public BigDecimal getBulk() {
        return bulk;
    }

    public void setBulk(BigDecimal bulk) {
        this.bulk = bulk;
    }

    public BigDecimal getMaxPondage() {
        return maxPondage;
    }

    public void setMaxPondage(BigDecimal maxPondage) {
        this.maxPondage = maxPondage;
    }

    public BigDecimal getPoolLongitude() {
        return poolLongitude;
    }

    public void setPoolLongitude(BigDecimal poolLongitude) {
        this.poolLongitude = poolLongitude;
    }

    public BigDecimal getPoolLatitude() {
        return poolLatitude;
    }

    public void setPoolLatitude(BigDecimal poolLatitude) {
        this.poolLatitude = poolLatitude;
    }

    public String getPoolAddress() {
        return poolAddress;
    }

    public void setPoolAddress(String poolAddress) {
        this.poolAddress = poolAddress == null ? null : poolAddress.trim();
    }

    public String getPoolPhotos() {
        return poolPhotos;
    }

    public void setPoolPhotos(String poolPhotos) {
        this.poolPhotos = poolPhotos == null ? null : poolPhotos.trim();
    }

    public Date getPoolBuildtime() {
        return poolBuildtime;
    }

    public void setPoolBuildtime(Date poolBuildtime) {
        this.poolBuildtime = poolBuildtime;
    }

    public String getPoolSim() {
        return poolSim;
    }

    public void setPoolSim(String poolSim) {
        this.poolSim = poolSim == null ? null : poolSim.trim();
    }

    public String getPoolSimOperator() {
        return poolSimOperator;
    }

    public void setPoolSimOperator(String poolSimOperator) {
        this.poolSimOperator = poolSimOperator == null ? null : poolSimOperator.trim();
    }

    public Date getPoolCreationTime() {
        return poolCreationTime;
    }

    public void setPoolCreationTime(Date poolCreationTime) {
        this.poolCreationTime = poolCreationTime;
    }

    public Date getPoolUpdateTime() {
        return poolUpdateTime;
    }

    public void setPoolUpdateTime(Date poolUpdateTime) {
        this.poolUpdateTime = poolUpdateTime;
    }

    public String getPoolRemark() {
        return poolRemark;
    }

    public void setPoolRemark(String poolRemark) {
        this.poolRemark = poolRemark == null ? null : poolRemark.trim();
    }

    public String getPoolComm1() {
        return poolComm1;
    }

    public void setPoolComm1(String poolComm1) {
        this.poolComm1 = poolComm1 == null ? null : poolComm1.trim();
    }

    public String getPoolComm2() {
        return poolComm2;
    }

    public void setPoolComm2(String poolComm2) {
        this.poolComm2 = poolComm2 == null ? null : poolComm2.trim();
    }

    public String getPoolComm3() {
        return poolComm3;
    }

    public void setPoolComm3(String poolComm3) {
        this.poolComm3 = poolComm3 == null ? null : poolComm3.trim();
    }

    public String getPoolComm4() {
        return poolComm4;
    }

    public void setPoolComm4(String poolComm4) {
        this.poolComm4 = poolComm4 == null ? null : poolComm4.trim();
    }

    public String getPoolComm5() {
        return poolComm5;
    }

    public void setPoolComm5(String poolComm5) {
        this.poolComm5 = poolComm5 == null ? null : poolComm5.trim();
    }
}