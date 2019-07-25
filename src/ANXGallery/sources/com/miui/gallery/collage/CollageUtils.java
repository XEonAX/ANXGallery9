package com.miui.gallery.collage;

import android.content.res.AssetManager;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.miui.gallery.editor.photo.utils.IoUtils;
import com.miui.gallery.util.Log;
import java.io.IOException;
import java.io.InputStream;

public class CollageUtils {
    public static Gson generateCustomGson() {
        return new GsonBuilder().create();
    }

    public static Drawable getDrawableByAssets(Resources resources, String str) {
        InputStream inputStream;
        try {
            inputStream = resources.getAssets().open(str);
            try {
                Drawable createFromStream = Drawable.createFromStream(inputStream, null);
                IoUtils.close("CollageUtils", inputStream);
                return createFromStream;
            } catch (IOException unused) {
                try {
                    Log.e("CollageUtils", "load poster element img fail ! path %s", (Object) str);
                    IoUtils.close("CollageUtils", inputStream);
                    return null;
                } catch (Throwable th) {
                    th = th;
                    IoUtils.close("CollageUtils", inputStream);
                    throw th;
                }
            }
        } catch (IOException unused2) {
            inputStream = null;
            Log.e("CollageUtils", "load poster element img fail ! path %s", (Object) str);
            IoUtils.close("CollageUtils", inputStream);
            return null;
        } catch (Throwable th2) {
            th = th2;
            inputStream = null;
            IoUtils.close("CollageUtils", inputStream);
            throw th;
        }
    }

    public static String loadResourceFileString(AssetManager assetManager, String str) {
        InputStream inputStream;
        try {
            inputStream = assetManager.open(str);
            try {
                String readInputStreamToString = IoUtils.readInputStreamToString("CollageUtils", inputStream);
                IoUtils.close(inputStream);
                return readInputStreamToString;
            } catch (IOException e) {
                e = e;
                try {
                    Log.e("CollageUtils", (Throwable) e);
                    IoUtils.close(inputStream);
                    return null;
                } catch (Throwable th) {
                    th = th;
                    IoUtils.close(inputStream);
                    throw th;
                }
            }
        } catch (IOException e2) {
            e = e2;
            inputStream = null;
            Log.e("CollageUtils", (Throwable) e);
            IoUtils.close(inputStream);
            return null;
        } catch (Throwable th2) {
            th = th2;
            inputStream = null;
            IoUtils.close(inputStream);
            throw th;
        }
    }
}
