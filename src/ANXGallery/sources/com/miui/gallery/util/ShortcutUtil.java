package com.miui.gallery.util;

import android.content.Context;
import android.content.Intent;
import android.content.Intent.ShortcutIconResource;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutInfo.Builder;
import android.content.pm.ShortcutManager;
import android.graphics.Bitmap;
import android.graphics.drawable.Icon;
import android.os.Build.VERSION;
import android.text.TextUtils;
import com.android.internal.SystemPropertiesCompat;
import java.util.List;

public class ShortcutUtil {
    public static void createShortcut(Context context, String str, String str2, Bitmap bitmap, int i, Intent intent) {
        if (VERSION.SDK_INT < 26) {
            Intent intent2 = new Intent("com.android.launcher.action.INSTALL_SHORTCUT");
            intent2.setPackage(SystemPropertiesCompat.get("ro.miui.product.home", "com.miui.home"));
            intent2.putExtra("duplicate", false);
            intent2.putExtra("android.intent.extra.shortcut.NAME", str2);
            if (bitmap != null) {
                intent2.putExtra("android.intent.extra.shortcut.ICON", bitmap);
            } else {
                intent2.putExtra("android.intent.extra.shortcut.ICON_RESOURCE", ShortcutIconResource.fromContext(context, i));
            }
            intent2.putExtra("android.intent.extra.shortcut.INTENT", intent);
            context.sendBroadcast(intent2);
        } else {
            try {
                ShortcutManager shortcutManager = (ShortcutManager) context.getApplicationContext().getSystemService(ShortcutManager.class);
                if (shortcutManager.isRequestPinShortcutSupported()) {
                    List<ShortcutInfo> pinnedShortcuts = shortcutManager.getPinnedShortcuts();
                    if (MiscUtil.isValid(pinnedShortcuts)) {
                        for (ShortcutInfo id : pinnedShortcuts) {
                            if (TextUtils.equals(id.getId(), str)) {
                                return;
                            }
                        }
                    }
                    shortcutManager.requestPinShortcut(new Builder(context, str).setIcon(bitmap != null ? Icon.createWithBitmap(bitmap) : Icon.createWithResource(context, i)).setShortLabel(str2).setIntent(intent).build(), null);
                }
            } catch (Exception e) {
                Log.e("ShortcutUtil", "createShortcut error.\n", (Object) e);
            }
        }
    }
}
