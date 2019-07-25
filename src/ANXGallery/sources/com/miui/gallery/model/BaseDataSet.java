package com.miui.gallery.model;

import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.os.AsyncTask;
import android.text.TextUtils;
import android.util.SparseArray;
import com.miui.gallery.R;
import com.miui.gallery.ui.DeletionTask.OnDeletionCompleteListener;
import com.miui.gallery.ui.ProcessTask;
import com.miui.gallery.ui.ProcessTask.ProcessCallback;
import com.miui.gallery.util.DialogUtil;
import com.miui.gallery.util.MediaAndAlbumOperations.OnAddAlbumListener;
import com.miui.gallery.util.MediaAndAlbumOperations.OnCompleteListener;
import com.miui.gallery.util.MiscUtil;

public abstract class BaseDataSet {
    private SparseArray<BaseDataItem> mBaseDataCache;
    protected int mInitPosition;

    public BaseDataSet() {
        this(0);
    }

    public BaseDataSet(int i) {
        this.mBaseDataCache = new SparseArray<>();
        this.mInitPosition = i;
    }

    private int getIndexOfItem(long j, int i, int i2) {
        int count = getCount();
        int clamp = MiscUtil.clamp(i2, 0, count);
        for (int clamp2 = MiscUtil.clamp(i, 0, count - 1); clamp2 < clamp; clamp2++) {
            if (getItemKey(clamp2) == j) {
                return clamp2;
            }
        }
        return -1;
    }

    private int getIndexOfItem(BaseDataItem baseDataItem, int i, int i2) {
        int count = getCount();
        int clamp = MiscUtil.clamp(i2, 0, count);
        for (int clamp2 = MiscUtil.clamp(i, 0, count - 1); clamp2 < clamp; clamp2++) {
            if (baseDataItem.getKey() == getItemKey(clamp2)) {
                return clamp2;
            }
        }
        return -1;
    }

    private int getIndexOfItem(String str, int i, int i2) {
        int count = getCount();
        int clamp = MiscUtil.clamp(i2, 0, count);
        for (int clamp2 = MiscUtil.clamp(i, 0, count - 1); clamp2 < clamp; clamp2++) {
            if (str.equalsIgnoreCase(getItemPath(clamp2))) {
                return clamp2;
            }
        }
        return -1;
    }

    public boolean addNewFile(String str, int i) {
        this.mBaseDataCache.clear();
        return false;
    }

    public abstract boolean addToAlbum(Activity activity, int i, boolean z, boolean z2, OnAddAlbumListener onAddAlbumListener);

    public boolean addToFavorites(Activity activity, int i, OnCompleteListener onCompleteListener) {
        return false;
    }

    /* access modifiers changed from: protected */
    public abstract void bindItem(BaseDataItem baseDataItem, int i);

    /* access modifiers changed from: protected */
    public abstract BaseDataItem createItem(int i);

