package com.baidu.vis.ClassIfication;

import android.content.Context;
import android.content.res.AssetManager;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.os.Build;
import android.util.Log;
import com.baidu.vis.ClassIfication.SDKExceptions.IlleagleCpuArch;
import com.baidu.vis.ClassIfication.SDKExceptions.MissingModleFileInAssetFolder;
import com.baidu.vis.ClassIfication.SDKExceptions.NV21BytesLengthNotMatch;
import com.baidu.vis.ClassIfication.SDKExceptions.NoSDCardPermission;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.ByteBuffer;

public class Util {
    private static final String TAG = "Predictor";

    public static byte[] bitmap2Bytes(Bitmap bitmap) {
        ByteBuffer allocate = ByteBuffer.allocate(bitmap.getByteCount());
        bitmap.copyPixelsToBuffer(allocate);
        return allocate.array();
    }

    public static Bitmap bytes2Bitmap(byte[] bArr, int i, int i2, Config config) {
        Bitmap createBitmap = Bitmap.createBitmap(i, i2, config);
        createBitmap.copyPixelsFromBuffer(ByteBuffer.wrap(bArr));
        return createBitmap;
    }

    public static void checkFile(String str) throws NV21BytesLengthNotMatch {
        if (!new File(str).exists()) {
            throw new NV21BytesLengthNotMatch();
        }
    }

    /* JADX WARNING: Can't wrap try/catch for region: R(12:20|21|22|23|24|25|26|(2:27|(1:29)(1:74))|(2:31|32)|33|34|55) */
    /* JADX WARNING: Code restructure failed: missing block: B:53:0x00a2, code lost:
        if (r5 == null) goto L_0x00a5;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:72:0x00bf, code lost:
        throw new com.baidu.vis.ClassIfication.SDKExceptions.MissingModleFileInAssetFolder();
     */
    /* JADX WARNING: Exception block dominator not found, dom blocks: [] */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Missing exception handler attribute for start block: B:33:0x0072 */
    /* JADX WARNING: Missing exception handler attribute for start block: B:70:0x00ba */
    /* JADX WARNING: Removed duplicated region for block: B:51:0x009f A[SYNTHETIC, Splitter:B:51:0x009f] */
    /* JADX WARNING: Removed duplicated region for block: B:59:0x00a9 A[SYNTHETIC, Splitter:B:59:0x00a9] */
    /* JADX WARNING: Removed duplicated region for block: B:63:0x00ae A[SYNTHETIC, Splitter:B:63:0x00ae] */
    public static void copyAssets(Context context, String str) throws NoSDCardPermission, MissingModleFileInAssetFolder, IlleagleCpuArch {
        OutputStream outputStream;
        String str2 = Build.CPU_ABI;
        if (str2.contains("v7a") || str2.contains("v8a")) {
            AssetManager assets = context.getAssets();
            InputStream open = assets.open(str);
            if (open != null) {
                try {
                    open.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (context.checkCallingOrSelfPermission("android.permission.WRITE_EXTERNAL_STORAGE") == 0) {
                InputStream inputStream = null;
                if (new File(context.getExternalFilesDir(null), str).exists()) {
                    Log.d(TAG, "NN model on SD card");
                    return;
                }
                try {
                    InputStream open2 = assets.open(str);
                    try {
                        outputStream = new FileOutputStream(new File(context.getExternalFilesDir(null), str));
                    } catch (IOException e2) {
                        e = e2;
                        outputStream = null;
                        inputStream = open2;
                        String str3 = nexExportFormat.TAG_FORMAT_TAG;
                        try {
                            StringBuilder sb = new StringBuilder();
                            sb.append("Failed to copy asset file: ");
                            sb.append(str);
                            Log.e(str3, sb.toString(), e);
                            if (inputStream != null) {
                            }
                        } catch (Throwable th) {
                            th = th;
                            if (inputStream != null) {
                                try {
                                    inputStream.close();
                                } catch (IOException unused) {
                                }
                            }
                            if (outputStream != null) {
                                try {
                                    outputStream.close();
                                } catch (IOException unused2) {
                                }
                            }
                            throw th;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        outputStream = null;
                        inputStream = open2;
                        if (inputStream != null) {
                        }
                        if (outputStream != null) {
                        }
                        throw th;
                    }
                    try {
                        byte[] bArr = new byte[1024];
                        while (true) {
                            int read = open2.read(bArr);
                            if (read == -1) {
                                break;
                            }
                            outputStream.write(bArr, 0, read);
                        }
                        if (open2 != null) {
                            open2.close();
                        }
                    } catch (IOException e3) {
                        e = e3;
                        inputStream = open2;
                        String str32 = nexExportFormat.TAG_FORMAT_TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("Failed to copy asset file: ");
                        sb2.append(str);
                        Log.e(str32, sb2.toString(), e);
                        if (inputStream != null) {
                            try {
                                inputStream.close();
                            } catch (IOException unused3) {
                            }
                        }
                    } catch (Throwable th3) {
                        th = th3;
                        inputStream = open2;
                        if (inputStream != null) {
                        }
                        if (outputStream != null) {
                        }
                        throw th;
                    }
                } catch (IOException e4) {
                    e = e4;
                    outputStream = null;
                    String str322 = nexExportFormat.TAG_FORMAT_TAG;
                    StringBuilder sb22 = new StringBuilder();
                    sb22.append("Failed to copy asset file: ");
                    sb22.append(str);
                    Log.e(str322, sb22.toString(), e);
                    if (inputStream != null) {
                    }
                } catch (Throwable th4) {
                    th = th4;
                    outputStream = null;
                    if (inputStream != null) {
                    }
                    if (outputStream != null) {
                    }
                    throw th;
                }
                outputStream.close();
                return;
            }
            throw new NoSDCardPermission();
        }
        throw new IlleagleCpuArch();
    }
}
