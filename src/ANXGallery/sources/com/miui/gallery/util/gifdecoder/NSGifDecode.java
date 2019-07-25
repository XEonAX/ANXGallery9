package com.miui.gallery.util.gifdecoder;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.os.Handler;
import android.os.HandlerThread;
import com.miui.gallery.util.CryptoUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.nostra13.universalimageloader.utils.ImageSizeUtils;
import java.io.ByteArrayOutputStream;
import java.io.FileDescriptor;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

public class NSGifDecode implements Runnable {
    private DecodeRunnable mDecodeRunnable;
    /* access modifiers changed from: private */
    public Bitmap mFrame = null;
    /* access modifiers changed from: private */
    public Handler mHandler;
    /* access modifiers changed from: private */
    public volatile GifFrameUpdateListener mListener = null;
    /* access modifiers changed from: private */
    public final Object mLock = new Object();
    private NSGifGen mNSGif = null;
    /* access modifiers changed from: private */
    public volatile boolean mQuit = false;

    private class DecodeRunnable implements Runnable {
        private int mIndex;
        private NSGif mNSGif;

        public DecodeRunnable(NSGif nSGif, int i) {
            this.mNSGif = nSGif;
            this.mIndex = i;
        }

        public void run() {
            if (!NSGifDecode.this.mQuit) {
                long currentTimeMillis = System.currentTimeMillis() + ((long) Math.max(20, this.mNSGif.getFrameDelay(this.mIndex)));
                if (NSGifDecode.this.mQuit || !this.mNSGif.writeTo(NSGifDecode.this.mFrame)) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("write frame ");
                    sb.append(this.mIndex);
                    sb.append(" failed");
                    Log.e("NSGifDecode", sb.toString());
                    return;
                }
                GifFrameUpdateListener access$200 = NSGifDecode.this.mListener;
                if (access$200 != null) {
                    access$200.onUpdateGifFrame(NSGifDecode.this.mFrame);
                }
                this.mIndex++;
                if (this.mIndex >= this.mNSGif.getFrameCount()) {
                    this.mIndex = 0;
                }
                if (!NSGifDecode.this.mQuit && this.mNSGif.decodeFrame(this.mIndex) && !NSGifDecode.this.mQuit) {
                    synchronized (NSGifDecode.this.mLock) {
                        if (NSGifDecode.this.mHandler != null) {
                            long currentTimeMillis2 = System.currentTimeMillis();
                            if (currentTimeMillis2 < currentTimeMillis) {
                                NSGifDecode.this.mHandler.postDelayed(this, currentTimeMillis - currentTimeMillis2);
                            } else {
                                NSGifDecode.this.mHandler.post(this);
                            }
                        }
                    }
                }
            }
        }
    }

    public interface GifFrameUpdateListener {
        void onUpdateGifFrame(Bitmap bitmap);
    }

    private interface NSGifGen {
        NSGif gen();
    }

    private static boolean checkGif(InputStream inputStream, byte[] bArr, int[] iArr) throws IOException {
        if (inputStream.read(bArr, 0, 10) != 10) {
            return false;
        }
        String str = new String(bArr, 0, 6);
        if ("GIF87a".equals(str) || "GIF89a".equals(str)) {
            int convertShort = convertShort(bArr, 6);
            if (iArr != null && iArr.length > 0) {
                iArr[0] = convertShort;
            }
            if (convertShort <= 0 || convertShort > ImageSizeUtils.getMaxTextureSize()) {
                StringBuilder sb = new StringBuilder();
                sb.append("invalid width: ");
                sb.append(convertShort);
                Log.d("NSGifDecode", sb.toString());
                return false;
            }
            int convertShort2 = convertShort(bArr, 8);
            if (iArr != null && iArr.length > 1) {
                iArr[1] = convertShort2;
            }
            if (convertShort2 > 0 && convertShort2 <= ImageSizeUtils.getMaxTextureSize()) {
                return true;
            }
            StringBuilder sb2 = new StringBuilder();
            sb2.append("invalid height: ");
            sb2.append(convertShort2);
            Log.d("NSGifDecode", sb2.toString());
            return false;
        }
        StringBuilder sb3 = new StringBuilder();
        sb3.append("is not gif, tag: ");
        sb3.append(str);
        Log.d("NSGifDecode", sb3.toString());
        return false;
    }

    private static int convertShort(byte[] bArr, int i) {
        return ((bArr[i + 1] & 255) << 8) | (bArr[i] & 255);
    }

    private static NSGifDecode create(NSGifGen nSGifGen) {
        if (nSGifGen != null) {
            try {
                NSGifDecode nSGifDecode = new NSGifDecode();
                nSGifDecode.mNSGif = nSGifGen;
                return nSGifDecode;
            } catch (OutOfMemoryError unused) {
            }
        }
        return null;
    }

    /* JADX WARNING: Removed duplicated region for block: B:18:0x0036  */
    /* JADX WARNING: Removed duplicated region for block: B:20:0x003a  */
    public static NSGifDecode create(FileDescriptor fileDescriptor, byte[] bArr) {
        InputStream inputStream;
        Exception e;
        byte[] bArr2;
        int[] iArr = new int[2];
        try {
            InputStream fileInputStream = new FileInputStream(fileDescriptor);
            try {
                if (fileInputStream.available() > 5242880) {
                    Log.d("NSGifDecode", "file is too large");
                    MiscUtil.closeSilently(fileInputStream);
                    return null;
                }
                if (bArr != null) {
                    if (bArr.length > 0) {
                        inputStream = CryptoUtil.getDecryptCipherInputStream(fileInputStream, bArr);
                        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                        bArr2 = new byte[4096];
                        if (checkGif(inputStream, bArr2, iArr)) {
                            MiscUtil.closeSilently(inputStream);
                            return null;
                        }
                        byteArrayOutputStream.write(bArr2, 0, 10);
                        while (true) {
                            int read = inputStream.read(bArr2);
                            if (read < 0) {
                                break;
                            }
                            byteArrayOutputStream.write(bArr2, 0, read);
                        }
                        byte[] byteArray = byteArrayOutputStream.toByteArray();
                        NSGifDecode create = create(byteArray, 0, byteArray.length);
                        if (create != null) {
                            try {
                                create.mFrame = Bitmap.createBitmap(iArr[0], iArr[1], Config.ARGB_8888);
                            } catch (OutOfMemoryError unused) {
                            }
                        }
                        MiscUtil.closeSilently(inputStream);
                        return create;
                    }
                }
                inputStream = fileInputStream;
                try {
                    ByteArrayOutputStream byteArrayOutputStream2 = new ByteArrayOutputStream();
                    bArr2 = new byte[4096];
                    if (checkGif(inputStream, bArr2, iArr)) {
                    }
                } catch (Exception e2) {
                    e = e2;
                    try {
                        Log.d("NSGifDecode", "load gif data", (Object) e);
                        MiscUtil.closeSilently(inputStream);
                        return null;
                    } catch (Throwable th) {
                        th = th;
                        MiscUtil.closeSilently(inputStream);
                        throw th;
                    }
                }
            } catch (Exception e3) {
                e = e3;
                inputStream = fileInputStream;
                Log.d("NSGifDecode", "load gif data", (Object) e);
                MiscUtil.closeSilently(inputStream);
                return null;
            } catch (Throwable th2) {
                th = th2;
                inputStream = fileInputStream;
                MiscUtil.closeSilently(inputStream);
                throw th;
            }
        } catch (Exception e4) {
            e = e4;
            inputStream = null;
            Log.d("NSGifDecode", "load gif data", (Object) e);
            MiscUtil.closeSilently(inputStream);
            return null;
        } catch (Throwable th3) {
            th = th3;
            inputStream = null;
            MiscUtil.closeSilently(inputStream);
            throw th;
        }
    }

    public static NSGifDecode create(final String str) {
        FileInputStream fileInputStream;
        int[] iArr = new int[2];
        try {
            fileInputStream = new FileInputStream(str);
            try {
                if (!checkGif(fileInputStream, new byte[10], iArr)) {
                    MiscUtil.closeSilently(fileInputStream);
                    return null;
                }
                MiscUtil.closeSilently(fileInputStream);
                NSGifDecode create = create((NSGifGen) new NSGifGen() {
                    public NSGif gen() {
                        return NSGif.create(str);
                    }
                });
                if (create != null) {
                    try {
                        create.mFrame = Bitmap.createBitmap(iArr[0], iArr[1], Config.ARGB_8888);
                    } catch (OutOfMemoryError unused) {
                    }
                }
                return create;
            } catch (IOException e) {
                e = e;
                try {
                    Log.d("NSGifDecode", "read gif file", (Object) e);
                    MiscUtil.closeSilently(fileInputStream);
                    return null;
                } catch (Throwable th) {
                    th = th;
                    MiscUtil.closeSilently(fileInputStream);
                    throw th;
                }
            }
        } catch (IOException e2) {
            e = e2;
            fileInputStream = null;
            Log.d("NSGifDecode", "read gif file", (Object) e);
            MiscUtil.closeSilently(fileInputStream);
            return null;
        } catch (Throwable th2) {
            th = th2;
            fileInputStream = null;
            MiscUtil.closeSilently(fileInputStream);
            throw th;
        }
    }

    private static NSGifDecode create(final byte[] bArr, final int i, final int i2) {
        return create((NSGifGen) new NSGifGen() {
            public NSGif gen() {
                return NSGif.create(bArr, i, i2);
            }
        });
    }

    public void cancel() {
        this.mQuit = true;
        synchronized (this.mLock) {
            if (this.mHandler != null) {
                this.mHandler.removeCallbacks(this.mDecodeRunnable);
                this.mHandler.getLooper().quitSafely();
                this.mDecodeRunnable = null;
                this.mHandler = null;
            }
        }
    }

    public void run() {
        try {
            if (this.mNSGif != null) {
                NSGif gen = this.mNSGif.gen();
                this.mNSGif = null;
                if (gen != null) {
                    if (this.mFrame == null) {
                        try {
                            this.mFrame = Bitmap.createBitmap(gen.getWidth(), gen.getHeight(), Config.ARGB_8888);
                        } catch (OutOfMemoryError e) {
                            Log.e("NSGifDecode", "OOM on create bitmap", (Object) e);
                            return;
                        }
                    }
                    if (gen.getFrameCount() == 1) {
                        GifFrameUpdateListener gifFrameUpdateListener = this.mListener;
                        if (gen.decodeFrame(0) && gen.writeTo(this.mFrame) && gifFrameUpdateListener != null) {
                            gifFrameUpdateListener.onUpdateGifFrame(this.mFrame);
                        }
                        return;
                    }
                    if (!gen.decodeFrame(0)) {
                        this.mQuit = true;
                    }
                    if (!this.mQuit) {
                        synchronized (this.mLock) {
                            HandlerThread handlerThread = new HandlerThread("NSGifDecode");
                            handlerThread.start();
                            this.mHandler = new Handler(handlerThread.getLooper());
                            this.mDecodeRunnable = new DecodeRunnable(gen, 0);
                            this.mHandler.post(this.mDecodeRunnable);
                        }
                    }
                }
            }
        } catch (Exception e2) {
            Log.w("NSGifDecode", (Throwable) e2);
        }
    }

    public void setListener(GifFrameUpdateListener gifFrameUpdateListener) {
        this.mListener = gifFrameUpdateListener;
    }
}
