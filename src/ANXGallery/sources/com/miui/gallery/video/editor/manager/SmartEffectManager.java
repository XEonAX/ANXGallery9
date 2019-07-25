package com.miui.gallery.video.editor.manager;

import android.text.TextUtils;
import com.miui.gallery.video.editor.SmartEffect;
import com.nexstreaming.nexeditorsdk.nexTemplateManager.Template;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class SmartEffectManager {
    public void initDataWithTemplate(List<Template> list, ArrayList<SmartEffect> arrayList) {
        for (Template template : list) {
            if (template != null) {
                int assetIdx = template.packageInfo().assetIdx();
                String assetId = template.packageInfo().assetId();
                String id = template.id();
                boolean z = true;
                if (!TextUtils.isEmpty(id)) {
                    Iterator it = arrayList.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            break;
                        }
                        SmartEffect smartEffect = (SmartEffect) it.next();
                        if (smartEffect != null && !TextUtils.isEmpty(smartEffect.getAssetName()) && id.contains(smartEffect.getAssetName()) && assetId.equals(smartEffect.getAssetName()) && assetIdx == smartEffect.getAssetId()) {
                            smartEffect.setDownloadState(17);
                            smartEffect.setTemplate(template);
                            z = false;
                            break;
                        }
                    }
                    if (z) {
                        NexAssetTemplateManager.getInstance().uninstallPackageById(id);
                    }
                }
            }
        }
    }

    public void updateDataWithTemplate(List<Template> list, SmartEffect smartEffect) {
        if (smartEffect != null && list != null) {
            for (Template template : list) {
                if (template != null) {
                    int assetIdx = template.packageInfo().assetIdx();
                    String assetId = template.packageInfo().assetId();
                    String id = template.id();
                    if (!TextUtils.isEmpty(smartEffect.getAssetName()) && id.contains(smartEffect.getAssetName()) && assetId.equals(smartEffect.getAssetName()) && assetIdx == smartEffect.getAssetId()) {
                        smartEffect.setDownloadState(0);
                        smartEffect.setTemplate(template);
                        return;
                    }
                } else {
                    return;
                }
            }
        }
    }
}
