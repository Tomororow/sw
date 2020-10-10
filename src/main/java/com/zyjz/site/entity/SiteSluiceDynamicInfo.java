package com.zyjz.site.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;

public class SiteSluiceDynamicInfo {

    /** 主键标识, uuid id */
    private String id;

    /** 所属闸门站id ssdi_device_sluice_id */
    private String ssdiDeviceSluiceId;

    /** 所属闸门站编码,普通索引,外键,关联闸门站基础信息表 devicesluice_code */
    private String devicesluiceCode;

    /** 所属闸门编码 ssdi_sluice_gate_code */
    private String ssdiSluiceGateCode;

    /** 闸门水文信息采集时间 ssdi_collect_time */
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date ssdiCollectTime;

    /** 设备网络状态,0:离线,1:在线 ssdi_net_state */
    private Integer ssdiNetState;

    /** 闸前实时水位,单位米 before_water_level */
    private BigDecimal beforeWaterLevel;

    /** 闸后实时水位,单位米 after_water_level */
    private BigDecimal afterWaterLevel;

    /** 闸口瞬时流速,米/秒(m/s) sluice_instant_speed */
    private BigDecimal sluiceInstantSpeed;

    /** 闸口瞬时流量,立方米/秒(m3/s) sluice_instant_flow */
    private BigDecimal sluiceInstantFlow;

    /** 瞬时流量 instant_traffic */
    private BigDecimal instantTraffic;

    /** 累计流量 cumulative_traffic */
    private BigDecimal cumulativeTraffic;

    /** 闸门开度,单位米 sluice_height */
    private BigDecimal sluiceHeight;

    /** 闸门荷重A gate_loadA */
    private BigDecimal gateLoada;

    /** 闸门荷重B gate_loadB */
    private BigDecimal gateLoadb;

    /** 闸门手自动 automatic */
    private Integer automatic;

    /** 实时数据创建时间 ssdi_create_time */
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date ssdiCreateTime;

    //闸门站基础信息表字段
    //闸门站名称
    private String deviceSluiceName;
    //闸门站关联视频站id
    private String sluiceMovieSiteId;

