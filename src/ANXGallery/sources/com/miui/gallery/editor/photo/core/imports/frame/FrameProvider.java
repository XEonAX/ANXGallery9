package com.miui.gallery.editor.photo.core.imports.frame;

import android.app.Application;
import android.content.Context;
import android.content.res.AssetManager;
import android.os.AsyncTask;
import com.miui.gallery.editor.photo.core.Effect;
import com.miui.gallery.editor.photo.core.RenderEngine;
import com.miui.gallery.editor.photo.core.SdkManager;
import com.miui.gallery.editor.photo.core.SdkProvider;
import com.miui.gallery.editor.photo.core.common.fragment.AbstractFrameFragment;
import com.miui.gallery.editor.photo.core.common.model.FrameData;
import com.miui.gallery.editor.photo.utils.IoUtils;
import com.miui.gallery.util.GsonUtils;
import com.miui.gallery.util.Log;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

class FrameProvider extends SdkProvider<FrameData, AbstractFrameFragment> {
    /* access modifiers changed from: private */
    public static final String SEPARATOR = File.separator;
    /* access modifiers changed from: private */
    public List<FrameData> mFrameData;

    private static class LoadResourceTask extends AsyncTask<Application, Void, List<FrameData>> {
        private ResourceListener mResourceListener;

        public LoadResourceTask(ResourceListener resourceListener) {
            this.mResourceListener = resourceListener;
        }

        /* access modifiers changed from: protected */
        public List<FrameData> doInBackground(Application... applicationArr) {
            AssetManager assets = applicationArr[0].getAssets();
            ArrayList arrayList = new ArrayList();
            try {
                String[] list = assets.list("frame");
                for (int i = 0; i < list.length; i++) {
                    String str = list[i];
                    FrameConfig frameConfig = (FrameConfig) GsonUtils.fromJson(FrameProvider.loadResourceFileString(assets, String.format("%s%s%s", new Object[]{"frame", FrameProvider.SEPARATOR, str})), FrameConfig.class);
                    FrameData frameData = new FrameData((short) i, str, frameConfig.width, frameConfig.height, frameConfig.iconRatio);
                    arrayList.add(frameData);
                }
            } catch (Exception e) {
                Log.e("FrameProvider", "FrameProvider load resource error", (Object) e);
            }
            return arrayList;
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(List<FrameData> list) {
            if (this.mResourceListener != null) {
                this.mResourceListener.onLoadFinish(list);
            }
        }
    }

    private interface ResourceListener {
        void onLoadFinish(List<FrameData> list);
    }

    static {
        SdkManager.INSTANCE.register(new FrameProvider());
    }

    private FrameProvider() {
        super(Effect.FRAME);
    }

    private void initialize() {
        new LoadResourceTask(new ResourceListener() {
            public void onLoadFinish(List<FrameData> list) {
                FrameProvider.this.mFrameData = list;
                FrameProvider.this.notifyInitializeFinish();
            }
        }).execute(new Application[]{getApplicationContext()});
    }

    static String loadResourceFileString(AssetManager assetManager, String str) {
        InputStream inputStream;
        try {
            inputStream = assetManager.open(str);
            try {
                String readInputStreamToString = IoUtils.readInputStreamToString("FrameProvider", inputStream);
                IoUtils.close(inputStream);
                return readInputStreamToString;
            } catch (IOException e) {
                e = e;
                try {
                    Log.e("FrameProvider", (Throwable) e);
                    IoUtils.close(inputStream);
                    return null;
                } catch (Throwable th) {
                    th = th;
                    IoUtils.close(inputStream);
                    throw th;
                }
            }
        } catch (IOException e2) {
            e = e2;
            inputStream = null;
            Log.e("FrameProvider", (Throwable) e);
            IoUtils.close(inputStream);
            return null;
        } catch (Throwable th2) {
            th = th2;
            inputStream = null;
            IoUtils.close(inputStream);
            throw th;
        }
    }

    public RenderEngine createEngine(Context context) {
        return new FrameEngine();
    }

    public List<? extends FrameData> list() {
        return this.mFrameData;
    }

    /* access modifiers changed from: protected */
    public void onActivityCreate() {
        initialize();
    }

    /* access modifiers changed from: protected */
    public AbstractFrameFragment onCreateFragment() {
        return new FrameFragment();
    }
}
