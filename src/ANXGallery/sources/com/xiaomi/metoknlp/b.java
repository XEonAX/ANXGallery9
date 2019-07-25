package com.xiaomi.metoknlp;

import com.xiaomi.metoknlp.a.e;
import com.xiaomi.metoknlp.a.f;
import java.util.HashMap;
import java.util.Map;

/* compiled from: CloudClient */
public final class b {
    private static String G;

    public static String a(String str, String str2) {
        String str3;
        String Z = f.Z();
        String w = w();
        if (w == null) {
            return null;
        }
        StringBuffer stringBuffer = new StringBuffer(Z);
        stringBuffer.append("/base/profile");
        stringBuffer.append("/");
        stringBuffer.append("metoknlpsdk");
        stringBuffer.append("/");
        stringBuffer.append(str);
        stringBuffer.append("/");
        stringBuffer.append(w);
        stringBuffer.append("__");
        stringBuffer.append(str2);
        String stringBuffer2 = stringBuffer.toString();
        Map x = x();
        try {
            str3 = com.xiaomi.metoknlp.a.b.a(stringBuffer2, x);
        } catch (Exception unused) {
            str3 = null;
        }
        x.clear();
        return str3;
    }

    private static String w() {
        String deviceModel = e.getDeviceModel();
        String V = e.V();
        String X = e.X();
        int mcc = e.getMcc();
        int mnc = e.getMnc();
        if (deviceModel == null || deviceModel.isEmpty() || V == null || V.isEmpty()) {
            return null;
        }
        if (mcc < 0 || mnc < 0) {
            mcc = 999;
            mnc = 99;
        }
        return String.format("%s__%s__%d__%d__%s", new Object[]{deviceModel, V, Integer.valueOf(mcc), Integer.valueOf(mnc), X});
    }

    private static Map x() {
        String w = w();
        HashMap hashMap = new HashMap();
        if (G == null) {
            String imei = e.getImei();
            if (imei == null || imei.isEmpty()) {
                return null;
            }
            String p = e.p(imei);
            if (p != null) {
                G = p;
            }
            if (G == null) {
                return null;
            }
        }
        hashMap.put("CCPVER", G);
        hashMap.put("CCPINF", w);
        return hashMap;
    }
}
