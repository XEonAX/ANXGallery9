package com.xiaomi.push.service;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.net.Uri;
import com.xiaomi.channel.commonutils.file.FileUtils;
import com.xiaomi.channel.commonutils.file.IOUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.string.XMStringUtils;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.SocketTimeoutException;
import java.net.URL;

public class NotificationIconHelper {
    private static long currentPicFileSize;

    public static class GetDataResult {
        byte[] data;
        int downloadSize;

        public GetDataResult(byte[] bArr, int i) {
            this.data = bArr;
            this.downloadSize = i;
        }
    }

    public static class GetIconResult {
        public Bitmap bitmap;
        public long downloadSize;

        public GetIconResult(Bitmap bitmap2, long j) {
            this.bitmap = bitmap2;
            this.downloadSize = j;
        }
    }

    private static void cleanCachedPic(Context context) {
        StringBuilder sb = new StringBuilder();
        sb.append(context.getCacheDir().getPath());
        sb.append(File.separator);
        sb.append("mipush_icon");
        File file = new File(sb.toString());
        if (file.exists()) {
            if (currentPicFileSize == 0) {
                currentPicFileSize = FileUtils.getFolderSize(file);
            }
            if (currentPicFileSize > 15728640) {
                try {
                    File[] listFiles = file.listFiles();
                    for (int i = 0; i < listFiles.length; i++) {
                        if (!listFiles[i].isDirectory() && Math.abs(System.currentTimeMillis() - listFiles[i].lastModified()) > 1209600) {
                            listFiles[i].delete();
                        }
                    }
                } catch (Exception e) {
                    MyLog.e((Throwable) e);
                }
                currentPicFileSize = 0;
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:10:0x0043, code lost:
        r6 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:11:0x0044, code lost:
        r4 = r6;
        r6 = r5;
        r5 = r4;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:12:0x0048, code lost:
        r6 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:13:0x0049, code lost:
        r4 = r6;
        r6 = r5;
        r5 = r4;
     */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Removed duplicated region for block: B:12:0x0048 A[ExcHandler: all (r6v6 'th' java.lang.Throwable A[CUSTOM_DECLARE]), Splitter:B:5:0x0034] */
    private static Bitmap getBitmapFromFile(Context context, String str) {
        Bitmap bitmap;
        StringBuilder sb = new StringBuilder();
        sb.append(context.getCacheDir().getPath());
        sb.append(File.separator);
        sb.append("mipush_icon");
        File file = new File(sb.toString(), XMStringUtils.getMd5Digest(str));
        FileInputStream fileInputStream = null;
        if (!file.exists()) {
            return null;
        }
        try {
            FileInputStream fileInputStream2 = new FileInputStream(file);
            try {
                bitmap = BitmapFactory.decodeStream(fileInputStream2);
                file.setLastModified(System.currentTimeMillis());
                IOUtils.closeQuietly(fileInputStream2);
            } catch (Exception e) {
                bitmap = null;
                fileInputStream = fileInputStream2;
                e = e;
                try {
                    MyLog.e(e);
                    IOUtils.closeQuietly(fileInputStream);
                    return bitmap;
                } catch (Throwable th) {
                    th = th;
                    IOUtils.closeQuietly(fileInputStream);
                    throw th;
                }
            } catch (Throwable th2) {
            }
        } catch (Exception e2) {
            e = e2;
            bitmap = null;
            MyLog.e(e);
            IOUtils.closeQuietly(fileInputStream);
            return bitmap;
        }
        return bitmap;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:59:0x00d6, code lost:
        if (r1 == null) goto L_0x00f8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:60:0x00d8, code lost:
        r1.disconnect();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:66:0x00f5, code lost:
        if (r1 == null) goto L_0x00f8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:67:0x00f8, code lost:
        return null;
     */
    /* JADX WARNING: Missing exception handler attribute for start block: B:63:0x00de */
    /* JADX WARNING: Removed duplicated region for block: B:72:0x0100  */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:56:0x00d0=Splitter:B:56:0x00d0, B:63:0x00de=Splitter:B:63:0x00de} */
    private static GetDataResult getDataFromUrl(String str, boolean z) {
        HttpURLConnection httpURLConnection;
        InputStream inputStream;
        InputStream inputStream2 = null;
        try {
            httpURLConnection = (HttpURLConnection) new URL(str).openConnection();
            try {
                httpURLConnection.setConnectTimeout(8000);
                httpURLConnection.setReadTimeout(20000);
                httpURLConnection.connect();
                int contentLength = httpURLConnection.getContentLength();
                if (!z || contentLength <= 102400) {
                    int responseCode = httpURLConnection.getResponseCode();
                    if (responseCode != 200) {
                        StringBuilder sb = new StringBuilder();
                        sb.append("Invalid Http Response Code ");
                        sb.append(responseCode);
                        sb.append(" received");
                        MyLog.w(sb.toString());
                        IOUtils.closeQuietly(null);
                        if (httpURLConnection != null) {
                            httpURLConnection.disconnect();
                        }
                        return null;
                    }
                    inputStream = httpURLConnection.getInputStream();
                    try {
                        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                        int i = z ? 102400 : 2048000;
                        byte[] bArr = new byte[1024];
                        while (true) {
                            if (i <= 0) {
                                break;
                            }
                            int read = inputStream.read(bArr, 0, 1024);
                            if (read == -1) {
                                break;
                            }
                            i -= read;
                            byteArrayOutputStream.write(bArr, 0, read);
                        }
                        if (i <= 0) {
                            MyLog.w("length 102400 exhausted.");
                            GetDataResult getDataResult = new GetDataResult(null, 102400);
                            IOUtils.closeQuietly(inputStream);
                            if (httpURLConnection != null) {
                                httpURLConnection.disconnect();
                            }
                            return getDataResult;
                        }
                        byte[] byteArray = byteArrayOutputStream.toByteArray();
                        GetDataResult getDataResult2 = new GetDataResult(byteArray, byteArray.length);
                        IOUtils.closeQuietly(inputStream);
                        if (httpURLConnection != null) {
                            httpURLConnection.disconnect();
                        }
                        return getDataResult2;
                    } catch (SocketTimeoutException ) {
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("Connect timeout to ");
                        sb2.append(str);
                        MyLog.e(sb2.toString());
                        IOUtils.closeQuietly(inputStream);
                    } catch (IOException e) {
                        e = e;
                        try {
                            MyLog.e((Throwable) e);
                            IOUtils.closeQuietly(inputStream);
                        } catch (Throwable th) {
                            th = th;
                            inputStream2 = inputStream;
                            IOUtils.closeQuietly(inputStream2);
                            if (httpURLConnection != null) {
                            }
                            throw th;
                        }
                    }
                } else {
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("Bitmap size is too big, max size is 102400  contentLen size is ");
                    sb3.append(contentLength);
                    sb3.append(" from url ");
                    sb3.append(str);
                    MyLog.w(sb3.toString());
                    IOUtils.closeQuietly(null);
                    if (httpURLConnection != null) {
                        httpURLConnection.disconnect();
                    }
                    return null;
                }
            } catch (SocketTimeoutException unused) {
                inputStream = null;
            } catch (IOException e2) {
                e = e2;
                inputStream = null;
                MyLog.e((Throwable) e);
                IOUtils.closeQuietly(inputStream);
            } catch (Throwable th2) {
                th = th2;
                IOUtils.closeQuietly(inputStream2);
                if (httpURLConnection != null) {
                }
                throw th;
            }
        } catch (SocketTimeoutException unused2) {
            httpURLConnection = null;
            inputStream = null;
        } catch (IOException e3) {
            e = e3;
            httpURLConnection = null;
            inputStream = null;
            MyLog.e((Throwable) e);
            IOUtils.closeQuietly(inputStream);
        } catch (Throwable th3) {
            th = th3;
            httpURLConnection = null;
            IOUtils.closeQuietly(inputStream2);
            if (httpURLConnection != null) {
                httpURLConnection.disconnect();
            }
            throw th;
        }
    }

    public static Bitmap getIconFromUri(Context context, String str) {
        InputStream inputStream;
        InputStream inputStream2;
        int sampleSize;
        Uri parse = Uri.parse(str);
        try {
            inputStream2 = context.getContentResolver().openInputStream(parse);
            try {
                sampleSize = getSampleSize(context, inputStream2);
                inputStream = context.getContentResolver().openInputStream(parse);
            } catch (IOException e) {
                e = e;
                inputStream = null;
                try {
                    MyLog.e((Throwable) e);
                    IOUtils.closeQuietly(inputStream);
                    IOUtils.closeQuietly(inputStream2);
                    return null;
                } catch (Throwable th) {
                    th = th;
                    IOUtils.closeQuietly(inputStream);
                    IOUtils.closeQuietly(inputStream2);
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                inputStream = null;
                IOUtils.closeQuietly(inputStream);
                IOUtils.closeQuietly(inputStream2);
                throw th;
            }
            try {
                Options options = new Options();
                options.inSampleSize = sampleSize;
                Bitmap decodeStream = BitmapFactory.decodeStream(inputStream, null, options);
                IOUtils.closeQuietly(inputStream);
                IOUtils.closeQuietly(inputStream2);
                return decodeStream;
            } catch (IOException e2) {
                e = e2;
                MyLog.e((Throwable) e);
                IOUtils.closeQuietly(inputStream);
                IOUtils.closeQuietly(inputStream2);
                return null;
            }
        } catch (IOException e3) {
            e = e3;
            inputStream = null;
            inputStream2 = null;
            MyLog.e((Throwable) e);
            IOUtils.closeQuietly(inputStream);
            IOUtils.closeQuietly(inputStream2);
            return null;
        } catch (Throwable th3) {
            th = th3;
            inputStream = null;
            inputStream2 = null;
            IOUtils.closeQuietly(inputStream);
            IOUtils.closeQuietly(inputStream2);
            throw th;
        }
    }

    public static GetIconResult getIconFromUrl(Context context, String str, boolean z) {
        ByteArrayInputStream byteArrayInputStream = null;
        GetIconResult getIconResult = new GetIconResult(null, 0);
        Bitmap bitmapFromFile = getBitmapFromFile(context, str);
        if (bitmapFromFile != null) {
            getIconResult.bitmap = bitmapFromFile;
            return getIconResult;
        }
        try {
            GetDataResult dataFromUrl = getDataFromUrl(str, z);
            if (dataFromUrl == null) {
                IOUtils.closeQuietly(null);
                return getIconResult;
            }
            getIconResult.downloadSize = (long) dataFromUrl.downloadSize;
            byte[] bArr = dataFromUrl.data;
            if (bArr != null) {
                if (z) {
                    ByteArrayInputStream byteArrayInputStream2 = new ByteArrayInputStream(bArr);
                    try {
                        int sampleSize = getSampleSize(context, byteArrayInputStream2);
                        Options options = new Options();
                        options.inSampleSize = sampleSize;
                        getIconResult.bitmap = BitmapFactory.decodeByteArray(bArr, 0, bArr.length, options);
                        byteArrayInputStream = byteArrayInputStream2;
                    } catch (Exception e) {
                        e = e;
                        byteArrayInputStream = byteArrayInputStream2;
                        try {
                            MyLog.e((Throwable) e);
                            IOUtils.closeQuietly(byteArrayInputStream);
                            return getIconResult;
                        } catch (Throwable th) {
                            th = th;
                            IOUtils.closeQuietly(byteArrayInputStream);
                            throw th;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        byteArrayInputStream = byteArrayInputStream2;
                        IOUtils.closeQuietly(byteArrayInputStream);
                        throw th;
                    }
                } else {
                    getIconResult.bitmap = BitmapFactory.decodeByteArray(bArr, 0, bArr.length);
                }
            }
            savePic2File(context, dataFromUrl.data, str);
            IOUtils.closeQuietly(byteArrayInputStream);
            return getIconResult;
        } catch (Exception e2) {
            e = e2;
            MyLog.e((Throwable) e);
            IOUtils.closeQuietly(byteArrayInputStream);
            return getIconResult;
        }
    }

    private static int getSampleSize(Context context, InputStream inputStream) {
        Options options = new Options();
        options.inJustDecodeBounds = true;
        BitmapFactory.decodeStream(inputStream, null, options);
        if (options.outWidth == -1 || options.outHeight == -1) {
            MyLog.w("decode dimension failed for bitmap.");
            return 1;
        }
        int round = Math.round((((float) context.getResources().getDisplayMetrics().densityDpi) / 160.0f) * 48.0f);
        if (options.outWidth <= round || options.outHeight <= round) {
            return 1;
        }
        return Math.min(options.outWidth / round, options.outHeight / round);
    }

    /* JADX WARNING: Removed duplicated region for block: B:31:0x007c  */
    private static void savePic2File(Context context, byte[] bArr, String str) {
        FileOutputStream fileOutputStream;
        BufferedOutputStream bufferedOutputStream;
        if (bArr == null) {
            MyLog.w("cannot save small icon cause bitmap is null");
            return;
        }
        cleanCachedPic(context);
        StringBuilder sb = new StringBuilder();
        sb.append(context.getCacheDir().getPath());
        sb.append(File.separator);
        sb.append("mipush_icon");
        File file = new File(sb.toString());
        if (!file.exists()) {
            file.mkdirs();
        }
        File file2 = new File(file, XMStringUtils.getMd5Digest(str));
        BufferedOutputStream bufferedOutputStream2 = null;
        try {
            if (!file2.exists()) {
                file2.createNewFile();
            }
            fileOutputStream = new FileOutputStream(file2);
            try {
                bufferedOutputStream = new BufferedOutputStream(fileOutputStream);
            } catch (Exception e) {
                e = e;
                try {
                    MyLog.e((Throwable) e);
                    IOUtils.closeQuietly(bufferedOutputStream2);
                    IOUtils.closeQuietly(fileOutputStream);
                    if (currentPicFileSize == 0) {
                    }
                } catch (Throwable th) {
                    th = th;
                    IOUtils.closeQuietly(bufferedOutputStream2);
                    IOUtils.closeQuietly(fileOutputStream);
                    throw th;
                }
            }
            try {
                bufferedOutputStream.write(bArr);
                bufferedOutputStream.flush();
                IOUtils.closeQuietly(bufferedOutputStream);
            } catch (Exception e2) {
                e = e2;
                bufferedOutputStream2 = bufferedOutputStream;
                MyLog.e((Throwable) e);
                IOUtils.closeQuietly(bufferedOutputStream2);
                IOUtils.closeQuietly(fileOutputStream);
                if (currentPicFileSize == 0) {
                }
            } catch (Throwable th2) {
                th = th2;
                bufferedOutputStream2 = bufferedOutputStream;
                IOUtils.closeQuietly(bufferedOutputStream2);
                IOUtils.closeQuietly(fileOutputStream);
                throw th;
            }
        } catch (Exception e3) {
            e = e3;
            fileOutputStream = null;
            MyLog.e((Throwable) e);
            IOUtils.closeQuietly(bufferedOutputStream2);
            IOUtils.closeQuietly(fileOutputStream);
            if (currentPicFileSize == 0) {
            }
        } catch (Throwable th3) {
            th = th3;
            fileOutputStream = null;
            IOUtils.closeQuietly(bufferedOutputStream2);
            IOUtils.closeQuietly(fileOutputStream);
            throw th;
        }
        IOUtils.closeQuietly(fileOutputStream);
        if (currentPicFileSize == 0) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append(context.getCacheDir().getPath());
            sb2.append(File.separator);
            sb2.append("mipush_icon");
            currentPicFileSize = FileUtils.getFolderSize(new File(sb2.toString())) + file2.length();
        }
    }
}
