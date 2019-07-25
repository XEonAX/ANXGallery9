package com.nexstreaming.app.common.nexasset.overlay;

import com.nexstreaming.app.common.nexasset.assetpackage.c;
import com.nexstreaming.app.common.nexasset.assetpackage.f;
import com.nexstreaming.app.common.nexasset.overlay.impl.AnimatedOverlayAsset;
import com.nexstreaming.app.common.nexasset.overlay.impl.BitmapOverlayAsset;
import com.nexstreaming.app.common.nexasset.overlay.impl.RenderItemOverlayAsset;
import com.nexstreaming.app.common.nexasset.overlay.impl.SVGOverlayAsset;
import com.nexstreaming.app.common.util.j;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;
import org.xmlpull.v1.XmlPullParserException;

public class OverlayAssetFactory {
    private static Map<String, WeakReference<OverlayAsset>> cache = new HashMap();
    private static int deadRefCheck = 0;

    private OverlayAssetFactory() {
    }

    public static OverlayAsset forItem(String str) throws IOException, XmlPullParserException {
        WeakReference weakReference = (WeakReference) cache.get(str);
        if (weakReference != null) {
            OverlayAsset overlayAsset = (OverlayAsset) weakReference.get();
            if (overlayAsset != null) {
                return overlayAsset;
            }
        }
        OverlayAsset overlayAsset2 = null;
        f c = c.a().c(str);
        if (c != null) {
            switch (c.getType()) {
                case overlay:
                    String filePath = c.getFilePath();
                    String substring = filePath.substring(filePath.lastIndexOf(46) + 1);
                    if (substring.equalsIgnoreCase("png") || substring.equalsIgnoreCase("jpeg") || substring.equalsIgnoreCase("jpg") || substring.equalsIgnoreCase("webp")) {
                        overlayAsset2 = new BitmapOverlayAsset(c);
                        break;
                    } else if (substring.equalsIgnoreCase("svg")) {
                        overlayAsset2 = new SVGOverlayAsset(c);
                        break;
                    } else if (substring.equalsIgnoreCase("xml")) {
                        overlayAsset2 = new AnimatedOverlayAsset(c);
                        break;
                    } else {
                        StringBuilder sb = new StringBuilder();
                        sb.append("Asset load error: ");
                        sb.append(str);
                        sb.append(" (unknown overlay type for '");
                        sb.append(filePath);
                        sb.append("')");
                        throw new IOException(sb.toString());
                    }
                    break;
                case renderitem:
                    return new RenderItemOverlayAsset(c);
            }
            if (overlayAsset2 != null) {
                cache.put(str, new WeakReference(overlayAsset2));
                int i = deadRefCheck;
                deadRefCheck = i + 1;
                if (i > 32) {
                    j.a(cache);
                    deadRefCheck = 0;
                }
            }
            return overlayAsset2;
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append("Asset not found: ");
        sb2.append(str);
        throw new IOException(sb2.toString());
    }
}
