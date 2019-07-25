package com.miui.gallery.cloud.syncstate;

import android.accounts.Account;
import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import com.miui.account.AccountHelper;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.cloud.GalleryCloudUtils;
import com.miui.gallery.provider.GalleryContract.Cloud;
import com.miui.gallery.provider.GalleryContract.ShareImage;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;
import com.miui.gallery.util.deviceprovider.UploadStatusController;
import java.util.Locale;
import miui.cloud.MiCloudCompat;
import miui.cloud.sync.MiCloudStatusInfo;
import miui.cloud.sync.MiCloudStatusInfo.QuotaInfo;

public class SyncStateUtil {

    public static class CloudSpaceInfo {
        private QuotaInfo mInfo;

        public CloudSpaceInfo(Context context) {
            MiCloudStatusInfo miCloudStatusInfo;
            QuotaInfo quotaInfo = null;
            try {
                miCloudStatusInfo = MiCloudStatusInfo.fromUserData(context);
            } catch (Exception e) {
                e.printStackTrace();
                miCloudStatusInfo = null;
            }
            if (miCloudStatusInfo != null) {
                quotaInfo = miCloudStatusInfo.getQuotaInfo();
            }
            this.mInfo = quotaInfo;
        }

        public long getTotal() {
            if (this.mInfo != null) {
                return this.mInfo.getTotal();
            }
            return 0;
        }

        public long getUsed() {
            if (this.mInfo != null) {
                return this.mInfo.getUsed();
            }
            return 0;
        }

        public boolean isSpaceLow() {
            boolean z = true;
            if (this.mInfo == null) {
                return true;
            }
            if (!this.mInfo.isSpaceFull() && !this.mInfo.isSpaceLowPercent()) {
                z = false;
            }
            return z;
        }
    }

    public static CloudSpaceInfo getCloudSpaceInfo(Context context) {
        return new CloudSpaceInfo(context);
    }

    public static DirtyCount getDirtyCount(Context context) {
        String[] strArr = {"count(*)", "serverType", String.format(Locale.US, " CASE WHEN ((serverType = 1 AND size < %s) OR (serverType = 2 AND size < %s)) THEN 0 ELSE 1 END AS oversized", new Object[]{Long.valueOf(CloudUtils.getMaxImageSizeLimit()), Long.valueOf(CloudUtils.getMaxVideoSizeLimit())})};
        return queryDirtyCount(context, GalleryCloudUtils.CLOUD_URI, strArr, String.format(Locale.US, "(%s) AND (%s = %s OR %s = %s) AND (%s = %s OR %s = %s) GROUP BY %s, %s", new Object[]{CloudUtils.SELECTION_OWNER_NEED_SYNC, "serverType", Integer.valueOf(1), "serverType", Integer.valueOf(2), "localFlag", Integer.valueOf(7), "localFlag", Integer.valueOf(8), "serverType", "oversized"})).plus(queryDirtyCount(context, GalleryCloudUtils.SHARE_IMAGE_URI, strArr, String.format(Locale.US, "(%s = %d OR %s = %d)  GROUP BY %s, %s", new Object[]{"localFlag", Integer.valueOf(7), "localFlag", Integer.valueOf(8), "serverType", "oversized"})));
    }

    public static long[] getDirtySize(Context context) {
        String format = String.format(Locale.US, "(%s) AND (%s = %s OR %s = %s) AND (%s = %s OR %s = %s) GROUP BY %s", new Object[]{CloudUtils.SELECTION_OWNER_NEED_SYNC, "serverType", Integer.valueOf(1), "serverType", Integer.valueOf(2), "localFlag", Integer.valueOf(7), "localFlag", Integer.valueOf(8), "serverType"});
        String format2 = String.format(Locale.US, "(%s = %d OR %s = %d) GROUP BY %s", new Object[]{"localFlag", Integer.valueOf(7), "localFlag", Integer.valueOf(8), "serverType"});
        long[] querySize = querySize(context, Cloud.CLOUD_URI, format);
        long[] querySize2 = querySize(context, ShareImage.SHARE_URI, format2);
        return new long[]{querySize[0] + querySize2[0], querySize[1] + querySize2[1]};
    }

