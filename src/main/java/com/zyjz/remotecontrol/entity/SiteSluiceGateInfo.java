package com.zyjz.remotecontrol.entity;

import java.math.BigDecimal;
import java.util.Date;

public class SiteSluiceGateInfo {
    /**  id */
    private String id;

    /** 闸门编码 ssgi_sluice_gate_code */
    private String ssgiSluiceGateCode;

    /** 闸门名称 ssgi_sluice_gate_name */
    private String ssgiSluiceGateName;

    /** 闸门站id ssgi_sluice_info_id */
    private String ssgiSluiceInfoId;

    /** 闸门站名称 ssgi_sluice_info_name */
    private String ssgiSluiceInfoName;

    /** 闸门宽度 ssgi_sluice_width */
    private BigDecimal ssgiSluiceWidth;

    /** 闸门高度 ssgi_sluice_height */
    private BigDecimal ssgiSluiceHeight;

    /** 闸门质量 ssgi_sluice_weight */
    private BigDecimal ssgiSluiceWeight;

    /** 闸门启闭类型 ssgi_sluice_type_code */
    private String ssgiSluiceTypeCode;

    /** 闸门启闭类型 ssgiSluiceTypeName:关联表 */
    private String ssgiSluiceTypeName;

    /** 闸门电动机功率 ssgi_sluice_motor_power */
    private BigDecimal ssgiSluiceMotorPower;

    /** 关联视频站id ssgi_sluice_movie_id */
    private String ssgiSluiceMovieId;

    /** 远程提闸webSocket地址 ssgi_sluice_socket_url */
    private String ssgiSluiceSocketUrl;

    /** AES加密秘钥  ssgi_secret_key*/
    private String ssgiSecretKey;

    /** 创建时间 ssgi_create_time */
    private Date ssgiCreateTime;

    /**
     * 视频的个数
     */
    private Integer videoLength;

    private SiteSluiceJzMiddDevice siteSluiceJzMiddDevice;

    /** 闸门启闭类型表 */
    /** 闸门启闭类型名称,填写代码对应名称 sluice_type_name */
    private String sluiceTypeName;

    /**
     *
     * @return id
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
     * 闸门编码
     * @return ssgi_sluice_gate_code 闸门编码
     */
    public String getSsgiSluiceGateCode() {
        return ssgiSluiceGateCode;
    }

    /**
     * 闸门编码
     * @param ssgiSluiceGateCode 闸门编码
     */
    public void setSsgiSluiceGateCode(String ssgiSluiceGateCode) {
        this.ssgiSluiceGateCode = ssgiSluiceGateCode == null ? null : ssgiSluiceGateCode.trim();
    }

    /**
     * 闸门名称
     * @return ssgi_sluice_gate_name 闸门名称
     */
    public String getSsgiSluiceGateName() {
        return ssgiSluiceGateName;
    }

    /**
     * 闸门名称
     * @param ssgiSluiceGateName 闸门名称
     */
    public void setSsgiSluiceGateName(String ssgiSluiceGateName) {
        this.ssgiSluiceGateName = ssgiSluiceGateName == null ? null : ssgiSluiceGateName.trim();
    }

    /**
     * 闸门站id
     * @return ssgi_sluice_info_id 闸门站id
     */
    public String getSsgiSluiceInfoId() {
        return ssgiSluiceInfoId;
    }

    /**
     * 闸门站id
     * @param ssgiSluiceInfoId 闸门站id
     */
    public void setSsgiSluiceInfoId(String ssgiSluiceInfoId) {
        this.ssgiSluiceInfoId = ssgiSluiceInfoId == null ? null : ssgiSluiceInfoId.trim();
    }

    /**
     * 闸门站名称
     * @return ssgi_sluice_info_name 闸门站名称
     */
    public String getSsgiSluiceInfoName() {
        return ssgiSluiceInfoName;
    }

    /**
     * 闸门站名称
     * @param ssgiSluiceInfoName 闸门站名称
     */
    public void setSsgiSluiceInfoName(String ssgiSluiceInfoName) {
        this.ssgiSluiceInfoName = ssgiSluiceInfoName == null ? null : ssgiSluiceInfoName.trim();
    }
    /**
     * 闸门宽度
     * @return ssgi_sluice_width 闸门宽度
     */
    public BigDecimal getSsgiSluiceWidth() {
        return ssgiSluiceWidth;
    }

    /**
     * 闸门宽度
     * @param ssgiSluiceWidth 闸门宽度
     */
    public void setSsgiSluiceWidth(BigDecimal ssgiSluiceWidth) {
        this.ssgiSluiceWidth = ssgiSluiceWidth;
    }

