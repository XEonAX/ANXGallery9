package com.miui.gallery.loader;

import android.content.AsyncTaskLoader;
import android.content.Context;
import com.miui.gallery.dao.GalleryLiteEntityManager;
import com.miui.gallery.model.Album;
import java.util.List;

public class AlbumSnapshotLoader extends AsyncTaskLoader<List<Album>> {
    private List<Album> mDataSet;

    public AlbumSnapshotLoader(Context context) {
        super(context);
    }

    public final void deliverResult(List<Album> list) {
        if (isReset()) {
            if (list != null) {
                list.clear();
            }
            return;
        }
        List<Album> list2 = this.mDataSet;
        this.mDataSet = list;
        if (isStarted()) {
            super.deliverResult(list);
        }
        if (!(list2 == null || list2 == list)) {
            list2.clear();
        }
    }

    public List<Album> loadInBackground() {
        return GalleryLiteEntityManager.getInstance().query(Album.class, null, null);
    }

    public final void onCanceled(List<Album> list) {
        if (list != null) {
            list.clear();
        }
    }

    /* access modifiers changed from: protected */
    public final void onReset() {
        super.onReset();
        onStopLoading();
        if (this.mDataSet != null) {
            this.mDataSet.clear();
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
    public void onStopLoading() {
        cancelLoad();
    }
}
