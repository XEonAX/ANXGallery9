package miui.os;

import android.text.TextUtils;
import java.io.File;

public class ExtraFileUtils {
    public static String getExtension(File file) {
        return file == null ? "" : getExtension(file.getName());
    }

    public static String getExtension(String str) {
        if (TextUtils.isEmpty(str)) {
            return "";
        }
        int lastIndexOf = str.lastIndexOf(".");
        return lastIndexOf > -1 ? str.substring(lastIndexOf + 1) : "";
    }

    public static String getFileName(String str) {
        if (TextUtils.isEmpty(str)) {
            return "";
        }
        int lastIndexOf = str.lastIndexOf(File.separator);
        return lastIndexOf > -1 ? str.substring(lastIndexOf + 1) : str;
    }

    public static String getFileTitle(String str) {
        if (TextUtils.isEmpty(str)) {
            return "";
        }
        int lastIndexOf = str.lastIndexOf(".");
        return lastIndexOf > -1 ? str.substring(0, lastIndexOf) : str;
    }
}
