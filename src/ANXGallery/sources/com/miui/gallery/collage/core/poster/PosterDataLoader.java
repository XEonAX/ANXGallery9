package com.miui.gallery.collage.core.poster;

import android.content.res.AssetManager;
import android.os.AsyncTask;
import android.util.SparseArray;
import com.google.gson.Gson;
import com.google.gson.JsonParser;
import com.miui.gallery.collage.CollageUtils;
import com.miui.gallery.collage.app.common.IDataLoader;
import com.miui.gallery.collage.core.layout.LayoutModel;
import com.miui.gallery.util.Log;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

class PosterDataLoader implements IDataLoader {
    private static final String PATH_POSTER;
    public static final String PATH_POSTER_LAYOUT;
    public static final String PATH_POSTER_MODE;
    private static final String SEPARATOR = File.separator;
    private AssetManager mAssetManager;
    private DataLoadListener mDataLoadListener;
    private AsyncTask mTask;

    interface DataLoadListener {
        void onDataLoad(SparseArray<List<LayoutModel>> sparseArray, SparseArray<List<PosterModel>> sparseArray2);
    }

    private static class LoadResourceTask extends AsyncTask<AssetManager, Void, Void> {
        private DataLoadListener mDataLoadListener;
        private SparseArray<List<LayoutModel>> mPosterLayoutSparseArray = new SparseArray<>();
        private SparseArray<List<PosterModel>> mPosterSparseArray = new SparseArray<>();

        public LoadResourceTask(DataLoadListener dataLoadListener) {
            this.mDataLoadListener = dataLoadListener;
        }

        /* access modifiers changed from: protected */
        public Void doInBackground(AssetManager... assetManagerArr) {
            String[] list;
            String[] list2;
            Gson generateCustomGson = CollageUtils.generateCustomGson();
            AssetManager assetManager = assetManagerArr[0];
            try {
                JsonParser jsonParser = new JsonParser();
                for (String str : assetManager.list(PosterDataLoader.PATH_POSTER_LAYOUT)) {
                    if (isCancelled()) {
                        return null;
                    }
                    PosterDataLoader.addLayoutModel(this.mPosterLayoutSparseArray, PosterDataLoader.generatePosterLayoutModelByName(assetManager, generateCustomGson, str));
                }
                for (String str2 : assetManager.list(PosterDataLoader.PATH_POSTER_MODE)) {
                    if (isCancelled()) {
                        return null;
                    }
                    long currentTimeMillis = System.currentTimeMillis();
                    PosterDataLoader.addPosterModel(this.mPosterSparseArray, PosterDataLoader.generatePosterModelByName(assetManager, generateCustomGson, jsonParser, str2));
                    Log.d("PosterDataLoader", "gson parse posterModel %s coast %d", str2, Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
                }
            } catch (IOException e) {
                Log.d("PosterDataLoader", (Throwable) e);
            }
            return null;
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Void voidR) {
            if (this.mDataLoadListener != null) {
                this.mDataLoadListener.onDataLoad(this.mPosterLayoutSparseArray, this.mPosterSparseArray);
            }
        }
    }

    static {
        StringBuilder sb = new StringBuilder();
        sb.append("collage");
        sb.append(SEPARATOR);
        sb.append("poster");
        PATH_POSTER = sb.toString();
        StringBuilder sb2 = new StringBuilder();
        sb2.append(PATH_POSTER);
        sb2.append(SEPARATOR);
        sb2.append("mode");
        PATH_POSTER_MODE = sb2.toString();
        StringBuilder sb3 = new StringBuilder();
        sb3.append(PATH_POSTER);
        sb3.append(SEPARATOR);
        sb3.append("layout");
        PATH_POSTER_LAYOUT = sb3.toString();
    }

    public PosterDataLoader(AssetManager assetManager, DataLoadListener dataLoadListener) {
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

    /* access modifiers changed from: private */
    public static void addPosterModel(SparseArray<List<PosterModel>> sparseArray, PosterModel posterModel) {
        for (int i : posterModel.collageModels) {
            int i2 = i / 10;
            List list = (List) sparseArray.get(i2);
            if (list == null) {
                list = new ArrayList();
                sparseArray.put(i2, list);
            }
            list.add(posterModel);
        }
    }

    public static LayoutModel generatePosterLayoutModelByName(AssetManager assetManager, Gson gson, String str) {
        StringBuilder sb = new StringBuilder();
        sb.append(PATH_POSTER_LAYOUT);
        sb.append(SEPARATOR);
        sb.append(str);
        LayoutModel layoutModel = (LayoutModel) gson.fromJson(CollageUtils.loadResourceFileString(assetManager, sb.toString()), LayoutModel.class);
        layoutModel.name = str;
        return layoutModel;
    }

    public static PosterModel generatePosterModelByName(AssetManager assetManager, Gson gson, JsonParser jsonParser, String str) {
        StringBuilder sb = new StringBuilder();
        sb.append(PATH_POSTER_MODE);
        sb.append(SEPARATOR);
        sb.append(str);
        String sb2 = sb.toString();
        StringBuilder sb3 = new StringBuilder();
        sb3.append(sb2);
        sb3.append(SEPARATOR);
        sb3.append("main.json");
        PosterModel posterModel = (PosterModel) gson.fromJson(CollageUtils.loadResourceFileString(assetManager, sb3.toString()), PosterModel.class);
        posterModel.relativePath = sb2;
        posterModel.name = str;
        ImageElementModel[] imageElementModelArr = posterModel.imageElementModels;
        if (imageElementModelArr != null) {
            for (ImageElementModel imageElementModel : imageElementModelArr) {
                imageElementModel.relativePath = sb2;
            }
        }
        CollagePositionModel[] collagePositionModelArr = posterModel.collagePositions;
        if (collagePositionModelArr != null) {
            for (CollagePositionModel collagePositionModel : collagePositionModelArr) {
                collagePositionModel.relativePath = sb2;
            }
        }
        return posterModel;
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
