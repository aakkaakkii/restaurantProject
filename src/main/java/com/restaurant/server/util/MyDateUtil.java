package com.restaurant.server.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class MyDateUtil {
    public static Date getDate(Date currentTime){
        SimpleDateFormat df = getDayDateFormat();
        String stringifyDate = df.format(currentTime);
        return parseDate(df, stringifyDate);
    }

    public static Date getNextDay(Date currentTime){
        SimpleDateFormat df = getDayDateFormat();
        Calendar c = Calendar.getInstance();
        c.setTime(currentTime);
        c.add(Calendar.DATE, 1);  // number of days to add
        String stringifyDate = df.format(c.getTime());
        return parseDate(df, stringifyDate);

    }

    public static String getHouerMinute(Date currentTime){
        Calendar c = Calendar.getInstance();
        c.setTime(currentTime);

        return ""+c.get(Calendar.HOUR_OF_DAY)+":"+c.get(Calendar.MINUTE);
    }

    public static String formatDateNormal(Date date){
        return getDayDateFormat().format(date);
    }

    public static String formatDateLong(Date date){
        return getTimeDateFormat().format(date);
    }


    public static SimpleDateFormat getDayDateFormat(){
        return new SimpleDateFormat("yyyy-MM-dd");
    }

    public static SimpleDateFormat getTimeDateFormat(){
        return new SimpleDateFormat("yyyy-MM-dd HH:mm");
    }

    private static Date parseDate(SimpleDateFormat df, String stringifyDate){
        Date date = null;
        try {
            date = df.parse(stringifyDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }
}
