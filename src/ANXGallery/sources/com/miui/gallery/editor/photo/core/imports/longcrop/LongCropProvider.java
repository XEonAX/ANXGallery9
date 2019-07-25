package com.miui.gallery.editor.photo.core.imports.longcrop;

import android.content.Context;
import com.miui.gallery.editor.photo.core.Effect;
import com.miui.gallery.editor.photo.core.RenderEngine;
import com.miui.gallery.editor.photo.core.SdkManager;
import com.miui.gallery.editor.photo.core.SdkProvider;
import com.miui.gallery.editor.photo.core.common.fragment.AbstractLongCropFragment;
import java.util.List;

public class LongCropProvider extends SdkProvider<Object, AbstractLongCropFragment> {
    static {
        SdkManager.INSTANCE.register(new LongCropProvider());
    }

    public LongCropProvider() {
        super(Effect.LONG_CROP);
    }

    public RenderEngine createEngine(Context context) {
        return new CropRenderEngine();
    }

    public List<Object> list() {
        return null;
    }

    /* access modifiers changed from: protected */
    public void onActivityCreate() {
        super.onActivityCreate();
        notifyInitializeFinish();
    }

    /* access modifiers changed from: protected */
    public LongScreenshotCropFragment onCreateFragment() {
        return new LongScreenshotCropFragment();
    }
}
