package com.miui.gallery.picker.helper;

import android.text.TextUtils;
import com.miui.gallery.provider.ShareMediaManager;

public class PickerSqlHelper {
    public static String buildPickerResultQuery(String[] strArr, String str, String[] strArr2, String str2, String str3) {
        if (strArr != null) {
            StringBuilder sb = new StringBuilder();
            sb.append("SELECT * FROM(");
            sb.append(buildQueryInTable("cloud", strArr, str, strArr2));
            sb.append(" UNION ");
            sb.append(buildQueryInTable(ShareMediaManager.getShareMediaTable(), strArr, str, strArr2));
            sb.append(")");
            if (!TextUtils.isEmpty(str2)) {
                sb.append(" GROUP BY ");
                sb.append(str2);
            }
            if (!TextUtils.isEmpty(str3)) {
                sb.append(" ORDER BY ");
                sb.append(str3);
            }
            return sb.toString();
        }
        throw new IllegalArgumentException("projection can not be null");
    }

    private static String buildQueryInTable(String str, String[] strArr, String str2, String[] strArr2) {
        StringBuilder sb = new StringBuilder();
        String join = TextUtils.join(",", strArr);
        sb.append("SELECT ");
        sb.append(join);
        sb.append(" FROM ");
        sb.append(str);
        if (!TextUtils.isEmpty(str2)) {
            if (strArr2 != null && strArr2.length > 0) {
                str2 = String.format(str2, (Object[]) strArr2);
            }
            sb.append(" WHERE ");
            sb.append(str2);
        }
        return sb.toString();
    }
}
