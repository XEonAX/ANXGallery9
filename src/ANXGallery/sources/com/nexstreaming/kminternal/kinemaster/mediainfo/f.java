package com.nexstreaming.kminternal.kinemaster.mediainfo;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.os.AsyncTask;
import android.util.Log;
import com.nexstreaming.app.common.task.Task;
import com.nexstreaming.app.common.task.Task.TaskError;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

/* compiled from: ThumbnailConversionTask */
abstract class f extends AsyncTask<Integer, Integer, TaskError> {
    private File a;
    private File b;
    private File c;
    private File d;
    private long e;
    /* access modifiers changed from: private */
    public Bitmap f;
    /* access modifiers changed from: private */
    public Bitmap g;
    /* access modifiers changed from: private */
    public Bitmap h;
    /* access modifiers changed from: private */
    public int[] i;

    public f(File file, File file2, File file3, File file4) {
        this.a = file2;
        this.d = file;
        this.b = file3;
        this.c = file4;
    }

    private TaskError a(InputStream inputStream) throws IOException {
        return g.a(inputStream, this.e, 50, new d() {
            int a;
            int b;
            Bitmap c;
            Canvas d;
            Rect e;
            Paint f;

            public void a(Bitmap bitmap, int i, int i2, int i3) {
                if (i == 0) {
                    this.a = 90;
                    this.b = i2 * 160;
                    this.c = Bitmap.createBitmap(this.b, this.a, Config.RGB_565);
                    f.this.f = this.c;
                    this.d = new Canvas(this.c);
                    this.e = new Rect(0, 0, 160, 90);
                    this.f = new Paint();
                    this.f.setFilterBitmap(true);
                    f.this.i = new int[i2];
                    StringBuilder sb = new StringBuilder();
                    sb.append("processRawFile : totalCount=");
                    sb.append(i2);
                    Log.d("KMMediaInfo_ThumbConv", sb.toString());
                }
                f.this.i[i] = i3;
                if (bitmap == null) {
                    this.e.offset(160, 0);
                    return;
                }
                if (i == 0) {
                    Log.d("KMMediaInfo_ThumbConv", "Make large thumnail at i==0");
                    Bitmap createBitmap = Bitmap.createBitmap(640, 360, Config.RGB_565);
                    new Canvas(createBitmap).drawBitmap(bitmap, null, new Rect(0, 0, 640, 360), this.f);
                    f.this.g = createBitmap;
                } else if (i == i2 - 1) {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("Make large end thumnail at i==");
                    sb2.append(i);
                    Log.d("KMMediaInfo_ThumbConv", sb2.toString());
                    Bitmap createBitmap2 = Bitmap.createBitmap(640, 360, Config.RGB_565);
                    new Canvas(createBitmap2).drawBitmap(bitmap, null, new Rect(0, 0, 640, 360), this.f);
                    f.this.h = createBitmap2;
                }
                this.d.save();
                this.d.scale(-1.0f, -1.0f, 80.0f, 45.0f);
                this.d.drawBitmap(bitmap, null, this.e, this.f);
                this.d.restore();
                this.d.translate(160.0f, 0.0f);
            }
        });
    }

    private void a(int[] iArr, Bitmap bitmap, File file) throws IOException {
        String str = "KMMediaInfo_ThumbConv";
        StringBuilder sb = new StringBuilder();
        sb.append("writeBitmapToFile(");
        sb.append(file);
        sb.append(") : ");
        sb.append(iArr == null ? "no index" : "width index");
        Log.d(str, sb.toString());
        DataOutputStream dataOutputStream = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(file)));
        if (iArr != null) {
            try {
                dataOutputStream.writeInt(160);
                dataOutputStream.writeInt(90);
                dataOutputStream.writeInt(iArr.length);
                for (int writeInt : iArr) {
                    dataOutputStream.writeInt(writeInt);
                }
            } finally {
                dataOutputStream.close();
                file.setReadable(true);
            }
        }
        bitmap.compress(CompressFormat.JPEG, 70, dataOutputStream);
        dataOutputStream.close();
        file.setReadable(true);
    }

    private TaskError b() throws IOException {
        BufferedInputStream bufferedInputStream = new BufferedInputStream(new FileInputStream(this.d));
        try {
            return a((InputStream) bufferedInputStream);
        } finally {
            bufferedInputStream.close();
        }
    }

    private void c() throws IOException {
        a(null, this.g, this.b);
        a(null, this.h == null ? this.g : this.h, this.c);
        a(this.i, this.f, this.a);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public TaskError doInBackground(Integer... numArr) {
        if (!this.d.exists()) {
            Log.d("KMMediaInfo_ThumbConv", "doInBackground : raw thumbnail file not found");
            return ThumbnailError.RawFileNotFound;
        }
        this.e = this.d.length();
        StringBuilder sb = new StringBuilder();
        sb.append("doInBackground : mThumbFileSize=");
        sb.append(this.e);
        Log.d("KMMediaInfo_ThumbConv", sb.toString());
        if (this.e < 8) {
            Log.d("KMMediaInfo_ThumbConv", "doInBackground : raw thumbnail file too small");
            return ThumbnailError.RawFileTooSmall;
        }
        try {
            TaskError b2 = b();
            if (b2 != null) {
                Log.d("KMMediaInfo_ThumbConv", "doInBackground : raw thumbnail file parse error");
                return b2;
            }
            c();
            Log.d("KMMediaInfo_ThumbConv", "doInBackground : out");
            return null;
        } catch (IOException e2) {
            Log.d("KMMediaInfo_ThumbConv", "doInBackground : EXCEPTION", e2);
            return Task.makeTaskError((Exception) e2);
        }
    }

    /* access modifiers changed from: protected */
    public abstract void a();

    /* access modifiers changed from: protected */
    public abstract void a(TaskError taskError);

    /* access modifiers changed from: protected */
    /* renamed from: b */
    public final void onPostExecute(TaskError taskError) {
        if (taskError == null) {
            a();
        } else {
            a(taskError);
        }
    }
}
