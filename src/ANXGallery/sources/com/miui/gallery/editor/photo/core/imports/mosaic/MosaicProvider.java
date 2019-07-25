package com.miui.gallery.editor.photo.core.imports.mosaic;

import android.app.Application;
import android.content.Context;
import android.content.res.AssetManager;
import android.os.AsyncTask;
import com.miui.gallery.editor.photo.core.Effect;
import com.miui.gallery.editor.photo.core.RenderEngine;
import com.miui.gallery.editor.photo.core.SdkManager;
import com.miui.gallery.editor.photo.core.SdkProvider;
import com.miui.gallery.editor.photo.core.common.fragment.AbstractMosaicFragment;
import com.miui.gallery.editor.photo.core.common.model.MosaicData;
import com.miui.gallery.editor.photo.utils.IoUtils;
import com.miui.gallery.util.GsonUtils;
import com.miui.gallery.util.Log;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

class MosaicProvider extends SdkProvider<MosaicData, AbstractMosaicFragment> {
    /* access modifiers changed from: private */
    public static final String PATH_MOSAIC;
    public static final String PEN_MASK_PATH;
    private static final String SEPARATOR = File.separator;
    /* access modifiers changed from: private */
    public List<MosaicData> mMosaicDataList = new ArrayList();

    private static class LoadMosaicTask extends AsyncTask<Application, Void, List<MosaicGLEntity>> {
        private AssetManager mAssetManager;
        private ResourceListener mResourceListener;

        LoadMosaicTask(ResourceListener resourceListener, AssetManager assetManager) {
            this.mResourceListener = resourceListener;
            this.mAssetManager = assetManager;
        }

        /* access modifiers changed from: protected */
        public List<MosaicGLEntity> doInBackground(Application... applicationArr) {
            Object obj;
            AssetManager assetManager = this.mAssetManager;
            ArrayList arrayList = new ArrayList();
            try {
                String[] list = assetManager.list(MosaicProvider.PATH_MOSAIC);
                for (int i = 0; i < list.length; i++) {
                    String str = list[i];
                    String access$300 = MosaicProvider.getMosaicConfigPath(str);
                    String access$400 = MosaicProvider.getMosaicIconPath(str);
                    MosaicConfig mosaicConfig = (MosaicConfig) GsonUtils.fromJson(MosaicProvider.loadResourceFileString(assetManager, access$300), MosaicConfig.class);
                    Object obj2 = 0;
                    switch (mosaicConfig.type) {
                        case ORIGIN:
                            obj = new MosaicGLOriginEntity((short) i, str, access$400);
                            break;
                        case RESOURCE:
                            MosaicGLResourceEntity mosaicGLResourceEntity = new MosaicGLResourceEntity((short) i, str, access$400, MosaicProvider.getMosaicReourcePath(str), mosaicConfig.tileMode);
                            obj = mosaicGLResourceEntity;
                            break;
                        case EFFECT:
                            obj = new MosaicGLEffectEntity((short) i, str, access$400, mosaicConfig.effectType);
                            break;
                        default:
                            obj = obj2;
                            break;
                    }
                    arrayList.add(obj);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
            return arrayList;
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(List<MosaicGLEntity> list) {
            if (this.mResourceListener != null) {
                this.mResourceListener.onLoadFinish(list);
            }
        }
    }

    private interface ResourceListener {
        void onLoadFinish(List<MosaicGLEntity> list);
    }

    static {
        StringBuilder sb = new StringBuilder();
        sb.append("mosaic");
        sb.append(SEPARATOR);
        sb.append("entities");
        PATH_MOSAIC = sb.toString();
        StringBuilder sb2 = new StringBuilder();
        sb2.append("mosaic");
        sb2.append(SEPARATOR);
        sb2.append("pen");
        sb2.append(SEPARATOR);
        sb2.append("pen_mask.png");
        PEN_MASK_PATH = sb2.toString();
        SdkManager.INSTANCE.register(new MosaicProvider());
    }

    private MosaicProvider() {
        super(Effect.MOSAIC);
    }

    /* access modifiers changed from: private */
    public static String getMosaicConfigPath(String str) {
        StringBuilder sb = new StringBuilder();
        sb.append(PATH_MOSAIC);
        sb.append(SEPARATOR);
        sb.append(str);
        sb.append(SEPARATOR);
        sb.append("config.json");
        return sb.toString();
    }

    /* access modifiers changed from: private */
    public static String getMosaicIconPath(String str) {
        StringBuilder sb = new StringBuilder();
        sb.append("assets://");
        sb.append(PATH_MOSAIC);
        sb.append(SEPARATOR);
        sb.append(str);
        sb.append(SEPARATOR);
        sb.append("icon.png");
        return sb.toString();
    }

    /* access modifiers changed from: private */
    public static String getMosaicReourcePath(String str) {
        StringBuilder sb = new StringBuilder();
        sb.append("assets://");
        sb.append(PATH_MOSAIC);
        sb.append(SEPARATOR);
        sb.append(str);
        sb.append(SEPARATOR);
        sb.append("resource.png");
        return sb.toString();
    }

    private void initialize() {
        new LoadMosaicTask(new ResourceListener() {
            public void onLoadFinish(List<MosaicGLEntity> list) {
                MosaicProvider.this.mMosaicDataList.clear();
                MosaicProvider.this.mMosaicDataList.addAll(list);
                MosaicProvider.this.notifyInitializeFinish();
            }
        }, getApplicationContext().getAssets()).execute(new Application[]{getApplicationContext()});
    }

    static String loadResourceFileString(AssetManager assetManager, String str) {
        InputStream inputStream;
        try {
            inputStream = assetManager.open(str);
            try {
                String readInputStreamToString = IoUtils.readInputStreamToString("MosaicProvider", inputStream);
                IoUtils.close(inputStream);
                return readInputStreamToString;
            } catch (IOException e) {
                e = e;
                try {
                    Log.e("MosaicProvider", (Throwable) e);
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
            Log.e("MosaicProvider", (Throwable) e);
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
        return new MosaicEngine();
    }

    public List<? extends MosaicData> list() {
        return this.mMosaicDataList;
    }

    /* access modifiers changed from: protected */
    public void onActivityCreate() {
        super.onActivityCreate();
        initialize();
    }

    /* access modifiers changed from: protected */
    public AbstractMosaicFragment onCreateFragment() {
        return new MosaicFragment();
    }
}
