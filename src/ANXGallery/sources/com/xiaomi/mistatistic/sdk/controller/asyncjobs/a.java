package com.xiaomi.mistatistic.sdk.controller.asyncjobs;

import android.annotation.SuppressLint;
import android.content.Context;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.Environment;
import android.os.storage.StorageManager;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.xiaomi.mistatistic.sdk.BuildSetting;
import com.xiaomi.mistatistic.sdk.b;
import com.xiaomi.mistatistic.sdk.controller.LocalEventRecorder;
import com.xiaomi.mistatistic.sdk.controller.d;
import com.xiaomi.mistatistic.sdk.controller.g;
import com.xiaomi.mistatistic.sdk.controller.j;
import com.xiaomi.mistatistic.sdk.controller.m;
import com.xiaomi.mistatistic.sdk.controller.o;
import com.xiaomi.mistatistic.sdk.controller.t;
import java.util.GregorianCalendar;
import java.util.Locale;

/* compiled from: BasicInfoRecordJob */
public class a implements com.xiaomi.mistatistic.sdk.controller.e.a {
    private boolean a = false;

    public static void a() {
        try {
            Context a2 = d.a();
            if (!t.a(m.a(a2, "dau_time", 0)) && t.a(a2)) {
                LocalEventRecorder.insertEvent(new com.xiaomi.mistatistic.sdk.data.d("mistat_basic", "mistat_dau_dummy"));
                m.b(a2, "dau_time", System.currentTimeMillis());
            }
        } catch (Exception e) {
            j.a("addDauEventWhenForeground exception: ", (Throwable) e);
        }
    }

    private void a(Context context) {
        int i = new GregorianCalendar().get(6);
        if (i != m.a(context, "last_day", 0)) {
            m.b(context, "last_day", i);
            LocalEventRecorder.insertEvent(new com.xiaomi.mistatistic.sdk.data.d("mistat_basic", "mistat_dau"));
            a("ui_version", t.f("ro.miui.ui.version.name"));
            a("version", VERSION.INCREMENTAL);
            a("sd", d(context));
            String f = t.f("ro.miui.region");
            if (TextUtils.isEmpty(f)) {
                f = t.f("ro.product.locale.region");
            }
            a("region", f);
            a("carrier_name", t.f("ro.carrier.name"));
            if (!BuildSetting.isInternationalBuild() && !t.c()) {
                a("imei_md5", g.b(context));
                a("miui_imei_md5", t.b(t.f(context)));
                a("android_id_md5", t.b(t.c(context)));
                a("serial_num_md5", t.b(t.a()));
            }
            a("mcc", b());
            b(context);
            this.a = true;
        }
    }

    private static void a(String str, String str2) {
        if (!TextUtils.isEmpty(str2)) {
            LocalEventRecorder.insertEvent(new com.xiaomi.mistatistic.sdk.data.g("mistat_basic", str, str2));
        }
    }

    @SuppressLint({"InlinedApi"})
    private static boolean a(Context context, String str) {
        try {
            StorageManager storageManager = (StorageManager) context.getSystemService("storage");
            return "mounted".equals((String) storageManager.getClass().getMethod("getVolumeState", new Class[]{String.class}).invoke(storageManager, new Object[]{str}));
        } catch (Throwable th) {
            j.a("isStorageMounted exception", th);
        }
    }

    private String b() {
        String f = t.f("ril.limit_service_mnc");
        String f2 = t.f("ril.limit_service_mcc");
        if (!TextUtils.isEmpty(f) && f.length() >= 3) {
            String substring = f.substring(f.length() - 3, f.length());
            try {
                Integer.parseInt(substring);
                return substring;
            } catch (NumberFormatException e) {
                j.a("network_mcc exception", (Throwable) e);
            }
        } else if (!TextUtils.isEmpty(f2) && f2.length() == 3) {
            try {
                Integer.parseInt(f2);
                return f2;
            } catch (NumberFormatException e2) {
                j.a("mcc_mtk exception", (Throwable) e2);
            }
        }
        return "";
    }

    private void b(Context context) {
        com.xiaomi.mistatistic.sdk.data.g gVar = t.d(context) ? BuildSetting.isUserExperienceProgramEnabled(context) ? new com.xiaomi.mistatistic.sdk.data.g("mistat_basic", "UEP", "yes") : new com.xiaomi.mistatistic.sdk.data.g("mistat_basic", "UEP", "no") : new com.xiaomi.mistatistic.sdk.data.g("mistat_basic", "UEP", "not_miui");
        LocalEventRecorder.insertEvent(gVar);
    }

