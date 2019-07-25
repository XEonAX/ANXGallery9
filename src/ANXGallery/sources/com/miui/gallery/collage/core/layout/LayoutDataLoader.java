package com.miui.gallery.collage.core.layout;

import android.content.res.AssetManager;
import android.os.AsyncTask;
import android.util.SparseArray;
import com.google.gson.Gson;
import com.miui.gallery.collage.CollageUtils;
import com.miui.gallery.collage.app.common.IDataLoader;
import com.miui.gallery.util.Log;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

class LayoutDataLoader implements IDataLoader {
    public static final String PATH_LAYOUT;
    private static final String SEPARATOR = File.separator;
    private AssetManager mAssetManager;
    private DataLoadListener mDataLoadListener;
    private AsyncTask mTask;

    interface DataLoadListener {
        void onDataLoad(SparseArray<List<LayoutModel>> sparseArray);
    }

    private static class LoadResourceTask extends AsyncTask<AssetManager, Void, Void> {
        private DataLoadListener mDataLoadListener;
        private SparseArray<List<LayoutModel>> mLayoutSparseArray = new SparseArray<>();

        public LoadResourceTask(DataLoadListener dataLoadListener) {
            this.mDataLoadListener = dataLoadListener;
        }

        /* access modifiers changed from: protected */
        public Void doInBackground(AssetManager... assetManagerArr) {
            String[] list;
            Gson generateCustomGson = CollageUtils.generateCustomGson();
            AssetManager assetManager = assetManagerArr[0];
            try {
                for (String str : assetManager.list(LayoutDataLoader.PATH_LAYOUT)) {
                    if (isCancelled()) {
                        return null;
                    }
                    LayoutDataLoader.addLayoutModel(this.mLayoutSparseArray, LayoutDataLoader.generateLayoutModelByName(assetManager, generateCustomGson, str));
                }
            } catch (IOException e) {
                Log.d("LayoutDataLoader", (Throwable) e);
            }
            return null;
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Void voidR) {
            if (this.mDataLoadListener != null) {
                this.mDataLoadListener.onDataLoad(this.mLayoutSparseArray);
            }
        }
    }

    static {
        StringBuilder sb = new StringBuilder();
        sb.append("collage");
        sb.append(SEPARATOR);
        sb.append("layout");
        PATH_LAYOUT = sb.toString();
    }

    public LayoutDataLoader(AssetManager assetManager, DataLoadListener dataLoadListener) {
        this.mAssetManager = assetManager;
        this.mDataLoadListener = dataLoadListener;
    }

    /* access modifiers changed from: private */
    public static void addLayoutModel(SparseArray<List<LayoutModel>> sparseArray, LayoutModel layoutModel) {
        int i = layoutModel.size;
        List list = (List) sparseArray.get(i);
        if (list == null) {
            list = new ArrayList();
            sparseArray.put(i, list);
        }
        list.add(layoutModel);
    }

    public static LayoutModel generateLayoutModelByName(AssetManager assetManager, Gson gson, String str) {
        StringBuilder sb = new StringBuilder();
        sb.append(PATH_LAYOUT);
        sb.append(SEPARATOR);
        sb.append(str);
        LayoutModel layoutModel = (LayoutModel) gson.fromJson(CollageUtils.loadResourceFileString(assetManager, sb.toString()), LayoutModel.class);
        layoutModel.name = str;
        return layoutModel;
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
