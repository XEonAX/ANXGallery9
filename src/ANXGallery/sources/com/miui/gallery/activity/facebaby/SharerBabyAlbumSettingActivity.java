package com.miui.gallery.activity.facebaby;

import android.content.Intent;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.cloud.GalleryCloudUtils;
import com.miui.gallery.cloud.baby.BabyInfo;
import com.miui.gallery.provider.GalleryContract.Album;
import com.miui.gallery.share.AlbumShareUIManager;
import com.miui.gallery.share.AlbumShareUIManager.OnCompletionListener;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.FutureHandler;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.GalleryUtils;
import com.miui.gallery.util.GalleryUtils.QueryHandler;

public class SharerBabyAlbumSettingActivity extends BabyAlbumSettingActivityBase {
    private String mAccountName;
    private String mAlbumId;
    /* access modifiers changed from: private */
    public Future mRefreshFuture;
    /* access modifiers changed from: private */
    public String mSelfRelationText;
    private Future mSyncFuture;

    /* access modifiers changed from: private */
    public BabyInfo getBabyInfoFromDB() {
        return (BabyInfo) GalleryUtils.safeQuery(GalleryCloudUtils.SHARE_ALBUM_URI, new String[]{"babyInfoJson"}, "_id = ?", new String[]{Long.toString(this.mBabyAlbumLocalId.longValue())}, (String) null, (QueryHandler<T>) new QueryHandler<BabyInfo>() {
            public BabyInfo handle(Cursor cursor) {
                if (cursor == null || !cursor.moveToNext()) {
                    return null;
                }
                return BabyInfo.fromJSON(cursor.getString(0));
            }
        });
    }

    private String getEntry(String str, int i, int i2) {
        String[] stringArray = getResources().getStringArray(i);
        String[] stringArray2 = getResources().getStringArray(i2);
        for (int i3 = 0; i3 < stringArray.length; i3++) {
            if (TextUtils.equals(stringArray[i3], str)) {
                return stringArray2[i3];
            }
        }
        return null;
    }

    /* access modifiers changed from: private */
    public String getSelfRelationText() {
        if (TextUtils.isEmpty(this.mAlbumId)) {
            this.mAlbumId = CloudUtils.getDBShareAlbumByLocalId(String.valueOf(this.mBabyAlbumLocalId)).getAlbumId();
        }
        if (TextUtils.isEmpty(this.mAccountName)) {
            this.mAccountName = GalleryCloudUtils.getAccountName();
        }
        Uri uri = GalleryCloudUtils.SHARE_USER_URI;
        String[] strArr = {"relationText"};
        String format = String.format("%s=? AND %s=?", new Object[]{"albumId", "userId"});
        return (String) GalleryUtils.safeQuery(uri, strArr, format, new String[]{this.mAlbumId, this.mAccountName}, (String) null, (QueryHandler<T>) new QueryHandler<String>() {
            public String handle(Cursor cursor) {
                return (cursor == null || !cursor.moveToNext()) ? "" : cursor.getString(0);
            }
        });
    }

    /* access modifiers changed from: private */
    public void refreshSelfRelationText(final boolean z) {
        if (this.mRefreshFuture == null || this.mRefreshFuture.isCancelled()) {
            this.mRefreshFuture = ThreadManager.getMiscPool().submit(new Job<String>() {
                public String run(JobContext jobContext) {
                    return SharerBabyAlbumSettingActivity.this.getSelfRelationText();
                }
            }, new FutureHandler<String>() {
                public void onPostExecute(Future<String> future) {
                    if (!future.isCancelled()) {
                        String str = (String) future.get();
                        if (TextUtils.isEmpty(str)) {
                            if (z) {
                                SharerBabyAlbumSettingActivity.this.syncShareInfoFromServer();
                            }
                        } else if (!TextUtils.equals(SharerBabyAlbumSettingActivity.this.mSelfRelationText, str)) {
                            SharerBabyAlbumSettingActivity.this.mSelfRelationText = str;
                            SharerBabyAlbumSettingActivity.this.mRelationPre.setValue(str);
                        }
                    }
                    SharerBabyAlbumSettingActivity.this.mRefreshFuture = null;
                }
            });
        }
    }

    /* access modifiers changed from: private */
    public void syncShareInfoFromServer() {
        if (!TextUtils.isEmpty(this.mAlbumId)) {
            this.mSyncFuture = AlbumShareUIManager.syncUserListForAlbumAsync(this.mAlbumId, true, new OnCompletionListener<Void, Void>() {
                public void onCompletion(Void voidR, Void voidR2, int i, boolean z) {
                    if (i == 0 && !z) {
                        SharerBabyAlbumSettingActivity.this.refreshSelfRelationText(false);
                    }
                }
            });
        }
    }

