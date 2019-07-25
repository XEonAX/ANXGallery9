package com.miui.gallery.editor.photo.screen.mosaic;

import android.content.Context;
import android.content.res.AssetManager;
import android.os.AsyncTask;
import com.miui.gallery.editor.photo.screen.core.ScreenProvider;
import com.miui.gallery.editor.photo.screen.mosaic.shader.MosaicData;
import com.miui.gallery.editor.photo.screen.mosaic.shader.MosaicEntity;
import com.miui.gallery.editor.photo.screen.mosaic.shader.MosaicEntityBitmap;
import com.miui.gallery.editor.photo.screen.mosaic.shader.MosaicEntityBlur;
import com.miui.gallery.editor.photo.screen.mosaic.shader.MosaicEntityNormal;
import com.miui.gallery.editor.photo.screen.mosaic.shader.MosaicEntityOrigin;
import com.miui.gallery.editor.photo.screen.mosaic.shader.MosaicEntityTriangle;
import com.miui.gallery.editor.photo.screen.mosaic.shader.MosaicEntityTriangleRect;
import com.miui.gallery.editor.photo.utils.IoUtils;
import com.miui.gallery.util.GsonUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

public class ScreenMosaicProvider extends ScreenProvider {
    /* access modifiers changed from: private */
    public static final String PATH_MOSAIC;
    private static final String SEPARATOR = File.separator;
    private List<MosaicData> mMosaicDataList = new ArrayList();

    private static class LoadMosaicTask extends AsyncTask<Void, Void, List<MosaicEntity>> {
        private Context mContext;
        private ResourceListener mResourceListener;

        LoadMosaicTask(ResourceListener resourceListener, Context context) {
            this.mResourceListener = resourceListener;
            this.mContext = context;
        }

        /* access modifiers changed from: protected */
        public List<MosaicEntity> doInBackground(Void... voidArr) {
            Object obj;
            AssetManager assets = this.mContext.getAssets();
            ArrayList arrayList = new ArrayList();
            try {
                String[] list = assets.list(ScreenMosaicProvider.PATH_MOSAIC);
                for (String str : list) {
                    String access$100 = ScreenMosaicProvider.getMosaicConfigPath(str);
                    String access$200 = ScreenMosaicProvider.getMosaicIconPath(str);
                    ScreenMosaicConfig screenMosaicConfig = (ScreenMosaicConfig) GsonUtils.fromJson(ScreenMosaicProvider.loadResourceFileString(assets, access$100), ScreenMosaicConfig.class);
                    if (screenMosaicConfig.supportScreenEditor) {
                        switch (screenMosaicConfig.effectType) {
                            case ORIGIN:
                                obj = new MosaicEntityOrigin(str, access$200);
                                break;
                            case BITMAP:
                                obj = new MosaicEntityBitmap(str, access$200, ScreenMosaicProvider.getMosaicResourcePath(str), screenMosaicConfig.tileMode);
                                break;
                            case BLUR:
                                obj = new MosaicEntityBlur(str, access$200, this.mContext);
                                break;
                            case TRIANGLE:
                                obj = new MosaicEntityTriangle(str, access$200);
                                break;
                            case TRIANGLE_RECT:
                                obj = new MosaicEntityTriangleRect(str, access$200);
                                break;
                            default:
                                obj = new MosaicEntityNormal(str, access$200);
                                break;
                        }
                        arrayList.add(obj);
                        if (arrayList.size() >= 6) {
                            return arrayList;
                        }
                    }
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
            return arrayList;
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(List<MosaicEntity> list) {
            if (this.mResourceListener != null) {
                this.mResourceListener.onLoadFinish(list);
            }
        }
    }

    private interface ResourceListener {
        void onLoadFinish(List<MosaicEntity> list);
    }

    static {
        StringBuilder sb = new StringBuilder();
        sb.append("mosaic");
        sb.append(SEPARATOR);
        sb.append("entities");
        PATH_MOSAIC = sb.toString();
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
    public static String getMosaicResourcePath(String str) {
        StringBuilder sb = new StringBuilder();
        sb.append("assets://");
        sb.append(PATH_MOSAIC);
        sb.append(SEPARATOR);
        sb.append(str);
        sb.append(SEPARATOR);
        sb.append("resource.png");
        return sb.toString();
    }

    private void initialize(Context context) {
        if (!this.mIsInitialized) {
            new LoadMosaicTask(new ResourceListener() {
                public final void onLoadFinish(List list) {
                    ScreenMosaicProvider.lambda$initialize$75(ScreenMosaicProvider.this, list);
                }
            }, context.getApplicationContext()).execute(new Void[0]);
        }
    }

    public static /* synthetic */ void lambda$initialize$75(ScreenMosaicProvider screenMosaicProvider, List list) {
        screenMosaicProvider.mMosaicDataList.clear();
        screenMosaicProvider.mMosaicDataList.addAll(list);
        screenMosaicProvider.mIsInitialized = true;
    }

    static String loadResourceFileString(AssetManager assetManager, String str) {
        InputStream inputStream;
        try {
            inputStream = assetManager.open(str);
            try {
                String readInputStreamToString = IoUtils.readInputStreamToString("ScreenMosaicProvider", inputStream);
                IoUtils.close(inputStream);
                return readInputStreamToString;
            } catch (IOException e) {
                e = e;
                try {
                    Log.e("ScreenMosaicProvider", (Throwable) e);
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
            Log.e("ScreenMosaicProvider", (Throwable) e);
            IoUtils.close(inputStream);
            return null;
        } catch (Throwable th2) {
            th = th2;
            inputStream = null;
            IoUtils.close(inputStream);
            throw th;
        }
    }

    public void clearShader() {
        for (MosaicData mosaicData : this.mMosaicDataList) {
            ((MosaicEntity) mosaicData).clearShader();
        }
    }

    public MosaicData getDefaultData() {
        if (MiscUtil.isValid(this.mMosaicDataList)) {
            for (MosaicData mosaicData : this.mMosaicDataList) {
                if (mosaicData instanceof MosaicEntityNormal) {
                    return mosaicData;
                }
            }
        }
        return null;
    }

    public List<? extends MosaicData> list() {
        return this.mMosaicDataList;
    }

    public void onActivityCreate(Context context) {
        initialize(context);
    }

    public void onActivityDestroy() {
    }
}
