package com.nexstreaming.app.common.nexasset.overlay.impl;

import android.graphics.RectF;
import android.util.Log;
import com.nexstreaming.app.common.nexasset.assetpackage.f;
import com.nexstreaming.app.common.nexasset.assetpackage.h;
import com.nexstreaming.app.common.nexasset.assetpackage.i;
import com.nexstreaming.app.common.nexasset.overlay.AwakeAsset;
import com.nexstreaming.app.common.nexasset.overlay.OverlayMotion;
import com.nexstreaming.kminternal.kinemaster.config.EditorGlobal;
import com.nexstreaming.kminternal.kinemaster.config.a;
import com.nexstreaming.kminternal.nexvideoeditor.LayerRenderer;
import com.nexstreaming.kminternal.nexvideoeditor.NexEditor;
import java.io.IOException;
import java.util.Map;
import org.xmlpull.v1.XmlPullParserException;

public class RenderItemOverlayAsset extends AbstractOverlayAsset {
    private static final String LOG_TAG = "RenderItemOverlayAsset";
    /* access modifiers changed from: private */
    public int[] effect_id_ = {-1, -1};
    private int height;
    private int width;

    public RenderItemOverlayAsset(f fVar) {
        super(fVar);
        try {
            h a = i.a(a.a().b(), fVar.getId());
            this.width = a.d();
            this.height = a.e();
            String str = LOG_TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Read itemdef: ");
            sb.append(fVar.getId());
            sb.append(" : w,h=");
            sb.append(a.d());
            sb.append(",");
            sb.append(a.e());
            Log.d(str, sb.toString());
        } catch (XmlPullParserException e) {
            String str2 = LOG_TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Error reading itemdef: ");
            sb2.append(fVar.getId());
            Log.e(str2, sb2.toString(), e);
        } catch (IOException e2) {
            String str3 = LOG_TAG;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("Error reading itemdef: ");
            sb3.append(fVar.getId());
            Log.e(str3, sb3.toString(), e2);
        }
    }

    public int getDefaultDuration() {
        return 0;
    }

    public int getIntrinsicHeight() {
        if (this.width <= 0 || this.height <= 0) {
            return 700;
        }
        return this.height;
    }

    public int getIntrinsicWidth() {
        if (this.width <= 0 || this.height <= 0) {
            return 700;
        }
        return this.width;
    }

    public AwakeAsset onAwake(LayerRenderer layerRenderer, final RectF rectF, final String str, Map<String, String> map) {
        return new AwakeAsset() {
            private RectF currentBound = rectF;
            private String currentEffectOptions = str;

            public boolean needRendererReawakeOnEditResize() {
                return false;
            }

            public void onAsleep(LayerRenderer layerRenderer) {
                NexEditor a = EditorGlobal.a();
                if (a != null && RenderItemOverlayAsset.this.effect_id_[layerRenderer.o().id] >= 0) {
                    a.c(RenderItemOverlayAsset.this.effect_id_[layerRenderer.o().id], layerRenderer.o().id);
                    RenderItemOverlayAsset.this.effect_id_[layerRenderer.o().id] = -1;
                }
            }

            public boolean onRefresh(LayerRenderer layerRenderer, RectF rectF, String str) {
                this.currentEffectOptions = str;
                this.currentBound = rectF;
                return true;
            }

            public void onRender(LayerRenderer layerRenderer, OverlayMotion overlayMotion, int i, int i2) {
                if (RenderItemOverlayAsset.this.effect_id_[layerRenderer.o().id] < 0) {
                    NexEditor a = EditorGlobal.a();
                    if (a != null) {
                        RenderItemOverlayAsset.this.effect_id_[layerRenderer.o().id] = a.a(RenderItemOverlayAsset.this.getItemInfo().getId(), layerRenderer.o().id);
                    }
                }
                if (RenderItemOverlayAsset.this.effect_id_[layerRenderer.o().id] >= 0) {
                    layerRenderer.a(RenderItemOverlayAsset.this.effect_id_[layerRenderer.o().id], this.currentEffectOptions, layerRenderer.g(), i, i2, this.currentBound.left, this.currentBound.top, this.currentBound.right, this.currentBound.bottom, layerRenderer.k());
                }
            }
        };
    }
}
