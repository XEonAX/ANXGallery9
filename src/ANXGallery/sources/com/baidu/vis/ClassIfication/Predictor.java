package com.baidu.vis.ClassIfication;

import android.content.Context;
import android.util.Log;
import com.baidu.vis.ClassIfication.SDKExceptions.IlleagleCpuArch;
import com.baidu.vis.ClassIfication.SDKExceptions.IlleagleLicense;
import com.baidu.vis.ClassIfication.SDKExceptions.MissingModleFileInAssetFolder;
import com.baidu.vis.ClassIfication.SDKExceptions.NV21BytesLengthNotMatch;
import com.baidu.vis.ClassIfication.SDKExceptions.NoSDCardPermission;
import com.baidu.vis.ClassIfication.SDKExceptions.NotInit;
import com.baidu.vis.ClassIfication.SDKExceptions.loadLicenseLibraryError;
import com.baidu.vis.ClassIfication.SDKExceptions.loadNativeLibraryError;
import java.io.File;

public class Predictor {
    private static final String TAG = "ClassIfication";
    private static boolean isInited = false;
    public static loadLicenseLibraryError loadLicenseLibraryError = null;
    public static loadNativeLibraryError loadNativeLibraryError = null;
    private static int mAuthorityStatus = 0;
    private static Predictor mInstance = null;
    private static final boolean sCheckAuthority = true;

    public static synchronized Predictor getInstance() {
        Predictor predictor;
        synchronized (Predictor.class) {
            if (mInstance == null) {
                mInstance = new Predictor();
            }
            predictor = mInstance;
        }
        return predictor;
    }

    public static synchronized int init(Context context, String str) throws loadNativeLibraryError, loadLicenseLibraryError {
        int i;
        synchronized (Predictor.class) {
            if (loadNativeLibraryError != null) {
                throw loadNativeLibraryError;
            } else if (loadLicenseLibraryError == null) {
                i = mAuthorityStatus;
            } else {
                throw loadLicenseLibraryError;
            }
        }
        return i;
    }

    public static synchronized int initModel(Context context, String str) throws NoSDCardPermission, MissingModleFileInAssetFolder, IlleagleCpuArch, IlleagleLicense {
        int nativeModelInit;
        synchronized (Predictor.class) {
            if (mAuthorityStatus == 0) {
                Util.copyAssets(context, str);
                nativeModelInit = nativeModelInit(new File(context.getExternalFilesDir(null), str).getAbsolutePath(), context);
                if (nativeModelInit == 0) {
                    isInited = true;
                }
            } else {
                String str2 = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("license error : ");
                sb.append(mAuthorityStatus);
                Log.d(str2, sb.toString());
                throw new IlleagleLicense();
            }
        }
        return nativeModelInit;
    }

    public static synchronized int initModelWithPath(Context context, String str) throws IlleagleLicense, NV21BytesLengthNotMatch {
        int nativeModelInit;
        synchronized (Predictor.class) {
            if (mAuthorityStatus == 0) {
                Util.checkFile(str);
                nativeModelInit = nativeModelInit(str, context);
                if (nativeModelInit == 0) {
                    isInited = true;
                }
            } else {
                String str2 = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("license error : ");
                sb.append(mAuthorityStatus);
                Log.d(str2, sb.toString());
                throw new IlleagleLicense();
            }
        }
        return nativeModelInit;
    }

    public static synchronized int modelRelease() throws IlleagleLicense, NotInit {
        int nativeRelease;
        synchronized (Predictor.class) {
            if (mAuthorityStatus != 0) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("license error : ");
                sb.append(mAuthorityStatus);
                Log.d(str, sb.toString());
                throw new IlleagleLicense();
            } else if (isInited) {
                nativeRelease = nativeRelease();
            } else {
                Log.d(TAG, "model not init");
                throw new NotInit();
            }
        }
        return nativeRelease;
    }

    public static native int nativeModelInit(String str, Context context);

    public static native Response nativePredict(Object obj, String str, byte[] bArr, int i, int i2);

    public static native int nativeRelease();

    public static synchronized Response predict(Object obj) throws IlleagleLicense, NotInit {
        Response nativePredict;
        synchronized (Predictor.class) {
            if (mAuthorityStatus != 0) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("license error : ");
                sb.append(mAuthorityStatus);
                Log.d(str, sb.toString());
                throw new IlleagleLicense();
            } else if (isInited) {
                nativePredict = nativePredict(obj, "", null, 0, 0);
            } else {
                Log.d(TAG, "model not init");
                throw new NotInit();
            }
        }
        return nativePredict;
    }

    public static synchronized Response predict(String str) throws IlleagleLicense, NotInit, NV21BytesLengthNotMatch {
        Response nativePredict;
        synchronized (Predictor.class) {
            if (mAuthorityStatus != 0) {
                String str2 = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("license error : ");
                sb.append(mAuthorityStatus);
                Log.d(str2, sb.toString());
                throw new IlleagleLicense();
            } else if (isInited) {
                Util.checkFile(str);
                nativePredict = nativePredict(null, str, null, 0, 0);
            } else {
                Log.d(TAG, "model not init");
                throw new NotInit();
            }
        }
        return nativePredict;
    }

    public static synchronized Response predict(byte[] bArr, int i, int i2) throws IlleagleLicense, NotInit, NV21BytesLengthNotMatch {
        Response nativePredict;
        synchronized (Predictor.class) {
            if (mAuthorityStatus != 0) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("license error : ");
                sb.append(mAuthorityStatus);
                Log.d(str, sb.toString());
                throw new IlleagleLicense();
            } else if (!isInited) {
                Log.d(TAG, "model not init");
                throw new NotInit();
            } else if (bArr.length != 0) {
                nativePredict = nativePredict(null, "", bArr, i, i2);
            } else {
                Log.d(TAG, "NV21Bytes Length NotMatch");
                throw new NV21BytesLengthNotMatch();
            }
        }
        return nativePredict;
    }
}
