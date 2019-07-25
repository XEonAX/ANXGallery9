package com.miui.gallery.ui;

import com.miui.gallery.GalleryApp;
import com.miui.gallery.provider.CloudUtils;
import com.miui.gallery.ui.ProcessTask.OnCompleteListener;
import com.miui.gallery.ui.ProcessTask.ProcessCallback;
import com.miui.gallery.util.MediaAndAlbumOperations;
import java.io.Serializable;
import java.lang.ref.WeakReference;

public class AddRemoveFavoritesTask extends ProcessTask<Param, long[]> {

    private static class OnCompleteListenerAdapter implements OnCompleteListener<long[]> {
        private WeakReference<MediaAndAlbumOperations.OnCompleteListener> mListenerRef;

        public OnCompleteListenerAdapter(MediaAndAlbumOperations.OnCompleteListener onCompleteListener) {
            this.mListenerRef = new WeakReference<>(onCompleteListener);
        }

        public void onCompleteProcess(long[] jArr) {
            MediaAndAlbumOperations.OnCompleteListener onCompleteListener = (MediaAndAlbumOperations.OnCompleteListener) this.mListenerRef.get();
            if (onCompleteListener != null) {
                onCompleteListener.onComplete(jArr);
            }
        }
    }

    public static class Param implements Serializable {
        /* access modifiers changed from: private */
        public int mAddRemoveBy;
        /* access modifiers changed from: private */
        public String[] mData;
        /* access modifiers changed from: private */
        public long[] mIds;
        /* access modifiers changed from: private */
        public int mOperationType;

        public Param(int i, int i2, long[] jArr) {
            this.mOperationType = i;
            this.mAddRemoveBy = i2;
            this.mIds = jArr;
        }

        public Param(int i, int i2, String[] strArr) {
            this.mOperationType = i;
            this.mAddRemoveBy = i2;
            this.mData = strArr;
        }
    }

    public AddRemoveFavoritesTask() {
        super(new ProcessCallback<Param, long[]>() {
            public long[] doProcess(Param[] paramArr) {
                int access$000 = paramArr[0].mOperationType;
                int access$100 = paramArr[0].mAddRemoveBy;
                if (access$100 == 1) {
                    if (access$000 == 1) {
                        return CloudUtils.addToFavoritesBySha1(GalleryApp.sGetAndroidContext(), paramArr[0].mData);
                    }
                    if (access$000 == 2) {
                        return CloudUtils.removeFromFavoritesBySha1(GalleryApp.sGetAndroidContext(), paramArr[0].mData);
                    }
                } else if (access$100 == 2) {
                    if (access$000 == 1) {
                        return CloudUtils.addToFavoritesByPath(GalleryApp.sGetAndroidContext(), paramArr[0].mData);
                    }
                    if (access$000 == 2) {
                        return CloudUtils.removeFromFavoritesByPath(GalleryApp.sGetAndroidContext(), paramArr[0].mData);
                    }
                } else if (access$100 == 3) {
                    if (access$000 == 1) {
                        return CloudUtils.addToFavoritesById(GalleryApp.sGetAndroidContext(), paramArr[0].mIds);
                    }
                    if (access$000 == 2) {
                        return CloudUtils.removeFromFavoritesById(GalleryApp.sGetAndroidContext(), paramArr[0].mIds);
                    }
                }
                return null;
            }
        });
    }

    public void setOperationCompleteListener(MediaAndAlbumOperations.OnCompleteListener onCompleteListener) {
        if (onCompleteListener != null) {
            setCompleteListener(new OnCompleteListenerAdapter(onCompleteListener));
        } else {
            setCompleteListener(null);
        }
    }
}
