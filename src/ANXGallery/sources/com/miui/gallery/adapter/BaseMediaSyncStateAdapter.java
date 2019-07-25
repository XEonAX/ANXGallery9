package com.miui.gallery.adapter;

import android.content.Context;
import com.miui.gallery.adapter.SyncStateDisplay.DisplayScene;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.util.SyncUtil;
import java.lang.ref.WeakReference;

public abstract class BaseMediaSyncStateAdapter extends BaseMediaAdapterDeprecated {
    /* access modifiers changed from: private */
    public static volatile boolean sIsGalleryCloudSyncable;
    /* access modifiers changed from: private */
    public static volatile boolean sIsLoginAccount;
    private static Runnable sUpdateRunnable;
    protected DisplayScene mShowScene;
    protected int mSyncStateDisplayOptions;

    private static class SyncStateRunnable implements Runnable {
        /* access modifiers changed from: private */
        public final WeakReference<BaseMediaSyncStateAdapter> mAdapterRef;

        public SyncStateRunnable(BaseMediaSyncStateAdapter baseMediaSyncStateAdapter) {
            this.mAdapterRef = new WeakReference<>(baseMediaSyncStateAdapter);
        }

        private void notifyStateChanged() {
            ThreadManager.getMainHandler().post(new Runnable() {
                public void run() {
                    BaseMediaSyncStateAdapter baseMediaSyncStateAdapter = (BaseMediaSyncStateAdapter) SyncStateRunnable.this.mAdapterRef.get();
                    if (baseMediaSyncStateAdapter != null) {
                        baseMediaSyncStateAdapter.notifyDataSetChanged();
                    }
                }
            });
        }

        public void run() {
            BaseMediaSyncStateAdapter baseMediaSyncStateAdapter = (BaseMediaSyncStateAdapter) this.mAdapterRef.get();
            if (baseMediaSyncStateAdapter != null) {
                Context applicationContext = baseMediaSyncStateAdapter.mContext.getApplicationContext();
                BaseMediaSyncStateAdapter.sIsLoginAccount = SyncUtil.existXiaomiAccount(applicationContext);
                boolean z = false;
                if (BaseMediaSyncStateAdapter.sIsLoginAccount) {
                    z = SyncUtil.isGalleryCloudSyncable(applicationContext);
                }
                if (BaseMediaSyncStateAdapter.sIsGalleryCloudSyncable != z) {
                    BaseMediaSyncStateAdapter.sIsGalleryCloudSyncable = z;
                    notifyStateChanged();
                }
            }
        }
    }

    public BaseMediaSyncStateAdapter(Context context) {
        this(context, DisplayScene.SCENE_NONE);
    }

    public BaseMediaSyncStateAdapter(Context context, DisplayScene displayScene) {
        this(context, displayScene, 7);
    }

    public BaseMediaSyncStateAdapter(Context context, DisplayScene displayScene, int i) {
        super(context);
        this.mShowScene = displayScene;
        this.mSyncStateDisplayOptions = i;
        updateGalleryCloudSyncableState();
    }

    /* access modifiers changed from: protected */
    public int getSyncStateInternal(int i) {
        return !sIsGalleryCloudSyncable ? (!sIsLoginAccount || i != 3) ? Integer.MAX_VALUE : 4 : i;
    }

    public void updateGalleryCloudSyncableState() {
        if (sUpdateRunnable == null) {
            sUpdateRunnable = new SyncStateRunnable(this);
        }
        ThreadManager.getWorkHandler().removeCallbacks(sUpdateRunnable);
        ThreadManager.getWorkHandler().postDelayed(sUpdateRunnable, 100);
    }
}
