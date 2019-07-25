package com.nexstreaming.kminternal.nexvideoeditor;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.media.AudioManager;
import android.media.AudioTrack;
import android.os.AsyncTask;
import android.os.Handler;
import android.os.Looper;
import android.util.Base64;
import android.util.Log;
import com.nexstreaming.app.common.nexasset.assetpackage.f;
import com.nexstreaming.kminternal.kinemaster.config.EditorGlobal;
import com.nexstreaming.kminternal.kinemaster.editorwrapper.b;
import com.nexstreaming.kminternal.kinemaster.editorwrapper.b.C0005b;
import com.nexstreaming.kminternal.nexvideoeditor.NexEditor.ErrorCode;
import com.nexstreaming.kminternal.nexvideoeditor.NexEditor.PlayState;
import com.nexstreaming.kminternal.nexvideoeditor.NexEditor.c;
import com.nexstreaming.kminternal.nexvideoeditor.NexImageLoader.d;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Iterator;

public class NexEditorEventListener {
    private static Bitmap n = null;
    private static String o = "";
    /* access modifiers changed from: private */
    public NexEditor a = null;
    /* access modifiers changed from: private */
    public c b = null;
    private Handler c = null;
    /* access modifiers changed from: private */
    public PlayState d = null;
    private int e = 0;
    private boolean f = false;
    private AudioManager g;
    private c h;
    private LayerRenderer i = new LayerRenderer();
    private boolean j = false;
    private boolean k = true;
    private int l = 0;
    /* access modifiers changed from: private */
    public ArrayList<a> m = new ArrayList<>();
    public AudioTrack mAudioTrack = null;
    public NexImageLoader mImage = null;

    private class a extends AsyncTask<String, Void, NexImage> {
        private String b;