    /* access modifiers changed from: protected */
    public Intent getIntentToAutoUploadPage() {
        Intent intentToAutoUploadPage = super.getIntentToAutoUploadPage();
        intentToAutoUploadPage.putExtra("allow_to_reassociate", true);
        return intentToAutoUploadPage;
    }

    /* access modifiers changed from: protected */
    public int getPreferenceResourceId() {
        return R.xml.sharer_baby_album_preferences;
    }

    /* access modifiers changed from: protected */
    public void justSaveInfo2DbByJson() {
        if (!this.mHaveSaveBabyInfo) {
            saveBabyInfo();
        }
    }

    /* access modifiers changed from: protected */
    public void onActivityResult(int i, int i2, Intent intent) {
        if (i != 0) {
            super.onActivityResult(i, i2, intent);
        } else if (i2 == -1 && intent != null) {
            BabyInfo babyInfo = (BabyInfo) intent.getParcelableExtra("baby-info");
            this.mPeopleId = babyInfo.mPeopleId;
            this.mIsAutoupdate = Boolean.valueOf(babyInfo.mAutoupdate);
            this.mFaceAlbumLocalId = Long.valueOf(intent.getLongExtra("associate_people_face_local_id", -1));
        }
    }

    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        refreshSelfRelationText(true);
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        if (this.mRefreshFuture != null) {
            this.mRefreshFuture.cancel();
            this.mRefreshFuture = null;
        }
        if (this.mSyncFuture != null) {
            this.mSyncFuture.cancel();
            this.mSyncFuture = null;
        }
        super.onDestroy();
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.activity.facebaby.BabyAlbumSettingActivityBase, com.miui.gallery.activity.facebaby.SharerBabyAlbumSettingActivity, android.app.Activity] */
    /* access modifiers changed from: protected */
    public void onPause() {
        super.onPause();
        GallerySamplingStatHelper.recordPageEnd(this, "album_baby_share_setting");
        saveBabyInfo();
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.activity.facebaby.BabyAlbumSettingActivityBase, com.miui.gallery.activity.facebaby.SharerBabyAlbumSettingActivity, android.app.Activity] */
    /* access modifiers changed from: protected */
    public void onResume() {
        super.onResume();
        GallerySamplingStatHelper.recordPageStart(this, "album_baby_share_setting");
    }

    /* access modifiers changed from: protected */
    public void saveBabyInfo() {
        if (babyInfoChanged()) {
            final BabyInfo babyInfo = toBabyInfo(this.mPeopleId, 0);
            ThreadManager.getMiscPool().submit(new Job<Void>() {
                public Void run(JobContext jobContext) {
                    BabyInfo access$000 = SharerBabyAlbumSettingActivity.this.getBabyInfoFromDB();
                    if (access$000 != null) {
                        access$000.mAutoupdate = SharerBabyAlbumSettingActivity.this.mIsAutoupdate.booleanValue();
                        access$000.mPeopleId = SharerBabyAlbumSettingActivity.this.mPeopleId;
                    } else {
                        access$000 = babyInfo;
                    }
                    String transformToEditedColumnsElement = GalleryCloudUtils.transformToEditedColumnsElement(25);
                    String str = "update %s set %s=%s, %s='%s', %s=coalesce(replace(%s, '%s', '') || '%s', '%s') where %s=%s";
                    Object[] objArr = new Object[12];
                    objArr[0] = "shareAlbum";
                    objArr[1] = "babyInfoJson";
                    objArr[2] = access$000 == null ? "" : DatabaseUtils.sqlEscapeString(access$000.toJSON());
                    objArr[3] = "peopleId";
                    objArr[4] = access$000 == null ? "" : access$000.mPeopleId;
                    objArr[5] = "editedColumns";
                    objArr[6] = "editedColumns";
                    objArr[7] = transformToEditedColumnsElement;
                    objArr[8] = transformToEditedColumnsElement;
                    objArr[9] = transformToEditedColumnsElement;
                    objArr[10] = "_id";
                    objArr[11] = SharerBabyAlbumSettingActivity.this.mBabyAlbumLocalId;
                    GalleryUtils.safeExec(String.format(str, objArr));
                    GalleryApp.sGetAndroidContext().getContentResolver().notifyChange(Album.URI, null, true);
                    return null;
                }
            });
            Intent intent = new Intent();
            Bundle bundle = new Bundle();
            bundle.putParcelable("baby-info", babyInfo);
            intent.putExtras(bundle);
            setResult(12, intent);
            this.mHaveSaveBabyInfo = true;
        }
    }

    /* access modifiers changed from: protected */
    public void setPreferencesValue() {
        super.setPreferencesValue();
        this.mBabyNicknamePre.setValue(this.mNickName);
        this.mBabySexPre.setValue(getEntry(this.mSex, R.array.baby_sexy_value, R.array.baby_sexy));
        this.mRelationPre.setValue(this.mSelfRelationText);
        this.mChooseDate.setValue(this.mBirthday);
    }
}
