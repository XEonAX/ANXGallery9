package com.miui.gallery.editor.photo.sdk;

import android.content.Context;
import android.graphics.Bitmap;
import android.os.AsyncTask;
import com.miui.filtersdk.BeautificationSDK;
import com.miui.gallery.editor.photo.core.imports.filter.FilterEngine;
import com.miui.gallery.editor.photo.core.imports.filter.FilterManager;

public class AutoRenderer {
    private AutoRenderTask mAutoRenderTask;
    /* access modifiers changed from: private */
    public FilterEngine mFilterEngine;

    private class AutoRenderTask extends AsyncTask<Bitmap, Void, Bitmap> {
        private Callback mCallback;

        public AutoRenderTask(Callback callback) {
            this.mCallback = callback;
        }

        /* access modifiers changed from: protected */
        public Bitmap doInBackground(Bitmap... bitmapArr) {
            if (AutoRenderer.this.mFilterEngine != null) {
                return AutoRenderer.this.mFilterEngine.render(bitmapArr[0], FilterManager.getAutoBeautifyData(), null);
            }
            return null;
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Bitmap bitmap) {
            if (bitmap != null) {
                this.mCallback.onDone(bitmap);
            } else {
                this.mCallback.onError(0, bitmap);
            }
            super.onPostExecute(bitmap);
        }
    }

    public interface Callback {
        void onDone(Bitmap bitmap);

        void onError(int i, Object obj);
    }

    public AutoRenderer(Context context) {
        Context applicationContext = context.getApplicationContext();
        this.mFilterEngine = new FilterEngine(applicationContext);
        BeautificationSDK.init(applicationContext);
    }

    public void release() {
        this.mFilterEngine.release();
        this.mFilterEngine = null;
        if (this.mAutoRenderTask != null) {
            this.mAutoRenderTask.cancel(true);
        }
    }

    public Bitmap render(Bitmap bitmap) {
        return this.mFilterEngine.render(bitmap, FilterManager.getAutoBeautifyData(), null);
    }

    public void render(Bitmap bitmap, Callback callback) {
        this.mAutoRenderTask = new AutoRenderTask(callback);
        this.mAutoRenderTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Bitmap[]{bitmap});
    }
}