    public void delete(final Activity activity, int i, final OnDeletionCompleteListener onDeletionCompleteListener) {
        final BaseDataItem item = getItem(null, i);
        if (item != null) {
            Activity activity2 = activity;
            DialogUtil.showInfoDialog((Context) activity2, getDeleteDialogMessage(item, activity), activity.getResources().getString(R.string.delete), 17039370, 17039360, (OnClickListener) new OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    ProcessTask processTask = new ProcessTask(new ProcessCallback<Void, Integer>() {
                        public Integer doProcess(Void[] voidArr) {
                            return Integer.valueOf(BaseDataSet.this.doDelete(item));
                        }
                    });
                    processTask.setCompleteListener(new ProcessTask.OnCompleteListener() {
                        public void onCompleteProcess(Object obj) {
                            if (onDeletionCompleteListener != null) {
                                onDeletionCompleteListener.onDeleted(obj == null ? 0 : ((Integer) obj).intValue(), null);
                            }
                        }
                    });
                    processTask.showProgress(activity, activity.getString(R.string.delete_in_process));
                    processTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
                }
            }, (OnClickListener) new OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    dialogInterface.cancel();
                }
            });
        }
    }

    /* access modifiers changed from: protected */
    public abstract int doDelete(BaseDataItem baseDataItem);

    /* access modifiers changed from: protected */
    public boolean foldBurst() {
        return false;
    }

    public abstract int getCount();

    /* access modifiers changed from: protected */
    public String getDeleteDialogMessage(BaseDataItem baseDataItem, Context context) {
        if (baseDataItem.isBurstItem()) {
            int size = baseDataItem.getBurstGroup() == null ? 0 : baseDataItem.getBurstGroup().size();
            return context.getResources().getQuantityString(R.plurals.delete_third_party_burst_photo, size, new Object[]{Integer.valueOf(size)});
        }
        return context.getResources().getString(baseDataItem.isVideo() ? R.string.delete_third_party_video : R.string.delete_third_party_photo);
    }

    public int getIndexOfItem(long j, int i) {
        if (i < 0) {
            return getIndexOfItem(j, 0, getCount());
        }
        int i2 = i - 20;
        int indexOfItem = getIndexOfItem(j, i2, i);
        if (indexOfItem != -1) {
            return indexOfItem;
        }
        int i3 = i + 20;
        int indexOfItem2 = getIndexOfItem(j, i, i3);
        if (indexOfItem2 != -1) {
            return indexOfItem2;
        }
        int indexOfItem3 = getIndexOfItem(j, 0, i2);
        return indexOfItem3 != -1 ? indexOfItem3 : getIndexOfItem(j, i3, getCount());
    }

    public int getIndexOfItem(BaseDataItem baseDataItem, int i) {
        if (baseDataItem == null) {
            return -1;
        }
        int count = getCount();
        if (i < 0) {
            return getIndexOfItem(baseDataItem, 0, count);
        }
        int i2 = i + 20;
        int indexOfItem = getIndexOfItem(baseDataItem, i, i2);
        if (indexOfItem != -1) {
            return indexOfItem;
        }
        int i3 = i - 20;
        int indexOfItem2 = getIndexOfItem(baseDataItem, i3, i);
        if (indexOfItem2 != -1) {
            return indexOfItem2;
        }
        int indexOfItem3 = getIndexOfItem(baseDataItem, 0, i3);
        return indexOfItem3 != -1 ? indexOfItem3 : getIndexOfItem(baseDataItem, i2, count);
    }

    public int getIndexOfItem(String str, int i) {
        if (TextUtils.isEmpty(str)) {
            return -1;
        }
        if (i < 0) {
            return getIndexOfItem(str, 0, getCount());
        }
        int i2 = i - 20;
        int indexOfItem = getIndexOfItem(str, i2, i);
        if (indexOfItem != -1) {
            return indexOfItem;
        }
        int i3 = i + 20;
        int indexOfItem2 = getIndexOfItem(str, i, i3);
        if (indexOfItem2 != -1) {
            return indexOfItem2;
        }
        int indexOfItem3 = getIndexOfItem(str, 0, i2);
        return indexOfItem3 != -1 ? indexOfItem3 : getIndexOfItem(str, i3, getCount());
    }

    public int getInitPosition() {
        return this.mInitPosition;
    }

    public BaseDataItem getItem(BaseDataItem baseDataItem, int i) {
        if (baseDataItem == null) {
            BaseDataItem baseDataItem2 = (BaseDataItem) this.mBaseDataCache.get(i);
            if (baseDataItem2 != null) {
                return baseDataItem2;
            }
            BaseDataItem createItem = createItem(i);
            this.mBaseDataCache.put(i, createItem);
            return createItem;
        }
        bindItem(baseDataItem, i);
        return baseDataItem;
    }

    public abstract long getItemKey(int i);

    /* access modifiers changed from: protected */
    public abstract String getItemPath(int i);

    public abstract void onRelease();

    public final void release() {
        this.mBaseDataCache.clear();
        onRelease();
    }

    public boolean removeFromFavorites(Activity activity, int i, OnCompleteListener onCompleteListener) {
        return false;
    }

    public boolean removeFromSecret(Activity activity, int i, OnCompleteListener onCompleteListener) {
        return false;
    }

    public void setInitPosition(int i) {
        this.mInitPosition = i;
    }
}
