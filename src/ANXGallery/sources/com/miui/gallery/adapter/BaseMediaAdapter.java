package com.miui.gallery.adapter;

import android.content.Context;
import android.graphics.RectF;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.OnScrollListener;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.R;
import com.miui.gallery.adapter.CheckableAdapter.CheckedItem;
import com.miui.gallery.adapter.SyncStateDisplay.DisplayScene;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.util.SyncUtil;
import com.miui.gallery.widget.recyclerview.BaseViewHolder;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.assist.ViewScaleType;
import java.lang.ref.WeakReference;

public abstract class BaseMediaAdapter<VH extends BaseViewHolder> extends BaseGalleryCursorAdapter<VH> {
    /* access modifiers changed from: private */
    public static volatile boolean sIsGalleryCloudSyncable;
    /* access modifiers changed from: private */
    public static volatile boolean sIsLoginAccount;
    private static Runnable sUpdateRunnable;
    protected DisplayScene mShowScene;
    protected int mSyncStateDisplayOptions;
    protected int mViewScrollState;

    private static class OnScrollListenerWrapper extends OnScrollListener {
        private final OnScrollListener mWrapped;

        public OnScrollListenerWrapper(OnScrollListener onScrollListener) {
            this.mWrapped = onScrollListener;
        }

        public void onScrollStateChanged(RecyclerView recyclerView, int i) {
            if (this.mWrapped != null) {
                this.mWrapped.onScrollStateChanged(recyclerView, i);
            }
        }

        public void onScrolled(RecyclerView recyclerView, int i, int i2) {
            if (this.mWrapped != null) {
                this.mWrapped.onScrolled(recyclerView, i, i2);
            }
        }
    }

    private static class SyncStateRunnable implements Runnable {
        /* access modifiers changed from: private */
        public final WeakReference<BaseMediaAdapter> mAdapterRef;

        public SyncStateRunnable(BaseMediaAdapter baseMediaAdapter) {
            this.mAdapterRef = new WeakReference<>(baseMediaAdapter);
        }

        private void notifyStateChanged() {
            ThreadManager.getMainHandler().post(new Runnable() {
                public void run() {
                    BaseMediaAdapter baseMediaAdapter = (BaseMediaAdapter) SyncStateRunnable.this.mAdapterRef.get();
                    if (baseMediaAdapter != null) {
                        baseMediaAdapter.notifyDataSetChanged();
                    }
                }
            });
        }

        public void run() {
            BaseMediaAdapter baseMediaAdapter = (BaseMediaAdapter) this.mAdapterRef.get();
            if (baseMediaAdapter != null) {
                Context applicationContext = baseMediaAdapter.mContext.getApplicationContext();
                BaseMediaAdapter.sIsLoginAccount = SyncUtil.existXiaomiAccount(applicationContext);
                boolean z = false;
                if (BaseMediaAdapter.sIsLoginAccount) {
                    z = SyncUtil.isGalleryCloudSyncable(applicationContext);
                }
                if (BaseMediaAdapter.sIsGalleryCloudSyncable != z) {
                    BaseMediaAdapter.sIsGalleryCloudSyncable = z;
                    notifyStateChanged();
                }
            }
        }
    }

    public BaseMediaAdapter(Context context) {
        this(context, DisplayScene.SCENE_NONE);
    }

    public BaseMediaAdapter(Context context, DisplayScene displayScene) {
        this(context, displayScene, 7);
    }

    public BaseMediaAdapter(Context context, DisplayScene displayScene, int i) {
        super(context);
        this.mViewScrollState = 0;
        this.mShowScene = displayScene;
        this.mSyncStateDisplayOptions = i;
        updateGalleryCloudSyncableState();
    }

    public abstract void doBindViewHolder(VH vh, int i);

    public OnScrollListener generateWrapScrollListener(OnScrollListener onScrollListener) {
        return new OnScrollListenerWrapper(onScrollListener) {
            public void onScrollStateChanged(RecyclerView recyclerView, int i) {
                super.onScrollStateChanged(recyclerView, i);
                BaseMediaAdapter.this.onViewScrollStateChanged(recyclerView, i);
            }

            public void onScrolled(RecyclerView recyclerView, int i, int i2) {
                super.onScrolled(recyclerView, i, i2);
                BaseMediaAdapter.this.onViewScrolled(recyclerView, i, i2);
            }
        };
    }

    public CheckedItem getCheckedItem(int i) {
        if (i >= getItemCount() || i < 0) {
            return null;
        }
        return new Builder().setId(getItemKey(i)).setSha1(getSha1(i)).setMicroThumbnailFile(getMicroThumbFilePath(i)).setThumbnailFile(getThumbFilePath(i)).setOriginFile(getOriginFilePath(i)).setMimeType(getMimeType(i)).build();
    }

    /* access modifiers changed from: protected */
    public ImageSize getDisplayImageSize(int i) {
        return ThumbConfig.get().sMicroTargetSize;
    }

    /* access modifiers changed from: protected */
    public ViewScaleType getDisplayScaleType(int i) {
        return ViewScaleType.CROP;
    }

    public RectF getItemDecodeRectF(int i) {
        return null;
    }

    public abstract long getItemKey(int i);

    public abstract String getMimeType(int i);

    public abstract String getSha1(int i);

    /* access modifiers changed from: protected */
    public int getSyncStateInternal(int i) {
        return !sIsGalleryCloudSyncable ? (!sIsLoginAccount || i != 3) ? Integer.MAX_VALUE : 4 : i;
    }

    public boolean isFavorite(int i) {
        return false;
    }

    public final void onBindViewHolder(VH vh, int i) {
        vh.itemView.setTag(R.id.tag_item_position, Integer.valueOf(i));
        doBindViewHolder(vh, i);
    }

    /* access modifiers changed from: protected */
    public void onViewScrollStateChanged(RecyclerView recyclerView, int i) {
        this.mViewScrollState = i;
    }

    /* access modifiers changed from: protected */
    public void onViewScrolled(RecyclerView recyclerView, int i, int i2) {
    }

    public void updateGalleryCloudSyncableState() {
        if (sUpdateRunnable == null) {
            sUpdateRunnable = new SyncStateRunnable(this);
        }
        ThreadManager.getWorkHandler().removeCallbacks(sUpdateRunnable);
        ThreadManager.getWorkHandler().postDelayed(sUpdateRunnable, 100);
    }
}
