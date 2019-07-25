package com.miui.gallery.video.editor.manager;

import android.text.TextUtils;
import com.miui.gallery.video.editor.TextStyle;
import java.util.ArrayList;
import java.util.Iterator;

public class WaterMarkManager {
    public void initDataWithTemplate(String[] strArr, ArrayList<TextStyle> arrayList) {
        boolean z;
        if (strArr != null && arrayList != null) {
            for (String str : strArr) {
                if (!TextUtils.isEmpty(str)) {
                    Iterator it = arrayList.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            z = true;
                            break;
                        }
                        TextStyle textStyle = (TextStyle) it.next();
                        if (textStyle != null && !TextUtils.isEmpty(textStyle.getAssetName()) && str.contains(textStyle.getAssetName())) {
                            textStyle.setDownloadState(17);
                            textStyle.setTemplateId(str);
                            z = false;
                            break;
                        }
                    }
                    if (z) {
                        NexAssetTemplateManager.getInstance().uninstallPackageById(str);
                    }
                }
            }
        }
    }

    public void updateDataWithTemplate(String[] strArr, TextStyle textStyle) {
        if (strArr != null && textStyle != null) {
            int i = 0;
            while (i < strArr.length) {
                String str = strArr[i];
                if (TextUtils.isEmpty(textStyle.getAssetName()) || !str.contains(textStyle.getAssetName())) {
                    i++;
                } else {
                    textStyle.setDownloadState(0);
                    textStyle.setTemplateId(str);
                    return;
                }
            }
        }
    }
}
