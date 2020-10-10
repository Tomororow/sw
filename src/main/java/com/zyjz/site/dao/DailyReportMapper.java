package com.zyjz.site.dao;

import com.zyjz.site.entity.DailyReport;

public interface DailyReportMapper {
    int insert(DailyReport record);

    int insertSelective(DailyReport record);
    
    int insertreport();
}