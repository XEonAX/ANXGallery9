package com.miui.gallery.ui;

import android.content.Context;
import android.os.Bundle;
import com.miui.gallery.R;
import com.miui.gallery.provider.CloudUtils;

public class AlbumCreatorDialogFragment extends BaseAlbumOperationDialogFragment {
    /* access modifiers changed from: protected */
    public Bundle execAlbumOperation(Context context, String str) {
        return CloudUtils.create(context, str);
    }

    /* access modifiers changed from: protected */
    public int getDialogTitle() {
        return R.string.create_new_album;
    }

    /* access modifiers changed from: protected */
    public int getOperationFailedString() {
        return R.string.create_new_album_failed;
    }

    /* access modifiers changed from: protected */
    public int getOperationSucceededString() {
        return 0;
    }

    /* access modifiers changed from: protected */
    public long getResultId(Bundle bundle) {
        if (bundle == null) {
            return -101;
        }
        return bundle.getLong("id", -1);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
    }

    /* access modifiers changed from: protected */
    public void parseArguments() {
        this.mDefaultName = "";
    }
}
