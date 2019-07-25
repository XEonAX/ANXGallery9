package com.miui.gallery.data;

import android.content.Context;
import android.text.TextUtils;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.miui.gallery.util.Log;

public class LocationUtil {
    private static int INT_COORDINATE_FACTOR = 1000000;

    public static String convertDoubleToLaLon(double d) {
        long j = (long) d;
        double d2 = (double) j;
        Double.isNaN(d2);
        double d3 = d - d2;
        long j2 = (long) (d3 * 60.0d);
        double d4 = (double) j2;
        Double.isNaN(d4);
        long round = Math.round((d3 - (d4 / 60.0d)) * 3600.0d * 1.0E7d);
        StringBuilder sb = new StringBuilder();
        sb.append(j);
        sb.append("/1,");
        sb.append(j2);
        sb.append("/1,");
        sb.append(round);
        sb.append("/10000000");
        return sb.toString();
    }

    public static int convertIntLat(double d) {
        double d2 = (double) INT_COORDINATE_FACTOR;
        Double.isNaN(d2);
        return (int) (d * d2);
    }

    public static double convertRationalLatLonToDouble(String str, String str2) {
        if (TextUtils.isEmpty(str)) {
            return 0.0d;
        }
        try {
            String[] split = str.split(",");
            String[] split2 = split[0].split("/");
            double parseDouble = Double.parseDouble(split2[0].trim()) / Double.parseDouble(split2[1].trim());
            String[] split3 = split[1].split("/");
            double parseDouble2 = Double.parseDouble(split3[0].trim()) / Double.parseDouble(split3[1].trim());
            String[] split4 = split[2].split("/");
            double parseDouble3 = parseDouble + (parseDouble2 / 60.0d) + ((Double.parseDouble(split4[0].trim()) / Double.parseDouble(split4[1].trim())) / 3600.0d);
            return (TextUtils.isEmpty(str2) || (!str2.equals("S") && !str2.equals("W"))) ? parseDouble3 : -parseDouble3;
        } catch (NumberFormatException unused) {
            return 0.0d;
        } catch (ArrayIndexOutOfBoundsException unused2) {
            return 0.0d;
        }
    }

    public static String getCityNameFromRes(Context context, String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("cityname_");
        sb.append(str);
        int identifier = context.getResources().getIdentifier(sb.toString(), "string", context.getPackageName());
        if (identifier != 0) {
            return context.getResources().getString(identifier);
        }
        Log.e("LocationUtil", "cannot find a res id for %s", (Object) str);
        return null;
    }

    public static boolean isLocationValidate(String str) {
        return !TextUtils.isEmpty(str) && !MovieStatUtils.DOWNLOAD_FAILED.equals(str) && !"-2".equals(str);
    }

    public static boolean isValidateCoordinate(double d, double d2) {
        return (d == 0.0d || d2 == 0.0d) ? false : true;
    }
}
