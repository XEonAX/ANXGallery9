package com.nexstreaming.nexeditorsdk;

import android.os.Environment;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.nexstreaming.app.common.util.a;
import com.nexstreaming.app.common.util.g;
import com.nexstreaming.nexeditorsdk.exception.InvalidRangeException;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

public final class nexConfig {
    public static final int kDeviceMaxGamma = 10;
    public static final int kDeviceMaxLightLevel = 9;
    public static final int kForceDirectExport = 6;
    public static final int kHardwareCodecMemSize = 1;
    public static final int kHardwareDecMaxCount = 2;
    public static final int kMaxResolution = 5;
    public static final int kMaxSupportedFPS = 3;
    public static final int kNativeLogLevel = 7;
    public static final int kSetUserConfig = 0;
    public static final int kSupportMPEGV4 = 4;
    public static final int kUseTimeChecker = 8;
    static int[] sConfigProperty = {0, 8912896, 4, BaiduSceneResult.MOTORCYCLE, 0, 8912896, 0, 2, 1, 550, 2400, 0};

    public static int getProperty(int i) {
        if (sConfigProperty.length > i) {
            return sConfigProperty[i];
        }
        throw new InvalidRangeException(0, sConfigProperty.length - 1, i);
    }

    /* JADX WARNING: Incorrect type for immutable var: ssa=boolean, code=int, for r6v0, types: [int, boolean] */
    public static void set(int i, int i2, int i3, int i4, int i5) {
        sConfigProperty[0] = 1;
        sConfigProperty[1] = i;
        sConfigProperty[2] = i2;
        sConfigProperty[3] = i3;
        sConfigProperty[4] = i4;
        sConfigProperty[5] = i5;
    }

    public static void setCapability(InputStream inputStream) {
        InputStream inputStream2;
        a aVar;
        String absolutePath = Environment.getExternalStorageDirectory().getAbsolutePath();
        StringBuilder sb = new StringBuilder();
        sb.append(absolutePath);
        sb.append(File.separator);
        sb.append("CodecCapacity");
        try {
            inputStream2 = new BufferedInputStream(new FileInputStream(new File(new File(sb.toString()), "CapabilityResult.txt")));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            inputStream2 = null;
        }
        try {
            aVar = new g().a(inputStream2);
        } catch (IOException e2) {
            e2.printStackTrace();
            aVar = null;
        }
        int f = aVar.e() > aVar.f() ? aVar.f() : aVar.e();
        sConfigProperty[0] = 1;
        sConfigProperty[1] = aVar.a();
        sConfigProperty[2] = f;
        sConfigProperty[3] = aVar.b();
        sConfigProperty[4] = aVar.d();
        sConfigProperty[5] = aVar.c();
    }

    public static boolean setProperty(int i, int i2) {
        if (sConfigProperty.length <= i) {
            return false;
        }
        sConfigProperty[0] = 1;
        sConfigProperty[i] = i2;
        return true;
    }
}
