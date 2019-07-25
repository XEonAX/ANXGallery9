package com.miui.gallery.ui;

import android.app.Activity;
import android.app.Dialog;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.net.Uri;
import android.os.Bundle;
import com.miui.gallery.R;
import com.miui.gallery.scanner.MediaScannerUtil;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.FutureListener;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MediaFileUtils;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.StorageUtils;
import com.miui.gallery.widget.GalleryDialogFragment;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.assist.ImageScaleType;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import miui.app.ProgressDialog;

public class SaveUriDialogFragment extends GalleryDialogFragment {
    /* access modifiers changed from: private */
    public OnCompleteListener mListener;
    private ProgressDialog mProgressDialog;

    public interface OnCompleteListener {
        void onComplete(String str);
    }

    private static File generateJPGFileForSaving(String str) {
        String str2;
        int i = 0;
        while (true) {
            String format = String.format("%s/%s", new Object[]{str, String.format("SAVE_%s", new Object[]{new SimpleDateFormat("yyyyMMdd_kkmmss").format(new Date(System.currentTimeMillis()))})});
            String str3 = "jpg";
            if (i > 0) {
                StringBuilder sb = new StringBuilder();
                sb.append(format);
                sb.append("_");
                sb.append(i);
                sb.append(".");
                sb.append(str3);
                str2 = sb.toString();
            } else {
                StringBuilder sb2 = new StringBuilder();
                sb2.append(format);
                sb2.append(".");
                sb2.append(str3);
                str2 = sb2.toString();
            }
            File file = new File(str2);
            if (!file.exists()) {
                try {
                    file.createNewFile();
                    return file;
                } catch (IOException e) {
                    Log.e("SaveUriDialogFragment", "generateJPGFileForSaving() failed %s %s", file.getAbsolutePath(), e);
                    return null;
                }
            } else {
                i++;
            }
        }
    }

    private void save(final Uri uri) {
        if (uri != null) {
            ThreadManager.getMiscPool().submit(new Job<String>() {
                public String run(JobContext jobContext) {
                    return SaveUriDialogFragment.this.saveInternal(uri);
                }
            }, new FutureListener<String>() {
                public void onFutureDone(final Future<String> future) {
                    if (SaveUriDialogFragment.this.getActivity() != null) {
                        SaveUriDialogFragment.this.getActivity().runOnUiThread(new Runnable() {
                            public void run() {
                                if (SaveUriDialogFragment.this.mListener != null) {
                                    SaveUriDialogFragment.this.mListener.onComplete((String) future.get());
                                }
                                if (SaveUriDialogFragment.this.isAdded()) {
                                    SaveUriDialogFragment.this.dismissAllowingStateLoss();
                                }
                            }
                        });
                    }
                }
            });
        } else if (this.mListener != null) {
            this.mListener.onComplete(null);
        }
    }

    /* access modifiers changed from: private */
    public String saveInternal(Uri uri) {
        FileOutputStream fileOutputStream;
        String safePathInPriorStorageForUnadapted = StorageUtils.getSafePathInPriorStorageForUnadapted("DCIM/Camera");
        if (!FileUtils.createFolder(new File(safePathInPriorStorageForUnadapted), false)) {
            return null;
        }
        File generateJPGFileForSaving = generateJPGFileForSaving(safePathInPriorStorageForUnadapted);
        if (generateJPGFileForSaving == null) {
            return null;
        }
        Bitmap loadImageSync = ImageLoader.getInstance().loadImageSync(uri.toString(), null, new Builder().imageScaleType(ImageScaleType.NONE_SAFE).build());
        if (loadImageSync == null) {
            Log.e("SaveUriDialogFragment", "fail to convert %s to bitmap", (Object) uri.toString());
            return null;
        }
        try {
            fileOutputStream = new FileOutputStream(generateJPGFileForSaving);
            try {
                loadImageSync.compress(CompressFormat.JPEG, 100, fileOutputStream);
                String absolutePath = generateJPGFileForSaving.getAbsolutePath();
                MediaScannerUtil.scanSingleFile(getActivity().getApplicationContext(), absolutePath, 0);
                MediaFileUtils.triggerMediaScan(true, generateJPGFileForSaving);
                MiscUtil.closeSilently(fileOutputStream);
                loadImageSync.recycle();
                return absolutePath;
            } catch (Exception e) {
                e = e;
                try {
                    Log.e("SaveUriDialogFragment", "fail to save %s %s", uri, e);
                    MiscUtil.closeSilently(fileOutputStream);
                    loadImageSync.recycle();
                    return null;
                } catch (Throwable th) {
                    th = th;
                    MiscUtil.closeSilently(fileOutputStream);
                    loadImageSync.recycle();
                    throw th;
                }
            }
        } catch (Exception e2) {
            e = e2;
            fileOutputStream = null;
            Log.e("SaveUriDialogFragment", "fail to save %s %s", uri, e);
            MiscUtil.closeSilently(fileOutputStream);
            loadImageSync.recycle();
            return null;
        } catch (Throwable th2) {
            th = th2;
            fileOutputStream = null;
            MiscUtil.closeSilently(fileOutputStream);
            loadImageSync.recycle();
            throw th;
        }
    }

    public static void show(Activity activity, Uri uri, OnCompleteListener onCompleteListener) {
        SaveUriDialogFragment saveUriDialogFragment = new SaveUriDialogFragment();
        Bundle bundle = new Bundle();
        bundle.putParcelable("key_uri", uri);
        saveUriDialogFragment.setArguments(bundle);
        saveUriDialogFragment.setOnCompleteListener(onCompleteListener);
        saveUriDialogFragment.showAllowingStateLoss(activity.getFragmentManager(), "SaveUriDialogFragment");
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        save((Uri) getArguments().getParcelable("key_uri"));
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setCancelable(false);
    }

    public Dialog onCreateDialog(Bundle bundle) {
        this.mProgressDialog = ProgressDialog.show(getActivity(), "", getActivity().getString(R.string.adding_to_album), true, false);
        return this.mProgressDialog;
    }

    public void onDestroy() {
        setOnCompleteListener(null);
        super.onDestroy();
    }

    public void setOnCompleteListener(OnCompleteListener onCompleteListener) {
        this.mListener = onCompleteListener;
    }
}
