package com.miui.gallery.listener;

import android.view.View;
import android.view.View.OnClickListener;

public abstract class SingleClickListener implements OnClickListener {
    private int mId = -1;
    private long mLastClickTime = 0;

    public void onClick(View view) {
        long currentTimeMillis = System.currentTimeMillis();
        int id = view.getId();
        if (this.mId != id) {
            this.mId = id;
            this.mLastClickTime = currentTimeMillis;
            onSingleClick(view);
            return;
        }
        if (currentTimeMillis - this.mLastClickTime > 1000) {
            this.mLastClickTime = currentTimeMillis;
            onSingleClick(view);
        }
    }

    /* access modifiers changed from: protected */
    public abstract void onSingleClick(View view);
}
