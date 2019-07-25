package com.miui.gallery.ui;

import android.app.Activity;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.provider.CloudUtils;
import com.miui.gallery.ui.ProcessTask.OnCompleteListener;
import com.miui.gallery.ui.ProcessTask.ProcessCallback;
import com.miui.gallery.util.DocumentProviderUtils;
import java.io.Serializable;
import java.lang.ref.WeakReference;

public class DeletionTask extends ProcessTask<Param, long[]> {
    /* access modifiers changed from: private */
    public WeakReference<Activity> mRef;

    public interface OnDeletionCompleteListener {
        void onDeleted(int i, long[] jArr);
    }

    public static class Param implements Serializable {
        public long mAlbumId;
        public String mAlbumName;
        public int mDeleteBy;
        public int mDeleteOptions;
        public int mDeleteReason;
        public int mDupType;
        public long[] mIds;
        public boolean mIsBurstItems;
        public String[] mPaths;

        public Param(long[] jArr, int i, int i2) {
            this.mDupType = 0;
            this.mAlbumId = -1;
            this.mDeleteBy = 2;
            this.mIds = jArr;
            this.mDeleteOptions = i;
            this.mDeleteReason = i2;
        }

        public Param(long[] jArr, int i, long j, String str, int i2) {
            this.mDupType = 0;
            this.mAlbumId = -1;
            this.mIds = jArr;
            this.mDupType = i;
            this.mAlbumId = j;
            this.mAlbumName = str;
            this.mDeleteBy = 0;
            this.mDeleteReason = i2;
        }

        public Param(long[] jArr, int i, long j, String str, int i2, boolean z) {
            this.mDupType = 0;
            this.mAlbumId = -1;
            this.mIds = jArr;
            this.mDupType = i;
            this.mAlbumId = j;
            this.mAlbumName = str;
            this.mDeleteBy = 0;
            this.mDeleteReason = i2;
            this.mIsBurstItems = z;
        }

        public Param(String[] strArr, int i, int i2) {
            this.mDupType = 0;
            this.mAlbumId = -1;
            this.mDeleteBy = 1;
            this.mPaths = strArr;
            this.mDeleteOptions = i;
            this.mDeleteReason = i2;
        }

        public int getItemsCount() {
            switch (this.mDeleteBy) {
                case 0:
                    return this.mIds.length;
                case 1:
                    return this.mPaths.length;
                case 2:
                    return this.mIds.length;
                default:
                    return 0;
            }
        }
    }

    public DeletionTask() {
        super(new ProcessCallback<Param, long[]>() {
            public long[] doProcess(Param[] paramArr) {
                long[] jArr = {-112};
                boolean needRequestExternalSDCardPermission = DocumentProviderUtils.needRequestExternalSDCardPermission(GalleryApp.sGetAndroidContext());
                if (paramArr[0].mDeleteBy == 0) {
                    if (!needRequestExternalSDCardPermission) {
                        jArr = CloudUtils.deleteById(GalleryApp.sGetAndroidContext(), paramArr[0].mDupType, paramArr[0].mDeleteOptions, paramArr[0].mDeleteReason, paramArr[0].mIds);
                    }
                    return jArr;
                } else if (paramArr[0].mDeleteBy == 1) {
                    if (!needRequestExternalSDCardPermission) {
                        jArr = CloudUtils.deleteByPath(GalleryApp.sGetAndroidContext(), paramArr[0].mDeleteOptions, paramArr[0].mDeleteReason, paramArr[0].mPaths);
                    }
                    return jArr;
                } else if (paramArr[0].mDeleteBy != 2) {
                    return null;
                } else {
                    if (!needRequestExternalSDCardPermission) {
                        jArr = CloudUtils.deleteAlbum(GalleryApp.sGetAndroidContext(), paramArr[0].mDeleteOptions, paramArr[0].mDeleteReason, paramArr[0].mIds);
                    }
                    return jArr;
                }
            }
        });
    }

    public void setOnDeletionCompleteListener(final OnDeletionCompleteListener onDeletionCompleteListener) {
        if (onDeletionCompleteListener != null) {
            setCompleteListener(new OnCompleteListener<long[]>() {
                public void onCompleteProcess(long[] jArr) {
                    int length = jArr == null ? 0 : jArr.length;
                    Activity activity = DeletionTask.this.mRef != null ? (Activity) DeletionTask.this.mRef.get() : null;
                    if (length == 1 && jArr[0] == -112 && activity != null) {
                        DocumentProviderUtils.startExtSDCardPermissionActivityForResult(activity);
                    } else if (onDeletionCompleteListener != null) {
                        onDeletionCompleteListener.onDeleted(length, jArr);
                    }
                }
            });
        } else {
            setCompleteListener(new OnCompleteListener<long[]>() {
                public void onCompleteProcess(long[] jArr) {
                    int length = jArr == null ? 0 : jArr.length;
                    Activity activity = DeletionTask.this.mRef != null ? (Activity) DeletionTask.this.mRef.get() : null;
                    if (length == 1 && jArr[0] == -112 && activity != null) {
                        DocumentProviderUtils.startExtSDCardPermissionActivityForResult(activity);
                    }
                }
            });
        }
    }

    public void showProgress(Activity activity) {
        if (activity != null) {
            this.mRef = new WeakReference<>(activity);
            super.showProgress(activity, activity.getString(R.string.delete_in_process));
        }
    }
}
