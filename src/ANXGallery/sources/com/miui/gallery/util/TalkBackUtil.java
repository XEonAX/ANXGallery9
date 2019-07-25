package com.miui.gallery.util;

import android.content.Context;
import android.text.TextUtils;
import android.view.View;
import com.miui.gallery.R;
import com.miui.gallery.data.LocationManager;
import miui.date.DateUtils;

public class TalkBackUtil {
    public static String getContentDescriptionForImage(Context context, long j, String str, String str2) {
        if (context == null || str2 == null) {
            return null;
        }
        return getContentDescriptionForImage(context, j, str, FileMimeUtil.isVideoFromMimeType(str2));
    }

    public static String getContentDescriptionForImage(Context context, long j, String str, boolean z) {
        if (context == null) {
            return null;
        }
        String generateTitleLine = LocationManager.getInstance().generateTitleLine(str);
        String formatDateTime = DateUtils.formatDateTime(j, 942);
        if (!TextUtils.isEmpty(generateTitleLine)) {
            return context.getString(z ? R.string.video_with_time_and_location : R.string.image_with_time_and_location, new Object[]{formatDateTime, generateTitleLine});
        }
        return context.getString(z ? R.string.video_with_time : R.string.image_with_time, new Object[]{formatDateTime});
    }

    public static void requestAnnouncementEvent(View view, String str) {
        if (view != null && !TextUtils.isEmpty(str)) {
            view.announceForAccessibility(str);
        }
    }
}