    public static String getQuantityStringWithUnit(Context context, long j) {
        return MiCloudCompat.getQuantityStringWithUnit(j);
    }

    public static int[] getSyncedCount(Context context) {
        return querySyncedCount(context, Cloud.CLOUD_URI, String.format(Locale.US, "%s AND (%s = %s OR %s = %s) GROUP BY %s", new Object[]{"(localFlag = 0 AND serverStatus = 'custom')", "serverType", Integer.valueOf(1), "serverType", Integer.valueOf(2), "serverType"}));
    }

    public static long[] getSyncedSize(Context context) {
        return querySize(context, Cloud.CLOUD_URI, String.format(Locale.US, "%s AND (%s = %s OR %s = %s) GROUP BY %s", new Object[]{"(localFlag = 0 AND serverStatus = 'custom')", "serverType", Integer.valueOf(1), "serverType", Integer.valueOf(2), "serverType"}));
    }

    public static boolean hasSyncedData(Context context) {
        return ((Integer) SafeDBUtil.safeQuery(context, Cloud.CLOUD_URI, new String[]{"count(*)"}, String.format(Locale.US, "%s AND %s", new Object[]{"(localFlag = 0 AND serverStatus = 'custom')", "serverType IN (1,2)"}), (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<Integer>() {
            public Integer handle(Cursor cursor) {
                return (cursor == null || !cursor.moveToFirst()) ? Integer.valueOf(0) : Integer.valueOf(cursor.getInt(0));
            }
        })).intValue() > 0;
    }

    public static boolean isSyncing(Context context) {
        Account xiaomiAccount = AccountHelper.getXiaomiAccount(context);
        boolean z = false;
        if (xiaomiAccount == null) {
            return false;
        }
        if (ContentResolver.isSyncActive(xiaomiAccount, "com.miui.gallery.cloud.provider") || UploadStatusController.getInstance().isUploading()) {
            z = true;
        }
        return z;
    }

    private static DirtyCount queryDirtyCount(Context context, Uri uri, String[] strArr, String str) {
        return (DirtyCount) SafeDBUtil.safeQuery(context, uri, strArr, str, (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<DirtyCount>() {
            public DirtyCount handle(Cursor cursor) {
                DirtyCount dirtyCount = new DirtyCount();
                if (cursor != null) {
                    while (cursor.moveToNext()) {
                        int i = cursor.getInt(0);
                        int i2 = cursor.getInt(1);
                        int i3 = cursor.getInt(2);
                        if (i2 == 1) {
                            if (i3 == 1) {
                                dirtyCount.setOversizedImageCount(i);
                            } else {
                                dirtyCount.setSyncableImageCount(i);
                            }
                        } else if (i3 == 1) {
                            dirtyCount.setOversizedVideoCount(i);
                        } else if (i3 == 0) {
                            dirtyCount.setSyncableVideoCount(i);
                        }
                    }
                }
                return dirtyCount;
            }
        });
    }

    private static long[] querySize(Context context, Uri uri, String str) {
        return (long[]) SafeDBUtil.safeQuery(context, uri, new String[]{"sum(size)", "serverType"}, str, (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<long[]>() {
            public long[] handle(Cursor cursor) {
                long[] jArr = {0, 0};
                if (cursor != null) {
                    while (cursor.moveToNext()) {
                        long j = cursor.getLong(0);
                        if (cursor.getInt(1) == 1) {
                            jArr[0] = j;
                        } else {
                            jArr[1] = j;
                        }
                    }
                }
                return jArr;
            }
        });
    }

    private static int[] querySyncedCount(Context context, Uri uri, String str) {
        return (int[]) SafeDBUtil.safeQuery(context, uri, new String[]{"count(*)", "serverType"}, str, (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<int[]>() {
            public int[] handle(Cursor cursor) {
                int[] iArr = {0, 0};
                if (cursor != null) {
                    while (cursor.moveToNext()) {
                        int i = cursor.getInt(0);
                        if (cursor.getInt(1) == 1) {
                            iArr[0] = i;
                        } else {
                            iArr[1] = i;
                        }
                    }
                }
                return iArr;
            }
        });
    }
}
