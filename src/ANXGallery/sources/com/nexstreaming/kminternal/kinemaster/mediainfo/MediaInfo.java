package com.nexstreaming.kminternal.kinemaster.mediainfo;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.os.AsyncTask;
import android.util.Log;
import android.util.SparseArray;
import com.google.gson_nex.Gson;
import com.google.gson_nex.JsonIOException;
import com.google.gson_nex.JsonSyntaxException;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.nexstreaming.app.common.task.ResultTask;
import com.nexstreaming.app.common.task.ResultTask.OnResultAvailableListener;
import com.nexstreaming.app.common.task.Task;
import com.nexstreaming.app.common.task.Task.Event;
import com.nexstreaming.app.common.task.Task.OnFailListener;
import com.nexstreaming.app.common.task.Task.OnTaskEventListener;
import com.nexstreaming.app.common.task.Task.TaskError;
import com.nexstreaming.app.common.util.FileType;
import com.nexstreaming.kminternal.kinemaster.config.EditorGlobal;
import com.nexstreaming.kminternal.kinemaster.config.ExclusionList;
import com.nexstreaming.kminternal.kinemaster.config.NexEditorDeviceProfile;
import com.nexstreaming.kminternal.nexvideoeditor.NexClipInfo;
import com.nexstreaming.kminternal.nexvideoeditor.NexEditor;
import com.nexstreaming.kminternal.nexvideoeditor.NexEditor.ErrorCode;
import com.nexstreaming.kminternal.nexvideoeditor.NexEditor.h;
import com.nexstreaming.kminternal.nexvideoeditor.NexEditor.j;
import com.nexstreaming.kminternal.nexvideoeditor.NexEditor.k;
import com.nexstreaming.kminternal.nexvideoeditor.NexEditor.m;
import com.nexstreaming.nexeditorsdk.nexEngine;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Reader;
import java.lang.ref.WeakReference;
import java.util.ArrayDeque;
import java.util.Deque;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

public class MediaInfo {
    /* access modifiers changed from: private */
    public static Deque<c<h, f>> B = new ArrayDeque();
    /* access modifiers changed from: private */
    public static int C = 0;
    /* access modifiers changed from: private */
    public static Deque<c<b, Void>> D = new ArrayDeque();
    /* access modifiers changed from: private */
    public static Task E = null;
    /* access modifiers changed from: private */
    public static SparseArray<c<?, ?>> F = new SparseArray<>();
    private static boolean G = false;
    private static boolean H = false;
    private static Object I = new Object();
    private static k J = new k() {
        public void a(int i, int i2, int i3, int i4, int i5, byte[] bArr, int i6, int i7, int i8) {
            int i9 = i8;
            c cVar = (c) MediaInfo.F.get(i9);
            StringBuilder sb = new StringBuilder();
            sb.append("sThumbDoneListener onGetThumbDoneListener : tag=");
            sb.append(i9);
            Log.d("MediaInfo", sb.toString());
            if (cVar != null) {
                Log.d("MediaInfo", "sThumbDoneListener NOTIFY TASK!");
                cVar.a(i, i2, i3, i4, i5, bArr, i6, i7);
            }
        }
    };
    private static j K = new j() {
        public void a(ErrorCode errorCode, int i) {
            c cVar = (c) MediaInfo.F.get(i);
            StringBuilder sb = new StringBuilder();
            sb.append("sClipInfoDoneListener onGetClipInfoDone : tag=");
            sb.append(i);
            sb.append(" resultCode=");
            sb.append(errorCode);
            Log.d("MediaInfo", sb.toString());
            if (cVar != null) {
                Log.d("MediaInfo", "sClipInfoDoneListener NOTIFY TASK!");
                cVar.a(errorCode);
            }
        }
    };
    private static h L = new h() {
        public void a() {
            Log.d("MediaInfo", "sOnEditorDestroyedListener onEditorDestroyed");
            for (int i = 0; i < MediaInfo.F.size(); i++) {
                ((c) MediaInfo.F.valueAt(i)).sendFailure(ErrorCode.EDITOR_INSTANCE_DESTROYED);
            }
            MediaInfo.F = new SparseArray();
            MediaInfo.B = new ArrayDeque();
            MediaInfo.C = 0;
        }
    };
    private static m M = new m() {
        public void a() {
            Log.d("MediaInfo", "sIdleListener onIdle!");
            MediaInfo.R();
            MediaInfo.S();
        }
    };
    private static Map<String, WeakReference<MediaInfo>> a;
    private static ExclusionList b;
    /* access modifiers changed from: private */
    public static Executor v = Executors.newSingleThreadExecutor();
    private static Executor w = Executors.newSingleThreadExecutor();
    private static File y;
    private static File z;
    private boolean A = true;
    /* access modifiers changed from: private */
    public String c;
    private int d = -1;
    private File e;
    /* access modifiers changed from: private */
    public File f;
    /* access modifiers changed from: private */
    public File g;
    private File h;
    private File i;
    /* access modifiers changed from: private */
    public File j;
    /* access modifiers changed from: private */
    public File k;
    private File l;
    private String m;
    private ErrorCode n = ErrorCode.NONE;
    /* access modifiers changed from: private */
    public c<h, f> o = null;
    /* access modifiers changed from: private */
    public c<b, Void> p = null;
    private ResultTask<Bitmap> q = null;
    private ResultTask<Bitmap> r = null;
    /* access modifiers changed from: private */
    public ResultTask<int[]> s = null;
    private AsyncTask<String, Integer, int[]> t = null;
    private b u;
    private boolean x;

    public enum MediaInfoError implements TaskError {
        PCMLevelsNotAvailable,
        SeekPointsNotAvailable,
        ThumbnailsNotAvailable,
        LargeStartThumbnailNotAvailable,
        LargeEndThumbnailNotAvailable;

        public Exception getException() {
            return null;
        }

        public String getLocalizedMessage(Context context) {
            return name();
        }

        public String getMessage() {
            return name();
        }
    }

    private static class a {
        final int a;
        final int b;
        final int[] c;
        final Bitmap d;

        a(int i, int i2, int[] iArr, Bitmap bitmap) {
            this.a = i;
            this.b = i2;
            this.c = iArr;
            this.d = bitmap;
        }
    }

    private static class b {
        public int a;
        public String b;
        public long c;
        public boolean d;
        public boolean e;
        public boolean f;
        public int g;
        public int h;
        public int i;
        public int j;
        public int k;
        public int l;
        public int m;
        public int n;
        public int o;
        public int p;
        public int q;
        public int r;
        public int s;
        public int t;
        public int u;
        public int v;
        public int w;
        public int x;
        public int y;
        public int z;

