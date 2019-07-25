package com.miui.gallery.editor.photo.sdk;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.BitmapFactory.Options;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Handler;
import android.os.Looper;
import com.miui.gallery.editor.photo.utils.BigBitmapLoadUtils;
import com.miui.gallery.editor.photo.utils.Bitmaps;
import com.miui.gallery.editor.photo.utils.IoUtils;
import com.miui.gallery.util.ExifUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery3d.exif.ExifInterface;
import com.miui.gallery3d.exif.ExifInvalidFormatException;
import com.miui.gallery3d.exif.ExifTag;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

public class RenderTask {
    /* access modifiers changed from: private */
    public Callback mCallback;
    /* access modifiers changed from: private */
    public boolean mCancelled = false;
    /* access modifiers changed from: private */
    public Context mContext;
    /* access modifiers changed from: private */
    public Uri mCurrent;
    private Handler mHandler = new Handler(Looper.getMainLooper());
    private Generator mOutputGenerator;
    private Iterator<Uri> mTasks;

    public interface Callback {
        void onItemFinish(Uri uri, Uri uri2);

        void onTaskCancelled();

        void onTaskError();

        void onTaskFinish();
    }

    public interface Generator {
        Uri generate(Uri uri);
    }

    private static class Parameter {
        Uri mOutput;
        Uri mSource;

        public Parameter(Uri uri, Uri uri2) {
            this.mSource = uri;
            this.mOutput = uri2;
        }
    }

    private class PrepareTask extends AsyncTask<Parameter, Void, Parameter> {
        private PrepareTask() {
        }

        /* access modifiers changed from: protected */
        public Parameter doInBackground(Parameter... parameterArr) {
            Bitmap bitmap;
            Parameter parameter = parameterArr[0];
            File file = new File(new File(parameter.mOutput.getPath()).getParent());
            if (!file.exists() && !file.mkdirs()) {
                return null;
            }
            ExifInterface exifInterface = new ExifInterface();
            try {
                exifInterface.readExif(parameter.mSource.getPath());
            } catch (ExifInvalidFormatException e) {
                Log.w("RenderTask", (Throwable) e);
            } catch (IOException e2) {
                Log.w("RenderTask", (Throwable) e2);
            }
            try {
                bitmap = RenderTask.this.decodeOrigin(parameter.mSource, exifInterface);
            } catch (FileNotFoundException e3) {
                e3.printStackTrace();
                bitmap = null;
            }
            if (bitmap != null) {
                AutoRenderer autoRenderer = new AutoRenderer(RenderTask.this.mContext);
                Bitmap render = autoRenderer.render(bitmap);
                if (render == null || !RenderTask.this.saveShareBitmap(render, parameter.mOutput, exifInterface)) {
                    RenderTask.this.performItemFinish(null);
                } else {
                    RenderTask.this.performItemFinish(parameter.mOutput);
                }
                autoRenderer.release();
            }
            return parameter;
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Parameter parameter) {
            super.onPostExecute(parameter);
            if (parameter == null) {
                RenderTask.this.mCallback.onTaskError();
            } else {
                Log.d("RenderTask", "schedule for %s -> %s", parameter.mSource, parameter.mOutput);
            }
        }
    }

    public RenderTask(Context context, Collection<Uri> collection, Generator generator) {
        if (context == null) {
            throw new IllegalArgumentException("context can't be null");
        } else if (collection == null) {
            throw new IllegalArgumentException("tasks can't be null");
        } else if (generator != null) {
            ArrayList arrayList = new ArrayList(collection);
            this.mContext = context;
            this.mTasks = arrayList.iterator();
            this.mOutputGenerator = generator;
        } else {
            throw new IllegalArgumentException("generator can't be null");
        }
    }

