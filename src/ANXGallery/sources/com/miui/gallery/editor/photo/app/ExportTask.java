package com.miui.gallery.editor.photo.app;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.Process;
import android.text.TextUtils;
import android.text.format.DateFormat;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.utils.IoUtils;
import com.miui.gallery.provider.CloudUtils;
import com.miui.gallery.scanner.MediaScanner;
import com.miui.gallery.scanner.SaveToCloudUtil;
import com.miui.gallery.scanner.SaveToCloudUtil.SaveParams;
import com.miui.gallery.util.DocumentProviderUtils;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MediaStoreUtils;
import com.miui.gallery.util.StorageUtils;
import com.miui.gallery.util.ToastUtils;
import java.io.File;
import java.util.Locale;

public class ExportTask {
    private Activity mActivity;
    private ExportFragment mExportFragment;
    private Uri mExportUri;
    private boolean mExternalCall;
    private long mSecretId;
    private Uri mSource;

    private File createExportFile(DraftManager draftManager, Uri uri) {
        Cursor cursor;
        String str = null;
        if ("file".equals(uri.getScheme())) {
            str = new File(uri.getPath()).getParent();
        } else if ("content".equals(uri.getScheme())) {
            try {
                cursor = this.mActivity.getContentResolver().query(uri, new String[]{"_data"}, null, null, null);
                if (cursor != null) {
                    try {
                        if (cursor.moveToNext()) {
                            str = new File(cursor.getString(0)).getParent();
                        }
                    } catch (Exception unused) {
                        try {
                            Log.d("ExportTask", "receive an exception when look for parent for %s", (Object) uri);
                            IoUtils.close("ExportTask", cursor);
                            return createFile(draftManager, str);
                        } catch (Throwable th) {
                            th = th;
                        }
                    }
                }
            } catch (Exception unused2) {
                cursor = null;
                Log.d("ExportTask", "receive an exception when look for parent for %s", (Object) uri);
                IoUtils.close("ExportTask", cursor);
                return createFile(draftManager, str);
            } catch (Throwable th2) {
                th = th2;
                cursor = null;
                IoUtils.close("ExportTask", cursor);
                throw th;
            }
            IoUtils.close("ExportTask", cursor);
        }
        return createFile(draftManager, str);
    }

    private File createFile(DraftManager draftManager, String str) {
        String format = String.format(Locale.US, "IMG_%s.%s", new Object[]{DateFormat.format("yyyyMMdd_HHmmss", System.currentTimeMillis()), draftManager.getExportFileSuffix()});
        if (TextUtils.isEmpty(str)) {
            str = StorageUtils.getCreativeDirectory();
            FileUtils.createFolder(str, false);
        } else if (DocumentProviderUtils.needUseDocumentProvider(str)) {
            str = StorageUtils.getPathInPrimaryStorage(StorageUtils.getRelativePath(GalleryApp.sGetAndroidContext(), str));
            FileUtils.createFolder(str, false);
        }
        return FileUtils.forceCreate(str, format, 0);
    }

    public static ExportTask from(Activity activity) {
        Intent intent = activity.getIntent();
        if (intent == null || intent.getData() == null) {
            return null;
        }
        ExportTask exportTask = new ExportTask();
        exportTask.mActivity = activity;
        exportTask.mExternalCall = TextUtils.equals("android.intent.action.EDIT", intent.getAction());
        exportTask.mSource = intent.getData();
        Log.d("ExportTask", "editting %s", (Object) exportTask.mSource);
        return exportTask;
    }

    public void closeExportDialog() {
        if (this.mExportFragment != null && this.mExportFragment.isAdded()) {
            this.mExportFragment.dismissAllowingStateLoss();
            this.mExportFragment = null;
        }
    }

    public Uri getExportUri() {
        if (this.mExportUri != null) {
            return this.mExportUri;
        }
        throw new IllegalStateException("call prepareToExport first");
    }

    public long getSecretId() {
        return this.mSecretId;
    }

