package com.miui.gallery.util;

import android.text.TextUtils;
import com.miui.gallery.cloudcontrol.CloudControlStrategyHelper;
import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;

public class FileMimeUtil extends BaseFileMimeUtil {
    private static HashMap<String, String> sSupportUploadMimeTypeMap;

    public static String getSupportUploadMimeType(String str) {
        String str2;
        if (!TextUtils.isEmpty(str)) {
            String mimeTypeForFile = MediaFile.getMimeTypeForFile(str);
            if (!TextUtils.isEmpty(mimeTypeForFile) && (isImageFromMimeType(mimeTypeForFile) || isVideoFromMimeType(mimeTypeForFile))) {
                int lastIndexOf = str.lastIndexOf(46);
                if (lastIndexOf >= 0) {
                    String supportedMimeTypeByExt = getSupportedMimeTypeByExt(str.substring(lastIndexOf + 1).toUpperCase(Locale.ROOT));
                    if (supportedMimeTypeByExt != null) {
                        return supportedMimeTypeByExt;
                    }
                    if (isVideoFromMimeType(mimeTypeForFile)) {
                        try {
                            str2 = rawGetMimeType(str, VIDEO_MIMES);
                        } catch (IOException e) {
                            Log.w("BaseFileMimeUtil", (Throwable) e);
                            str2 = supportedMimeTypeByExt;
                        }
                        if (str2 != null) {
                            return str2;
                        }
                    }
                }
            }
        }
        return "*/*";
    }

    private static String getSupportedMimeTypeByExt(String str) {
        if (sSupportUploadMimeTypeMap == null) {
            sSupportUploadMimeTypeMap = CloudControlStrategyHelper.getUploadSupportedFileTypes();
        }
        if (sSupportUploadMimeTypeMap == null) {
            return null;
        }
        return (String) sSupportUploadMimeTypeMap.get(str);
    }
}
