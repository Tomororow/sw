package com.zyjz.sysmanage.entity;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * @ClassName: SysDatabaseInfo
 * @Description: 数据提取连接信息实体
 * @Author: zhaojx
 * @Date: 2018年3月14日 上午10:30:41
 */
public class SysDatabaseInfo implements Serializable {
    private String id;

    private Integer systemCode;

    private String systemName;

    private String dbType;

    private String dbUrl;

    private String dbAddr;

    private String dbPort;

    private String dbUser;

    private String dbPwd;

    private String dbName;

    private String dbTableName;

    private String dbColumnName;

    private Date sdiCreateTime;

    private Date sdiEditTime;

    private String sdiRemark;

    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Integer getSystemCode() {
        return systemCode;
    }

    public void setSystemCode(Integer systemCode) {
        this.systemCode = systemCode;
    }

    public String getSystemName() {
        return systemName;
    }

    public void setSystemName(String systemName) {
        this.systemName = systemName == null ? null : systemName.trim();
    }

    public String getDbType() {
        return dbType;
    }

    public void setDbType(String dbType) {
        this.dbType = dbType == null ? null : dbType.trim();
    }

    public String getDbUrl() {
        return dbUrl;
    }

    public void setDbUrl(String dbUrl) {
        this.dbUrl = dbUrl == null ? null : dbUrl.trim();
    }

    public String getDbAddr() {
        return dbAddr;
    }

    public void setDbAddr(String dbAddr) {
        this.dbAddr = dbAddr == null ? null : dbAddr.trim();
    }

    public String getDbPort() {
        return dbPort;
    }

    public void setDbPort(String dbPort) {
        this.dbPort = dbPort == null ? null : dbPort.trim();
    }

    public String getDbUser() {
        return dbUser;
    }

    public void setDbUser(String dbUser) {
        this.dbUser = dbUser == null ? null : dbUser.trim();
    }

    public String getDbPwd() {
        return dbPwd;
    }

    public void setDbPwd(String dbPwd) {
        this.dbPwd = dbPwd == null ? null : dbPwd.trim();
    }

    public String getDbName() {
        return dbName;
    }

    public void setDbName(String dbName) {
        this.dbName = dbName == null ? null : dbName.trim();
    }

    public String getDbTableName() {
        return dbTableName;
    }

    public void setDbTableName(String dbTableName) {
        this.dbTableName = dbTableName == null ? null : dbTableName.trim();
    }

    public String getDbColumnName() {
        return dbColumnName;
    }

    public void setDbColumnName(String dbColumnName) {
        this.dbColumnName = dbColumnName == null ? null : dbColumnName.trim();
    }

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getSdiCreateTime() {
        return sdiCreateTime;
    }

    public void setSdiCreateTime(Date sdiCreateTime) {
        this.sdiCreateTime = sdiCreateTime;
    }

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getSdiEditTime() {
        return sdiEditTime;
    }

    public void setSdiEditTime(Date sdiEditTime) {
        this.sdiEditTime = sdiEditTime;
    }

    public String getSdiRemark() {
        return sdiRemark;
    }

    public void setSdiRemark(String sdiRemark) {
        this.sdiRemark = sdiRemark == null ? null : sdiRemark.trim();
    }
}