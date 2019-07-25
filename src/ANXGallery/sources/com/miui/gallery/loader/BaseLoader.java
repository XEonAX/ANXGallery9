package com.miui.gallery.loader;

import android.content.AsyncTaskLoader;
import android.content.Context;
import com.miui.gallery.model.BaseDataSet;

public abstract class BaseLoader extends AsyncTaskLoader<BaseDataSet> {
    private OnLoadCompleteListener mBackgroundLoadListener;
    protected BaseDataSet mDataSet;

    public interface OnLoadCompleteListener {
        void onLoadComplete(BaseLoader baseLoader, BaseDataSet baseDataSet);
    }

    public BaseLoader(Context context) {
        super(context);
    }

    public final void deliverResult(BaseDataSet baseDataSet) {
        if (isReset()) {
            if (baseDataSet != null) {
                baseDataSet.release();
            }
            return;
        }
        BaseDataSet baseDataSet2 = this.mDataSet;
        this.mDataSet = baseDataSet;
        if (isStarted()) {
            super.deliverResult(baseDataSet);
        } else if (this.mBackgroundLoadListener != null) {
            this.mBackgroundLoadListener.onLoadComplete(this, baseDataSet);
        }
        if (!(baseDataSet2 == null || baseDataSet2 == baseDataSet)) {
            baseDataSet2.release();
        }
    }

    public final void onCanceled(BaseDataSet baseDataSet) {
        if (baseDataSet != null) {
            baseDataSet.release();
        }
        if (!isStarted() && this.mBackgroundLoadListener != null) {
            this.mBackgroundLoadListener.onLoadComplete(this, null);
        }
    }

    /* access modifiers changed from: protected */
    public final void onReset() {
        super.onReset();
        onStopLoading();
        if (this.mDataSet != null) {
            this.mDataSet.release();
            this.mDataSet = null;
        }
    }

    /* access modifiers changed from: protected */
    public final void onStartLoading() {
        if (this.mDataSet != null) {
            deliverResult(this.mDataSet);
        }
        if (takeContentChanged() || this.mDataSet == null) {
            forceLoad();
        }
    }

    /* access modifiers changed from: protected */
    public final void onStopLoading() {
        cancelLoad();
    }

    public void setBackgroundLoadListener(OnLoadCompleteListener onLoadCompleteListener) {
        this.mBackgroundLoadListener = onLoadCompleteListener;
    }
}
