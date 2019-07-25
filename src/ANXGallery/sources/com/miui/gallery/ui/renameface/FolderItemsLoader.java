package com.miui.gallery.ui.renameface;

import android.app.Activity;
import android.os.AsyncTask;
import com.miui.gallery.model.DisplayFolderItem;
import java.lang.ref.SoftReference;
import java.util.ArrayList;

public abstract class FolderItemsLoader {
    protected SoftReference<Activity> mActivityRef;
    /* access modifiers changed from: private */
    public boolean mCancelled;
    protected ArrayList<DisplayFolderItem> mItems = new ArrayList<>();
    /* access modifiers changed from: private */
    public ArrayList<DisplayFolderItem> mLoadedItems = null;
    /* access modifiers changed from: private */
    public final LoaderUpdatedItems mOutListener;
    private String mPath;
    private long[] mSelectedFoldersLocalID;

    public interface LoaderUpdatedItems {
        void onLoaderUpdatedItems();
    }

    public FolderItemsLoader(Activity activity, String str, LoaderUpdatedItems loaderUpdatedItems, long[] jArr, boolean z) {
        this.mPath = str;
        this.mOutListener = loaderUpdatedItems;
        this.mSelectedFoldersLocalID = jArr;
        this.mActivityRef = new SoftReference<>(activity);
        reload();
    }

    private void reload() {
        new AsyncTask<Void, Void, ArrayList<DisplayFolderItem>>() {
            /* access modifiers changed from: protected */
            public ArrayList<DisplayFolderItem> doInBackground(Void... voidArr) {
                FolderItemsLoader.this.mLoadedItems = FolderItemsLoader.this.refreshCloudFolderItems();
                return FolderItemsLoader.this.mLoadedItems;
            }

            /* access modifiers changed from: protected */
            public void onPostExecute(ArrayList<DisplayFolderItem> arrayList) {
                FolderItemsLoader.this.mItems = arrayList;
                if (!FolderItemsLoader.this.mCancelled && FolderItemsLoader.this.mOutListener != null) {
                    FolderItemsLoader.this.mOutListener.onLoaderUpdatedItems();
                }
            }
        }.execute(new Void[0]);
    }

    public void cancel() {
        this.mCancelled = true;
    }

    /* access modifiers changed from: protected */
    public boolean isMediaSetCandidate(String str) {
        boolean z = false;
        if (this.mSelectedFoldersLocalID != null) {
            int i = 0;
            while (true) {
                if (i >= this.mSelectedFoldersLocalID.length) {
                    break;
                } else if (Long.parseLong(str) == this.mSelectedFoldersLocalID[i]) {
                    z = true;
                    break;
                } else {
                    i++;
                }
            }
        }
        return !z;
    }

    /* access modifiers changed from: protected */
    public ArrayList<DisplayFolderItem> refreshCloudFolderItems() {
        return new ArrayList<>();
    }

    public final ArrayList<DisplayFolderItem> tryToGetLoadedItems(long j) {
        long currentTimeMillis = System.currentTimeMillis();
        while (this.mLoadedItems == null) {
            try {
                Thread.sleep(100);
                if (System.currentTimeMillis() - currentTimeMillis >= j) {
                    return null;
                }
            } catch (InterruptedException unused) {
                return null;
            }
        }
        return this.mLoadedItems;
    }

    public final ArrayList<DisplayFolderItem> unblockGetItems() {
        return this.mItems;
    }
}
