package com.oioi77.cims.util.datautil;

import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

/**
 * 数据转换工具类
 */
public class DataUtils {

    /**
     * 字符串转日期类型
     * @return
     */
    public static Date stringToDate(String date){
        LocalDate localDate = LocalDate.parse(date);
        ZoneId zone = ZoneId.systemDefault();
        Instant instant1 = localDate.atStartOfDay().atZone(zone).toInstant();
        return Date.from(instant1);

    }
}
