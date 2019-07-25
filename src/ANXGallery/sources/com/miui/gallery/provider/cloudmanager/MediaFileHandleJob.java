package com.miui.gallery.provider.cloudmanager;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.text.TextUtils;
import com.miui.gallery.provider.GalleryContract.Cloud;
import com.miui.gallery.provider.GalleryContract.ShareAlbum;
import com.miui.gallery.provider.GalleryContract.ShareImage;
import com.miui.gallery.provider.ShareMediaManager;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MediaFileUtils;
import com.miui.gallery.util.MediaFileUtils.FileType;
import com.miui.gallery.util.StorageUtils;
import com.miui.gallery.util.deleterecorder.DeleteRecord;
import com.miui.gallery.util.deleterecorder.DeleteRecorder;
import java.io.File;
import java.util.HashMap;

class MediaFileHandleJob {
    private String mAlbumDir;
    private long mId;
    private String mLocalFile;
    private int mLocalFlag;
    private int mReason;
    private String mServerAlbumId;
    private String mThumbnail;

    private MediaFileHandleJob(String str, long j, String str2, String str3, String str4, String str5, int i, int i2) {
        this.mId = j;
        this.mThumbnail = str2;
        this.mLocalFile = str3;
        this.mAlbumDir = str4;
        this.mLocalFlag = i;
        this.mServerAlbumId = str;
        this.mReason = i2;
    }

    private boolean delete(Context context, String str, boolean z) {
        File file = new File(str);
        String relativePath = StorageUtils.getRelativePath(context, file.getParent());
        if (TextUtils.isEmpty(relativePath)) {
            Log.w("CloudManager.MediaFileHandleJob", "Could't get relative path for %s", file.getParent());
            return false;
        } else if (relativePath.equalsIgnoreCase(this.mAlbumDir)) {
            if (z) {
                MediaFileUtils.deleteFileType(FileType.NORMAL, str);
            } else {
                MediaFileUtils.deleteFileType(FileType.NONE, str);
                MediaFileUtils.triggerMediaScan(true, file);
            }
            Log.d("CloudManager.MediaFileHandleJob", "deleted");
            return true;
        } else {
            Log.w("CloudManager.MediaFileHandleJob", "file not exist, skip.");
            return false;
        }
    }

    private void doCopy(Context context, boolean z) {
        editFile(context, true, z);
    }

    private void doMove(Context context) {
        editFile(context, false, false);
    }

    /* JADX WARNING: Removed duplicated region for block: B:20:0x007e  */
    /* JADX WARNING: Removed duplicated region for block: B:21:0x0085  */
    /* JADX WARNING: Removed duplicated region for block: B:30:0x00c1  */
    /* JADX WARNING: Removed duplicated region for block: B:31:0x00c9 A[ADDED_TO_REGION] */
    private void editFile(Context context, boolean z, boolean z2) {
        boolean z3;
        File file;
        File desFile;
        boolean move;
        Log.d("CloudManager.MediaFileHandleJob", "editFile");
        ContentValues contentValues = new ContentValues();
        int i = 0;
        if (!TextUtils.isEmpty(this.mLocalFile)) {
            File file2 = new File(this.mLocalFile);
            File desFile2 = getDesFile(context, file2);
            if (desFile2 == file2) {
                contentValues.putNull("thumbnailFile");
                z3 = true;
            } else if (desFile2 != null) {
                if (z) {
                    z3 = FileUtils.copyFile(file2, desFile2);
                } else {
                    boolean move2 = FileUtils.move(file2, desFile2);
                    if (move2) {
                        MediaFileUtils.deleteFileType(FileType.NORMAL, file2.getAbsolutePath());
                    }
                    z3 = move2;
                }
                if (z3) {
                    Log.d("CloudManager.MediaFileHandleJob", "edit localFile finish, with des(%s)", (Object) desFile2);
                    contentValues.put("localFile", desFile2.getAbsolutePath());
                    contentValues.putNull("thumbnailFile");
                    notifyMediaProviderScanFile(desFile2.getAbsolutePath());
                }
            }
            if (!z3 && !TextUtils.isEmpty(this.mThumbnail)) {
                file = new File(this.mThumbnail);
                desFile = getDesFile(context, file);
                if (desFile != file) {
                    contentValues.putNull("localFile");
                    z3 = true;
                } else if (desFile != null) {
                    if (z) {
                        move = FileUtils.copyFile(file, desFile);
                    } else {
                        move = FileUtils.move(file, desFile);
                        if (move) {
                            MediaFileUtils.deleteFileType(FileType.NORMAL, file.getAbsolutePath());
                        }
                    }
                    if (z3) {
                        Log.d("CloudManager.MediaFileHandleJob", "edit thumbnail finish, with des(%s)", (Object) desFile);
                        contentValues.put("thumbnailFile", desFile.getAbsolutePath());
                        contentValues.putNull("localFile");
                        notifyMediaProviderScanFile(desFile.getAbsolutePath());
                    }
                }
            }
            if (z3) {
                Log.e("CloudManager.MediaFileHandleJob", "both thumbnail and localFile edit failed.");
            } else {
                if (z && z2) {
                    contentValues.put("localFlag", Integer.valueOf(8));
                }
                Log.d("CloudManager.MediaFileHandleJob", "edit success, update db: %s", (Object) contentValues);
                if (ShareMediaManager.isOtherShareMediaId(this.mId)) {
                    i = context.getContentResolver().update(ShareImage.SHARE_URI, contentValues, "_id=?", new String[]{String.valueOf(ShareMediaManager.getOriginalMediaId(this.mId))});
                } else {
                    i = context.getContentResolver().update(Cloud.CLOUD_URI, contentValues, "_id=?", new String[]{String.valueOf(this.mId)});
                }
            }
            Log.d("CloudManager.MediaFileHandleJob", "edit finish with updates(%d)", (Object) Integer.valueOf(i));
        }
        z3 = false;
        file = new File(this.mThumbnail);
        desFile = getDesFile(context, file);
        if (desFile != file) {
        }
        if (z3) {
        }
        Log.d("CloudManager.MediaFileHandleJob", "edit finish with updates(%d)", (Object) Integer.valueOf(i));
    }