        private a() {
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public NexImage doInBackground(String... strArr) {
            NexImage openThemeImage = NexEditorEventListener.this.mImage.openThemeImage(strArr[0]);
            if (openThemeImage == null) {
                return openThemeImage;
            }
            int width = openThemeImage.getWidth();
            int height = openThemeImage.getHeight();
            int loadedType = openThemeImage.getLoadedType();
            int[] iArr = new int[(width * height)];
            openThemeImage.getPixels(iArr);
            if (NexEditorEventListener.this.a != null) {
                NexEditorEventListener.this.a.a(strArr[0], iArr, width, height, loadedType);
            }
            return openThemeImage;
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void onPostExecute(NexImage nexImage) {
            NexEditorEventListener.this.m.remove(this);
            Log.d("NexEditorEventHandler", String.format("Done:image thread queue length:%d", new Object[]{Integer.valueOf(NexEditorEventListener.this.m.size())}));
        }

        public void a(String str) {
            this.b = str;
        }

        /* access modifiers changed from: protected */
        /* renamed from: b */
        public void onCancelled(NexImage nexImage) {
            if (NexEditorEventListener.this.a != null && this.b != null) {
                NexEditorEventListener.this.a.a(this.b);
            }
        }
    }

    public NexEditorEventListener(NexEditor nexEditor, Context context, a aVar, d dVar) {
        Resources resources = null;
        if (context != null) {
            this.g = (AudioManager) context.getApplicationContext().getSystemService("audio");
        } else {
            this.g = null;
        }
        this.a = nexEditor;
        if (context != null) {
            resources = context.getResources();
        }
        NexImageLoader nexImageLoader = new NexImageLoader(resources, aVar, dVar, nexEditor.f(), nexEditor.g(), nexEditor.h());
        this.mImage = nexImageLoader;
        this.c = new Handler(Looper.getMainLooper());
    }

    private void a() {
        if (this.l == 0) {
            try {
                InputStream open = com.nexstreaming.kminternal.kinemaster.config.a.a().b().getAssets().open(EditorGlobal.b());
                MessageDigest instance = MessageDigest.getInstance("SHA-256");
                byte[] bArr = new byte[4096];
                while (true) {
                    int read = open.read(bArr);
                    if (read == -1) {
                        break;
                    }
                    instance.update(bArr, 0, read);
                }
                open.close();
                if (Base64.encodeToString(instance.digest(), 0).startsWith("5i/mnZqgIegSRcn19oeAQavHHw9HeyJZugRi3/4ASTY=")) {
                    this.l = 2;
                    return;
                }
            } catch (IOException e2) {
                e2.printStackTrace();
            } catch (NoSuchAlgorithmException e3) {
                e3.printStackTrace();
            }
            this.l = 1;
        }
    }

    private synchronized void a(int i2) {
        if (this.f && i2 >= this.e) {
            this.f = false;
        }
    }

    /* access modifiers changed from: private */
    public void a(PlayState playState, PlayState playState2) {
        if (this.d != playState2) {
            this.d = playState2;
            if (this.b != null) {
                this.b.a(playState, playState2);
            }
            if (playState2 == PlayState.IDLE) {
                this.a.l();
            }
            if (playState != null && playState != PlayState.NONE) {
                switch (playState2) {
                    case RUN:
                    case RECORD:
                        this.a.b(ErrorCode.NONE);
                        break;
                    default:
                        this.a.c(ErrorCode.NONE);
                        break;
                }
            }
        }
    }

    private void b() {
        if (this.l != 2) {
            this.i.a(-65281, 0.0f, 0.0f, this.i.a(), this.i.b());
            return;
        }
        if (true == this.k) {
            String language = com.nexstreaming.kminternal.kinemaster.config.a.a().b().getResources().getConfiguration().locale.getLanguage();
            if (n == null || language != o) {
                o = language;
                new Options().inScaled = false;
                try {
                    InputStream open = com.nexstreaming.kminternal.kinemaster.config.a.a().b().getAssets().open(EditorGlobal.b());
                    n = BitmapFactory.decodeStream(open);
                    open.close();
                } catch (IOException e2) {
                    e2.printStackTrace();
                }
            }
            if (n != null) {
                float b2 = this.i.b() / 1080.0f;
                float a2 = this.i.a() * 0.96484375f;
                float b3 = this.i.b() * 0.048611112f;
                this.i.a(n, a2 - (((float) n.getWidth()) * b2), b3, a2, b3 + (((float) n.getHeight()) * b2));
                return;
            }
        }
        return;
    }

    public int callbackCapture(int i2, int i3, int i4, byte[] bArr) {
        Handler handler = this.c;
        final int i5 = i2;
        final int i6 = i3;
        final int i7 = i4;
        final byte[] bArr2 = bArr;
        AnonymousClass1 r1 = new Runnable() {
            public void run() {
                if (NexEditorEventListener.this.a != null) {
                    NexEditorEventListener.this.a.a(i5, i6, i7, bArr2, true);
                }
            }
        };
        handler.post(r1);
        return 0;
    }

    public int callbackCheckImageWorkDone() {
        return this.m.size();
    }

    public AudioManager callbackGetAudioManager() {
        StringBuilder sb = new StringBuilder();
        sb.append("callbackGetAudioManager ");
        sb.append(this.g);
        Log.d("NexEditorEventHandler", sb.toString());
        return this.g;
    }

    public AudioTrack callbackGetAudioTrack(int i2, int i3) {
        Log.d("NexEditorEventHandler", String.format("callbackGetAudioTrack(SampleRate(%d) Channel(%d)", new Object[]{Integer.valueOf(i2), Integer.valueOf(i3)}));
        if (this.mAudioTrack != null) {
            this.mAudioTrack.release();
        }
        int i4 = i3 != 1 ? 3 : 2;
        AudioTrack audioTrack = new AudioTrack(3, i2, i4, 2, AudioTrack.getMinBufferSize(i2, i4, 2), 1);
        this.mAudioTrack = audioTrack;
        return this.mAudioTrack;
    }

    public NexImage callbackGetImageUsingFile(String str, int i2) {
        return this.mImage.openFile(str, i2);
    }

    public NexImage callbackGetImageUsingText(String str) {
        return this.mImage.openFile(str, 0);
    }

    public byte[] callbackGetThemeFile(String str) {
        String str2;
        if (str.contains(".force_effect/")) {
            str = str.replace(".force_effect/", "/");
        }
        int indexOf = str.indexOf(47);
        if (indexOf >= 0) {
            String substring = str.substring(0, indexOf);
            str2 = str.substring(indexOf + 1);
            str = substring;
        } else {
            str2 = "";
        }
        return this.mImage.callbackReadAssetItemFile(str, str2);
    }

    public NexImage callbackGetThemeImage(String str, int i2) {
        if (i2 != 1 && i2 != 3) {
            return this.mImage.openThemeImage(str);
        }
        if (i2 == 3) {
            Iterator it = this.m.iterator();
            while (it.hasNext()) {
                ((a) it.next()).cancel(false);
            }
            this.m.clear();
            Log.d("NexEditorEventHandler", String.format("CLEAR:image thread queue length:%d", new Object[]{Integer.valueOf(this.m.size())}));
        }
        a aVar = new a();
        aVar.a(str);
        this.m.add(aVar);
        Log.d("NexEditorEventHandler", String.format("NEW:image thread queue length:%d asyncmode:%d", new Object[]{Integer.valueOf(this.m.size()), Integer.valueOf(i2)}));
        aVar.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new String[]{str});
        return null;
    }

