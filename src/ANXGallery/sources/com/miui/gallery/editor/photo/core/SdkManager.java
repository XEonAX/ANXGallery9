package com.miui.gallery.editor.photo.core;

import android.app.Application;
import com.miui.gallery.util.Log;
import java.util.Arrays;

public class SdkManager {
    public static final SdkManager INSTANCE = new SdkManager();
    private boolean mHasCreateCalled = false;
    private SdkProvider[] mProviders = new SdkProvider[Effect.values().length];

    static {
        load("com.miui.gallery.editor.photo.core.imports.filter.FilterProvider", "com.miui.gallery.editor.photo.core.imports.crop.CropProvider", "com.miui.gallery.editor.photo.core.imports.sticker.StickerProvider", "com.miui.gallery.editor.photo.core.imports.longcrop.LongCropProvider", "com.miui.gallery.editor.photo.core.imports.text.TextProvider", "com.miui.gallery.editor.photo.core.imports.doodle.DoodleProvider", "com.miui.gallery.editor.photo.core.imports.mosaic.MosaicProvider", "com.miui.gallery.editor.photo.core.imports.remover.RemoverProvider", "com.miui.gallery.editor.photo.core.imports.miuibeauty.MiuiBeautyProvider", "com.miui.gallery.editor.photo.core.imports.frame.FrameProvider");
    }

    private SdkManager() {
    }

    private static void load(String... strArr) {
        Log.d("SdkManager", "loading %s", (Object) Arrays.toString(strArr));
        for (String cls : strArr) {
            try {
                Class.forName(cls);
            } catch (ClassNotFoundException e) {
                Log.w("SdkManager", (Throwable) e);
            }
        }
    }

    public <T extends SdkProvider> T getProvider(Effect<T> effect) {
        return this.mProviders[effect.ordinal()];
    }

    public void onActivityCreate() {
        SdkProvider[] sdkProviderArr;
        if (!this.mHasCreateCalled) {
            Log.d("SdkManager", "creating application");
            for (SdkProvider sdkProvider : this.mProviders) {
                if (sdkProvider != null) {
                    Log.d("SdkManager", "notify %s's provider application is creating", (Object) sdkProvider.mSupported);
                    sdkProvider.onActivityCreate();
                }
            }
            this.mHasCreateCalled = true;
        }
    }

    public void onAttach(Application application) {
        SdkProvider[] sdkProviderArr;
        Log.d("SdkManager", "attach to application");
        for (SdkProvider sdkProvider : this.mProviders) {
            if (sdkProvider != null) {
                sdkProvider.attach(application);
            }
        }
    }

    public <T extends SdkProvider> void register(T t) {
        Log.d("SdkManager", "registering %s", (Object) t);
        Effect<? extends SdkProvider<D, F>> effect = t.mSupported;
        SdkProvider sdkProvider = this.mProviders[effect.ordinal()];
        if (sdkProvider == null) {
            this.mProviders[effect.ordinal()] = t;
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("already registered provider found: ");
        sb.append(sdkProvider);
        throw new IllegalStateException(sb.toString());
    }
}