    @SuppressLint({"NewApi"})
    private void c(Context context) {
        StringBuilder sb;
        LocalEventRecorder.insertEvent(new com.xiaomi.mistatistic.sdk.data.d("mistat_basic", "new"));
        LocalEventRecorder.insertEvent(new com.xiaomi.mistatistic.sdk.data.g("mistat_basic", "model", Build.MODEL));
        StringBuilder sb2 = new StringBuilder();
        sb2.append("android");
        sb2.append(VERSION.SDK_INT);
        LocalEventRecorder.insertEvent(new com.xiaomi.mistatistic.sdk.data.g("mistat_basic", "OS", sb2.toString()));
        TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService("phone");
        if (!TextUtils.isEmpty(telephonyManager.getNetworkOperatorName())) {
            LocalEventRecorder.insertEvent(new com.xiaomi.mistatistic.sdk.data.g("mistat_basic", "operator", telephonyManager.getSimOperator()));
        }
        if (!BuildSetting.isInternationalBuild() && !t.c()) {
            a("device_id", g.a(context));
            a("imei_md5", g.b(context));
            a("android_id_md5", t.b(t.c(context)));
            a("serial_num_md5", t.b(t.a()));
            a("mac_md5", t.b(context));
        }
        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
        if (displayMetrics != null) {
            int i = displayMetrics.widthPixels;
            int i2 = displayMetrics.heightPixels;
            if (i < i2) {
                sb = new StringBuilder();
                sb.append(i);
                sb.append("x");
                sb.append(i2);
            } else {
                sb = new StringBuilder();
                sb.append(i2);
                sb.append("x");
                sb.append(i);
            }
            LocalEventRecorder.insertEvent(new com.xiaomi.mistatistic.sdk.data.g("mistat_basic", "resolution", sb.toString()));
        }
        a("locale", Locale.getDefault().toString());
        a("device_name", t.f("ro.product.mod_device"));
        a("real_model", t.f("ro.product.model.real"));
        a("channel", t.f("ro.sys.miui_rom_channel_id"));
        if (t.d(context)) {
            try {
                a("mi", Class.forName("miui.os.Build").getField("IS_INTERNATIONAL_BUILD").getBoolean(null) ? "1" : MovieStatUtils.DOWNLOAD_SUCCESS);
            } catch (Exception e) {
                j.a("get IS_INTERNATIONAL_BUILD exception", (Throwable) e);
            }
            try {
                Class cls = Class.forName("miui.os.Build");
                String str = cls.getField("IS_ALPHA_BUILD").getBoolean(null) ? "A" : cls.getField("IS_DEVELOPMENT_VERSION").getBoolean(null) ? "D" : "S";
                a("bc", str);
            } catch (Exception e2) {
                j.a("get build version exception", (Throwable) e2);
            }
        }
    }

    private static String d(Context context) {
        String str = MovieStatUtils.DOWNLOAD_SUCCESS;
        try {
            String absolutePath = Environment.getExternalStorageDirectory().getAbsolutePath();
            String str2 = System.getenv("SECONDARY_STORAGE");
            if (TextUtils.isEmpty(str2)) {
                return str;
            }
            return (!a(context, str2) || str2.equals(absolutePath)) ? "2" : "1";
        } catch (Throwable th) {
            j.a("getExternalStorageState exception", th);
            return str;
        }
    }

    public void execute() {
        try {
            Context a2 = d.a();
            a(a2);
            if (!m.b(a2, "basic_info_reported")) {
                c(a2);
                m.b(a2, "basic_info_reported", 1);
                this.a = true;
            }
            String e = d.e();
            String a3 = m.a(a2, "basic_info_version", "");
            if (!TextUtils.isEmpty(a3) && !a3.equals(e)) {
                b.c();
                LocalEventRecorder.insertEvent(new com.xiaomi.mistatistic.sdk.data.d("mistat_basic", "upgrade"));
            }
            m.b(a2, "basic_info_version", e);
            if (this.a) {
                new o(2).a();
            }
        } catch (Exception e2) {
            j.a("BasicInfoRecordJob.execute exception", (Throwable) e2);
        }
    }
}
