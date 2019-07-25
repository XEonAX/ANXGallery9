package com.miui.gallery.util;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.MediaFileUtils.FileType;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.assist.ImageScaleType;
import com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

public class FileCompressTask implements Job {
    private String mCompressFolder;
    private List<String> mCompressItems;
    /* access modifiers changed from: private */
    public OnCompressListener mCompressListener;
    private DisplayImageOptions mDisplayImageOptions = new Builder().imageScaleType(ImageScaleType.EXACTLY).bitmapConfig(Config.RGB_565).build();

    public interface OnCompressListener {
        void onCompressComplete(List<String> list, List<String> list2);

        void onCompressProgress(float f);
    }

    public FileCompressTask(List<String> list, OnCompressListener onCompressListener, String str) {
        this.mCompressItems = list;
        this.mCompressListener = onCompressListener;
        this.mCompressFolder = str;
    }

    /* JADX WARNING: Removed duplicated region for block: B:33:0x00f4  */
    /* JADX WARNING: Removed duplicated region for block: B:37:0x010f  */
    public Object run(JobContext jobContext) {
        FileOutputStream fileOutputStream;
        if (MiscUtil.isValid(this.mCompressItems)) {
            int size = this.mCompressItems.size();
            final ArrayList arrayList = new ArrayList();
            final ArrayList arrayList2 = new ArrayList();
            File file = new File(StorageUtils.getSafePathInPriorStorageForUnadapted(this.mCompressFolder));
            int i = 0;
            if (file.exists()) {
                MediaFileUtils.deleteFileType(FileType.FOLDER, file);
            }
            FileUtils.createFolder(file, true);
            for (String str : this.mCompressItems) {
                if (jobContext.isCancelled()) {
                    return null;
                }
                Bitmap loadImageSync = ImageLoader.getInstance().loadImageSync(Scheme.FILE.wrap(str), this.mDisplayImageOptions);
                if (BitmapUtils.isValidate(loadImageSync)) {
                    String fileTitle = FileUtils.getFileTitle(FileUtils.getFileName(str));
                    StringBuilder sb = new StringBuilder();
                    sb.append(fileTitle);
                    sb.append(".jpg");
                    File file2 = new File(file, sb.toString());
                    if (file2.exists()) {
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append(fileTitle);
                        sb2.append("_");
                        sb2.append(System.currentTimeMillis());
                        sb2.append(".jpg");
                        file2 = new File(file, sb2.toString());
                    }
                    try {
                        fileOutputStream = new FileOutputStream(file2);
                        try {
                            loadImageSync.compress(CompressFormat.JPEG, 90, fileOutputStream);
                            arrayList.add(file2.getAbsolutePath());
                            MiscUtil.closeSilently(fileOutputStream);
                            i++;
                            if (this.mCompressListener != null) {
                                final float f = (((float) i) * 1.0f) / ((float) size);
                                ThreadManager.getMainHandler().post(new Runnable() {
                                    public void run() {
                                        FileCompressTask.this.mCompressListener.onCompressProgress(r2);
                                    }
                                });
                            }
                        } catch (Exception e) {
                            e = e;
                            try {
                                e.printStackTrace();
                                MiscUtil.closeSilently(fileOutputStream);
                                i++;
                                if (this.mCompressListener != null) {
                                    final float f2 = (((float) i) * 1.0f) / ((float) size);
                                    ThreadManager.getMainHandler().post(new Runnable() {
                                        public void run() {
                                            FileCompressTask.this.mCompressListener.onCompressProgress(r2);
                                        }
                                    });
                                }
                                arrayList2.add(str);
                            } catch (Throwable th) {
                                th = th;
                                MiscUtil.closeSilently(fileOutputStream);
                                int i2 = i + 1;
                                if (this.mCompressListener != null) {
                                    final float f3 = (((float) i2) * 1.0f) / ((float) size);
                                    ThreadManager.getMainHandler().post(new Runnable() {
                                        public void run() {
                                            FileCompressTask.this.mCompressListener.onCompressProgress(f3);
                                        }
                                    });
                                }
                                throw th;
                            }
                        }
                    } catch (Exception e2) {
                        e = e2;
                        fileOutputStream = null;
                        e.printStackTrace();
                        MiscUtil.closeSilently(fileOutputStream);
                        i++;
                        if (this.mCompressListener != null) {
                        }
                        arrayList2.add(str);
                    } catch (Throwable th2) {
                        th = th2;
                        fileOutputStream = null;
                        MiscUtil.closeSilently(fileOutputStream);
                        int i22 = i + 1;
                        if (this.mCompressListener != null) {
                        }
                        throw th;
                    }
                }
                arrayList2.add(str);
            }
            if (this.mCompressListener != null) {
                ThreadManager.getMainHandler().post(new Runnable() {
                    public void run() {
                        FileCompressTask.this.mCompressListener.onCompressProgress(1.0f);
                        FileCompressTask.this.mCompressListener.onCompressComplete(arrayList, arrayList2);
                    }
                });
            }
        }
        return null;
    }
}
