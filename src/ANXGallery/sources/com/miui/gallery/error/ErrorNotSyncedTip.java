package com.miui.gallery.error;

import android.content.Context;
import com.miui.gallery.R;
import com.miui.gallery.cloud.base.SyncRequest.Builder;
import com.miui.gallery.cloud.base.SyncType;
import com.miui.gallery.error.core.ErrorActionCallback;
import com.miui.gallery.error.core.ErrorCode;
import com.miui.gallery.error.core.ErrorTip;
import com.miui.gallery.util.SyncUtil;

public class ErrorNotSyncedTip extends ErrorTip {
    public ErrorNotSyncedTip(ErrorCode errorCode) {
        super(errorCode);
    }

    public void action(Context context, ErrorActionCallback errorActionCallback) {
        SyncUtil.requestSync(context, new Builder().setSyncType(SyncType.NORMAL).setSyncReason(544).build());
        if (errorActionCallback != null) {
            errorActionCallback.onAction(this.mCode, true);
        }
    }

    public CharSequence getActionStr(Context context) {
        return context.getResources().getString(R.string.error_not_synced_action);
    }

    public CharSequence getMessage(Context context) {
        return context.getResources().getString(R.string.error_not_synced_msg);
    }

    public CharSequence getTitle(Context context) {
        return context.getResources().getString(R.string.error_not_synced_tip);
    }
}