        private b() {
        }
    }

    private static class c<RESULT_TYPE, PARAM_TYPE> extends ResultTask<RESULT_TYPE> {
        int a = 3;
        boolean b = false;
        /* access modifiers changed from: private */
        public final MediaInfo c;
        private final d<RESULT_TYPE, PARAM_TYPE> d;
        private final e e;
        private final PARAM_TYPE f;

        public c(MediaInfo mediaInfo, PARAM_TYPE param_type, d<RESULT_TYPE, PARAM_TYPE> dVar) {
            this.d = dVar;
            this.e = null;
            this.c = mediaInfo;
            this.f = param_type;
            StringBuilder sb = new StringBuilder();
            sb.append("MediaInfoTask : add to active tasks; tag=");
            sb.append(getTaskId());
            Log.d("MediaInfo", sb.toString());
            MediaInfo.F.put(getTaskId(), this);
        }

        public c(MediaInfo mediaInfo, PARAM_TYPE param_type, d<RESULT_TYPE, PARAM_TYPE> dVar, e eVar) {
            this.d = dVar;
            this.e = eVar;
            this.c = mediaInfo;
            this.f = param_type;
            StringBuilder sb = new StringBuilder();
            sb.append("MediaInfoTask : add to active tasks; thumb tag=");
            sb.append(getTaskId());
            Log.d("MediaInfo", sb.toString());
            MediaInfo.F.put(getTaskId(), this);
        }

        /* access modifiers changed from: private */
        public PARAM_TYPE a() {
            return this.f;
        }

        /* access modifiers changed from: private */
        public void a(int i, int i2, int i3, int i4, int i5, byte[] bArr, int i6, int i7) {
            if (MediaInfo.F.get(getTaskId()) == this && this.e != null) {
                this.e.a(i, i2, i3, i4, i5, bArr, i6, i7);
            }
        }

        /* access modifiers changed from: private */
        public void a(ErrorCode errorCode) {
            if (MediaInfo.F.get(getTaskId()) == this && this.d != null) {
                this.d.a(this, errorCode);
            }
        }

        public void sendFailure(TaskError taskError) {
            StringBuilder sb = new StringBuilder();
            sb.append("MediaInfoTask::sendFailure : remove from active tasks; tag=");
            sb.append(getTaskId());
            Log.d("MediaInfo", sb.toString());
            if (MediaInfo.F.get(getTaskId()) != this) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("MediaInfoTask::sendFailure : NOT THIS; tag=");
                sb2.append(getTaskId());
                Log.d("MediaInfo", sb2.toString());
                return;
            }
            super.sendFailure(taskError);
            MediaInfo.F.remove(getTaskId());
            StringBuilder sb3 = new StringBuilder();
            sb3.append("MediaInfoTask::sendFailure : tag=");
            sb3.append(getTaskId());
            sb3.append(" sActiveTasks.size()=");
            sb3.append(MediaInfo.F.size());
            Log.d("MediaInfo", sb3.toString());
            if (MediaInfo.F.size() == 0 && MediaInfo.E != null) {
                StringBuilder sb4 = new StringBuilder();
                sb4.append("MediaInfoTask::sendFailure : tag=");
                sb4.append(getTaskId());
                sb4.append(" mWaitNotBusyTask.signalEvent(COMPLETE)");
                Log.d("MediaInfo", sb4.toString());
                MediaInfo.E.signalEvent(Event.COMPLETE);
            }
        }

