package com.miui.gallery.collage.core.stitching;

import android.content.res.AssetManager;
import android.os.AsyncTask;
import com.google.gson.Gson;
import com.miui.gallery.collage.CollageUtils;
import com.miui.gallery.collage.app.common.IDataLoader;
import com.miui.gallery.util.Log;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

class StitchingDataLoader implements IDataLoader {
    public static final String PATH_STITCHING;
    private static final String SEPARATOR = File.separator;
    private AssetManager mAssetManager;
    private DataLoadListener mDataLoadListener;
    private AsyncTask mTask;

    interface DataLoadListener {
        void onDataLoad(List<StitchingModel> list);
    }

    private static class LoadResourceTask extends AsyncTask<AssetManager, Void, Void> {
        private DataLoadListener mDataLoadListener;
        private List<StitchingModel> mStitchingModelList;

        private LoadResourceTask(DataLoadListener dataLoadListener) {
            this.mDataLoadListener = dataLoadListener;
        }

        /* access modifiers changed from: protected */
        public Void doInBackground(AssetManager... assetManagerArr) {
            String[] list;
            this.mStitchingModelList = new ArrayList();
            Gson generateCustomGson = CollageUtils.generateCustomGson();
            AssetManager assetManager = assetManagerArr[0];
            try {
                for (String str : assetManager.list(StitchingDataLoader.PATH_STITCHING)) {
                    if (isCancelled()) {
                        return null;
                    }
                    this.mStitchingModelList.add(StitchingDataLoader.generateStitchingModelByName(assetManager, generateCustomGson, str));
                }
            } catch (IOException e) {
                Log.d("StitchingDataLoader", (Throwable) e);
            }
            return null;
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Void voidR) {
            if (this.mDataLoadListener != null) {
                this.mDataLoadListener.onDataLoad(this.mStitchingModelList);
            }
        }
    }

    static {
        StringBuilder sb = new StringBuilder();
        sb.append("collage");
        sb.append(SEPARATOR);
        sb.append("stitching");
        PATH_STITCHING = sb.toString();
    }

    public StitchingDataLoader(AssetManager assetManager, DataLoadListener dataLoadListener) {
        this.mAssetManager = assetManager;
        this.mDataLoadListener = dataLoadListener;
    }

    /* access modifiers changed from: private */
    public static StitchingModel generateStitchingModelByName(AssetManager assetManager, Gson gson, String str) {
        StringBuilder sb = new StringBuilder();
        sb.append(PATH_STITCHING);
        sb.append(SEPARATOR);
        sb.append(str);
        String sb2 = sb.toString();
        StringBuilder sb3 = new StringBuilder();
        sb3.append(sb2);
        sb3.append(SEPARATOR);
        sb3.append("main.json");
        StitchingModel stitchingModel = (StitchingModel) gson.fromJson(CollageUtils.loadResourceFileString(assetManager, sb3.toString()), StitchingModel.class);
        stitchingModel.relativePath = sb2;
        stitchingModel.name = str;
        return stitchingModel;
    }

    public void cancel() {
        if (this.mTask != null) {
            this.mTask.cancel(false);
        }
    }

    public void loadData() {
        this.mTask = new LoadResourceTask(this.mDataLoadListener).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new AssetManager[]{this.mAssetManager});
    }
}
