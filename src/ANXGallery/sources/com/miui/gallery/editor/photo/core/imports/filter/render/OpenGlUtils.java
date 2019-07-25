package com.miui.gallery.editor.photo.core.imports.filter.render;

import android.content.Context;
import android.graphics.Bitmap;
import android.opengl.GLES20;
import android.opengl.GLUtils;
import android.os.Build;
import com.miui.gallery.util.BaseMiscUtil;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;

public class OpenGlUtils {
    public static Bitmap ensureBitmapSize(Bitmap bitmap) {
        int maxTextureSize = GLESUtils.getMaxTextureSize();
        if (bitmap != null && (bitmap.getWidth() > maxTextureSize || bitmap.getHeight() > maxTextureSize)) {
            try {
                return bitmap.getWidth() > bitmap.getHeight() ? Bitmap.createScaledBitmap(bitmap, maxTextureSize, (bitmap.getHeight() * maxTextureSize) / bitmap.getWidth(), true) : Bitmap.createScaledBitmap(bitmap, (bitmap.getWidth() * maxTextureSize) / bitmap.getHeight(), maxTextureSize, true);
            } catch (OutOfMemoryError e) {
                StringBuilder sb = new StringBuilder();
                sb.append("ensureBitmapSize error:");
                sb.append(e.toString());
                Log.e("OpenGlUtils", sb.toString());
                HashMap hashMap = new HashMap();
                hashMap.put(nexExportFormat.TAG_FORMAT_TYPE, "filter");
                hashMap.put("model", Build.MODEL);
                GallerySamplingStatHelper.recordCountEvent("photo_editor", "memory_error", hashMap);
                bitmap = null;
            }
        }
        return bitmap;
    }

    public static int genTexture() {
        return genTexture(3553);
    }

    public static int genTexture(int i) {
        int[] iArr = new int[1];
        GLES20.glGenTextures(1, iArr, 0);
        GLES20.glBindTexture(i, iArr[0]);
        if (i == 36197) {
            GLES20.glTexParameterf(36197, 10241, 9729.0f);
            GLES20.glTexParameterf(36197, 10240, 9729.0f);
            GLES20.glTexParameteri(36197, 10242, 33071);
            GLES20.glTexParameteri(36197, 10243, 33071);
        } else {
            GLES20.glTexParameterf(3553, 10241, 9729.0f);
            GLES20.glTexParameterf(3553, 10240, 9729.0f);
            GLES20.glTexParameteri(3553, 10242, 33071);
            GLES20.glTexParameteri(3553, 10243, 33071);
        }
        return iArr[0];
    }

    public static int loadTexture(Bitmap bitmap, int i, boolean z) {
        boolean z2 = true;
        if (bitmap == null || bitmap.isRecycled()) {
            String str = "OpenGlUtils";
            String str2 = "img is null: %b";
            if (bitmap != null) {
                z2 = false;
            }
            Log.d(str, str2, (Object) Boolean.valueOf(z2));
            return -1;
        }
        int[] iArr = new int[1];
        if (i == -1) {
            GLES20.glGenTextures(1, iArr, 0);
            GLES20.glBindTexture(3553, iArr[0]);
            GLES20.glTexParameterf(3553, 10240, 9729.0f);
            GLES20.glTexParameterf(3553, 10241, 9729.0f);
            GLES20.glTexParameterf(3553, 10242, 33071.0f);
            GLES20.glTexParameterf(3553, 10243, 33071.0f);
            GLUtils.texImage2D(3553, 0, bitmap, 0);
        } else {
            GLES20.glBindTexture(3553, i);
            GLUtils.texImage2D(3553, 0, bitmap, 0);
            iArr[0] = i;
        }
        if (z) {
            bitmap.recycle();
        }
        return iArr[0];
    }

    public static String readShaderFromRawResource(Context context, int i) {
        InputStream openRawResource = context.getResources().openRawResource(i);
        InputStreamReader inputStreamReader = new InputStreamReader(openRawResource);
        BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
        StringBuilder sb = new StringBuilder();
        while (true) {
            try {
                String readLine = bufferedReader.readLine();
                if (readLine != null) {
                    sb.append(readLine);
                    sb.append(10);
                } else {
                    BaseMiscUtil.closeSilently(openRawResource);
                    BaseMiscUtil.closeSilently(inputStreamReader);
                    BaseMiscUtil.closeSilently(bufferedReader);
                    return sb.toString();
                }
            } catch (IOException unused) {
                BaseMiscUtil.closeSilently(openRawResource);
                BaseMiscUtil.closeSilently(inputStreamReader);
                BaseMiscUtil.closeSilently(bufferedReader);
                return null;
            } catch (Throwable th) {
                BaseMiscUtil.closeSilently(openRawResource);
                BaseMiscUtil.closeSilently(inputStreamReader);
                BaseMiscUtil.closeSilently(bufferedReader);
                throw th;
            }
        }
    }
}
