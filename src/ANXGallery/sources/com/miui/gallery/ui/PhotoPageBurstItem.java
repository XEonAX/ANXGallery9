package com.miui.gallery.ui;

import android.content.Context;
import android.util.AttributeSet;
import com.miui.gallery.error.core.ErrorCode;

public class PhotoPageBurstItem extends PhotoPageImageBaseItem {

    protected class BurstCheckManager extends CheckManager {
        protected BurstCheckManager() {
            super();
        }

        /* access modifiers changed from: protected */
        public boolean originChecked() {
            return true;
        }
    }

    public PhotoPageBurstItem(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    /* access modifiers changed from: protected */
    public CheckManager createCheckManager() {
        return new BurstCheckManager();
    }

    /* access modifiers changed from: protected */
    public void onImageLoadFinish(ErrorCode errorCode) {
        super.onImageLoadFinish(errorCode);
        this.mPhotoView.setInterceptTouch(true);
    }
}
