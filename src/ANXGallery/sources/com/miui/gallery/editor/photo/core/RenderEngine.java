package com.miui.gallery.editor.photo.core;

import android.content.Context;
import android.graphics.Bitmap;
import com.miui.gallery.util.BaseBitmapUtils;
import com.miui.gallery.util.Log;
import java.util.List;

public abstract class RenderEngine {
    public static RenderEngine findEngine(Context context, RenderData renderData, RenderEngine[] renderEngineArr) {
        Effect type = renderData.getType();
        RenderEngine renderEngine = renderEngineArr[type.ordinal()];
        if (renderEngine != null) {
            return renderEngine;
        }
        SdkProvider provider = SdkManager.INSTANCE.getProvider(type);
        if (provider == null) {
            return renderEngine;
        }
        RenderEngine createEngine = provider.createEngine(context);
        renderEngineArr[type.ordinal()] = createEngine;
        return createEngine;
    }

    public static Bitmap render(Context context, Bitmap bitmap, List<RenderData> list, RenderEngine[] renderEngineArr) {
        if (bitmap == null) {
            Log.w("RenderEngine", "no bitmap need to render");
            return null;
        }
        int size = list.size();
        int i = 0;
        Bitmap bitmap2 = bitmap;
        while (i < size) {
            RenderData renderData = (RenderData) list.get(i);
            i++;
            while (true) {
                if (i >= list.size()) {
                    break;
                }
                RenderData renderData2 = (RenderData) list.get(i);
                Log.d("RenderEngine", "try merge %s with %s", renderData.getType(), renderData2.getType());
                RenderData merge = renderData.merge(renderData2);
                if (merge == null) {
                    Log.d("RenderEngine", "not support");
                    break;
                }
                Log.d("RenderEngine", "merged");
                i++;
                renderData = merge;
            }
            RenderEngine findEngine = findEngine(context, renderData, renderEngineArr);
            if (findEngine == null) {
                return null;
            }
            Bitmap render = findEngine.render(bitmap2, renderData);
            if (render != bitmap2) {
                BaseBitmapUtils.recycleSilently(bitmap2);
                bitmap2 = render;
            }
            if (render == null) {
                Log.w("RenderEngine", "render %s failed, return", renderData.getType());
                return null;
            }
            bitmap = render;
        }
        Log.w("RenderEngine", "render %d finish", Integer.valueOf(list.size()));
        return bitmap;
    }

    public void release() {
    }

    public abstract Bitmap render(Bitmap bitmap, RenderData renderData);
}
