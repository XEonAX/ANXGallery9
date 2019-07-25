package com.nexstreaming.kminternal.kinemaster.codeccolorformat;

import android.content.Context;
import android.content.SharedPreferences;
import android.media.MediaFormat;
import android.os.AsyncTask;
import android.preference.PreferenceManager;
import android.util.Log;
import com.nexstreaming.app.common.task.ResultTask;
import com.nexstreaming.app.common.task.Task;
import com.nexstreaming.app.common.task.Task.TaskError;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.Vector;

public class ColorFormatChecker {
    /* access modifiers changed from: private */
    public static ResultTask<ColorFormat> a;
    private c b;
    private b c;
    /* access modifiers changed from: private */
    public boolean d;
    /* access modifiers changed from: private */
    public boolean e;
    /* access modifiers changed from: private */
    public MediaFormat f;
    /* access modifiers changed from: private */
    public Vector<byte[]> g;
    /* access modifiers changed from: private */
    public Vector<byte[]> h;

    public enum ColorFormat {
        UNKNOWN,
        NV12,
        NV21
    }

    private ColorFormatChecker() {
        this.d = false;
        this.e = false;
    }

    public static ResultTask<ColorFormat> a(Context context) {
        ColorFormat[] values;
        if (a == null) {
            a = new ResultTask<>();
            final SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(context);
            if (defaultSharedPreferences.contains("km_detected_codec_color_format")) {
                String string = defaultSharedPreferences.getString("km_detected_codec_color_format", null);
                for (ColorFormat colorFormat : ColorFormat.values()) {
                    if (colorFormat.name().equals(string)) {
                        a.setResult(colorFormat);
                        return a;
                    }
                }
            }
            new AsyncTask<Void, Void, ColorFormat>() {
                TaskError a = null;

                /* access modifiers changed from: protected */
                /* renamed from: a */
                public ColorFormat doInBackground(Void... voidArr) {
                    try {
                        return new ColorFormatChecker().b();
                    } catch (Exception e) {
                        this.a = Task.makeTaskError("Error getting color format", e);
                        return null;
                    }
                }

                /* access modifiers changed from: protected */
                /* renamed from: a */
                public void onPostExecute(ColorFormat colorFormat) {
                    if (colorFormat != null) {
                        defaultSharedPreferences.edit().putString("km_detected_codec_color_format", colorFormat.name()).commit();
                        ColorFormatChecker.a.sendResult(colorFormat);
                    } else {
                        ColorFormatChecker.a.sendFailure(this.a);
                    }
                    super.onPostExecute(colorFormat);
                }
            }.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[]{null});
        }
        return a;
    }

    /* access modifiers changed from: private */
    public ColorFormat b() throws IOException {
        ColorFormat colorFormat = ColorFormat.UNKNOWN;
        this.g = new Vector<>();
        this.h = new Vector<>();
        this.b = new c(1280, 720);
        this.b.a(new d() {
            public boolean a(int i) {
                StringBuilder sb = new StringBuilder();
                sb.append("Receive flag from Encoder : ");
                sb.append(a.a(i));
                Log.d("ColorFormatChecker", sb.toString());
                if (i == 4) {
                    ColorFormatChecker.this.d = true;
                }
                return true;
            }

            public boolean a(int i, long j) {
                return true;
            }

            public boolean a(byte[] bArr, int i, int i2, long j) {
                ColorFormatChecker.this.g.add(bArr);
                Log.d("ColorFormatChecker", String.format("Encoder One Frame Received(Type:%d, Length:%d, Time:%d)", new Object[]{Integer.valueOf(i), Integer.valueOf(i2), Long.valueOf(j)}));
                return true;
            }

            public boolean a(byte[] bArr, byte[] bArr2) {
                if (ColorFormatChecker.this.f == null) {
                    ColorFormatChecker.this.f = MediaFormat.createVideoFormat("video/avc", 1280, 720);
                }
                ByteBuffer wrap = ByteBuffer.wrap(bArr);
                ByteBuffer wrap2 = ByteBuffer.wrap(bArr2);
                ColorFormatChecker.this.f.setByteBuffer("csd-0", wrap);
                ColorFormatChecker.this.f.setByteBuffer("csd-1", wrap2);
                Log.d("ColorFormatChecker", String.format("Encoder Frame config Received", new Object[0]));
                return true;
            }
        });
        byte[] bArr = new byte[1382400];
        Arrays.fill(bArr, 0, 921600, 45);
        for (int i = 0; i < 460800; i += 2) {
            int i2 = i + 921600;
            bArr[i2] = -44;
            bArr[i2 + 1] = -127;
        }
        long j = 0;
        long j2 = 0;
        for (int i3 = 0; i3 < 5; i3++) {
            this.b.a(bArr, j2);
            j2 += 30000;
        }
        while (!this.d) {
            this.b.a(null, j2);
        }
        try {
            this.b.a();
            this.b = null;
        } catch (IOException e2) {
            e2.printStackTrace();
        }
        if (this.f == null) {
            return colorFormat;
        }
        this.c = new b(this.f, null);
        this.c.a(new d() {
            public boolean a(int i) {
                StringBuilder sb = new StringBuilder();
                sb.append("Receive flag from Decoder : ");
                sb.append(a.a(i));
                Log.d("ColorFormatChecker", sb.toString());
                if (i == 4) {
                    ColorFormatChecker.this.e = true;
                    Log.d("ColorFormatChecker", "Decoder EOS received");
                }
                return true;
            }

            public boolean a(int i, long j) {
                return true;
            }

            public boolean a(byte[] bArr, int i, int i2, long j) {
                if (ColorFormatChecker.this.h.size() <= 0) {
                    ColorFormatChecker.this.h.add(bArr);
                }
                Log.d("ColorFormatChecker", String.format("Decoder One Frame Received(Type:%d, Length:%d, Time:%d)", new Object[]{Integer.valueOf(i), Integer.valueOf(i2), Long.valueOf(j)}));
                return true;
            }

            public boolean a(byte[] bArr, byte[] bArr2) {
                return true;
            }
        });
        while (this.g.size() > 0) {
            byte[] bArr2 = (byte[]) this.g.get(0);
            if (bArr2 != null) {
                this.c.a(bArr2, j);
                this.g.remove(0);
                j += 30000;
            }
        }
        while (!this.e) {
            this.c.a((ByteBuffer) null, j);
        }
        try {
            this.c.a();
        } catch (IOException e3) {
            e3.printStackTrace();
        }
        if (this.h.size() <= 0) {
            return colorFormat;
        }
        int c2 = this.c.c();
        int d2 = this.c.d();
        byte[] bArr3 = (byte[]) this.h.get(0);
        if (bArr3 == null) {
            return colorFormat;
        }
        int i4 = c2 * d2;
        return (((Math.abs(bArr[921600] - bArr3[i4]) + Math.abs(bArr[921601] - bArr3[i4 + 1])) + Math.abs(bArr[921602] - bArr3[i4 + 2])) + Math.abs(bArr[921603] - bArr3[i4 + 3])) / 4 > 10 ? ColorFormat.NV21 : ColorFormat.NV12;
    }
}
