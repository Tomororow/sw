package com.zyjz.remotecontrol.entity;

import java.math.BigDecimal;
import java.util.Date;

public class SiteSluiceJzMiddDevice {
    /**  id */
    private Integer id;

    /** 闸门站id ssjmd_sluice_info_id */
    private String ssjmdSluiceInfoId;

    /** 闸门编码 ssjmd_sluice_gate_code */
    private String ssjmdSluiceGateCode;

    /** 闸门开度,单位米 ssjmd_sluice_height */
    private BigDecimal ssjmdSluiceHeight;

    /** 闸门开度上限 ssjmd_open_ceiling */
    private BigDecimal ssjmdOpenCeiling;

    /** 闸门开度下限 ssjmd_open_lower */
    private BigDecimal ssjmdOpenLower;

    /** 闸门开度零点 ssjmd_open_zero */
    private BigDecimal ssjmdOpenZero;

    /** A路荷重 ssjmd_A_road_load */
    private BigDecimal ssjmdARoadLoad;

    /** A路荷重90% ssjmd_A_road_load90 */
    private BigDecimal ssjmdARoadLoad90;

    /** A路荷重110% ssjmd_A_road_load110 */
    private BigDecimal ssjmdARoadLoad110;

    /** A路荷重零点 ssjmd_A_road_load_zero */
    private BigDecimal ssjmdARoadLoadZero;

    /** B路荷重 ssjmd_B_road_load */
    private BigDecimal ssjmdBRoadLoad;

    /** B路荷重90% ssjmd_B_road_load90 */
    private BigDecimal ssjmdBRoadLoad90;

    /** B路荷重110% ssjmd_B_road_load110 */
    private BigDecimal ssjmdBRoadLoad110;

    /** B路荷重零点 ssjmd_B_road_load_zero */
    private BigDecimal ssjmdBRoadLoadZero;

    /** A路荷重90%预警 ssjmd_A_road_load90_warning */
    private BigDecimal ssjmdARoadLoad90Warning;

    /** B路荷重90%预警 ssjmd_B_road_load90_warning */
    private BigDecimal ssjmdBRoadLoad90Warning;

    /** A路荷重110%预警 ssjmd_A_road_load110_warning */
    private BigDecimal ssjmdARoadLoad110Warning;

    /** B路荷重110%预警 ssjmd_B_road_load110_warning */
    private BigDecimal ssjmdBRoadLoad110Warning;

    /** 控制模式 ssjmd_control_mode */
    private String ssjmdControlMode;

    /** 闸门状态 ssjmd_sluic_gate_type */
    private String ssjmdSluicGateType;

    /** 开度限位 ssjmd_sluice_height_limit */
    private BigDecimal ssjmdSluiceHeightLimit;

    /** 闸前实时水位,单位米 ssjmd_before_water_level */
    private BigDecimal ssjmdBeforeWaterLevel;

    /** 闸后实时水位,单位米 ssjmd_after_water_level */
    private BigDecimal ssjmdAfterWaterLevel;

    /** 闸口瞬时流速,米/秒(m/s) ssjmd_sluice_instant_speed */
    private BigDecimal ssjmdSluiceInstantSpeed;

    /** 闸口瞬时流量,立方米/秒(m3/s) ssjmd_sluice_instant_flow */
    private BigDecimal ssjmdSluiceInstantFlow;

    /** 修改时间 ssjmd_modify_time */
    private Date ssjmdModifyTime;

    /** 创建时间 ssjmd_create_time */
    private Date ssjmdCreateTime;

    /**
     *
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     *
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 闸门站id
     * @return ssjmd_sluice_info_id 闸门站id
     */
    public String getSsjmdSluiceInfoId() {
        return ssjmdSluiceInfoId;
    }

    /**
     * 闸门站id
     * @param ssjmdSluiceInfoId 闸门站id
     */
    public void setSsjmdSluiceInfoId(String ssjmdSluiceInfoId) {
        this.ssjmdSluiceInfoId = ssjmdSluiceInfoId == null ? null : ssjmdSluiceInfoId.trim();
    }

    /**
     * 闸门编码
     * @return ssjmd_sluice_gate_code 闸门编码
     */
    public String getSsjmdSluiceGateCode() {
        return ssjmdSluiceGateCode;
    }

    /**
     * 闸门编码
     * @param ssjmdSluiceGateCode 闸门编码
     */
    public void setSsjmdSluiceGateCode(String ssjmdSluiceGateCode) {
        this.ssjmdSluiceGateCode = ssjmdSluiceGateCode == null ? null : ssjmdSluiceGateCode.trim();
    }