    /**
     * 闸门高度
     * @return ssgi_sluice_height 闸门高度
     */
    public BigDecimal getSsgiSluiceHeight() {
        return ssgiSluiceHeight;
    }

    /**
     * 闸门高度
     * @param ssgiSluiceHeight 闸门高度
     */
    public void setSsgiSluiceHeight(BigDecimal ssgiSluiceHeight) {
        this.ssgiSluiceHeight = ssgiSluiceHeight;
    }

    /**
     * 闸门质量
     * @return ssgi_sluice_weight 闸门质量
     */
    public BigDecimal getSsgiSluiceWeight() {
        return ssgiSluiceWeight;
    }

    /**
     * 闸门质量
     * @param ssgiSluiceWeight 闸门质量
     */
    public void setSsgiSluiceWeight(BigDecimal ssgiSluiceWeight) {
        this.ssgiSluiceWeight = ssgiSluiceWeight;
    }

    /**
     * 闸门启闭类型
     * @return ssgi_sluice_type_code 闸门启闭类型
     */
    public String getSsgiSluiceTypeCode() {
        return ssgiSluiceTypeCode;
    }

    /**
     * 闸门启闭类型
     * @param ssgiSluiceTypeCode 闸门启闭类型
     */
    public void setSsgiSluiceTypeCode(String ssgiSluiceTypeCode) {
        this.ssgiSluiceTypeCode = ssgiSluiceTypeCode == null ? null : ssgiSluiceTypeCode.trim();
    }

    public String getSsgiSluiceTypeName() {
        return ssgiSluiceTypeName;
    }

    public void setSsgiSluiceTypeName(String ssgiSluiceTypeName) {
        this.ssgiSluiceTypeName = ssgiSluiceTypeName;
    }

    /**
     * 闸门电动机功率
     * @return ssgi_sluice_motor_power 闸门电动机功率
     */
    public BigDecimal getSsgiSluiceMotorPower() {
        return ssgiSluiceMotorPower;
    }

    /**
     * 闸门电动机功率
     * @param ssgiSluiceMotorPower 闸门电动机功率
     */
    public void setSsgiSluiceMotorPower(BigDecimal ssgiSluiceMotorPower) {
        this.ssgiSluiceMotorPower = ssgiSluiceMotorPower;
    }

    /**
     * 关联视频站id
     * @return ssgi_sluice_movie_id 关联视频站id
     */
    public String getSsgiSluiceMovieId() {
        return ssgiSluiceMovieId;
    }

    /**
     * 关联视频站id
     * @param ssgiSluiceMovieId 关联视频站id
     */
    public void setSsgiSluiceMovieId(String ssgiSluiceMovieId) {
        this.ssgiSluiceMovieId = ssgiSluiceMovieId == null ? null : ssgiSluiceMovieId.trim();
    }

    public String getSsgiSluiceSocketUrl() {
        return ssgiSluiceSocketUrl;
    }

    public void setSsgiSluiceSocketUrl(String ssgiSluiceSocketUrl) {
        this.ssgiSluiceSocketUrl = ssgiSluiceSocketUrl;
    }

    public String getSsgiSecretKey() {
        return ssgiSecretKey;
    }

    public void setSsgiSecretKey(String ssgiSecretKey) {
        this.ssgiSecretKey = ssgiSecretKey;
    }

    /**
     * 创建时间
     * @return ssgi_create_time 创建时间
     */
    public Date getSsgiCreateTime() {
        return ssgiCreateTime;
    }

    /**
     * 创建时间
     * @param ssgiCreateTime 创建时间
     */
    public void setSsgiCreateTime(Date ssgiCreateTime) {
        this.ssgiCreateTime = ssgiCreateTime;
    }

    public SiteSluiceJzMiddDevice getSiteSluiceJzMiddDevice() {
        return siteSluiceJzMiddDevice;
    }

    public void setSiteSluiceJzMiddDevice(SiteSluiceJzMiddDevice siteSluiceJzMiddDevice) {
        this.siteSluiceJzMiddDevice = siteSluiceJzMiddDevice;
    }

    public String getSluiceTypeName() {
        return sluiceTypeName;
    }

    public void setSluiceTypeName(String sluiceTypeName) {
        this.sluiceTypeName = sluiceTypeName;
    }

    public Integer getVideoLength() {
        return videoLength;
    }

    public void setVideoLength(Integer videoLength) {
        this.videoLength = videoLength;
    }
}