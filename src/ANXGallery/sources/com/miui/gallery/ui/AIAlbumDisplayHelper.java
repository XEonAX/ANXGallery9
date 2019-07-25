package com.miui.gallery.ui;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.support.v4.content.LocalBroadcastManager;
import android.util.SparseBooleanArray;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloudcontrol.CloudControlManager;
import com.miui.gallery.cloudcontrol.FeatureProfile.Status;
import com.miui.gallery.cloudcontrol.observers.FeatureStatusObserver;
import java.lang.ref.WeakReference;
import java.util.Observable;
import java.util.Observer;

public class AIAlbumDisplayHelper {
    private BroadcastReceiver mAIAlbumSwitchObserver;
    private AIAlbumDisplayStatusObservable mObservable;
    private FeatureStatusObserver mSearchCloudControlStatusObserver;
    private SparseBooleanArray mStatusValueCache;

    private static class AIAlbumDisplayHelperHolder {
        /* access modifiers changed from: private */
        public static final AIAlbumDisplayHelper S_INSTANCE = new AIAlbumDisplayHelper();
    }

    private class AIAlbumDisplayStatusObservable extends Observable {
        private AIAlbumDisplayStatusObservable() {
        }

        /* access modifiers changed from: 0000 */
        public void onUpdateStatus(SparseBooleanArray sparseBooleanArray) {
            setChanged();
            notifyObservers(sparseBooleanArray);
        }
    }

    public interface DisplayStatusCallback {
        void onStatusChanged(SparseBooleanArray sparseBooleanArray);
    }

    public static class WeakReferencedAIAlbumDisplayStatusObserver implements Observer {
        private WeakReference<DisplayStatusCallback> mCallbackRef;

        public WeakReferencedAIAlbumDisplayStatusObserver(DisplayStatusCallback displayStatusCallback) {
            this.mCallbackRef = new WeakReference<>(displayStatusCallback);
        }

        public void update(Observable observable, Object obj) {
            DisplayStatusCallback displayStatusCallback = (DisplayStatusCallback) this.mCallbackRef.get();
            if (displayStatusCallback != null && (obj instanceof SparseBooleanArray)) {
                displayStatusCallback.onStatusChanged((SparseBooleanArray) obj);
            }
        }
    }

    private AIAlbumDisplayHelper() {
        this.mStatusValueCache = null;
        this.mSearchCloudControlStatusObserver = new FeatureStatusObserver() {
            public void onStatusChanged(String str, Status status) {
                if ("search".equals(str)) {
                    AIAlbumDisplayHelper.this.requeryStatusAndNotifyStatusChange();
                }
            }
        };
        this.mAIAlbumSwitchObserver = new BroadcastReceiver() {
            public void onReceive(Context context, Intent intent) {
                if (intent != null && "com.miui.gallery.action.AI_ALBUM_SWITCH_CHANGE".equals(intent.getAction())) {
                    AIAlbumDisplayHelper.this.requeryStatusAndNotifyStatusChange();
                }
            }
        };
    }

    public static AIAlbumDisplayHelper getInstance() {
        return AIAlbumDisplayHelperHolder.S_INSTANCE;
    }

    /* access modifiers changed from: private */
    public void requeryStatusAndNotifyStatusChange() {
        SparseBooleanArray sparseBooleanArray = this.mStatusValueCache == null ? new SparseBooleanArray() : this.mStatusValueCache;
        this.mStatusValueCache = new SparseBooleanArray();
        boolean z = true;
        updateNewValue(sparseBooleanArray, 1, AIAlbumStatusHelper.isLocalSearchOpen(true) && AIAlbumStatusHelper.isCloudControlSearchBarOpen());
        if (!AIAlbumStatusHelper.useNewAIAlbumSwitch() || (!AIAlbumStatusHelper.isFaceAlbumEnabled() && !AIAlbumStatusHelper.isLocalSearchOpen(true))) {
            z = false;
        }
        updateNewValue(sparseBooleanArray, 2, z);
        if (this.mObservable != null && sparseBooleanArray.size() > 0) {
            this.mObservable.onUpdateStatus(sparseBooleanArray);
        }
    }

    private void updateNewValue(SparseBooleanArray sparseBooleanArray, int i, boolean z) {
        this.mStatusValueCache.put(i, z);
        if (sparseBooleanArray.indexOfKey(i) < 0 || sparseBooleanArray.get(i) != z) {
            sparseBooleanArray.put(i, z);
        } else {
            sparseBooleanArray.delete(i);
        }
    }

    public SparseBooleanArray registerAIAlbumDisplayStatusObserver(WeakReferencedAIAlbumDisplayStatusObserver weakReferencedAIAlbumDisplayStatusObserver) {
        if (this.mObservable == null) {
            this.mObservable = new AIAlbumDisplayStatusObservable();
        }
        requeryStatusAndNotifyStatusChange();
        int countObservers = this.mObservable.countObservers();
        this.mObservable.addObserver(weakReferencedAIAlbumDisplayStatusObserver);
        if (countObservers <= 0 && this.mObservable.countObservers() > 0) {
            CloudControlManager.getInstance().registerStatusObserver("search", this.mSearchCloudControlStatusObserver);
            LocalBroadcastManager.getInstance(GalleryApp.sGetAndroidContext()).registerReceiver(this.mAIAlbumSwitchObserver, new IntentFilter("com.miui.gallery.action.AI_ALBUM_SWITCH_CHANGE"));
        }
        return this.mStatusValueCache.clone();
    }

    public void unregisterAIAlbumDisplayStatusObserver(WeakReferencedAIAlbumDisplayStatusObserver weakReferencedAIAlbumDisplayStatusObserver) {
        if (this.mObservable != null) {
            this.mObservable.deleteObserver(weakReferencedAIAlbumDisplayStatusObserver);
            if (this.mObservable.countObservers() <= 0) {
                CloudControlManager.getInstance().unregisterStatusObserver(this.mSearchCloudControlStatusObserver);
                LocalBroadcastManager.getInstance(GalleryApp.sGetAndroidContext()).unregisterReceiver(this.mAIAlbumSwitchObserver);
            }
        }
    }
}
