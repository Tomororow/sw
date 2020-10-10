package com.zyjz.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CommonMethodUtils {
    /**
     * 时间格式化
     * @param date 日期
     * @param type 类型
     * @return
     */
    public static int timeFormatter(Date date, String type){
        if("year".equals(type)){
            return Integer.parseInt(new SimpleDateFormat("yyyy").format(date));
        }
        if("month".equals(type)){
            return Integer.parseInt(new SimpleDateFormat("MM").format(date));
        }
        if("day".equals(type)){
            return Integer.parseInt(new SimpleDateFormat("dd").format(date));
        }
        if("hour".equals(type)){
            return Integer.parseInt(new SimpleDateFormat("HH").format(date));
        }
        return 0;
    }
}
