package com.nexstreaming.nexeditorsdk;

import android.content.Context;
import android.graphics.Bitmap;
import com.nexstreaming.app.common.nexasset.assetpackage.ItemCategory;
import com.nexstreaming.app.common.nexasset.assetpackage.ItemType;
import com.nexstreaming.app.common.nexasset.assetpackage.c;
import com.nexstreaming.app.common.nexasset.assetpackage.e;
import com.nexstreaming.app.common.nexasset.assetpackage.f;
import com.nexstreaming.kminternal.kinemaster.config.a;
import java.io.IOException;
import java.util.ArrayList;

public final class nexOverlayPreset {
    private static String TAG = "OverlayPresetLoad";
    private static nexOverlayPreset sSingleton;

    nexOverlayPreset(Context context) {
    }

    public static nexOverlayPreset getOverlayPreset() {
        return sSingleton;
    }

    public static nexOverlayPreset getOverlayPreset(Context context) {
        if (sSingleton == null) {
            sSingleton = new nexOverlayPreset(context);
        }
        return sSingleton;
    }

    public String[] getIDs() {
        ArrayList arrayList = new ArrayList();
        for (f fVar : c.a().a(ItemCategory.overlay)) {
            if (!fVar.isHidden() && fVar.getType() == ItemType.overlay) {
                arrayList.add(fVar.getId());
            }
        }
        String[] strArr = new String[arrayList.size()];
        for (int i = 0; i < strArr.length; i++) {
            strArr[i] = (String) arrayList.get(i);
        }
        return strArr;
    }

    public String[] getIDs(int i) {
        ArrayList arrayList = new ArrayList();
        for (f fVar : c.a().c(i)) {
            if (!fVar.isHidden() && fVar.getCategory() == ItemCategory.overlay && fVar.getType() == ItemType.overlay) {
                arrayList.add(fVar.getId());
            }
        }
        String[] strArr = new String[arrayList.size()];
        for (int i2 = 0; i2 < strArr.length; i2++) {
            strArr[i2] = (String) arrayList.get(i2);
        }
        return strArr;
    }

    /* JADX WARNING: Removed duplicated region for block: B:12:0x002b A[RETURN] */
    public Bitmap getIcon(String str, int i, int i2) {
        Bitmap bitmap;
        Bitmap bitmap2;
        f c = c.a().c(str);
        if (c != null) {
            try {
                bitmap = e.a(a.a().b(), c, i, i2);
            } catch (IOException unused) {
                bitmap = null;
            }
            if (bitmap == null) {
                try {
                    bitmap2 = e.b(a.a().b(), c, i, i2);
                } catch (IOException unused2) {
                }
                if (bitmap2 == null) {
                    return bitmap2;
                }
            }
            bitmap2 = bitmap;
            if (bitmap2 == null) {
                return null;
            }
        }
        return null;
    }

    public nexOverlayImage getOverlayImage(String str) {
        f c = c.a().c(str);
        if (c != null && c.getCategory() == ItemCategory.overlay && c.getType() == ItemType.overlay) {
            return new nexOverlayImage(str, true);
        }
        return null;
    }
}
