package com.miui.gallery.collage.core;

import android.app.Fragment;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.os.AsyncTask;
import android.text.format.DateFormat;
import com.miui.gallery.collage.BitmapManager;
import com.miui.gallery.collage.CollageActivity.ReplaceImageListener;
import com.miui.gallery.collage.app.common.CollageMenuFragment;
import com.miui.gallery.collage.app.common.CollageRenderFragment;
import com.miui.gallery.collage.app.common.IDataLoader;
import com.miui.gallery.editor.photo.utils.IoUtils;
import com.miui.gallery.scanner.MediaScanner;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MediaStoreUtils;
import com.miui.gallery.util.StorageUtils;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Locale;

public abstract class CollagePresenter {
    private IDataLoader mDataLoader;
    protected int mImageCount = -1;
    private CollageMenuFragment mMenuFragment;
    private CollageRenderFragment mRenderFragment;
    private ReplaceImageListener mReplaceImageListener = new ReplaceImageListener() {
        public void onReplace(Bitmap bitmap) {
            if (CollagePresenter.this.mViewInterface != null) {
                CollagePresenter.this.mViewInterface.onReplaceBitmap(bitmap);
            }
        }
    };
    private SaveTask mSaveTask;
    protected ViewInterface mViewInterface;

    public interface DataLoadListener {
        void onDataLoad();
    }

    private interface SaveListener {
        void onSaveFinish(String str, boolean z);
    }

    private static class SaveTask extends AsyncTask<Void, Void, Void> {
        private final Context mContext;
        private final String mOutPath;
        private final RenderData mRenderData;
        private final RenderEngine mRenderEngine;
        /* access modifiers changed from: private */
        public SaveListener mSaveListener;
        private boolean mSuccess;

        private SaveTask(RenderEngine renderEngine, RenderData renderData, String str, Context context) {
            this.mSuccess = false;
            this.mRenderEngine = renderEngine;
            this.mRenderData = renderData;
            this.mOutPath = str;
            this.mContext = context.getApplicationContext();
        }

        /* access modifiers changed from: protected */
        public Void doInBackground(Void... voidArr) {
            FileOutputStream fileOutputStream;
            this.mSuccess = false;
            Bitmap render = this.mRenderEngine.render(this.mRenderData);
            if (isCancelled()) {
                return null;
            }
            File file = new File(this.mOutPath);
            try {
                File parentFile = file.getParentFile();
                if (!parentFile.exists()) {
                    parentFile.mkdirs();
                }
                if (file.exists()) {
                    file.delete();
                }
                fileOutputStream = new FileOutputStream(file);
                try {
                    render.compress(CompressFormat.JPEG, 100, fileOutputStream);
                    fileOutputStream.flush();
                    MediaScanner.scanSingleFile(this.mContext, file.getPath());
                    MediaStoreUtils.insert(this.mContext, file, 1);
                    this.mSuccess = true;
                } catch (IOException e) {
                    e = e;
                }
            } catch (IOException e2) {
                e = e2;
                fileOutputStream = null;
                try {
                    Log.d("CollagePresenter", (Throwable) e);
                    IoUtils.close(fileOutputStream);
                    return null;
                } catch (Throwable th) {
                    th = th;
                    IoUtils.close(fileOutputStream);
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                fileOutputStream = null;
                IoUtils.close(fileOutputStream);
                throw th;
            }
            IoUtils.close(fileOutputStream);
            return null;
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Void voidR) {
            if (this.mSaveListener != null) {
                this.mSaveListener.onSaveFinish(this.mOutPath, this.mSuccess);
            }
        }
    }

    private static String getCreativePath() {
        return StorageUtils.getCreativeDirectory();
    }

    public void attach(ViewInterface viewInterface) {
        this.mViewInterface = viewInterface;
    }

    /* access modifiers changed from: protected */
    public abstract RenderEngine createEngine(Context context, BitmapManager bitmapManager);

    public final void detach() {
        this.mViewInterface = null;
        this.mMenuFragment = null;
        this.mRenderFragment = null;
        if (this.mSaveTask != null) {
            this.mSaveTask.mSaveListener = null;
            this.mSaveTask.cancel(false);
        }
        if (this.mDataLoader != null) {
            this.mDataLoader.cancel();
        }
        onDetach();
    }