    public NexImage callbackGetThemeImageUsingResource(String str) {
        return this.mImage.openFile(str, 0);
    }

    public int callbackHighLightIndex(final int i2, final int[] iArr) {
        StringBuilder sb = new StringBuilder();
        sb.append("callbackHighLightIndex start iCount=");
        sb.append(i2);
        Log.d("NexEditorEventHandler", sb.toString());
        this.c.post(new Runnable() {
            public void run() {
                if (NexEditorEventListener.this.a != null) {
                    NexEditorEventListener.this.a.a(i2, iArr);
                }
            }
        });
        Log.d("NexEditorEventHandler", "callbackHighLightIndex end");
        return 0;
    }

    public int callbackHighLightIndexForVAS(final int i2, final int[] iArr, final int[] iArr2) {
        StringBuilder sb = new StringBuilder();
        sb.append("callbackHighLightIndexForVAS start iCount=");
        sb.append(i2);
        Log.d("NexEditorEventHandler", sb.toString());
        this.c.post(new Runnable() {
            public void run() {
                if (NexEditorEventListener.this.a != null) {
                    NexEditorEventListener.this.a.a(i2, iArr, iArr2);
                }
            }
        });
        Log.d("NexEditorEventHandler", "callbackHighLightIndexForVAS end");
        return 0;
    }

    public int callbackPrepareCustomLayer(int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9, int i10, int i11, int i12, int i13, int i14, int i15, int i16, int i17, int i18, int i19) {
        int i20 = i18;
        int i21 = i19;
        if (this.h == null) {
            return 1;
        }
        this.i.d((i17 & 1) != 0);
        int a2 = NexEditor.a();
        int b2 = NexEditor.b();
        if (NexEditor.c() == 0) {
            if (i20 > i21) {
                a2 = Math.round((((float) i20) * 720.0f) / ((float) i21));
                b2 = 720;
            } else {
                b2 = Math.round((((float) i21) * 720.0f) / ((float) i20));
                a2 = 720;
            }
        }
        int d2 = this.a.d();
        NexEditor nexEditor = this.a;
        if (d2 == 1) {
            a2 *= 2;
        }
        this.i.a(a2, b2);
        this.i.b(i20, i21);
        int i22 = i3;
        this.i.a(i3);
        this.i.m();
        this.h.a(this.i);
        b();
        this.i.n();
        return 0;
    }

    public void callbackReleaseAudioTrack() {
        Log.d("NexEditorEventHandler", String.format("callbackReleaseAudioTrack", new Object[0]));
        if (this.mAudioTrack != null) {
            this.mAudioTrack.release();
            this.mAudioTrack = null;
        }
    }

    public void callbackReleaseImage() {
    }

    public int callbackThumb(int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9, byte[] bArr) {
        StringBuilder sb = new StringBuilder();
        sb.append("callbackThumb start iMode=");
        sb.append(i2);
        sb.append(", iTime=");
        final int i10 = i4;
        sb.append(i10);
        sb.append(", iWidth=");
        final int i11 = i5;
        sb.append(i11);
        sb.append(", iHeight=");
        final int i12 = i6;
        sb.append(i12);
        sb.append(", iSize=");
        final int i13 = i9;
        sb.append(i13);
        sb.append(", tag=");
        final int i14 = i3;
        sb.append(i14);
        Log.d("NexEditorEventHandler", sb.toString());
        Handler handler = this.c;
        final int i15 = i2;
        final byte[] bArr2 = bArr;
        final int i16 = i7;
        final int i17 = i8;
        AnonymousClass12 r3 = new Runnable() {
            public void run() {
                if (NexEditorEventListener.this.a != null) {
                    NexEditorEventListener.this.a.a(i15, i10, i11, i12, i13, bArr2, i16, i17, i14);
                }
            }
        };
        handler.post(r3);
        Log.d("NexEditorEventHandler", "salabara callbackThumb end");
        return 0;
    }

