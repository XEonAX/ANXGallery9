package com.miui.gallery.editor.photo.core.imports.text;

import android.app.Application;
import android.content.Context;
import android.content.res.AssetManager;
import android.os.AsyncTask;
import android.text.TextUtils;
import com.miui.gallery.editor.photo.core.Effect;
import com.miui.gallery.editor.photo.core.RenderEngine;
import com.miui.gallery.editor.photo.core.SdkManager;
import com.miui.gallery.editor.photo.core.common.fragment.AbstractEffectFragment;
import com.miui.gallery.editor.photo.core.common.model.TextData;
import com.miui.gallery.editor.photo.core.common.provider.AbstractTextProvider;
import com.miui.gallery.editor.photo.core.imports.text.dialog.BaseDialogModel;
import com.miui.gallery.editor.photo.core.imports.text.dialog.DialogManager;
import com.miui.gallery.editor.photo.core.imports.text.watermark.WatermarkInfo;
import com.miui.gallery.editor.photo.utils.IoUtils;
import com.miui.gallery.util.GsonUtils;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

class TextProvider extends AbstractTextProvider {
    private DialogManager mDialogManager;
    private List<TextData> mTextBubbleList;
    /* access modifiers changed from: private */
    public List<TextData> mTextWatermarkList;

    private static class LoadWatermarkTask extends AsyncTask<Application, Void, List<WatermarkInfo>> {
        private AssetManager mAssetManager;
        private ResourceListener mResourceListener;

        LoadWatermarkTask(ResourceListener resourceListener, AssetManager assetManager) {
            this.mResourceListener = resourceListener;
            this.mAssetManager = assetManager;
        }

        private static String getAssetFilePath(String str, String str2) {
            if (TextUtils.isEmpty(str2)) {
                return null;
            }
            StringBuilder sb = new StringBuilder();
            sb.append("assets://watermark");
            sb.append(File.separator);
            sb.append(str);
            sb.append(File.separator);
            sb.append(str2);
            return sb.toString();
        }

        private static String getConfigPath(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append("watermark");
            sb.append(File.separator);
            sb.append(str);
            sb.append(File.separator);
            sb.append("config.json");
            return sb.toString();
        }

        /* access modifiers changed from: protected */
        public List<WatermarkInfo> doInBackground(Application... applicationArr) {
            AssetManager assetManager = this.mAssetManager;
            ArrayList arrayList = new ArrayList();
            try {
                String[] list = assetManager.list("watermark");
                for (String str : list) {
                    WatermarkInfo watermarkInfo = (WatermarkInfo) GsonUtils.fromJson(IoUtils.loadAssetFileString(assetManager, getConfigPath(str)), WatermarkInfo.class);
                    watermarkInfo.icon = getAssetFilePath(str, watermarkInfo.icon);
                    watermarkInfo.bgPost = getAssetFilePath(str, watermarkInfo.bgPost);
                    arrayList.add(watermarkInfo);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
            return arrayList;
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(List<WatermarkInfo> list) {
            if (this.mResourceListener != null) {
                this.mResourceListener.onLoadFinish(list);
            }
        }
    }

    private interface ResourceListener {
        void onLoadFinish(List<WatermarkInfo> list);
    }

    static {
        SdkManager.INSTANCE.register(new TextProvider());
    }

    protected TextProvider() {
        super(Effect.TEXT);
    }

    private void initTextBubbleData() {
        this.mTextBubbleList = new ArrayList();
        List dialogModelList = this.mDialogManager.getDialogModelList();
        for (int i = 0; i < dialogModelList.size(); i++) {
            BaseDialogModel baseDialogModel = (BaseDialogModel) dialogModelList.get(i);
            this.mTextBubbleList.add(new TextConfig(0, baseDialogModel.name, baseDialogModel));
        }
    }

    private void initTextWaterMarkData() {
        new LoadWatermarkTask(new ResourceListener() {
            public void onLoadFinish(List<WatermarkInfo> list) {
                TextProvider.this.mTextWatermarkList = new ArrayList();
                for (WatermarkInfo textConfig : list) {
                    TextProvider.this.mTextWatermarkList.add(new TextConfig(0, textConfig));
                }
                TextProvider.this.notifyInitializeFinish();
            }
        }, getApplicationContext().getAssets()).execute(new Application[]{getApplicationContext()});
    }

    private void initialize() {
        this.mDialogManager = new DialogManager();
        initTextBubbleData();
        initTextWaterMarkData();
    }

    public RenderEngine createEngine(Context context) {
        return new TextEngine();
    }

    public List<TextData> list() {
        return this.mTextBubbleList;
    }

    public List<TextData> listWatermark() {
        return this.mTextWatermarkList;
    }

    /* access modifiers changed from: protected */
    public void onActivityCreate() {
        super.onActivityCreate();
        initialize();
    }

    /* access modifiers changed from: protected */
    public AbstractEffectFragment onCreateFragment() {
        return new TextFragment();
    }
}
