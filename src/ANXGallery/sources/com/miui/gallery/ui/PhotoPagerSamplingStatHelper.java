package com.miui.gallery.ui;

import android.net.Uri;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import java.util.ArrayList;

public class PhotoPagerSamplingStatHelper {
    private static Uri mEditorSavedUri;

    public static void onDestroy() {
        mEditorSavedUri = null;
    }

    public static void onEditorSaved(Uri uri) {
        mEditorSavedUri = uri;
    }

    public static void onImageShared(ArrayList<Uri> arrayList) {
        if (MiscUtil.isValid(arrayList)) {
            if (arrayList.size() == 1 && mEditorSavedUri != null && mEditorSavedUri.equals(arrayList.get(0))) {
                Log.d("PhotoPagerSamplingStatHelper", "User share the photo after edit.");
                GallerySamplingStatHelper.recordCountEvent("photo", "photo_share_after_edit");
            }
            mEditorSavedUri = null;
        }
    }
}