    public String getAssetResourceKey(String str) {
        String substring = str.substring("[ThemeImage]".length());
        String str2 = "16v9";
        int indexOf = substring.indexOf(47);
        if (indexOf < 0) {
            return str;
        }
        String substring2 = substring.substring(0, indexOf);
        String substring3 = substring.substring(indexOf + 1);
        f c2 = com.nexstreaming.app.common.nexasset.assetpackage.c.a(com.nexstreaming.kminternal.kinemaster.config.a.a().b()).c(substring2);
        if (c2 == null) {
            return str;
        }
        if (substring2.contains("9v16")) {
            str2 = "9v16";
        } else if (substring2.contains("2v1")) {
            str2 = "2v1";
        } else if (substring2.contains("1v2")) {
            str2 = "1v2";
        } else if (substring2.contains("1v1")) {
            str2 = "1v1";
        } else if (substring2.contains("4v3")) {
            str2 = "4v3";
        } else if (substring2.contains("3v4")) {
            str2 = "3v4";
        }
        StringBuilder sb = new StringBuilder();
        sb.append("[ThemeImage]");
        sb.append(c2.getAssetPackage().getAssetId());
        sb.append("/");
        sb.append(str2);
        sb.append("/");
        sb.append(substring3);
        return sb.toString();
    }

    public int getLutTextWithID(int i2, int i3) {
        if (this.a == null) {
            Log.d("NexEditorEventHandler", "getLutTextWithID() engine is null");
            return 0;
        }
        b c2 = b.c();
        if (c2 == null) {
            Log.d("NexEditorEventHandler", "getLutTextWithID() getLookUpTable is null");
            return 0;
        }
        C0005b a2 = c2.a(i2);
        if (a2 != null) {
            return this.i.a(a2.b(), i3);
        }
        Log.d("NexEditorEventHandler", "getLutTextWithID() lut is null");
        return 0;
    }