        public void sendResult(RESULT_TYPE result_type) {
            StringBuilder sb = new StringBuilder();
            sb.append("MediaInfoTask::sendResult : remove from active tasks; tag=");
            sb.append(getTaskId());
            Log.d("MediaInfo", sb.toString());
            if (MediaInfo.F.get(getTaskId()) != this) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("MediaInfoTask::sendResult : NOT THIS; tag=");
                sb2.append(getTaskId());
                Log.d("MediaInfo", sb2.toString());
                return;
            }
            MediaInfo.F.remove(getTaskId());
            StringBuilder sb3 = new StringBuilder();
            sb3.append("MediaInfoTask::sendResult : tag=");
            sb3.append(getTaskId());
            sb3.append(" sActiveTasks.size()=");
            sb3.append(MediaInfo.F.size());
            Log.d("MediaInfo", sb3.toString());
            if (MediaInfo.F.size() == 0 && MediaInfo.E != null) {
                StringBuilder sb4 = new StringBuilder();
                sb4.append("MediaInfoTask::sendResult : tag=");
                sb4.append(getTaskId());
                sb4.append(" mWaitNotBusyTask.signalEvent(COMPLETE)");
                Log.d("MediaInfo", sb4.toString());
                MediaInfo.E.signalEvent(Event.COMPLETE);
            }
            super.sendResult(result_type);
        }
    }

    private interface d<RESULT_TYPE, PARAM_TYPE> {
        void a(c<RESULT_TYPE, PARAM_TYPE> cVar, ErrorCode errorCode);
    }

    private interface e {
        void a(int i, int i2, int i3, int i4, int i5, byte[] bArr, int i6, int i7);
    }

    private static class f {
        public final String a;
        public final File b;
        public final int c;
        public final int d;
        public final int e;
        public final int f;
        public final int g;
        public final int h;
        public final int[] i;

        protected f(String str, File file, int i2, int i3, int i4, int i5, int i6, int i7) {
            this.a = str;
            this.b = file;
            this.c = i2;
            this.d = i3;
            this.e = i4;
            this.f = i5;
            this.g = i6;
            this.h = i7;
            this.i = null;
        }

        protected f(String str, File file, int i2, int i3, int[] iArr, int i4) {
            this.a = str;
            this.b = file;
            this.c = i2;
            this.d = i3;
            this.e = 0;
            this.f = 0;
            this.g = iArr.length;
            this.h = i4;
            this.i = iArr;
        }
    }

    private MediaInfo(String str, int i2, boolean z2) {
        Gson gson;
        BufferedWriter bufferedWriter;
        b bVar;
        BufferedReader bufferedReader;
        this.c = str;
        this.d = i2;
        if (i2 == 0) {
            FileType fromFile = FileType.fromFile(str);
            if (fromFile != null && fromFile.isImage()) {
                if (fromFile.isSupportedFormat()) {
                    M();
                    return;
                } else {
                    this.x = true;
                    return;
                }
            }
        }
        File file = new File(y, ".km_mediainfo");
        file.mkdirs();
        String format = String.format(Locale.US, "none_%08X", new Object[]{Integer.valueOf(str.hashCode())});
        if (i2 == 0) {
            format = b(new File(str));
        } else if (i2 == 1) {
            format = c(str);
        }
        StringBuilder sb = new StringBuilder();
        sb.append("mediaInfoDir=");
        sb.append(file);
        Log.d("MediaInfo", sb.toString());
        StringBuilder sb2 = new StringBuilder();
        sb2.append(format);
        sb2.append("_info.dat");
        this.e = new File(file, sb2.toString());
        StringBuilder sb3 = new StringBuilder();
        sb3.append(format);
        sb3.append("_seek.dat");
        this.f = new File(file, sb3.toString());
        StringBuilder sb4 = new StringBuilder();
        sb4.append(format);
        sb4.append("_vthumb.dat");
        this.g = new File(file, sb4.toString());
        StringBuilder sb5 = new StringBuilder();
        sb5.append(format);
        sb5.append("_vthumb_large.dat");
        this.h = new File(file, sb5.toString());
        StringBuilder sb6 = new StringBuilder();
        sb6.append(format);
        sb6.append("_vthumb_large_end.dat");
        this.i = new File(file, sb6.toString());
        StringBuilder sb7 = new StringBuilder();
        sb7.append(format);
        sb7.append("_vthumb_raw.dat");
        this.j = new File(file, sb7.toString());
        StringBuilder sb8 = new StringBuilder();
        sb8.append(format);
        sb8.append("_pcm.dat");
        this.k = new File(file, sb8.toString());
        this.l = file;
        this.m = format;
        this.A = z2;
        if (!z2 || !this.e.exists()) {
            gson = null;
        } else {
            StringBuilder sb9 = new StringBuilder();
            sb9.append("getInfo(");
            sb9.append(str);
            sb9.append(") info file exists -> attemptng to read");
            Log.d("MediaInfo", sb9.toString());
            gson = new Gson();
            try {
                bufferedReader = new BufferedReader(new FileReader(this.e));
                bVar = (b) gson.fromJson((Reader) bufferedReader, b.class);
                try {
                    bufferedReader.close();
                } catch (JsonIOException | JsonSyntaxException | IOException unused) {
                }
            } catch (JsonIOException | JsonSyntaxException | IOException unused2) {
                bVar = null;
            } catch (Throwable th) {
                bufferedReader.close();
                throw th;
            }
            if (bVar != null && bVar.a == 9) {
                StringBuilder sb10 = new StringBuilder();
                sb10.append("getInfo(");
                sb10.append(str);
                sb10.append(") info from disk cache");
                Log.d("MediaInfo", sb10.toString());
                this.u = bVar;
                return;
            }
        }
        if (b == null || !b.isExcluded(format)) {
            NexClipInfo nexClipInfo = new NexClipInfo();
            NexEditor Q = Q();
            if (Q == null) {
                this.n = ErrorCode.NO_INSTANCE_AVAILABLE;
                StringBuilder sb11 = new StringBuilder();
                sb11.append("getInfo(");
                sb11.append(str);
                sb11.append(") failure:");
                sb11.append(this.n);
                Log.d("MediaInfo", sb11.toString());
                return;
            }
            b.add(format);
            StringBuilder sb12 = new StringBuilder();
            sb12.append("getInfo(");
            sb12.append(str);
            sb12.append(") call editor for info");
            Log.d("MediaInfo", sb12.toString());
            this.n = Q.a(str, nexClipInfo, false, 0);
            StringBuilder sb13 = new StringBuilder();
            sb13.append("getInfo(");
            sb13.append(str);
            sb13.append(") returned from editor");
            Log.d("MediaInfo", sb13.toString());
            b.remove(format);
            this.u = new b();
            if (this.n != ErrorCode.NONE) {
                StringBuilder sb14 = new StringBuilder();
                sb14.append("getInfo(");
                sb14.append(str);
                sb14.append(") failure:");
                sb14.append(this.n);
                Log.d("MediaInfo", sb14.toString());
                return;
            }
            this.u.a = 9;
            this.u.b = str;
            this.u.d = nexClipInfo.mExistAudio != 0;
            this.u.e = nexClipInfo.mExistVideo != 0;
            this.u.f = false;
            this.u.k = nexClipInfo.mAudioDuration;
            this.u.l = nexClipInfo.mVideoDuration;
            this.u.c = N();
            this.u.g = nexClipInfo.mVideoWidth;
            this.u.h = nexClipInfo.mVideoHeight;
            this.u.i = nexClipInfo.mDisplayVideoWidth;
            this.u.j = nexClipInfo.mDisplayVideoHeight;
            this.u.m = nexClipInfo.mSeekPointCount;
            this.u.n = nexClipInfo.mFPS;
            this.u.o = nexClipInfo.mVideoH264Profile;
            this.u.p = nexClipInfo.mVideoH264Level;
            this.u.q = nexClipInfo.mVideoH264Interlaced;
            this.u.v = nexClipInfo.mVideoOrientation;
            this.u.r = nexClipInfo.mVideoBitRate;
            this.u.s = nexClipInfo.mAudioBitRate;
            this.u.t = nexClipInfo.mAudioSampleRate;
            this.u.u = nexClipInfo.mAudioChannels;
            this.u.w = nexClipInfo.mVideoRenderType;
            this.u.x = nexClipInfo.mVideoCodecType;
            this.u.y = nexClipInfo.mAudioCodecType;
            this.u.z = nexClipInfo.mVideoHDRType;
            if (z2) {
                if (gson == null) {
                    gson = new Gson();
                }
                StringBuilder sb15 = new StringBuilder();
                sb15.append("getInfo(");
                sb15.append(str);
                sb15.append(") writing:");
                sb15.append(this.e);
                Log.d("MediaInfo", sb15.toString());
                try {
                    bufferedWriter = new BufferedWriter(new FileWriter(this.e));
                    gson.toJson((Object) this.u, (Appendable) bufferedWriter);
                    bufferedWriter.close();
                    this.e.setReadable(true);
                } catch (IOException e2) {
                    e2.printStackTrace();
                } catch (Throwable th2) {
                    bufferedWriter.close();
                    this.e.setReadable(true);
                    throw th2;
                }
            }
            StringBuilder sb16 = new StringBuilder();
            sb16.append("getInfo(");
            sb16.append(str);
            sb16.append(") out");
            Log.d("MediaInfo", sb16.toString());
            return;
        }
        StringBuilder sb17 = new StringBuilder();
        sb17.append("getInfo(");
        sb17.append(str);
        sb17.append(") skip due to exclusion");
        Log.d("MediaInfo", sb17.toString());
        this.x = true;
    }

    private void M() {
        if (this.d != 0) {
            this.u = new b();
            this.u.a = 9;
            return;
        }
        File file = new File(this.c);
        Options options = new Options();
        options.inJustDecodeBounds = true;
        BitmapFactory.decodeFile(file.getAbsolutePath(), options);
        this.u = new b();
        this.u.a = 9;
        this.u.b = file.getAbsolutePath();
        this.u.d = false;
        this.u.e = false;
        this.u.f = true;
        this.u.k = 0;
        this.u.l = 0;
        this.u.c = file.length();
        this.u.g = options.outWidth;
        this.u.h = options.outHeight;
        this.u.m = 0;
        this.u.n = 0;
        this.u.o = 0;
        this.u.p = 0;
        this.u.q = 0;
        this.u.w = 0;
        this.u.x = 0;
        this.u.y = 0;
        this.u.z = 0;
        this.x = false;
        this.n = ErrorCode.NONE;
    }

    private long N() {
        if (this.d == 0) {
            return new File(this.c).length();
        }
        if (this.d == 1) {
            return (long) Integer.parseInt(this.c.substring(this.c.lastIndexOf(58) + 1));
        }
        return 0;
    }

    /* access modifiers changed from: private */
    public Task O() {
        Task task = new Task();
        new File(y, ".km_mediainfo").mkdirs();
        final Task task2 = task;
        AnonymousClass1 r0 = new f(this.j, this.g, this.h, this.i) {
            /* access modifiers changed from: protected */
            public void a() {
                MediaInfo.this.j.delete();
                task2.signalEvent(Event.SUCCESS, Event.COMPLETE);
            }

            /* access modifiers changed from: protected */
            public void a(TaskError taskError) {
                MediaInfo.this.j.delete();
                task2.sendFailure(taskError);
            }
        };
        r0.executeOnExecutor(v, new Integer[]{Integer.valueOf(0)});
        return task;
    }

    /* access modifiers changed from: private */
    public ResultTask<b> P() {
        final ResultTask<b> resultTask = new ResultTask<>();
        new AsyncTask<MediaInfo, Integer, b>() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public b doInBackground(MediaInfo... mediaInfoArr) {
                FileInputStream fileInputStream;
                MediaInfo mediaInfo = mediaInfoArr[0];
                if (mediaInfo.k.exists()) {
                    int min = (int) Math.min(mediaInfo.k.length(), 204800);
                    try {
                        byte[] bArr = new byte[min];
                        fileInputStream = new FileInputStream(MediaInfo.this.k);
                        int read = fileInputStream.read(bArr);
                        fileInputStream.close();
                        if (read >= min) {
                            return new b(bArr);
                        }
                    } catch (IOException e) {
                        e.printStackTrace();
                    } catch (Throwable th) {
                        fileInputStream.close();
                        throw th;
                    }
                }
                return null;
            }

            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void onPostExecute(b bVar) {
                resultTask.setResult(bVar);
                resultTask.signalEvent(Event.RESULT_AVAILABLE, Event.SUCCESS, Event.COMPLETE);
            }
        }.executeOnExecutor(w, new MediaInfo[]{this});
        return resultTask;
    }

    /* access modifiers changed from: private */
    public static NexEditor Q() {
        if (EditorGlobal.a() == null) {
            Log.d("MediaInfo", "getEditor : NULL EDITOR");
            return null;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("getEditor : setting sClipInfoDoneListener=");
        sb.append(K);
        Log.d("MediaInfo", sb.toString());
        EditorGlobal.a().a(K);
        EditorGlobal.a().a(M);
        EditorGlobal.a().a(L);
        EditorGlobal.a().a(J);
        return EditorGlobal.a();
    }

    /* access modifiers changed from: private */
    public static void R() {
        if (!D.isEmpty()) {
            NexEditor Q = Q();
            if (Q != null) {
                c cVar = (c) D.remove();
                Q.a(cVar.c.c, cVar.c.k, cVar.getTaskId());
            }
        }
    }

    /* access modifiers changed from: private */
    public static void S() {
        synchronized (I) {
            String str = "MediaInfo";
            StringBuilder sb = new StringBuilder();
            sb.append("startPendingThumbnailTask taskcount=");
            sb.append(B.size());
            Log.d(str, sb.toString());
            if (!B.isEmpty()) {
                NexEditor Q = Q();
                if (Q != null) {
                    c cVar = null;
                    boolean z2 = true;
                    while (true) {
                        if (B.isEmpty()) {
                            break;
                        }
                        cVar = (c) B.remove();
                        if (!cVar.b) {
                            z2 = false;
                            break;
                        }
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("startPendingThumbnailTask cancel thumbnail TaskId=");
                        sb2.append(cVar.getTaskId());
                        Log.d("MediaInfo", sb2.toString());
                        cVar.sendFailure(ErrorCode.GETCLIPINFO_USER_CANCEL);
                    }
                    if (z2) {
                        Log.d("MediaInfo", "startPendingThumbnailTask all canceled.");
                        return;
                    }
                    f fVar = (f) cVar.a();
                    try {
                        if (fVar.i != null) {
                            StringBuilder sb3 = new StringBuilder();
                            sb3.append("startPendingThumbnailTask use TimeTable sThumbnailsRunTaskId=");
                            sb3.append(cVar.getTaskId());
                            Log.d("MediaInfo", sb3.toString());
                            Q.a(fVar.a, fVar.b, fVar.c, fVar.d, fVar.i.length, fVar.i, fVar.h, cVar.getTaskId());
                        } else {
                            StringBuilder sb4 = new StringBuilder();
                            sb4.append("startPendingThumbnailTask range time sThumbnailsRunTaskId=");
                            sb4.append(cVar.getTaskId());
                            Log.d("MediaInfo", sb4.toString());
                            Q.a(fVar.a, fVar.b, fVar.c, fVar.d, fVar.e, fVar.f, fVar.g, fVar.h, cVar.getTaskId());
                        }
                    } catch (IOException e2) {
                        cVar.sendFailure(Task.makeTaskError((Exception) e2));
                    }
                }
            } else {
                Log.d("MediaInfo", "startPendingThumbnailTask all run end.");
            }
        }
    }

    public static MediaInfo a(String str) {
        if (str == null) {
            return null;
        }
        return a(str, true);
    }

    public static MediaInfo a(String str, boolean z2) {
        if (str == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("getInfo(");
        sb.append(str);
        sb.append(")");
        Log.d("MediaInfo", sb.toString());
        if (a == null) {
            Log.d("MediaInfo", "getInfo : init cache");
            a = new HashMap();
        }
        if (b == null) {
            Log.d("MediaInfo", "getInfo : init exclusion list");
            b = ExclusionList.exclusionListBackedBy(new File(new File(y, ".km_mediainfo"), "mediainfo_exclude.dat"));
        }
        int b2 = b(str);
        String absolutePath = b2 == 0 ? new File(str).getAbsolutePath() : str;
        if (z2) {
            WeakReference weakReference = (WeakReference) a.get(absolutePath);
            if (weakReference != null) {
                MediaInfo mediaInfo = (MediaInfo) weakReference.get();
                if (mediaInfo != null) {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("getInfo(");
                    sb2.append(str);
                    sb2.append(") using cache. duration=");
                    sb2.append(mediaInfo.p());
                    Log.d("MediaInfo", sb2.toString());
                    return mediaInfo;
                }
            }
        }
        if (b2 == 1) {
            z2 = false;
        }
        MediaInfo mediaInfo2 = new MediaInfo(str, b2, z2);
        if (mediaInfo2.n == ErrorCode.NO_INSTANCE_AVAILABLE) {
            return mediaInfo2;
        }
        StringBuilder sb3 = new StringBuilder();
        sb3.append("getInfo(");
        sb3.append(str);
        sb3.append(") adding to cache duration=");
        sb3.append(mediaInfo2.p());
        Log.d("MediaInfo", sb3.toString());
        a.put(absolutePath, new WeakReference(mediaInfo2));
        return mediaInfo2;
    }

    public static void a(Context context) {
        y = context.getApplicationContext().getCacheDir();
    }

    public static void a(File file) {
        z = file;
    }

    public static boolean a() {
        NexEditor Q = Q();
        if (Q == null) {
            return false;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("cancelAllGetThumbnails : Pending size=");
        sb.append(B.size());
        Log.d("MediaInfo", sb.toString());
        StringBuilder sb2 = new StringBuilder();
        sb2.append("cancelAllGetThumbnails : Active size=");
        sb2.append(F.size());
        Log.d("MediaInfo", sb2.toString());
        for (int i2 = 0; i2 < F.size(); i2++) {
            c cVar = (c) F.valueAt(i2);
            cVar.a = 0;
            cVar.b = true;
        }
        for (c cVar2 : B) {
            StringBuilder sb3 = new StringBuilder();
            sb3.append("cancelAllGetThumbnails : id=");
            sb3.append(cVar2.getTaskId());
            Log.d("MediaInfo", sb3.toString());
            cVar2.a = 0;
            cVar2.b = true;
        }
        Q.l(0);
        return true;
    }

    private static int b(String str) {
        if (str != null) {
            return str.startsWith("nexasset://") ? 1 : 0;
        }
        return -1;
    }

    private static String b(File file) {
        String name = file.getName();
        int hashCode = file.getAbsolutePath().hashCode();
        long lastModified = file.lastModified();
        long length = file.length();
        if (name.length() > 32) {
            name = name.substring(0, 32);
        }
        int i2 = (int) ((((lastModified * 212501089) + (length * 194851861)) + ((long) hashCode)) % 268435455);
        StringBuilder sb = new StringBuilder();
        sb.append(name);
        sb.append("_");
        sb.append(String.format(Locale.US, "%08X", new Object[]{Integer.valueOf(i2)}));
        return sb.toString();
    }

    /* access modifiers changed from: private */
    public ResultTask<a> c(File file) {
        final ResultTask<a> resultTask = new ResultTask<>();
        new AsyncTask<File, Integer, a>() {
            private a a(File file) throws IOException {
                DataInputStream dataInputStream = new DataInputStream(new BufferedInputStream(new FileInputStream(file)));
                int readInt = dataInputStream.readInt();
                int readInt2 = dataInputStream.readInt();
                int readInt3 = dataInputStream.readInt();
                int[] iArr = new int[readInt3];
                for (int i = 0; i < readInt3; i++) {
                    iArr[i] = dataInputStream.readInt();
                }
                return new a(readInt, readInt2, iArr, BitmapFactory.decodeStream(dataInputStream));
            }

            /* access modifiers changed from: protected */
            /* renamed from: a */
            public a doInBackground(File... fileArr) {
                try {
                    return a(fileArr[0]);
                } catch (IOException e) {
                    e.printStackTrace();
                    return null;
                }
            }

            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void onPostExecute(a aVar) {
                resultTask.setResult(aVar);
                resultTask.signalEvent(Event.RESULT_AVAILABLE, Event.SUCCESS, Event.COMPLETE);
            }
        }.executeOnExecutor(w, new File[]{file});
        return resultTask;
    }

    private static String c(String str) {
        String substring = str.substring(11);
        substring.replace(':', '_');
        StringBuilder sb = new StringBuilder();
        sb.append("nexasset_");
        sb.append(substring);
        return sb.toString();
    }

    public static boolean k() {
        return F.size() != 0;
    }

    public int A() {
        if (this.x || this.n.isError()) {
            return 0;
        }
        return this.u.w;
    }

    public int B() {
        if (this.x || this.n.isError()) {
            return 0;
        }
        return this.u.x;
    }

    public int C() {
        if (this.x || this.n.isError()) {
            return 0;
        }
        return this.u.y;
    }

    public int D() {
        if (this.x || this.n.isError()) {
            return 0;
        }
        return this.u.z;
    }

    public Task a(int i2, int i3, int i4, int i5, int i6, int i7, int[] iArr, c cVar) {
        f fVar;
        final int i8 = i6;
        final c cVar2 = cVar;
        boolean z2 = true;
        C++;
        File file = this.l;
        if (z != null) {
            file = z;
            StringBuilder sb = new StringBuilder();
            sb.append("getDetailThumbnails::temp cache dir=");
            sb.append(file.getAbsolutePath());
            Log.d("MediaInfo", sb.toString());
        }
        if (!file.exists()) {
            file.mkdirs();
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append(this.m);
        sb2.append("_detail_");
        sb2.append(i2);
        sb2.append("_");
        sb2.append(i3);
        sb2.append("_");
        sb2.append(i4);
        sb2.append("_");
        sb2.append(i5);
        sb2.append("_");
        sb2.append(i8);
        sb2.append("_");
        sb2.append(C);
        final File file2 = new File(file, sb2.toString());
        if (iArr != null) {
            f fVar2 = new f(this.c, file2, i2, i3, iArr, i7);
            fVar = fVar2;
        } else {
            fVar = new f(this.c, file2, i2, i3, i4, i5, i6, i7);
        }
        c cVar3 = new c(this, fVar, new d<h, f>() {
            public void a(final c<h, f> cVar, ErrorCode errorCode) {
                if (errorCode == ErrorCode.NONE) {
                    MediaInfo.S();
                    if ((((f) cVar.a()).h & nexEngine.ExportHEVCMainTierLevel52) == 262144) {
                        Log.d("MediaInfo", "getDetailThumbnails::onEditorAsyncDone() no cache mode");
                        cVar.signalEvent(Event.SUCCESS, Event.COMPLETE);
                        cVar.sendResult(a.a());
                    } else {
                        StringBuilder sb = new StringBuilder();
                        sb.append("getDetailThumbnails::onEditorAsyncDone(");
                        sb.append(MediaInfo.this.c);
                        sb.append(") -> ");
                        sb.append(file2);
                        Log.d("MediaInfo", sb.toString());
                        new AsyncTask<Void, Void, Void>() {
                            TaskError a = null;

                            /* access modifiers changed from: protected */
                            /* renamed from: a */
                            public Void doInBackground(Void... voidArr) {
                                if (i8 == 0) {
                                    this.a = g.a(file2, 50, cVar2);
                                } else {
                                    this.a = g.a(file2, i8, cVar2);
                                }
                                file2.delete();
                                return null;
                            }

                            /* access modifiers changed from: protected */
                            /* renamed from: a */
                            public void onPostExecute(Void voidR) {
                                if (this.a != null) {
                                    cVar.sendFailure(this.a);
                                    return;
                                }
                                cVar.signalEvent(Event.SUCCESS, Event.COMPLETE);
                                cVar.sendResult(a.a());
                            }
                        }.executeOnExecutor(MediaInfo.v, new Void[0]);
                    }
                } else if (cVar.b) {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("getDetailThumbnails::onEditorAsyncDone : User Cancel ID=");
                    sb2.append(cVar.getTaskId());
                    Log.d("MediaInfo", sb2.toString());
                    cVar.a = 0;
                    file2.delete();
                    cVar.sendFailure(ErrorCode.GETCLIPINFO_USER_CANCEL);
                    MediaInfo.S();
                } else {
                    cVar.a--;
                    if (cVar2 instanceof e) {
                        cVar.a = 0;
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("getDetailThumbnails::Raw File. No RETRYING=");
                        sb3.append(errorCode);
                        sb3.append(", ID=");
                        sb3.append(cVar.getTaskId());
                        Log.d("MediaInfo", sb3.toString());
                    }
                    if (cVar.a > 0) {
                        StringBuilder sb4 = new StringBuilder();
                        sb4.append("getDetailThumbnails::onEditorAsyncDone : RETRYING=");
                        sb4.append(errorCode);
                        sb4.append(", ID=");
                        sb4.append(cVar.getTaskId());
                        Log.d("MediaInfo", sb4.toString());
                        file2.delete();
                        if (errorCode == ErrorCode.GETCLIPINFO_USER_CANCEL || cVar.b) {
                            cVar.a = 0;
                            cVar.sendFailure(ErrorCode.GETCLIPINFO_USER_CANCEL);
                            MediaInfo.S();
                        } else {
                            MediaInfo.B.add(cVar);
                            if (errorCode != ErrorCode.INPROGRESS_GETCLIPINFO) {
                                MediaInfo.S();
                            }
                        }
                    } else {
                        StringBuilder sb5 = new StringBuilder();
                        sb5.append("getDetailThumbnails::onEditorAsyncDone : SEND FAILURE=");
                        sb5.append(errorCode);
                        sb5.append(", cancel=");
                        sb5.append(cVar.b);
                        Log.d("MediaInfo", sb5.toString());
                        if (errorCode == ErrorCode.GETCLIPINFO_USER_CANCEL || cVar.b) {
                            cVar.a = 0;
                        }
                        file2.delete();
                        cVar.sendFailure(errorCode);
                        MediaInfo.S();
                    }
                }
            }
        }, new e() {
            public void a(int i, int i2, int i3, int i4, int i5, byte[] bArr, int i6, int i7) {
                if (i != 1) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("getDetailThumbnails::onThumbDone() not video. mode=");
                    sb.append(i);
                    Log.d("MediaInfo", sb.toString());
                    return;
                }
                try {
                    g.a(bArr, i2, i3, i4, (i5 / (i3 * i4)) * 8, i6 - 1, i7, cVar2);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        });
        if (Q() == null || !B.isEmpty()) {
            z2 = false;
        }
        B.add(cVar3);
        if (z2) {
            S();
        }
        return cVar3;
    }

    public ErrorCode a(boolean z2, boolean z3) {
        NexEditor Q = Q();
        if (Q == null) {
            return ErrorCode.GENERAL;
        }
        int i2 = z2 ? 256 : 0;
        if (z3) {
            i2 |= 16;
        }
        return Q.a(this.c, new NexClipInfo(), i2, 0);
    }

    public ResultTask<h> b() {
        if (this.g == null && this.j == null) {
            return ResultTask.failedResultTask(MediaInfoError.ThumbnailsNotAvailable);
        }
        StringBuilder sb = new StringBuilder();
        sb.append("getThumbnails(");
        sb.append(this.c);
        sb.append(") sPendingThumbnailTasks=");
        sb.append(B.size());
        Log.d("MediaInfo", sb.toString());
        if (this.o == null || this.o.didSignalEvent(Event.FAIL)) {
            f fVar = new f(this.c, this.j, 640, 360, 0, r(), 30, 0);
            this.o = new c<>(this, fVar, new d<h, f>() {
                public void a(c<h, f> cVar, ErrorCode errorCode) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("getThumbnails::onEditorAsyncDone(");
                    sb.append(MediaInfo.this.c);
                    sb.append(") resultCode=");
                    sb.append(errorCode);
                    sb.append(" retry=");
                    sb.append(cVar.a);
                    Log.d("MediaInfo", sb.toString());
                    if (errorCode != ErrorCode.NONE) {
                        cVar.a--;
                        if (cVar.a > 0) {
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("getThumbnails::onEditorAsyncDone : RETRYING ID=");
                            sb2.append(cVar.getTaskId());
                            Log.d("MediaInfo", sb2.toString());
                            MediaInfo.B.add(cVar);
                            if (MediaInfo.B.size() <= 1 && errorCode != ErrorCode.INPROGRESS_GETCLIPINFO) {
                                MediaInfo.S();
                            }
                        } else {
                            Log.d("MediaInfo", "getThumbnails::onEditorAsyncDone : SEND FAILURE");
                            MediaInfo.this.o.sendFailure(errorCode);
                        }
                        return;
                    }
                    MediaInfo.S();
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("getThumbnails::onEditorAsyncDone(");
                    sb3.append(MediaInfo.this.c);
                    sb3.append(") Start JPEG Conversion");
                    Log.d("MediaInfo", sb3.toString());
                    MediaInfo.this.O().onComplete(new OnTaskEventListener() {
                        public void onTaskEvent(Task task, Event event) {
                            MediaInfo.this.c(MediaInfo.this.g).onResultAvailable(new OnResultAvailableListener<a>() {
                                /* renamed from: a */
                                public void onResultAvailable(ResultTask<a> resultTask, Event event, a aVar) {
                                    if (aVar != null) {
                                        MediaInfo.this.o.sendResult(new i(aVar.d, aVar.a, aVar.b, aVar.c));
                                    } else {
                                        MediaInfo.this.o.sendFailure(null);
                                    }
                                }
                            });
                        }
                    }).onFailure((OnFailListener) new OnFailListener() {
                        public void onFail(Task task, Event event, TaskError taskError) {
                            MediaInfo.this.o.sendFailure(null);
                        }
                    });
                }
            });
            c(this.g).onResultAvailable(new OnResultAvailableListener<a>() {
                /* renamed from: a */
                public void onResultAvailable(ResultTask<a> resultTask, Event event, a aVar) {
                    if (aVar == null || aVar.d == null || aVar.a <= 0 || aVar.b <= 0 || aVar.c == null) {
                        boolean z = MediaInfo.Q() != null && MediaInfo.B.isEmpty();
                        MediaInfo.B.add(MediaInfo.this.o);
                        if (z) {
                            MediaInfo.S();
                            return;
                        }
                        return;
                    }
                    MediaInfo.this.o.sendResult(new i(aVar.d, aVar.a, aVar.b, aVar.c));
                }
            });
            StringBuilder sb2 = new StringBuilder();
            sb2.append("getThumbnails(");
            sb2.append(this.c);
            sb2.append(") returning NEW task");
            Log.d("MediaInfo", sb2.toString());
            return this.o;
        }
        StringBuilder sb3 = new StringBuilder();
        sb3.append("getThumbnails(");
        sb3.append(this.c);
        sb3.append(") returning existing task");
        Log.d("MediaInfo", sb3.toString());
        return this.o;
    }

    public ResultTask<b> c() {
        if (this.k == null) {
            return ResultTask.failedResultTask(MediaInfoError.PCMLevelsNotAvailable);
        }
        if (this.p != null && !this.p.didSignalEvent(Event.FAIL)) {
            return this.p;
        }
        this.p = new c<>(this, null, new d<b, Void>() {
            public void a(final c<b, Void> cVar, ErrorCode errorCode) {
                if (errorCode == ErrorCode.INVALID_STATE) {
                    MediaInfo.D.add(cVar);
                    return;
                }
                MediaInfo.R();
                cVar.c.P().onResultAvailable(new OnResultAvailableListener<b>() {
                    /* renamed from: a */
                    public void onResultAvailable(ResultTask<b> resultTask, Event event, b bVar) {
                        if (bVar != null) {
                            cVar.sendResult(bVar);
                        } else {
                            cVar.sendFailure(null);
                        }
                    }
                });
            }
        });
        P().onResultAvailable(new OnResultAvailableListener<b>() {
            /* renamed from: a */
            public void onResultAvailable(ResultTask<b> resultTask, Event event, b bVar) {
                if (bVar != null) {
                    MediaInfo.this.p.sendResult(bVar);
                    return;
                }
                NexEditor H = MediaInfo.Q();
                if (H == null || !MediaInfo.D.isEmpty()) {
                    MediaInfo.D.add(MediaInfo.this.p);
                } else {
                    H.a(MediaInfo.this.c, MediaInfo.this.k, MediaInfo.this.p.getTaskId());
                }
            }
        });
        return this.p;
    }

    public int[] d() {
        if (this.t == null) {
            e();
            if (this.t == null) {
                throw new IllegalStateException();
            }
        }
        try {
            return (int[]) this.t.get();
        } catch (InterruptedException e2) {
            e2.printStackTrace();
            return null;
        } catch (ExecutionException e3) {
            e3.printStackTrace();
            return null;
        }
    }

    public ResultTask<int[]> e() {
        if (this.f == null) {
            return ResultTask.failedResultTask(MediaInfoError.SeekPointsNotAvailable);
        }
        if (this.s != null && !this.s.didSignalEvent(Event.FAIL)) {
            return this.s;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("getSeekPoints(");
        sb.append(this.c);
        sb.append(")");
        Log.d("MediaInfo", sb.toString());
        this.s = new ResultTask<>();
        this.t = new AsyncTask<String, Integer, int[]>() {
            private void a(File file, int[] iArr) throws IOException {
                StringBuilder sb = new StringBuilder();
                sb.append("getSeekPoints():writeFile(");
                sb.append(file);
                sb.append(")");
                Log.d("MediaInfo", sb.toString());
                DataOutputStream dataOutputStream = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(file)));
                int i = 0;
                while (i < iArr.length) {
                    try {
                        dataOutputStream.writeInt(iArr[i]);
                        i++;
                    } catch (Throwable th) {
                        dataOutputStream.close();
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("getSeekPoints(");
                        sb2.append(MediaInfo.this.c);
                        sb2.append(") wrote file: ");
                        sb2.append(file);
                        Log.d("MediaInfo", sb2.toString());
                        file.setReadable(true);
                        throw th;
                    }
                }
                StringBuilder sb3 = new StringBuilder();
                sb3.append("getSeekPoints(");
                sb3.append(MediaInfo.this.c);
                sb3.append(") wrote ");
                sb3.append(iArr.length);
                sb3.append(" points");
                Log.d("MediaInfo", sb3.toString());
                dataOutputStream.close();
                StringBuilder sb4 = new StringBuilder();
                sb4.append("getSeekPoints(");
                sb4.append(MediaInfo.this.c);
                sb4.append(") wrote file: ");
                sb4.append(file);
                Log.d("MediaInfo", sb4.toString());
                file.setReadable(true);
            }

            private int[] a(File file) throws IOException {
                DataInputStream dataInputStream = new DataInputStream(new FileInputStream(file));
                try {
                    int min = ((int) Math.min(file.length(), 204800)) / 4;
                    int[] iArr = new int[min];
                    for (int i = 0; i < min; i++) {
                        iArr[i] = dataInputStream.readInt();
                    }
                    StringBuilder sb = new StringBuilder();
                    sb.append("getSeekPoints():readFile : got ");
                    sb.append(min);
                    sb.append(" entries.");
                    Log.d("MediaInfo", sb.toString());
                    return iArr;
                } finally {
                    dataInputStream.close();
                }
            }

            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void onPostExecute(int[] iArr) {
                if (iArr == null) {
                    Log.d("MediaInfo", "onPostExecute : FAIL");
                    MediaInfo.this.s.signalEvent(Event.FAIL);
                    return;
                }
                StringBuilder sb = new StringBuilder();
                sb.append("onPostExecute : SUCCESS ");
                sb.append(iArr.length);
                Log.d("MediaInfo", sb.toString());
                MediaInfo.this.s.setResult(iArr);
                MediaInfo.this.s.signalEvent(Event.RESULT_AVAILABLE, Event.SUCCESS, Event.COMPLETE);
            }

            /* access modifiers changed from: protected */
            /* renamed from: a */
            public int[] doInBackground(String... strArr) {
                StringBuilder sb = new StringBuilder();
                sb.append("getSeekPoints:doInBackground(");
                sb.append(strArr[0]);
                sb.append(")");
                Log.d("MediaInfo", sb.toString());
                try {
                    return a(MediaInfo.this.f);
                } catch (IOException unused) {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("getSeekPoints:doInBackground(");
                    sb2.append(strArr[0]);
                    sb2.append(") -> no cache available; making");
                    Log.d("MediaInfo", sb2.toString());
                    NexEditor H = MediaInfo.Q();
                    if (H == null) {
                        return null;
                    }
                    NexClipInfo nexClipInfo = new NexClipInfo();
                    ErrorCode a2 = H.a(strArr[0], nexClipInfo, true, 0);
                    if (a2.isError() || nexClipInfo.mSeekTable == null) {
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("getSeekPoints(");
                        sb3.append(MediaInfo.this.c);
                        sb3.append(") FAIL -> ");
                        sb3.append(a2);
                        Log.d("MediaInfo", sb3.toString());
                        return null;
                    }
                    try {
                        a(MediaInfo.this.f, nexClipInfo.mSeekTable);
                    } catch (IOException e) {
                        StringBuilder sb4 = new StringBuilder();
                        sb4.append("getSeekPoints(");
                        sb4.append(MediaInfo.this.c);
                        sb4.append(") FAILED WRITING FILE");
                        Log.d("MediaInfo", sb4.toString());
                        e.printStackTrace();
                    }
                    return nexClipInfo.mSeekTable;
                }
            }
        }.executeOnExecutor(w, new String[]{this.c});
        return this.s;
    }

    public int f() {
        if (this.x || this.n.isError()) {
            return 0;
        }
        return this.u.m;
    }

    public boolean g() {
        return this.n != ErrorCode.UNSUPPORT_MAX_RESOLUTION && o() * n() <= (NexEditorDeviceProfile.getDeviceProfile().getMaxResolution() * BaiduSceneResult.CASTLE) / 100;
    }

    public boolean h() {
        return !this.x && !this.n.isError() && g();
    }

    public boolean i() {
        return this.x || this.n.isError();
    }

    public int j() {
        if (this.n.isError()) {
            switch (this.n) {
                case UNSUPPORT_AUDIO_CODEC:
                    return -2;
                case UNSUPPORT_AUDIO_PROFILE:
                    return -3;
                case UNSUPPORT_FORMAT:
                    return -4;
                case UNSUPPORT_MAX_RESOLUTION:
                    return -5;
                case UNSUPPORT_MIN_DURATION:
                    return -6;
                case UNSUPPORT_MIN_RESOLUTION:
                    return -7;
                case UNSUPPORT_VIDEIO_PROFILE:
                    return -8;
                case UNSUPPORT_VIDEO_CODEC:
                    return -9;
                case UNSUPPORT_VIDEO_FPS:
                    return -10;
                case UNSUPPORT_VIDEO_LEVEL:
                    return -11;
                default:
                    return -12;
            }
        } else {
            return h() ? 0 : -1;
        }
    }

    public boolean l() {
        if (this.x || this.n.isError()) {
            return false;
        }
        return this.u.d;
    }

    public boolean m() {
        if (this.x || this.n.isError()) {
            return false;
        }
        return this.u.e;
    }

    public int n() {
        if (this.x || this.n.isError()) {
            return 0;
        }
        return this.u.g;
    }

    public int o() {
        if (this.x || this.n.isError()) {
            return 0;
        }
        return this.u.h;
    }

    public int p() {
        if (this.x || this.n.isError()) {
            return 0;
        }
        return this.u.d ? this.u.k : this.u.l;
    }

    public int q() {
        if (this.x || this.n.isError()) {
            return 0;
        }
        return this.u.k;
    }

    public int r() {
        if (this.x || this.n.isError()) {
            return 0;
        }
        return this.u.l;
    }

    public int s() {
        if (this.x || this.n.isError()) {
            return 0;
        }
        return this.u.n;
    }

    public int t() {
        if (this.x || this.n.isError()) {
            return 0;
        }
        return this.u.v;
    }

    public int u() {
        if (this.x || this.n.isError()) {
            return 0;
        }
        return this.u.o;
    }

    public int v() {
        if (this.x || this.n.isError()) {
            return 0;
        }
        return this.u.p;
    }

    public int w() {
        if (this.x || this.n.isError()) {
            return 0;
        }
        return this.u.r;
    }

    public int x() {
        if (this.x || this.n.isError()) {
            return 0;
        }
        return this.u.s;
    }

    public int y() {
        if (this.x || this.n.isError()) {
            return 0;
        }
        return this.u.t;
    }

    public int z() {
        if (this.x || this.n.isError()) {
            return 0;
        }
        return this.u.u;
    }
}
