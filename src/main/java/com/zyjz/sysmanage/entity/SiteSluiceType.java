package com.zyjz.sysmanage.entity;

import java.util.Date;

public class SiteSluiceType {
    /** 主键标识, uuid id */
    private String id;

    /** 闸门启闭类型编码,唯一索引,1:手动螺杆,2:电动螺杆,3:手提闸门,依次往下 sluice_type_code */
    private Integer sluiceTypeCode;

    /** 闸门启闭类型名称,填写代码对应名称 sluice_type_name */
    private String sluiceTypeName;

    /** 创建时间 sst_create_time */
    private Date sstCreateTime;

    /** 上次修改时间 sst_edit_time */
    private Date sstEditTime;

    /** 备注 sst_remark */
    private String sstRemark;

    /**
     * 主键标识, uuid
     * @return id 主键标识, uuid
     */
    public String getId() {
        return id;
    }

    /**
     * 主键标识, uuid
     * @param id 主键标识, uuid
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * 闸门启闭类型编码,唯一索引,1:手动螺杆,2:电动螺杆,3:手提闸门,依次往下
     * @return sluice_type_code 闸门启闭类型编码,唯一索引,1:手动螺杆,2:电动螺杆,3:手提闸门,依次往下
     */
    public Integer getSluiceTypeCode() {
        return sluiceTypeCode;
    }

    /**
     * 闸门启闭类型编码,唯一索引,1:手动螺杆,2:电动螺杆,3:手提闸门,依次往下
     * @param sluiceTypeCode 闸门启闭类型编码,唯一索引,1:手动螺杆,2:电动螺杆,3:手提闸门,依次往下
     */
    public void setSluiceTypeCode(Integer sluiceTypeCode) {
        this.sluiceTypeCode = sluiceTypeCode;
    }

    /**
     * 闸门启闭类型名称,填写代码对应名称
     * @return sluice_type_name 闸门启闭类型名称,填写代码对应名称
     */
    public String getSluiceTypeName() {
        return sluiceTypeName;
    }

    /**
     * 闸门启闭类型名称,填写代码对应名称
     * @param sluiceTypeName 闸门启闭类型名称,填写代码对应名称
     */
    public void setSluiceTypeName(String sluiceTypeName) {
        this.sluiceTypeName = sluiceTypeName == null ? null : sluiceTypeName.trim();
    }

    /**
     * 创建时间
     * @return sst_create_time 创建时间
     */
    public Date getSstCreateTime() {
        return sstCreateTime;
    }

    /**
     * 创建时间
     * @param sstCreateTime 创建时间
     */
    public void setSstCreateTime(Date sstCreateTime) {
        this.sstCreateTime = sstCreateTime;
    }

    /**
     * 上次修改时间
     * @return sst_edit_time 上次修改时间
     */
    public Date getSstEditTime() {
        return sstEditTime;
    }

    /**
     * 上次修改时间
     * @param sstEditTime 上次修改时间
     */
    public void setSstEditTime(Date sstEditTime) {
        this.sstEditTime = sstEditTime;
    }

    /**
     * 备注
     * @return sst_remark 备注
     */
    public String getSstRemark() {
        return sstRemark;
    }

    /**
     * 备注
     * @param sstRemark 备注
     */
    public void setSstRemark(String sstRemark) {
        this.sstRemark = sstRemark == null ? null : sstRemark.trim();
    }
}