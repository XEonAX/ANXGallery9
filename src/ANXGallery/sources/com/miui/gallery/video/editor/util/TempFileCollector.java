package com.miui.gallery.video.editor.util;

import android.content.Context;
import com.miui.gallery.provider.CloudUtils;
import com.miui.gallery.util.Log;
import java.util.Arrays;
import java.util.LinkedList;

public class TempFileCollector {
    private static LinkedList<String> tempFilePaths = new LinkedList<>();

    public static void add(String str) {
        Log.d("TempFileCollector", "add %s", (Object) str);
        tempFilePaths.add(str);
    }

    public static void deleteAllTempFile(Context context) {
        if (tempFilePaths.size() > 0) {
            long currentTimeMillis = System.currentTimeMillis();
            String[] strArr = new String[tempFilePaths.size()];
            tempFilePaths.toArray(strArr);
            tempFilePaths.clear();
            CloudUtils.deleteByPath(context, 56, strArr);
            Log.d("TempFileCollector", "deleteAllTempFile %s, cost %s", Arrays.toString(strArr), Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
        }
    }
}