    //其他字段
    //累计流量
    private BigDecimal sumFlow;
    //闸门名称
    private String ssgiSluiceGateName;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }


    /**
     * 所属闸门站id
     * @return ssdi_device_sluice_id 所属闸门站id
     */
    public String getSsdiDeviceSluiceId() {
        return ssdiDeviceSluiceId;
    }

    /**
     * 所属闸门站id
     * @param ssdiDeviceSluiceId 所属闸门站id
     */
    public void setSsdiDeviceSluiceId(String ssdiDeviceSluiceId) {
        this.ssdiDeviceSluiceId = ssdiDeviceSluiceId == null ? null : ssdiDeviceSluiceId.trim();
    }

    /**
     * 所属闸门站编码,普通索引,外键,关联闸门站基础信息表
     * @return devicesluice_code 所属闸门站编码,普通索引,外键,关联闸门站基础信息表
     */
    public String getDevicesluiceCode() {
        return devicesluiceCode;
    }

    /**
     * 所属闸门站编码,普通索引,外键,关联闸门站基础信息表
     * @param devicesluiceCode 所属闸门站编码,普通索引,外键,关联闸门站基础信息表
     */
    public void setDevicesluiceCode(String devicesluiceCode) {
        this.devicesluiceCode = devicesluiceCode == null ? null : devicesluiceCode.trim();
    }

    /**
     * 所属闸门编码
     * @return ssdi_sluice_gate_code 所属闸门编码
     */
    public String getSsdiSluiceGateCode() {
        return ssdiSluiceGateCode;
    }

    /**
     * 所属闸门编码
     * @param ssdiSluiceGateCode 所属闸门编码
     */
    public void setSsdiSluiceGateCode(String ssdiSluiceGateCode) {
        this.ssdiSluiceGateCode = ssdiSluiceGateCode == null ? null : ssdiSluiceGateCode.trim();
    }

    /**
     * 闸门水文信息采集时间
     * @return ssdi_collect_time 闸门水文信息采集时间
     */
    public Date getSsdiCollectTime() {
        return ssdiCollectTime;
    }

    /**
     * 闸门水文信息采集时间
     * @param ssdiCollectTime 闸门水文信息采集时间
     */
    public void setSsdiCollectTime(Date ssdiCollectTime) {
        this.ssdiCollectTime = ssdiCollectTime;
    }

    /**
     * 设备网络状态,0:离线,1:在线
     * @return ssdi_net_state 设备网络状态,0:离线,1:在线
     */
    public Integer getSsdiNetState() {
        return ssdiNetState;
    }

    /**
     * 设备网络状态,0:离线,1:在线
     * @param ssdiNetState 设备网络状态,0:离线,1:在线
     */
    public void setSsdiNetState(Integer ssdiNetState) {
        this.ssdiNetState = ssdiNetState;
    }

    /**
     * 闸前实时水位,单位米
     * @return before_water_level 闸前实时水位,单位米
     */
    public BigDecimal getBeforeWaterLevel() {
        return beforeWaterLevel;
    }

    /**
     * 闸前实时水位,单位米
     * @param beforeWaterLevel 闸前实时水位,单位米
     */
    public void setBeforeWaterLevel(BigDecimal beforeWaterLevel) {
        this.beforeWaterLevel = beforeWaterLevel;
    }

    /**
     * 闸后实时水位,单位米
     * @return after_water_level 闸后实时水位,单位米
     */
    public BigDecimal getAfterWaterLevel() {
        return afterWaterLevel;
    }

    /**
     * 闸后实时水位,单位米
     * @param afterWaterLevel 闸后实时水位,单位米
     */
    public void setAfterWaterLevel(BigDecimal afterWaterLevel) {
        this.afterWaterLevel = afterWaterLevel;
    }

    /**
     * 闸口瞬时流速,米/秒(m/s)
     * @return sluice_instant_speed 闸口瞬时流速,米/秒(m/s)
     */
    public BigDecimal getSluiceInstantSpeed() {
        return sluiceInstantSpeed;
    }

    /**
     * 闸口瞬时流速,米/秒(m/s)
     * @param sluiceInstantSpeed 闸口瞬时流速,米/秒(m/s)
     */
    public void setSluiceInstantSpeed(BigDecimal sluiceInstantSpeed) {
        this.sluiceInstantSpeed = sluiceInstantSpeed;
    }

    /**
     * 闸口瞬时流量,立方米/秒(m3/s)
     * @return sluice_instant_flow 闸口瞬时流量,立方米/秒(m3/s)
     */
    public BigDecimal getSluiceInstantFlow() {
        return sluiceInstantFlow;
    }

    /**
     * 闸口瞬时流量,立方米/秒(m3/s)
     * @param sluiceInstantFlow 闸口瞬时流量,立方米/秒(m3/s)
     */
    public void setSluiceInstantFlow(BigDecimal sluiceInstantFlow) {
        this.sluiceInstantFlow = sluiceInstantFlow;
    }

    /**
     * 瞬时流量
     * @return instant_traffic 瞬时流量
     */
    public BigDecimal getInstantTraffic() {
        return instantTraffic;
    }

    /**
     * 瞬时流量
     * @param instantTraffic 瞬时流量
     */
    public void setInstantTraffic(BigDecimal instantTraffic) {
        this.instantTraffic = instantTraffic;
    }

    /**
     * 累计流量
     * @return cumulative_traffic 累计流量
     */
    public BigDecimal getCumulativeTraffic() {
        return cumulativeTraffic;
    }

    /**
     * 累计流量
     * @param cumulativeTraffic 累计流量
     */
    public void setCumulativeTraffic(BigDecimal cumulativeTraffic) {
        this.cumulativeTraffic = cumulativeTraffic;
    }

    /**
     * 闸门开度,单位米
     * @return sluice_height 闸门开度,单位米
     */
    public BigDecimal getSluiceHeight() {
        return sluiceHeight;
    }

    /**
     * 闸门开度,单位米
     * @param sluiceHeight 闸门开度,单位米
     */
    public void setSluiceHeight(BigDecimal sluiceHeight) {
        this.sluiceHeight = sluiceHeight;
    }

    /**
     * 闸门荷重A
     * @return gate_loadA 闸门荷重A
     */
    public BigDecimal getGateLoada() {
        return gateLoada;
    }

    /**
     * 闸门荷重A
     * @param gateLoada 闸门荷重A
     */
    public void setGateLoada(BigDecimal gateLoada) {
        this.gateLoada = gateLoada;
    }

    /**
     * 闸门荷重B
     * @return gate_loadB 闸门荷重B
     */
    public BigDecimal getGateLoadb() {
        return gateLoadb;
    }

    /**
     * 闸门荷重B
     * @param gateLoadb 闸门荷重B
     */
    public void setGateLoadb(BigDecimal gateLoadb) {
        this.gateLoadb = gateLoadb;
    }

    /**
     * 闸门手自动
     * @return automatic 闸门手自动
     */
    public Integer getAutomatic() {
        return automatic;
    }

    /**
     * 闸门手自动
     * @param automatic 闸门手自动
     */
    public void setAutomatic(Integer automatic) {
        this.automatic = automatic;
    }

    /**
     * 实时数据创建时间
     * @return ssdi_create_time 实时数据创建时间
     */
    public Date getSsdiCreateTime() {
        return ssdiCreateTime;
    }

    /**
     * 实时数据创建时间
     * @param ssdiCreateTime 实时数据创建时间
     */
    public void setSsdiCreateTime(Date ssdiCreateTime) {
        this.ssdiCreateTime = ssdiCreateTime;
    }


    public String getDeviceSluiceName() {
        return deviceSluiceName;
    }

    public void setDeviceSluiceName(String deviceSluiceName) {
        this.deviceSluiceName = deviceSluiceName;
    }

    public String getSluiceMovieSiteId() {
        return sluiceMovieSiteId;
    }

    public void setSluiceMovieSiteId(String sluiceMovieSiteId) {
        this.sluiceMovieSiteId = sluiceMovieSiteId;
    }

    public BigDecimal getSumFlow() {
        return sumFlow;
    }

    public void setSumFlow(BigDecimal sumFlow) {
        this.sumFlow = sumFlow;
    }

    public String getSsgiSluiceGateName() {
        return ssgiSluiceGateName;
    }

    public void setSsgiSluiceGateName(String ssgiSluiceGateName) {
        this.ssgiSluiceGateName = ssgiSluiceGateName;
    }
}