    /**
     * 闸门开度,单位米
     * @return ssjmd_sluice_height 闸门开度,单位米
     */
    public BigDecimal getSsjmdSluiceHeight() {
        return ssjmdSluiceHeight;
    }

    /**
     * 闸门开度,单位米
     * @param ssjmdSluiceHeight 闸门开度,单位米
     */
    public void setSsjmdSluiceHeight(BigDecimal ssjmdSluiceHeight) {
        this.ssjmdSluiceHeight = ssjmdSluiceHeight;
    }

    /**
     * 闸门开度上限
     * @return ssjmd_open_ceiling 闸门开度上限
     */
    public BigDecimal getSsjmdOpenCeiling() {
        return ssjmdOpenCeiling;
    }

    /**
     * 闸门开度上限
     * @param ssjmdOpenCeiling 闸门开度上限
     */
    public void setSsjmdOpenCeiling(BigDecimal ssjmdOpenCeiling) {
        this.ssjmdOpenCeiling = ssjmdOpenCeiling;
    }

    /**
     * 闸门开度下限
     * @return ssjmd_open_lower 闸门开度下限
     */
    public BigDecimal getSsjmdOpenLower() {
        return ssjmdOpenLower;
    }

    /**
     * 闸门开度下限
     * @param ssjmdOpenLower 闸门开度下限
     */
    public void setSsjmdOpenLower(BigDecimal ssjmdOpenLower) {
        this.ssjmdOpenLower = ssjmdOpenLower;
    }

    /**
     * 闸门开度零点
     * @return ssjmd_open_zero 闸门开度零点
     */
    public BigDecimal getSsjmdOpenZero() {
        return ssjmdOpenZero;
    }

    /**
     * 闸门开度零点
     * @param ssjmdOpenZero 闸门开度零点
     */
    public void setSsjmdOpenZero(BigDecimal ssjmdOpenZero) {
        this.ssjmdOpenZero = ssjmdOpenZero;
    }

    /**
     * A路荷重
     * @return ssjmd_A_road_load A路荷重
     */
    public BigDecimal getSsjmdARoadLoad() {
        return ssjmdARoadLoad;
    }

    /**
     * A路荷重
     * @param ssjmdARoadLoad A路荷重
     */
    public void setSsjmdARoadLoad(BigDecimal ssjmdARoadLoad) {
        this.ssjmdARoadLoad = ssjmdARoadLoad;
    }

    /**
     * A路荷重90%
     * @return ssjmd_A_road_load90 A路荷重90%
     */
    public BigDecimal getSsjmdARoadLoad90() {
        return ssjmdARoadLoad90;
    }

    /**
     * A路荷重90%
     * @param ssjmdARoadLoad90 A路荷重90%
     */
    public void setSsjmdARoadLoad90(BigDecimal ssjmdARoadLoad90) {
        this.ssjmdARoadLoad90 = ssjmdARoadLoad90;
    }

    /**
     * A路荷重110%
     * @return ssjmd_A_road_load110 A路荷重110%
     */
    public BigDecimal getSsjmdARoadLoad110() {
        return ssjmdARoadLoad110;
    }

    /**
     * A路荷重110%
     * @param ssjmdARoadLoad110 A路荷重110%
     */
    public void setSsjmdARoadLoad110(BigDecimal ssjmdARoadLoad110) {
        this.ssjmdARoadLoad110 = ssjmdARoadLoad110;
    }

    /**
     * A路荷重零点
     * @return ssjmd_A_road_load_zero A路荷重零点
     */
    public BigDecimal getSsjmdARoadLoadZero() {
        return ssjmdARoadLoadZero;
    }

    /**
     * A路荷重零点
     * @param ssjmdARoadLoadZero A路荷重零点
     */
    public void setSsjmdARoadLoadZero(BigDecimal ssjmdARoadLoadZero) {
        this.ssjmdARoadLoadZero = ssjmdARoadLoadZero;
    }

    /**
     * B路荷重
     * @return ssjmd_B_road_load B路荷重
     */
    public BigDecimal getSsjmdBRoadLoad() {
        return ssjmdBRoadLoad;
    }

    /**
     * B路荷重
     * @param ssjmdBRoadLoad B路荷重
     */
    public void setSsjmdBRoadLoad(BigDecimal ssjmdBRoadLoad) {
        this.ssjmdBRoadLoad = ssjmdBRoadLoad;
    }