    /* JADX INFO: finally extract failed */
    /* access modifiers changed from: private */
    public boolean saveShareBitmap(Bitmap bitmap, Uri uri, ExifInterface exifInterface) {
        OutputStream openOutputStream = IoUtils.openOutputStream("RenderTask", this.mContext, uri);
        List<ExifTag> allTags = exifInterface != null ? exifInterface.getAllTags() : null;
        if (allTags == null || allTags.isEmpty()) {
            Log.i("RenderTask", "no exif found in source image");
        } else {
            Log.d("RenderTask", "filter exif");
            ExifInterface exifInterface2 = new ExifInterface();
            for (ExifTag exifTag : allTags) {
                short tagId = exifTag.getTagId();
                if (tagId == ExifInterface.getTrueTagKey(ExifInterface.TAG_ORIENTATION) || tagId == ExifInterface.getTrueTagKey(ExifInterface.TAG_IMAGE_WIDTH) || tagId == ExifInterface.getTrueTagKey(ExifInterface.TAG_IMAGE_LENGTH) || tagId == ExifInterface.getTrueTagKey(ExifInterface.TAG_XIAOMI_COMMENT) || tagId == ExifInterface.getTrueTagKey(ExifInterface.TAG_USER_COMMENT)) {
                    Log.d("RenderTask", "skip user comment");
                } else {
                    exifInterface2.setTag(exifTag);
                }
            }
            exifInterface2.setTag(exifInterface2.buildTag(ExifInterface.TAG_ORIENTATION, Short.valueOf(ExifInterface.getOrientationValueForRotation(0))));
            exifInterface2.setTag(exifInterface2.buildTag(ExifInterface.TAG_IMAGE_WIDTH, Integer.valueOf(bitmap.getWidth())));
            exifInterface2.setTag(exifInterface2.buildTag(ExifInterface.TAG_IMAGE_LENGTH, Integer.valueOf(bitmap.getHeight())));
            openOutputStream = exifInterface2.getExifWriterStream(openOutputStream);
        }
        try {
            boolean compress = bitmap.compress(CompressFormat.JPEG, 95, openOutputStream);
            if (compress && openOutputStream != null) {
                openOutputStream.flush();
            }
            IoUtils.close("RenderTask", openOutputStream);
            return compress;
        } catch (IOException e) {
            Log.w("RenderTask", (Throwable) e);
            IoUtils.close("RenderTask", openOutputStream);
            return false;
        } catch (Throwable th) {
            IoUtils.close("RenderTask", openOutputStream);
            throw th;
        }
    }

    /* access modifiers changed from: private */
    public boolean scheduleNext() {
        if (!this.mTasks.hasNext()) {
            return false;
        }
        this.mCurrent = (Uri) this.mTasks.next();
        Uri generate = this.mOutputGenerator.generate(this.mCurrent);
        new PrepareTask().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Parameter[]{new Parameter(this.mCurrent, generate)});
        return true;
    }

    public void cancel() {
        if (Thread.currentThread() == Looper.getMainLooper().getThread()) {
            this.mCancelled = true;
            return;
        }
        throw new RuntimeException("can't run in sub thread.");
    }

    public Bitmap decodeOrigin(Uri uri, ExifInterface exifInterface) throws FileNotFoundException {
        Options options = new Options();
        options.inJustDecodeBounds = true;
        Bitmaps.decodeUri(this.mContext, uri, options);
        options.inJustDecodeBounds = false;
        options.inSampleSize = BigBitmapLoadUtils.calculateInSampleSize(this.mContext, options.outWidth, options.outHeight);
        return Bitmaps.setConfig(Bitmaps.joinExif(Bitmaps.decodeUri(this.mContext, uri, options), ExifUtil.getRotationDegrees(exifInterface), null));
    }

    public void performItemFinish(final Uri uri) {
        Log.d("RenderTask", "render finish: %s", (Object) uri);
        this.mHandler.post(new Runnable() {
            public void run() {
                if (RenderTask.this.mCallback != null) {
                    RenderTask.this.mCallback.onItemFinish(RenderTask.this.mCurrent, uri);
                }
                if (RenderTask.this.mCancelled) {
                    Log.d("RenderTask", "render cancelled.");
                    if (RenderTask.this.mCallback != null) {
                        RenderTask.this.mCallback.onTaskCancelled();
                    }
                } else if (!RenderTask.this.scheduleNext() && RenderTask.this.mCallback != null) {
                    RenderTask.this.mCallback.onTaskFinish();
                }
            }
        });
    }

    public void setCallback(Callback callback) {
        this.mCallback = callback;
    }

    public void start() {
        if (Thread.currentThread() != Looper.getMainLooper().getThread()) {
            throw new RuntimeException("can't run in sub thread.");
        } else if (this.mCancelled) {
            Log.d("RenderTask", "render cancelled.");
            if (this.mCallback != null) {
                this.mCallback.onTaskCancelled();
            }
        } else {
            if (!scheduleNext() && this.mCallback != null) {
                this.mCallback.onTaskFinish();
            }
        }
    }
}