    public void dismissControlWindow() {
        if (this.mRenderFragment != null) {
            this.mRenderFragment.dismissControlWindow();
        }
    }

    public void doSave(BitmapManager bitmapManager) {
        if (this.mRenderFragment != null && this.mViewInterface != null) {
            RenderData export = this.mRenderFragment.export();
            GallerySamplingStatHelper.recordCountEvent("collage", "collage_save", this.mRenderFragment.onSimple());
            RenderEngine createEngine = createEngine(this.mViewInterface.getContext().getApplicationContext(), bitmapManager);
            if (export == null || createEngine == null) {
                this.mViewInterface.onSaveFinish(null, false);
                return;
            }
            this.mViewInterface.onSaving();
            SaveTask saveTask = new SaveTask(createEngine, export, new File(getCreativePath(), String.format(Locale.US, "IMG_%s.jpg", new Object[]{DateFormat.format("yyyyMMdd_HHmmss", System.currentTimeMillis())})).getAbsolutePath(), this.mViewInterface.getContext().getApplicationContext());
            this.mSaveTask = saveTask;
            this.mSaveTask.mSaveListener = new SaveListener() {
                public void onSaveFinish(String str, boolean z) {
                    if (CollagePresenter.this.mViewInterface != null) {
                        CollagePresenter.this.mViewInterface.onSaveFinish(str, z);
                    }
                }
            };
            this.mSaveTask.execute(new Void[0]);
        }
    }

    public int getImageCount() {
        return this.mImageCount;
    }

    public CollageMenuFragment getMenuFragment() {
        if (this.mMenuFragment == null) {
            this.mMenuFragment = onCreateMenuFragment();
        }
        return this.mMenuFragment;
    }

    public abstract String getMenuFragmentTag();

    public Fragment getRenderFragment() {
        if (this.mRenderFragment == null) {
            this.mRenderFragment = onCreateRenderFragment();
        }
        return this.mRenderFragment;
    }

    public abstract String getRenderFragmentTag();

    public abstract int getTitle();

    /* access modifiers changed from: protected */
    public abstract boolean hasResourceData();

    public boolean isActivating() {
        return this.mRenderFragment != null && this.mRenderFragment.isActivating();
    }

    public final void loadDataFromResourceAsync(DataLoadListener dataLoadListener) {
        if (hasResourceData()) {
            if (dataLoadListener != null) {
                dataLoadListener.onDataLoad();
            }
            return;
        }
        this.mDataLoader = onCreateDataLoader(dataLoadListener);
        this.mDataLoader.loadData();
    }

    public void notifyBitmapReplace(Bitmap bitmap, Bitmap bitmap2) {
        if (this.mRenderFragment != null) {
            this.mRenderFragment.onBitmapReplace(bitmap, bitmap2);
        }
    }

    public void notifyReceiveBitmaps() {
        if (this.mRenderFragment != null) {
            this.mRenderFragment.setBitmap(this.mViewInterface.getBitmaps());
        }
    }

    public void onAttachFragment(Fragment fragment) {
        if (fragment instanceof CollageRenderFragment) {
            Bitmap[] bitmaps = this.mViewInterface.getBitmaps();
            if (bitmaps != null) {
                this.mRenderFragment.setBitmap(bitmaps);
            }
            this.mRenderFragment.setReplaceImageListener(this.mReplaceImageListener);
        } else if (fragment instanceof CollageMenuFragment) {
            this.mMenuFragment.setPresenter(this);
            if (this.mRenderFragment != null) {
                this.mMenuFragment.setRenderFragment(this.mRenderFragment);
            }
        }
    }

    /* access modifiers changed from: protected */
    public abstract IDataLoader onCreateDataLoader(DataLoadListener dataLoadListener);

    /* access modifiers changed from: protected */
    public abstract CollageMenuFragment onCreateMenuFragment();

    /* access modifiers changed from: protected */
    public abstract CollageRenderFragment onCreateRenderFragment();

    /* access modifiers changed from: protected */
    public abstract void onDetach();

    public void setImageSize(int i) {
        this.mImageCount = i;
    }

    public boolean supportImageSize(int i) {
        return true;
    }
}
