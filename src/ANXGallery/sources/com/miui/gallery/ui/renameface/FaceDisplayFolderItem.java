package com.miui.gallery.ui.renameface;

import android.graphics.RectF;
import com.miui.gallery.model.DisplayFolderItem;

/* compiled from: FaceAlbumHandlerBase */
class FaceDisplayFolderItem extends DisplayFolderItem {
    boolean isTip;
    RectF mFacePosRelative;

    public FaceDisplayFolderItem(String str, String str2, String str3, RectF rectF) {
        super(str, str2, str3);
        this.mFacePosRelative = rectF;
    }

    public FaceDisplayFolderItem(boolean z) {
        super("", null, 0, "", "");
        this.isTip = z;
    }
}