    public Uri getSource() {
        return this.mSource;
    }

    public boolean isExternalCall() {
        return this.mExternalCall;
    }

    public void onCancelled(boolean z) {
    }

    public boolean onExport(DraftManager draftManager, boolean z) {
        if (z && !this.mExternalCall) {
            Log.d("ExportTask", "internal call, scan to db :%s", (Object) this.mExportUri.getPath());
            if (draftManager.isSecret()) {
                Activity activity = this.mActivity;
                SaveParams saveParams = new SaveParams(new File(this.mExportUri.getPath()), -1000, 8, true);
                this.mSecretId = SaveToCloudUtil.saveToCloudDB(activity, saveParams);
                if (this.mSecretId <= 0) {
                    FileUtils.deleteFile(new File(this.mExportUri.getPath()));
                    return false;
                }
            } else {
                MediaScanner.scanSingleFile(this.mActivity, this.mExportUri.getPath());
                MediaStoreUtils.insert((Context) this.mActivity, this.mExportUri.getPath(), 1);
            }
            Log.d("ExportTask", "internal call, scan to db done secretId:%d", (Object) Long.valueOf(this.mSecretId));
        }
        if (z && this.mSource.equals(this.mExportUri) && this.mExternalCall && "content".equals(this.mSource.getScheme()) && "media".equals(this.mSource.getAuthority())) {
            MediaStoreUtils.update(this.mExportUri);
            Log.d("ExportTask", "external call, update media store:%s", (Object) this.mExportUri.toString());
        }
        if (this.mSource == this.mExportUri) {
            String mediaFilePath = MediaStoreUtils.getMediaFilePath(this.mExportUri.toString());
            long[] deleteCloudByPath = CloudUtils.deleteCloudByPath(this.mActivity, 55, mediaFilePath);
            Log.d("ExportTask", "deleteCloudByPath path:%s,result:%s", mediaFilePath, (deleteCloudByPath == null || deleteCloudByPath.length <= 0) ? null : String.valueOf(deleteCloudByPath[0]));
        }
        return z;
    }

    public void onPostExport(boolean z) {
        if (z && this.mExternalCall && !this.mSource.equals(this.mExportUri) && "file".equals(this.mExportUri.getScheme())) {
            ToastUtils.makeTextLong((Context) this.mActivity, (CharSequence) this.mActivity.getString(R.string.photo_save_to_msg, new Object[]{this.mExportUri.getPath()}));
        }
    }

    public void prepareToExport(DraftManager draftManager) {
        if (!this.mExternalCall) {
            prepareToExport(draftManager, true, this.mSource);
            Log.d("ExportTask", "export to a new file %s", (Object) this.mExportUri);
        } else if ("file".equals(this.mSource.getScheme()) || ("content".equals(this.mSource.getScheme()) && "media".equals(this.mSource.getAuthority()))) {
            prepareToExport(draftManager, false, null);
            Log.d("ExportTask", "export to origin file or media uri %s", (Object) this.mExportUri);
        } else {
            if (this.mActivity.checkUriPermission(this.mSource, Process.myPid(), Process.myUid(), 2) == 0) {
                prepareToExport(draftManager, false, null);
                Log.d("ExportTask", "export to origin uri %s", (Object) this.mExportUri);
                return;
            }
            this.mExportUri = Uri.fromFile(createFile(draftManager, null));
            Log.d("ExportTask", "export to a specified dir %s", (Object) this.mExportUri);
        }
    }

    public void prepareToExport(DraftManager draftManager, boolean z, Uri uri) {
        if (z) {
            this.mExportUri = Uri.fromFile(createExportFile(draftManager, uri));
        } else {
            this.mExportUri = this.mSource;
        }
    }

    public void showExportDialog() {
        this.mExportFragment = new ExportFragment();
        this.mExportFragment.setCancelable(false);
        this.mExportFragment.show(this.mActivity.getFragmentManager().beginTransaction().addToBackStack(null), null);
    }
}
