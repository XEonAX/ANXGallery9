package com.miui.gallery.ui;

import android.content.Context;
import android.os.Bundle;
import com.miui.gallery.R;
import com.miui.gallery.provider.CloudUtils;
import com.miui.gallery.ui.BaseAlbumOperationDialogFragment.OnAlbumOperationDoneListener;

public class AlbumRenameDialogFragment extends BaseAlbumOperationDialogFragment {
    private long mAlbumId;

    public static AlbumRenameDialogFragment newInstance(long j, String str, OnAlbumOperationDoneListener onAlbumOperationDoneListener) {
        AlbumRenameDialogFragment albumRenameDialogFragment = new AlbumRenameDialogFragment();
        Bundle bundle = new Bundle();
        bundle.putLong("key_album_id", j);
        bundle.putString("key_album_default_name", str);
        albumRenameDialogFragment.setArguments(bundle);
        albumRenameDialogFragment.setOnAlbumOperationDoneListener(onAlbumOperationDoneListener);
        return albumRenameDialogFragment;
    }

    /* access modifiers changed from: protected */
    public Bundle execAlbumOperation(Context context, String str) {
        return CloudUtils.renameAlbum(context, this.mAlbumId, str);
    }

    /* access modifiers changed from: protected */
    public int getDialogTitle() {
        return R.string.rename_album;
    }

    /* access modifiers changed from: protected */
    public int getOperationFailedString() {
        return R.string.rename_album_failed;
    }

    /* access modifiers changed from: protected */
    public int getOperationSucceededString() {
        return R.string.rename_album_succeeded;
    }

    /* access modifiers changed from: protected */
    public long getResultId(Bundle bundle) {
        if (bundle == null) {
            return -101;
        }
        return bundle.getLong("id", -1);
    }

    /* access modifiers changed from: protected */
    public void parseArguments() {
        Bundle arguments = getArguments();
        this.mAlbumId = arguments.getLong("key_album_id", -1);
        this.mDefaultName = arguments.getString("key_album_default_name");
    }
}
