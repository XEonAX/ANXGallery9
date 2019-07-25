package com.miui.gallery.util.deprecated;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.preference.PreferenceManager;
import com.miui.gallery.preference.BaseGalleryPreferences.PrefKeys;
import com.miui.gallery.util.StaticContext;

public class BaseDeprecatedPreference {
    private static SharedPreferences getDefaultPreferences(Context context) {
        return PreferenceManager.getDefaultSharedPreferences(context);
    }

    public static boolean sCanConnectNetworkByImpunity() {
        return sGetDefaultPreferences().getBoolean(PrefKeys.CTA_CAN_CONNECT_NETWORK_BY_IMPUNITY, false);
    }

    protected static Editor sGetDefaultEditor() {
        return sGetDefaultPreferences().edit();
    }

    public static SharedPreferences sGetDefaultPreferences() {
        return getDefaultPreferences(StaticContext.sGetAndroidContext());
    }
}
