package com.miui.gallery.video.editor.util;

import android.content.Intent;
import android.net.Uri;

public class IntentUtil {
    public static Intent makeMarketIntent(String str, boolean z) {
        StringBuilder sb = new StringBuilder();
        sb.append("market://details?");
        sb.append("id=");
        sb.append(str);
        sb.append("&");
        sb.append("back=");
        sb.append(z);
        return new Intent("android.intent.action.VIEW", Uri.parse(sb.toString()));
    }
}
