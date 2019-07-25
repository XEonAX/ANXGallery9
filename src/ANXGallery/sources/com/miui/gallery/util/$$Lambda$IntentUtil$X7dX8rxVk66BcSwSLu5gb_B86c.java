package com.miui.gallery.util;

import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.util.MovieLibraryLoaderHelper.DownloadStartListener;

/* renamed from: com.miui.gallery.util.-$$Lambda$IntentUtil$X7d-X8rxVk66BcSwSLu5gb_B86c reason: invalid class name */
/* compiled from: lambda */
public final /* synthetic */ class $$Lambda$IntentUtil$X7dX8rxVk66BcSwSLu5gb_B86c implements DownloadStartListener {
    public static final /* synthetic */ $$Lambda$IntentUtil$X7dX8rxVk66BcSwSLu5gb_B86c INSTANCE = new $$Lambda$IntentUtil$X7dX8rxVk66BcSwSLu5gb_B86c();

    private /* synthetic */ $$Lambda$IntentUtil$X7dX8rxVk66BcSwSLu5gb_B86c() {
    }

    public final void onDownloadStart() {
        ToastUtils.makeText(GalleryApp.sGetAndroidContext(), (int) R.string.photo_movie_module_loading);
    }
}