    /**
     * B路荷重90%
     * @return ssjmd_B_road_load90 B路荷重90%
     */
    public BigDecimal getSsjmdBRoadLoad90() {
        return ssjmdBRoadLoad90;
    }

    /**
     * B路荷重90%
     * @param ssjmdBRoadLoad90 B路荷重90%
     */
    public void setSsjmdBRoadLoad90(BigDecimal ssjmdBRoadLoad90) {
        this.ssjmdBRoadLoad90 = ssjmdBRoadLoad90;
    }

    /**
     * B路荷重110%
     * @return ssjmd_B_road_load110 B路荷重110%
     */
    public BigDecimal getSsjmdBRoadLoad110() {
        return ssjmdBRoadLoad110;
    }

    /**
     * B路荷重110%
     * @param ssjmdBRoadLoad110 B路荷重110%
     */
    public void setSsjmdBRoadLoad110(BigDecimal ssjmdBRoadLoad110) {
        this.ssjmdBRoadLoad110 = ssjmdBRoadLoad110;
    }

    /**
     * B路荷重零点
     * @return ssjmd_B_road_load_zero B路荷重零点
     */
    public BigDecimal getSsjmdBRoadLoadZero() {
        return ssjmdBRoadLoadZero;
    }

    /**
     * B路荷重零点
     * @param ssjmdBRoadLoadZero B路荷重零点
     */
    public void setSsjmdBRoadLoadZero(BigDecimal ssjmdBRoadLoadZero) {
        this.ssjmdBRoadLoadZero = ssjmdBRoadLoadZero;
    }

    /**
     * A路荷重90%预警
     * @return ssjmd_A_road_load90_warning A路荷重90%预警
     */
    public BigDecimal getSsjmdARoadLoad90Warning() {
        return ssjmdARoadLoad90Warning;
    }

    /**
     * A路荷重90%预警
     * @param ssjmdARoadLoad90Warning A路荷重90%预警
     */
    public void setSsjmdARoadLoad90Warning(BigDecimal ssjmdARoadLoad90Warning) {
        this.ssjmdARoadLoad90Warning = ssjmdARoadLoad90Warning;
    }

    /**
     * B路荷重90%预警
     * @return ssjmd_B_road_load90_warning B路荷重90%预警
     */
    public BigDecimal getSsjmdBRoadLoad90Warning() {
        return ssjmdBRoadLoad90Warning;
    }

    /**
     * B路荷重90%预警
     * @param ssjmdBRoadLoad90Warning B路荷重90%预警
     */
    public void setSsjmdBRoadLoad90Warning(BigDecimal ssjmdBRoadLoad90Warning) {
        this.ssjmdBRoadLoad90Warning = ssjmdBRoadLoad90Warning;
    }

    /**
     * A路荷重110%预警
     * @return ssjmd_A_road_load110_warning A路荷重110%预警
     */
    public BigDecimal getSsjmdARoadLoad110Warning() {
        return ssjmdARoadLoad110Warning;
    }

    /**
     * A路荷重110%预警
     * @param ssjmdARoadLoad110Warning A路荷重110%预警
     */
    public void setSsjmdARoadLoad110Warning(BigDecimal ssjmdARoadLoad110Warning) {
        this.ssjmdARoadLoad110Warning = ssjmdARoadLoad110Warning;
    }

    /**
     * B路荷重110%预警
     * @return ssjmd_B_road_load110_warning B路荷重110%预警
     */
    public BigDecimal getSsjmdBRoadLoad110Warning() {
        return ssjmdBRoadLoad110Warning;
    }

    /**
     * B路荷重110%预警
     * @param ssjmdBRoadLoad110Warning B路荷重110%预警
     */
    public void setSsjmdBRoadLoad110Warning(BigDecimal ssjmdBRoadLoad110Warning) {
        this.ssjmdBRoadLoad110Warning = ssjmdBRoadLoad110Warning;
    }

    /**
     * 控制模式
     * @return ssjmd_control_mode 控制模式
     */
    public String getSsjmdControlMode() {
        return ssjmdControlMode;
    }

    /**
     * 控制模式
     * @param ssjmdControlMode 控制模式
     */
    public void setSsjmdControlMode(String ssjmdControlMode) {
        this.ssjmdControlMode = ssjmdControlMode == null ? null : ssjmdControlMode.trim();
    }

