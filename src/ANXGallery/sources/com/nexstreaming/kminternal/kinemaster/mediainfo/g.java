package com.nexstreaming.kminternal.kinemaster.mediainfo;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.util.Log;
import com.nexstreaming.app.common.task.Task;
import com.nexstreaming.app.common.task.Task.TaskError;
import java.io.DataInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;

/* compiled from: ThumbnailParser */
class g {

    /* compiled from: ThumbnailParser */
    static class a implements Comparator<b> {
        a() {
        }

        /* renamed from: a */
        public int compare(b bVar, b bVar2) {
            if (bVar.a() < bVar2.a()) {
                return -1;
            }
            return bVar.a() > bVar2.a() ? 1 : 0;
        }
    }

    /* compiled from: ThumbnailParser */
    public static class b {
        private int a;
        private int b;
        private long c;

        b(int i, int i2, long j) {
            this.a = i;
            this.b = i2;
            this.c = j;
        }

        public int a() {
            return this.a;
        }

        public long b() {
            return this.c;
        }
    }

    private static int a(int i) {
        return ((i & 255) << 24) | ((-16777216 & i) >>> 24) | ((16711680 & i) >>> 8) | ((65280 & i) << 8);
    }

    static TaskError a(File file, int i, c cVar) {
        if (!file.exists()) {
            return ThumbnailError.RawFileNotFound;
        }
        long length = file.length();
        if (length < 8) {
            return ThumbnailError.RawFileTooSmall;
        }
        try {
            RandomAccessFile randomAccessFile = new RandomAccessFile(file, "r");
            long filePointer = randomAccessFile.getFilePointer();
            int readInt = randomAccessFile.readInt();
            int readInt2 = randomAccessFile.readInt();
            int readInt3 = randomAccessFile.readInt();
            int a2 = a(readInt);
            int a3 = a(readInt2);
            int a4 = a(readInt3);
            int i2 = ((a3 * a4) * a2) / 8;
            int min = (int) Math.min((long) i, (length - 8) / ((long) (i2 + 4)));
            if (min < 1) {
                return ThumbnailError.NoThumbailsFound;
            }
            byte[] bArr = new byte[i2];
            ByteBuffer.wrap(bArr);
            ArrayList arrayList = new ArrayList();
            int i3 = 0;
            int i4 = 0;
            int i5 = 0;
            while (i4 < min) {
                int readInt4 = randomAccessFile.readInt();
                int a5 = a(readInt4);
                if (i5 > a5) {
                    Log.d("ThumbnailParser", "thumbnail needSort");
                }
                arrayList.add(new b(a5, readInt4, randomAccessFile.getFilePointer()));
                randomAccessFile.read(bArr);
                i4++;
                i5 = a5;
            }
            randomAccessFile.seek(filePointer);
            Collections.sort(arrayList, new a());
            Log.d("ThumbnailParser", "Sort thumbnail time stamp");
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                b bVar = (b) it.next();
                randomAccessFile.seek(bVar.b());
                randomAccessFile.read(bArr);
                a(bArr, bVar.a(), a3, a4, a2, i3, min, cVar);
                i3++;
            }
            randomAccessFile.close();
            arrayList.clear();
            return null;
        } catch (IOException e) {
            return Task.makeTaskError((Exception) e);
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:27:0x0099  */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x00ae  */
    /* JADX WARNING: Removed duplicated region for block: B:31:0x00cb  */
    /* JADX WARNING: Removed duplicated region for block: B:33:0x00ce  */
    static ThumbnailError a(InputStream inputStream, long j, int i, c cVar) throws IOException {
        e eVar;
        d dVar;
        int i2;
        boolean z;
        Bitmap bitmap;
        Canvas canvas;
        Bitmap bitmap2;
        int min;
        DataInputStream dataInputStream;
        e eVar2;
        Object obj;
        c cVar2 = cVar;
        if (cVar2 == null) {
            return ThumbnailError.ParameterError;
        }
        DataInputStream dataInputStream2 = new DataInputStream(inputStream);
        int readInt = dataInputStream2.readInt();
        int readInt2 = dataInputStream2.readInt();
        int readInt3 = dataInputStream2.readInt();
        boolean z2 = cVar2 instanceof e;
        if (z2) {
            eVar = (e) cVar2;
            dVar = null;
        } else {
            dVar = (d) cVar2;
            eVar = null;
        }
        if ((readInt2 & -65536) == 0 && (-65536 & readInt3) == 0) {
            i2 = readInt;
            z = false;
        } else {
            int a2 = a(readInt);
            readInt2 = a(readInt2);
            readInt3 = a(readInt3);
            i2 = a2;
            z = true;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("processRawFile: w/h/swap=");
        sb.append(readInt2);
        sb.append("/");
        sb.append(readInt3);
        sb.append("/");
        sb.append(z);
        sb.append(" format=");
        sb.append(i2);
        Log.d("ThumbnailParser", sb.toString());
        if (i2 == 32) {
            if (!z2) {
                bitmap = Bitmap.createBitmap(readInt2, readInt3, Config.ARGB_8888);
                if (z2) {
                    bitmap2 = Bitmap.createBitmap(readInt2, readInt3, bitmap.getConfig());
                    canvas = new Canvas(bitmap2);
                    canvas.scale(1.0f, -1.0f);
                } else {
                    bitmap2 = null;
                    canvas = null;
                }
                int i3 = ((readInt2 * readInt3) * i2) / 8;
                e eVar3 = eVar;
                min = (int) Math.min((long) i, (j - 8) / ((long) (i3 + 4)));
                if (min >= 1) {
                    return ThumbnailError.NoThumbailsFound;
                }
                byte[] bArr = new byte[i3];
                ByteBuffer wrap = ByteBuffer.wrap(bArr);
                StringBuilder sb2 = new StringBuilder();
                sb2.append("processRawFile : thumbCount=");
                sb2.append(min);
                Log.d("ThumbnailParser", sb2.toString());
                int i4 = 0;
                while (i4 < min) {
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("processRawFile : i=");
                    sb3.append(i4);
                    Log.d("ThumbnailParser", sb3.toString());
                    int readInt4 = dataInputStream2.readInt();
                    if (z) {
                        readInt4 = a(readInt4);
                    }
                    StringBuilder sb4 = new StringBuilder();
                    boolean z3 = z;
                    sb4.append("processRawFile : time=");
                    sb4.append(readInt4);
                    Log.d("ThumbnailParser", sb4.toString());
                    if (dataInputStream2.read(bArr) < i3 - 1) {
                        if (z2) {
                            eVar2 = eVar3;
                            obj = null;
                            eVar2.a(null, i4, min, readInt4);
                        } else {
                            eVar2 = eVar3;
                            obj = null;
                            dVar.a(null, i4, min, readInt4);
                        }
                        dataInputStream = dataInputStream2;
                        Object obj2 = obj;
                    } else {
                        eVar2 = eVar3;
                        if (z2) {
                            eVar2.a(bArr, i4, min, readInt4);
                            wrap.rewind();
                            dataInputStream = dataInputStream2;
                        } else {
                            bitmap.copyPixelsFromBuffer(wrap);
                            wrap.rewind();
                            dataInputStream = dataInputStream2;
                            canvas.drawBitmap(bitmap, 0.0f, (float) (-readInt3), null);
                            dVar.a(bitmap2, i4, min, readInt4);
                        }
                    }
                    i4++;
                    eVar3 = eVar2;
                    z = z3;
                    dataInputStream2 = dataInputStream;
                }
                return null;
            }
        } else if (i2 == 16) {
            if (!z2) {
                bitmap = Bitmap.createBitmap(readInt2, readInt3, Config.RGB_565);
                if (z2) {
                }
                int i32 = ((readInt2 * readInt3) * i2) / 8;
                e eVar32 = eVar;
                min = (int) Math.min((long) i, (j - 8) / ((long) (i32 + 4)));
                if (min >= 1) {
                }
            }
        } else if (i2 != 8) {
            return ThumbnailError.UnknownFormat;
        } else {
            if (!z2) {
                bitmap = Bitmap.createBitmap(readInt2, readInt3, Config.ARGB_8888);
                if (z2) {
                }
                int i322 = ((readInt2 * readInt3) * i2) / 8;
                e eVar322 = eVar;
                min = (int) Math.min((long) i, (j - 8) / ((long) (i322 + 4)));
                if (min >= 1) {
                }
            }
        }
        bitmap = null;
        if (z2) {
        }
        int i3222 = ((readInt2 * readInt3) * i2) / 8;
        e eVar3222 = eVar;
        min = (int) Math.min((long) i, (j - 8) / ((long) (i3222 + 4)));
        if (min >= 1) {
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:21:0x006a  */
    /* JADX WARNING: Removed duplicated region for block: B:22:0x007f  */
    /* JADX WARNING: Removed duplicated region for block: B:25:0x009d  */
    /* JADX WARNING: Removed duplicated region for block: B:26:0x00a1  */
    static ThumbnailError a(byte[] bArr, int i, int i2, int i3, int i4, int i5, int i6, c cVar) throws IOException {
        e eVar;
        d dVar;
        Bitmap bitmap;
        Bitmap bitmap2;
        Canvas canvas;
        if (cVar == null) {
            return ThumbnailError.ParameterError;
        }
        boolean z = cVar instanceof e;
        if (z) {
            eVar = (e) cVar;
            dVar = null;
        } else {
            dVar = (d) cVar;
            eVar = null;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("processRawFile: w/h/time=");
        sb.append(i2);
        sb.append("/");
        sb.append(i3);
        sb.append("/");
        sb.append(i);
        sb.append(", format=");
        sb.append(i4);
        Log.d("ThumbnailParser", sb.toString());
        if (i4 == 32) {
            if (!z) {
                bitmap = Bitmap.createBitmap(i2, i3, Config.ARGB_8888);
                if (z) {
                    bitmap2 = Bitmap.createBitmap(i2, i3, bitmap.getConfig());
                    canvas = new Canvas(bitmap2);
                    canvas.scale(1.0f, -1.0f);
                } else {
                    bitmap2 = null;
                    canvas = null;
                }
                ByteBuffer wrap = ByteBuffer.wrap(bArr);
                StringBuilder sb2 = new StringBuilder();
                sb2.append("processRawFile : thumbCount=");
                sb2.append(i6);
                Log.d("ThumbnailParser", sb2.toString());
                if (!z) {
                    eVar.a(bArr, i5, i6, i);
                } else {
                    bitmap.copyPixelsFromBuffer(wrap);
                    canvas.drawBitmap(bitmap, 0.0f, (float) (-i3), null);
                    dVar.a(bitmap2, i5, i6, i);
                }
                return null;
            }
        } else if (i4 == 16) {
            if (!z) {
                bitmap = Bitmap.createBitmap(i2, i3, Config.RGB_565);
                if (z) {
                }
                ByteBuffer wrap2 = ByteBuffer.wrap(bArr);
                StringBuilder sb22 = new StringBuilder();
                sb22.append("processRawFile : thumbCount=");
                sb22.append(i6);
                Log.d("ThumbnailParser", sb22.toString());
                if (!z) {
                }
                return null;
            }
        } else if (i4 != 8) {
            return ThumbnailError.UnknownFormat;
        } else {
            if (!z) {
                bitmap = Bitmap.createBitmap(i2, i3, Config.ARGB_8888);
                if (z) {
                }
                ByteBuffer wrap22 = ByteBuffer.wrap(bArr);
                StringBuilder sb222 = new StringBuilder();
                sb222.append("processRawFile : thumbCount=");
                sb222.append(i6);
                Log.d("ThumbnailParser", sb222.toString());
                if (!z) {
                }
                return null;
            }
        }
        bitmap = null;
        if (z) {
        }
        ByteBuffer wrap222 = ByteBuffer.wrap(bArr);
        StringBuilder sb2222 = new StringBuilder();
        sb2222.append("processRawFile : thumbCount=");
        sb2222.append(i6);
        Log.d("ThumbnailParser", sb2222.toString());
        if (!z) {
        }
        return null;
    }
}
