package com.miui.gallery.scanner;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Environment;
import android.text.TextUtils;
import com.android.internal.EnvironmentCompat;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.ExtraTextUtils;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.StorageUtils;
import java.io.File;
import java.io.IOException;

public class MediaScannerReceiver extends BroadcastReceiver {
    private void onMediaScannerFinished(final Context context, final Uri uri) {
        ThreadManager.getMiscPool().submit(new Job<Object>() {
            public Object run(JobContext jobContext) {
                if (uri != null && "file".equals(uri.getScheme())) {
                    String path = uri.getPath();
                    if (!TextUtils.isEmpty(path) && new File(path).isDirectory()) {
                        MediaScannerUtil.scanDirectory(context.getApplicationContext(), path, 6, true, false);
                    }
                }
                return null;
            }
        });
    }

    private void onMediaScannerScanFile(final Context context, final Uri uri) {
        ThreadManager.getMiscPool().submit(new Job<Object>() {
            public Object run(JobContext jobContext) {
                if (uri != null && uri.getScheme().equals("file")) {
                    String path = uri.getPath();
                    if (!TextUtils.isEmpty(path)) {
                        String path2 = Environment.getExternalStorageDirectory().getPath();
                        String legacyExternalStorageDirectory = EnvironmentCompat.getLegacyExternalStorageDirectory();
                        try {
                            String canonicalPath = new File(path).getCanonicalPath();
                            if (ExtraTextUtils.startsWithIgnoreCase(canonicalPath, legacyExternalStorageDirectory)) {
                                StringBuilder sb = new StringBuilder();
                                sb.append(path2);
                                sb.append(canonicalPath.substring(legacyExternalStorageDirectory.length()));
                                canonicalPath = sb.toString();
                            }
                            if (MediaScannerReceiver.shouldHandlePath(context.getApplicationContext(), FileUtils.getParentFolderPath(canonicalPath))) {
                                Log.i("MediaScannerReceiver", "ACTION_MEDIA_SCANNER_SCAN_FILE %s", (Object) canonicalPath);
                                MediaScannerUtil.scanSingleFile(context.getApplicationContext(), canonicalPath, 1);
                            } else {
                                Log.i("MediaScannerReceiver", "ACTION_MEDIA_SCANNER_SCAN_FILE but not trigger %s", (Object) canonicalPath);
                            }
                        } catch (IOException unused) {
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("can't canonicalize ");
                            sb2.append(path);
                            Log.w("MediaScannerReceiver", sb2.toString());
                            return null;
                        }
                    }
                }
                return null;
            }
        });
    }

    /* access modifiers changed from: private */
    public static boolean shouldHandlePath(Context context, String str) {
        return !ExtraTextUtils.startsWithIgnoreCase(StorageUtils.getRelativePath(context, str), "MIUI/Gallery/cloud");
    }

    public void onReceive(Context context, Intent intent) {
        if (!intent.getBooleanExtra("com.miui.gallery.extra.trigger_scan", false)) {
            String action = intent.getAction();
            Uri data = intent.getData();
            Log.d("MediaScannerReceiver", "Broadcast received, action: [%s], data uri: [%s]", action, data);
            if ("android.intent.action.MEDIA_SCANNER_FINISHED".equals(action)) {
                onMediaScannerFinished(context, data);
            } else if ("android.intent.action.MEDIA_SCANNER_SCAN_FILE".equals(action)) {
                onMediaScannerScanFile(context, data);
            } else if ("android.intent.action.MEDIA_UNMOUNTED".equals(action)) {
                MediaScannerUtil.cleanup(context.getApplicationContext());
            } else if ("android.intent.action.MEDIA_MOUNTED".equals(action)) {
                String path = data.getPath();
                if (!TextUtils.isEmpty(path)) {
                    MediaScannerUtil.scanDirectory(context.getApplicationContext(), path, 6, true, true);
                }
            }
        }
    }
}