    /**
     * 闸门状态
     * @return ssjmd_sluic_gate_type 闸门状态
     */
    public String getSsjmdSluicGateType() {
        return ssjmdSluicGateType;
    }

    /**
     * 闸门状态
     * @param ssjmdSluicGateType 闸门状态
     */
    public void setSsjmdSluicGateType(String ssjmdSluicGateType) {
        this.ssjmdSluicGateType = ssjmdSluicGateType == null ? null : ssjmdSluicGateType.trim();
    }

    /**
     * 开度限位
     * @return ssjmd_sluice_height_limit 开度限位
     */
    public BigDecimal getSsjmdSluiceHeightLimit() {
        return ssjmdSluiceHeightLimit;
    }

    /**
     * 开度限位
     * @param ssjmdSluiceHeightLimit 开度限位
     */
    public void setSsjmdSluiceHeightLimit(BigDecimal ssjmdSluiceHeightLimit) {
        this.ssjmdSluiceHeightLimit = ssjmdSluiceHeightLimit;
    }

    /**
     * 闸前实时水位,单位米
     * @return ssjmd_before_water_level 闸前实时水位,单位米
     */
    public BigDecimal getSsjmdBeforeWaterLevel() {
        return ssjmdBeforeWaterLevel;
    }

    /**
     * 闸前实时水位,单位米
     * @param ssjmdBeforeWaterLevel 闸前实时水位,单位米
     */
    public void setSsjmdBeforeWaterLevel(BigDecimal ssjmdBeforeWaterLevel) {
        this.ssjmdBeforeWaterLevel = ssjmdBeforeWaterLevel;
    }

    /**
     * 闸后实时水位,单位米
     * @return ssjmd_after_water_level 闸后实时水位,单位米
     */
    public BigDecimal getSsjmdAfterWaterLevel() {
        return ssjmdAfterWaterLevel;
    }

    /**
     * 闸后实时水位,单位米
     * @param ssjmdAfterWaterLevel 闸后实时水位,单位米
     */
    public void setSsjmdAfterWaterLevel(BigDecimal ssjmdAfterWaterLevel) {
        this.ssjmdAfterWaterLevel = ssjmdAfterWaterLevel;
    }

    /**
     * 闸口瞬时流速,米/秒(m/s)
     * @return ssjmd_sluice_instant_speed 闸口瞬时流速,米/秒(m/s)
     */
    public BigDecimal getSsjmdSluiceInstantSpeed() {
        return ssjmdSluiceInstantSpeed;
    }

    /**
     * 闸口瞬时流速,米/秒(m/s)
     * @param ssjmdSluiceInstantSpeed 闸口瞬时流速,米/秒(m/s)
     */
    public void setSsjmdSluiceInstantSpeed(BigDecimal ssjmdSluiceInstantSpeed) {
        this.ssjmdSluiceInstantSpeed = ssjmdSluiceInstantSpeed;
    }

    /**
     * 闸口瞬时流量,立方米/秒(m3/s)
     * @return ssjmd_sluice_instant_flow 闸口瞬时流量,立方米/秒(m3/s)
     */
    public BigDecimal getSsjmdSluiceInstantFlow() {
        return ssjmdSluiceInstantFlow;
    }

    /**
     * 闸口瞬时流量,立方米/秒(m3/s)
     * @param ssjmdSluiceInstantFlow 闸口瞬时流量,立方米/秒(m3/s)
     */
    public void setSsjmdSluiceInstantFlow(BigDecimal ssjmdSluiceInstantFlow) {
        this.ssjmdSluiceInstantFlow = ssjmdSluiceInstantFlow;
    }

    /**
     * 修改时间
     * @return ssjmd_modify_time 修改时间
     */
    public Date getSsjmdModifyTime() {
        return ssjmdModifyTime;
    }

    /**
     * 修改时间
     * @param ssjmdModifyTime 修改时间
     */
    public void setSsjmdModifyTime(Date ssjmdModifyTime) {
        this.ssjmdModifyTime = ssjmdModifyTime;
    }

    /**
     * 创建时间
     * @return ssjmd_create_time 创建时间
     */
    public Date getSsjmdCreateTime() {
        return ssjmdCreateTime;
    }

    /**
     * 创建时间
     * @param ssjmdCreateTime 创建时间
     */
    public void setSsjmdCreateTime(Date ssjmdCreateTime) {
        this.ssjmdCreateTime = ssjmdCreateTime;
    }
}