    /* JADX WARNING: Removed duplicated region for block: B:38:0x00bd  */
    public static MediaFileHandleJob from(ContentResolver contentResolver, Cursor cursor, long j, int i) {
        String str;
        String str2;
        String str3;
        Cursor cursor2 = cursor;
        Cursor cursor3 = null;
        try {
            String string = cursor2.getString(7);
            String string2 = cursor2.getString(8);
            String string3 = cursor2.getString(6);
            int i2 = cursor2.getInt(2);
            long j2 = cursor2.getLong(0);
            long j3 = cursor2.getLong(3);
            if (j3 == -1000) {
                str = StorageUtils.DIRECTORY_SECRET_ALBUM_PATH;
                str2 = null;
            } else if (!ShareMediaManager.isOtherShareMediaId(j)) {
                ContentResolver contentResolver2 = contentResolver;
                Cursor query = contentResolver2.query(Cloud.CLOUD_URI, CloudManager.PROJECTION, "_id=?", new String[]{String.valueOf(j3)}, null);
                if (query != null) {
                    try {
                        if (query.moveToFirst()) {
                            String string4 = query.getString(7);
                            if (TextUtils.isEmpty(string4)) {
                                string4 = CloudManager.genRelativePath(query.getString(6), false);
                            }
                            str2 = null;
                            cursor3 = query;
                            str = string4;
                        }
                    } catch (Throwable th) {
                        th = th;
                        cursor3 = query;
                        if (cursor3 != null) {
                        }
                        throw th;
                    }
                }
                str2 = null;
                cursor3 = query;
                str = null;
            } else {
                String[] strArr = {String.valueOf(j3)};
                Cursor query2 = contentResolver.query(ShareAlbum.OTHER_SHARE_URI, new String[]{"albumId"}, "_id=?", strArr, null);
                if (query2 != null) {
                    try {
                        if (query2.moveToFirst()) {
                            str3 = query2.getString(0);
                            str = CloudManager.genRelativePath(null, true);
                            j2 = ShareMediaManager.convertToMediaId(j2);
                            str2 = str3;
                            cursor3 = query2;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        cursor3 = query2;
                        if (cursor3 != null) {
                        }
                        throw th;
                    }
                }
                str3 = null;
                str = CloudManager.genRelativePath(null, true);
                j2 = ShareMediaManager.convertToMediaId(j2);
                str2 = str3;
                cursor3 = query2;
            }
            MediaFileHandleJob mediaFileHandleJob = new MediaFileHandleJob(str2, j2, string2, string, str, string3, i2, i);
            if (cursor3 != null) {
                cursor3.close();
            }
            return mediaFileHandleJob;
        } catch (Throwable th3) {
            th = th3;
            if (cursor3 != null) {
                cursor3.close();
            }
            throw th;
        }
    }

    private File getDesFile(Context context, File file) {
        String relativePath = StorageUtils.getRelativePath(context, file.getParent());
        if (TextUtils.isEmpty(relativePath)) {
            Log.w("CloudManager.MediaFileHandleJob", "Could't get relative path for %s", file.getParent());
            return null;
        } else if (!relativePath.equalsIgnoreCase(this.mAlbumDir)) {
            String name = file.getName();
            boolean isOtherShareMediaId = ShareMediaManager.isOtherShareMediaId(this.mId);
            if (isOtherShareMediaId) {
                name = ShareMediaManager.getMediaFileName(name, this.mServerAlbumId);
                Log.d("CloudManager.MediaFileHandleJob", "Other shared dest filename %s", (Object) name);
            }
            File file2 = new File(StorageUtils.getSafePathInPriorStorage(this.mAlbumDir));
            if (!file2.exists()) {
                file2.mkdirs();
            }
            File file3 = new File(file2, name);
            if (file3.exists()) {
                File forceCreate = FileUtils.forceCreate(file3.getParent(), file3.getName(), 0);
                if (FileUtils.move(file3, forceCreate)) {
                    ContentValues contentValues = new ContentValues();
                    if (isOtherShareMediaId) {
                        contentValues.put("thumbnailFile", forceCreate.getAbsolutePath());
                        context.getContentResolver().update(ShareImage.SHARE_URI, contentValues, "thumbnailFile=?", new String[]{file3.getAbsolutePath()});
                    } else {
                        contentValues.put("thumbnailFile", forceCreate.getAbsolutePath());
                        context.getContentResolver().update(Cloud.CLOUD_URI, contentValues, "thumbnailFile=?", new String[]{file3.getAbsolutePath()});
                    }
                }
            }
            if (!file3.exists()) {
                return file3;
            }
            return null;
        } else {
            Log.w("CloudManager.MediaFileHandleJob", "skip copy localFile(%s), album(%s)", relativePath, this.mAlbumDir);
            return file;
        }
    }

    private static void notifyMediaProviderScanFile(String str) {
        MediaFileUtils.triggerMediaScan(true, new File(str));
    }

    public void doDelete(Context context, boolean z, boolean z2) {
        if (!TextUtils.isEmpty(this.mThumbnail)) {
            Log.d("CloudManager.MediaFileHandleJob", "delete thumbnail(%s)", (Object) this.mThumbnail);
            if (delete(context, this.mThumbnail, z2)) {
                DeleteRecorder.record(new DeleteRecord(this.mReason, this.mThumbnail, "CloudManager.MediaFileHandleJob"));
            }
        }
        if (!TextUtils.isEmpty(this.mLocalFile)) {
            Log.d("CloudManager.MediaFileHandleJob", "delete localFile(%s)", (Object) this.mLocalFile);
            if (delete(context, this.mLocalFile, z2)) {
                DeleteRecorder.record(new DeleteRecord(this.mReason, this.mLocalFile, "CloudManager.MediaFileHandleJob"));
            }
        }
        if (z) {
            if (ShareMediaManager.isOtherShareMediaId(this.mId)) {
                context.getContentResolver().delete(ShareImage.SHARE_URI, "_id=?", new String[]{String.valueOf(ShareMediaManager.getOriginalMediaId(this.mId))});
            } else {
                context.getContentResolver().delete(Cloud.CLOUD_URI, "_id=?", new String[]{String.valueOf(this.mId)});
            }
        }
        if (!TextUtils.isEmpty(this.mLocalFile)) {
            long lastModified = new File(this.mLocalFile).lastModified();
            long currentTimeMillis = (System.currentTimeMillis() - lastModified) / 1000;
            if (lastModified > 0 && currentTimeMillis < 60) {
                HashMap hashMap = new HashMap();
                hashMap.put("local", String.valueOf(z));
                GallerySamplingStatHelper.recordCountEvent("Sync", "sync_photo_delete_in_one_minute", hashMap);
                GallerySamplingStatHelper.recordNumericPropertyEvent("Sync", "sync_photo_delete_interval", currentTimeMillis);
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:10:0x0017, code lost:
        return true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:6:0x000d, code lost:
        doDelete(r4, r1, true);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:7:0x0012, code lost:
        return !r1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:9:0x0014, code lost:
        doCopy(r4, r1);
     */
    public boolean run(Context context) {
        boolean z = false;
        switch (this.mLocalFlag) {
            case -2:
                z = true;
                break;
            case -1:
                z = true;
                break;
            case 2:
            case 11:
                break;
            case 5:
            case 7:
            case 8:
                doMove(context);
                return true;
            case 6:
            case 9:
                break;
            default:
                return false;
        }
    }
}
