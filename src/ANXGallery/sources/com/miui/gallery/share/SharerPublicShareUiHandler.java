package com.miui.gallery.share;

import android.text.TextUtils;
import com.miui.gallery.share.AlbumShareUIManager.OnCompletionListener;
import com.miui.gallery.threadpool.Future;

public class SharerPublicShareUiHandler extends PublicShareUiHandler {
    public SharerPublicShareUiHandler(ShareAlbumBaseActivity shareAlbumBaseActivity, String str, CloudSharerMediaSet cloudSharerMediaSet) {
        super(shareAlbumBaseActivity, str, cloudSharerMediaSet);
    }

    private void tryToRequestPublicUrl() {
        if (this.mFuturePublic == null || this.mFuturePublic.isDone() || this.mFuturePublic.isCancelled()) {
            this.mFuturePublic = requestPublicUrl(this.mAlbumId, new OnCompletionListener<Void, String>() {
                public void onCompletion(Void voidR, String str, int i, boolean z) {
                    if (!z && i == 0 && str != null) {
                        SharerPublicShareUiHandler.this.updatePublicPreference(!TextUtils.isEmpty(str), str);
                    }
                }
            });
        }
    }

    /* access modifiers changed from: protected */
    public void initPreferences() {
        super.initPreferences();
        tryToRequestPublicUrl();
    }

    /* access modifiers changed from: protected */
    public final Future<?> requestPublicUrl(String str, OnCompletionListener<Void, String> onCompletionListener) {
        return AlbumShareUIManager.requestPublicUrlForSharerAsync(str, onCompletionListener);
    }
}