    public int getVignetteTexID(int i2) {
        b c2 = b.c();
        if (c2 == null) {
            Log.d("NexEditorEventHandler", "getVignetteTexID() getLookUpTable is null");
            return 0;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("getVignetteTexID() call... export_flag=");
        sb.append(i2);
        Log.d("NexEditorEventHandler", sb.toString());
        return this.i.a(c2.g(), i2);
    }

    public synchronized void ignoreEventsUntilTag(int i2) {
        if (!this.f) {
            this.f = true;
            this.e = i2;
        } else if (this.e < i2) {
            this.e = i2;
        }
    }

    public int notifyError(int i2, int i3, int i4, int i5) {
        Log.i("NexEditorEventHandler", String.format("[nexEditorEventHandler.java] event(%d) Param(%d %d) ", new Object[]{Integer.valueOf(i2), Integer.valueOf(i4), Integer.valueOf(i5)}));
        return 0;
    }

    public int notifyEvent(int i2, final int i3, final int i4, final int i5, int i6) {
        if (i2 == 18) {
            StringBuilder sb = new StringBuilder();
            sb.append("REACHED MARKER ");
            sb.append(i3);
            Log.d("NexEditorEventHandler", sb.toString());
            a(i3);
            this.c.post(new Runnable() {
                public void run() {
                    if (NexEditorEventListener.this.a != null) {
                        NexEditorEventListener.this.a.b(ErrorCode.NONE, i3);
                    }
                }
            });
        }
        if (this.f) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("IGNORING EVENT iEventType=");
            sb2.append(i2);
            sb2.append(" (awaiting tag ");
            sb2.append(this.e);
            sb2.append(")");
            Log.d("NexEditorEventHandler", sb2.toString());
            return 0;
        }
        switch (i2) {
            case 0:
                if (!this.j) {
                    this.c.post(new Runnable() {
                        public void run() {
                            PlayState fromValue = PlayState.fromValue(i3);
                            PlayState fromValue2 = PlayState.fromValue(i4);
                            if (fromValue2 == PlayState.RESUME) {
                                fromValue2 = PlayState.RECORD;
                            }
                            NexEditorEventListener.this.a(fromValue, fromValue2);
                        }
                    });
                    break;
                } else {
                    PlayState fromValue = PlayState.fromValue(i3);
                    PlayState fromValue2 = PlayState.fromValue(i4);
                    if (fromValue2 == PlayState.RESUME) {
                        fromValue2 = PlayState.RECORD;
                    }
                    a(fromValue, fromValue2);
                    break;
                }
            case 1:
                this.c.post(new Runnable() {
                    public void run() {
                        if (NexEditorEventListener.this.a == null || !NexEditorEventListener.this.a.e(i3)) {
                            if (NexEditorEventListener.this.b != null) {
                                NexEditorEventListener.this.b.a(i3);
                            }
                            if (NexEditorEventListener.this.a != null) {
                                NexEditorEventListener.this.a.k(i3);
                            }
                        }
                    }
                });
                break;
            case 5:
                Handler handler = this.c;
                final int i7 = i3;
                final int i8 = i4;
                final int i9 = i5;
                final int i10 = i6;
                AnonymousClass34 r2 = new Runnable() {
                    public void run() {
                        if (NexEditorEventListener.this.a != null) {
                            NexEditorEventListener.this.a.a(i7, i8, i9, i10);
                        }
                    }
                };
                handler.post(r2);
                break;
            case 6:
                this.c.post(new Runnable() {
                    public void run() {
                        if (NexEditorEventListener.this.a != null) {
                            NexEditorEventListener.this.a.a(i3, i4);
                        }
                    }
                });
                break;
            case 7:
                this.c.post(new Runnable() {
                    public void run() {
                        if (NexEditorEventListener.this.a != null) {
                            NexEditorEventListener.this.a.f(i3);
                        }
                    }
                });
                break;
            case 8:
                break;
            case 10:
                Handler handler2 = this.c;
                final int i11 = i4;
                final int i12 = i5;
                final int i13 = i6;
                final int i14 = i3;
                AnonymousClass5 r22 = new Runnable() {
                    public void run() {
                        if (NexEditorEventListener.this.a != null) {
                            if (i11 == 1) {
                                NexEditorEventListener.this.a.v();
                            } else {
                                NexEditorEventListener.this.a.d(i12, i13);
                            }
                        }
                        if (NexEditorEventListener.this.b == null) {
                            return;
                        }
                        if (i11 == 1) {
                            NexEditorEventListener.this.b.a();
                        } else if (i14 != 0) {
                            NexEditorEventListener.this.b.a(ErrorCode.fromValue(i14));
                        } else {
                            NexEditorEventListener.this.b.b(i12);
                        }
                    }
                };
                handler2.post(r22);
                break;
            case 11:
                this.c.post(new Runnable() {
                    public void run() {
                        NexEditorEventListener.this.a.s();
                        if (NexEditorEventListener.this.a != null) {
                            NexEditorEventListener.this.a.b(ErrorCode.fromValue(i3));
                        }
                        if (NexEditorEventListener.this.b != null) {
                            NexEditorEventListener.this.b.a(ErrorCode.fromValue(i3), i4);
                        }
                    }
                });
                break;
            case 13:
                this.c.post(new Runnable() {
                    public void run() {
                        if (NexEditorEventListener.this.a == null || !NexEditorEventListener.this.a.o()) {
                            if (NexEditorEventListener.this.b != null) {
                                NexEditorEventListener.this.b.b(ErrorCode.NONE);
                            }
                            if (NexEditorEventListener.this.a != null) {
                                NexEditorEventListener.this.a.d(ErrorCode.NONE);
                            }
                            NexEditorEventListener.this.a(NexEditorEventListener.this.d, PlayState.IDLE);
                            return;
                        }
                        NexEditorEventListener.this.a(NexEditorEventListener.this.d, PlayState.IDLE);
                    }
                });
                break;
            case 14:
                this.c.post(new Runnable() {
                    public void run() {
                        if (NexEditorEventListener.this.a == null || !NexEditorEventListener.this.a.f(ErrorCode.fromValue(i3))) {
                            if (NexEditorEventListener.this.b != null) {
                                NexEditorEventListener.this.b.b(ErrorCode.fromValue(i3));
                            }
                            if (NexEditorEventListener.this.a != null) {
                                NexEditorEventListener.this.a.d(ErrorCode.fromValue(i3));
                            }
                            NexEditorEventListener.this.a(NexEditorEventListener.this.d, PlayState.IDLE);
                            return;
                        }
                        NexEditorEventListener.this.a(NexEditorEventListener.this.d, PlayState.IDLE);
                    }
                });
                break;
            case 17:
                this.c.post(new Runnable() {
                    public void run() {
                        if (NexEditorEventListener.this.b != null) {
                            NexEditorEventListener.this.b.b();
                        }
                        NexEditorEventListener.this.a(NexEditorEventListener.this.d, PlayState.IDLE);
                    }
                });
                break;
            case 19:
                Log.i("NexEditorEventHandler", String.format("[nexEditorEventHandler.java] VIDEO_STARTED ", new Object[0]));
                this.c.post(new Runnable() {
                    public void run() {
                        if (NexEditorEventListener.this.a != null) {
                            NexEditorEventListener.this.a.n();
                        }
                        if (NexEditorEventListener.this.b != null) {
                            NexEditorEventListener.this.b.c();
                        }
                    }
                });
                break;
            case 20:
                this.c.post(new Runnable() {
                    public void run() {
                        StringBuilder sb = new StringBuilder();
                        sb.append("VIDEOEDITOR_EVENT_GETCLIPINFO_DONE delivery p1=");
                        sb.append(i3);
                        sb.append(" p2=");
                        sb.append(i4);
                        Log.d("NexEditorEventHandler", sb.toString());
                        if (NexEditorEventListener.this.a != null) {
                            Log.d("NexEditorEventHandler", "VIDEOEDITOR_EVENT_GETCLIPINFO_DONE deliver to editor");
                            NexEditorEventListener.this.a.c(ErrorCode.fromValue(i3), i4);
                        }
                        if (NexEditorEventListener.this.b != null) {
                            Log.d("NexEditorEventHandler", "VIDEOEDITOR_EVENT_GETCLIPINFO_DONE deliver to UI listener");
                            NexEditorEventListener.this.b.d();
                        }
                    }
                });
                StringBuilder sb3 = new StringBuilder();
                sb3.append("[nexEditorEventHandler.java] VIDEOEDITOR_EVENT_GETCLIPINFO_DONE p1=");
                sb3.append(i3);
                Log.i("NexEditorEventHandler", String.format(sb3.toString(), new Object[0]));
                break;
            case 21:
                StringBuilder sb4 = new StringBuilder();
                sb4.append("[nexEditorEventHandler.java] VIDEOEDITOR_EVENT_CAPTURE_DONE p1=");
                sb4.append(i3);
                Log.i("NexEditorEventHandler", String.format(sb4.toString(), new Object[0]));
                this.c.post(new Runnable() {
                    public void run() {
                        if (NexEditorEventListener.this.a != null) {
                            NexEditorEventListener.this.a.e(ErrorCode.fromValue(i3));
                        }
                    }
                });
                break;
            case 22:
                StringBuilder sb5 = new StringBuilder();
                sb5.append("[nexEditorEventHandler.java] VIDEOEDITOR_EVENT_PREPARE_CLIP_LOADING p1=");
                sb5.append(i3);
                Log.i("NexEditorEventHandler", String.format(sb5.toString(), new Object[0]));
                break;
            case 23:
                StringBuilder sb6 = new StringBuilder();
                sb6.append("VIDEOEDITOR_EVENT_TRANSCODING_DONE delivery p1=");
                sb6.append(i3);
                sb6.append(" p2=");
                sb6.append(i4);
                Log.d("NexEditorEventHandler", sb6.toString());
                this.c.post(new Runnable() {
                    public void run() {
                        if (NexEditorEventListener.this.a != null) {
                            NexEditorEventListener.this.a.a(ErrorCode.fromValue(i3), i4);
                        }
                    }
                });
                break;
            case 24:
                this.c.post(new Runnable() {
                    public void run() {
                        if (NexEditorEventListener.this.a != null) {
                            NexEditorEventListener.this.a.b(i3, i4, i5);
                        }
                    }
                });
                break;
            case 26:
                Log.d("NexEditorEventHandler", "VIDEOEDITOR_EVENT_FAST_OPTION_PREVIEW_DONE");
                this.c.post(new Runnable() {
                    public void run() {
                        if (NexEditorEventListener.this.a != null) {
                            NexEditorEventListener.this.a.a(ErrorCode.fromValue(i3));
                        }
                    }
                });
                break;
            case 27:
                StringBuilder sb7 = new StringBuilder();
                sb7.append("[nexEditorEventHandler.java] VIDEOEDITOR_EVENT_MAKE_HIGHLIGHT_DONE errcode=");
                sb7.append(i3);
                Log.i("NexEditorEventHandler", sb7.toString());
                this.c.post(new Runnable() {
                    public void run() {
                        if (NexEditorEventListener.this.a != null) {
                            NexEditorEventListener.this.a.c(i3);
                        }
                    }
                });
                break;
            case 28:
                StringBuilder sb8 = new StringBuilder();
                sb8.append("[nexEditorEventHandler.java] VIDEOEDITOR_EVENT_MAKE_HIGHLIGHT_PROGRESS_INDEX=");
                sb8.append(i3);
                sb8.append(", p2=");
                sb8.append(i4);
                Log.i("NexEditorEventHandler", sb8.toString());
                this.c.post(new Runnable() {
                    public void run() {
                        if (NexEditorEventListener.this.b != null) {
                            NexEditorEventListener.this.b.a(i3, i4);
                        }
                    }
                });
                break;
            case 30:
                StringBuilder sb9 = new StringBuilder();
                sb9.append("[nexEditorEventHandler.java] VIDEOEDITOR_EVENT_CHECK_DIRECT_EXPORT p1=");
                sb9.append(i3);
                Log.i("NexEditorEventHandler", sb9.toString());
                this.c.post(new Runnable() {
                    public void run() {
                        if (NexEditorEventListener.this.b != null) {
                            NexEditorEventListener.this.b.b(ErrorCode.fromValue(i3), i4);
                        }
                    }
                });
                break;
            case 31:
                StringBuilder sb10 = new StringBuilder();
                sb10.append("[nexEditorEventHandler.java] VIDEOEDITOR_EVENT_DIRECT_EXPORT_DONE p1=");
                sb10.append(i3);
                Log.i("NexEditorEventHandler", sb10.toString());
                this.c.post(new Runnable() {
                    public void run() {
                        if (NexEditorEventListener.this.b != null) {
                            NexEditorEventListener.this.b.b(ErrorCode.fromValue(i3));
                        }
                        if (NexEditorEventListener.this.a != null) {
                            NexEditorEventListener.this.a.d(ErrorCode.fromValue(i3));
                        }
                        NexEditorEventListener.this.a(NexEditorEventListener.this.d, PlayState.IDLE);
                    }
                });
                break;
            case 32:
                StringBuilder sb11 = new StringBuilder();
                sb11.append("[nexEditorEventHandler.java] VIDEOEDITOR_EVENT_DIRECT_EXPORT_PROGRESS=");
                sb11.append(i3);
                Log.i("NexEditorEventHandler", sb11.toString());
                break;
            case 33:
                this.c.post(new Runnable() {
                    public void run() {
                        if (NexEditorEventListener.this.a != null) {
                            StringBuilder sb = new StringBuilder();
                            sb.append("VIDEOEDITOR_EVENT_GETCLIPINFO_STOP_DONE deliver to editor p1=");
                            sb.append(i3);
                            sb.append(", p2=");
                            sb.append(i4);
                            Log.d("NexEditorEventHandler", sb.toString());
                            NexEditorEventListener.this.a.c(ErrorCode.GETCLIPINFO_USER_CANCEL, i4);
                        }
                        if (NexEditorEventListener.this.b != null) {
                            Log.d("NexEditorEventHandler", "VIDEOEDITOR_EVENT_GETCLIPINFO_STOP_DONE deliver to UI listener");
                            NexEditorEventListener.this.b.d();
                        }
                    }
                });
                StringBuilder sb12 = new StringBuilder();
                sb12.append("[nexEditorEventHandler.java] VIDEOEDITOR_EVENT_GETCLIPINFO_STOP_DONE p1=");
                sb12.append(i3);
                Log.i("NexEditorEventHandler", String.format(sb12.toString(), new Object[0]));
                break;
            case 35:
                StringBuilder sb13 = new StringBuilder();
                sb13.append("[nexEditorEventHandler.java] VIDEOEDITOR_EVENT_FAST_PREVIEW_START_DONE p1= ");
                sb13.append(i3);
                sb13.append(", p2= ");
                sb13.append(i4);
                sb13.append(", p3: ");
                sb13.append(i5);
                Log.i("NexEditorEventHandler", sb13.toString());
                this.c.post(new Runnable() {
                    public void run() {
                        if (NexEditorEventListener.this.b != null) {
                            NexEditorEventListener.this.b.a(ErrorCode.fromValue(i3), i4, i5);
                        }
                    }
                });
                break;
            case 36:
                StringBuilder sb14 = new StringBuilder();
                sb14.append("[nexEditorEventHandler.java] VIDEOEDITOR_EVENT_FAST_PREVIEW_STOP_DONE p1= ");
                sb14.append(i3);
                Log.i("NexEditorEventHandler", sb14.toString());
                this.c.post(new Runnable() {
                    public void run() {
                        if (NexEditorEventListener.this.b != null) {
                            NexEditorEventListener.this.b.d(ErrorCode.fromValue(i3));
                        }
                    }
                });
                break;
            case 37:
                StringBuilder sb15 = new StringBuilder();
                sb15.append("[nexEditorEventHandler.java] VIDEOEDITOR_EVENT_FAST_PREVIEW_TIME_DONE p1= ");
                sb15.append(i3);
                Log.i("NexEditorEventHandler", sb15.toString());
                this.c.post(new Runnable() {
                    public void run() {
                        if (NexEditorEventListener.this.b != null) {
                            NexEditorEventListener.this.b.e(ErrorCode.fromValue(i3));
                        }
                    }
                });
                break;
            case 38:
                StringBuilder sb16 = new StringBuilder();
                sb16.append("[nexEditorEventHandler.java] VIDEOEDITOR_EVENT_HIGHLIGHT_THUMBNAIL_PROGRESS=");
                sb16.append(i3);
                sb16.append(", p2=");
                sb16.append(i4);
                Log.i("NexEditorEventHandler", sb16.toString());
                this.c.post(new Runnable() {
                    public void run() {
                        if (NexEditorEventListener.this.b != null) {
                            NexEditorEventListener.this.b.a(i3, i4);
                        }
                    }
                });
                break;
            case 39:
                StringBuilder sb17 = new StringBuilder();
                sb17.append("[nexEditorEventHandler.java] VIDEOEDITOR_EVENT_MAKE_REVERSE_DONE p1= ");
                sb17.append(i3);
                sb17.append(", p2= ");
                sb17.append(i4);
                Log.i("NexEditorEventHandler", sb17.toString());
                this.c.post(new Runnable() {
                    public void run() {
                        if (NexEditorEventListener.this.b != null && NexEditorEventListener.this.b != null) {
                            NexEditorEventListener.this.b.c(ErrorCode.fromValue(i3));
                        }
                    }
                });
                break;
            case 40:
                StringBuilder sb18 = new StringBuilder();
                sb18.append("[nexEditorEventHandler.java] VIDEOEDITOR_EVENT_MAKE_REVERSE_PROGRESS p1= ");
                sb18.append(i3);
                sb18.append(", p2= ");
                sb18.append(i4);
                sb18.append(", p3: ");
                sb18.append(i5);
                Log.i("NexEditorEventHandler", sb18.toString());
                this.c.post(new Runnable() {
                    public void run() {
                        if (NexEditorEventListener.this.b != null) {
                            NexEditorEventListener.this.b.b(i3, 100);
                        }
                    }
                });
                break;
            case 41:
                StringBuilder sb19 = new StringBuilder();
                sb19.append("[nexEditorEventHandler.java] VIDEOEDITOR_EVENT_MAKE_VAS_HIGHLIGHT_DONE errcode=");
                sb19.append(i3);
                Log.i("NexEditorEventHandler", sb19.toString());
                this.c.post(new Runnable() {
                    public void run() {
                        if (NexEditorEventListener.this.a != null) {
                            NexEditorEventListener.this.a.d(i3);
                        }
                    }
                });
                break;
            case 51:
                StringBuilder sb20 = new StringBuilder();
                sb20.append("[nexEditorEventHandler.java] VIDEOEDITOR_EVENT_PREVIEW_PEAKMETER cts=");
                sb20.append(i3);
                sb20.append(", value=");
                sb20.append(i4);
                Log.i("NexEditorEventHandler", sb20.toString());
                this.c.post(new Runnable() {
                    public void run() {
                        if (NexEditorEventListener.this.b != null) {
                            NexEditorEventListener.this.b.c(i3, i4);
                        }
                    }
                });
                break;
            default:
                Log.i("NexEditorEventHandler", String.format("[nexEditorEventHandler.java] not implement event(%d) Param(%d %d %d %d) ", new Object[]{Integer.valueOf(i2), Integer.valueOf(i3), Integer.valueOf(i4), Integer.valueOf(i5), Integer.valueOf(i6)}));
                break;
        }
        return 0;
    }

    public void setContext(Context context) {
        this.mImage.setResources(context == null ? null : context.getApplicationContext().getResources());
        if (context != null) {
            this.g = (AudioManager) context.getApplicationContext().getSystemService("audio");
        } else {
            this.g = null;
        }
    }

    public void setCustomRenderCallback(c cVar) {
        this.h = cVar;
    }

    public void setSyncMode(boolean z) {
        this.j = z;
    }

    public void setUIListener(c cVar) {
        this.b = cVar;
        if (this.d != null) {
            this.b.a(PlayState.NONE, this.d);
        }
    }

    public void setWatermark(boolean z) {
        a();
        this.k = z;
    }
}
