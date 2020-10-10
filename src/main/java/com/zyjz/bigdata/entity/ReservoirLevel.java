package com.zyjz.bigdata.entity;

import java.math.BigDecimal;
import java.util.Date;

public class ReservoirLevel {
    /**  */
    private String id;

    /** 库水位 */
    private BigDecimal waterlevel;

    /** 流量 */
    private BigDecimal waterflow;

    /** 库容 */
    private BigDecimal capacity;

    /** 关联水库编码 */
    private String reservoircode;

    /** 创建时间 */
    private Date createtime;

    /** 修改时间 */
    private Date edittime;

    /**  */
    private String backupone;

    /**  */
    private String backuptwo;

    /**  */
    private String backupthree;

    /**  */
    private String backupfour;

    /**  */
    private String backupfive;

    /** 备注 */
    private String remark;

    /** 其他字段 */
    /** 库水位均值 */
    private BigDecimal waterlevelAvgPerHour;
    /** 库容均值 */
    private BigDecimal capacityAvgPerHour;
    /** 小时 */
    private String hour;

    /**
     * 
     * @return Id 
     */
    public String getId() {
        return id;
    }

    /**
     * 
     * @param id 
     */
    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    /**
     * 库水位
     * @return WaterLevel 库水位
     */
    public BigDecimal getWaterlevel() {
        return waterlevel;
    }

    /**
     * 库水位
     * @param waterlevel 库水位
     */
    public void setWaterlevel(BigDecimal waterlevel) {
        this.waterlevel = waterlevel;
    }

    /**
     * 流量
     * @return WaterFlow 流量
     */
    public BigDecimal getWaterflow() {
        return waterflow;
    }

    /**
     * 流量
     * @param waterflow 流量
     */
    public void setWaterflow(BigDecimal waterflow) {
        this.waterflow = waterflow;
    }

    /**
     * 库容
     * @return Capacity 库容
     */
    public BigDecimal getCapacity() {
        return capacity;
    }

    /**
     * 库容
     * @param capacity 库容
     */
    public void setCapacity(BigDecimal capacity) {
        this.capacity = capacity;
    }

    /**
     * 关联水库编码
     * @return ReservoirCode 关联水库编码
     */
    public String getReservoircode() {
        return reservoircode;
    }

    /**
     * 关联水库编码
     * @param reservoircode 关联水库编码
     */
    public void setReservoircode(String reservoircode) {
        this.reservoircode = reservoircode == null ? null : reservoircode.trim();
    }

    /**
     * 创建时间
     * @return CreateTime 创建时间
     */
    public Date getCreatetime() {
        return createtime;
    }

    /**
     * 创建时间
     * @param createtime 创建时间
     */
    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    /**
     * 修改时间
     * @return EditTime 修改时间
     */
    public Date getEdittime() {
        return edittime;
    }

    /**
     * 修改时间
     * @param edittime 修改时间
     */
    public void setEdittime(Date edittime) {
        this.edittime = edittime;
    }

    /**
     * 
     * @return BackupOne 
     */
    public String getBackupone() {
        return backupone;
    }

    /**
     * 
     * @param backupone 
     */
    public void setBackupone(String backupone) {
        this.backupone = backupone == null ? null : backupone.trim();
    }

    /**
     * 
     * @return BackupTwo 
     */
    public String getBackuptwo() {
        return backuptwo;
    }

    /**
     * 
     * @param backuptwo 
     */
    public void setBackuptwo(String backuptwo) {
        this.backuptwo = backuptwo == null ? null : backuptwo.trim();
    }

    /**
     * 
     * @return BackupThree 
     */
    public String getBackupthree() {
        return backupthree;
    }

    /**
     * 
     * @param backupthree 
     */
    public void setBackupthree(String backupthree) {
        this.backupthree = backupthree == null ? null : backupthree.trim();
    }

    /**
     * 
     * @return BackupFour 
     */
    public String getBackupfour() {
        return backupfour;
    }

    /**
     * 
     * @param backupfour 
     */
    public void setBackupfour(String backupfour) {
        this.backupfour = backupfour == null ? null : backupfour.trim();
    }

    /**
     * 
     * @return BackupFive 
     */
    public String getBackupfive() {
        return backupfive;
    }

    /**
     * 
     * @param backupfive 
     */
    public void setBackupfive(String backupfive) {
        this.backupfive = backupfive == null ? null : backupfive.trim();
    }

    /**
     * 备注
     * @return Remark 备注
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 备注
     * @param remark 备注
     */
    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public BigDecimal getWaterlevelAvgPerHour() {
        return waterlevelAvgPerHour;
    }

    public void setWaterlevelAvgPerHour(BigDecimal waterlevelAvgPerHour) {
        this.waterlevelAvgPerHour = waterlevelAvgPerHour;
    }

    public BigDecimal getCapacityAvgPerHour() {
        return capacityAvgPerHour;
    }

    public void setCapacityAvgPerHour(BigDecimal capacityAvgPerHour) {
        this.capacityAvgPerHour = capacityAvgPerHour;
    }

    public String getHour() {
        return hour;
    }

    public void setHour(String hour) {
        this.hour = hour;
    }
}