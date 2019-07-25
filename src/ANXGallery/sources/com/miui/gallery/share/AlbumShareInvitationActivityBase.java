package com.miui.gallery.share;

import android.app.Activity;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.os.Bundle;
import java.lang.ref.WeakReference;

public class AlbumShareInvitationActivityBase extends Activity {

    protected static class OnBlockMessageCancelled implements OnCancelListener {
        private final WeakReference<Activity> mActivityRef;

        public OnBlockMessageCancelled(Activity activity) {
            this.mActivityRef = new WeakReference<>(activity);
        }

        public void onCancel(DialogInterface dialogInterface) {
            Activity activity = (Activity) this.mActivityRef.get();
            if (activity != null) {
                activity.finish();
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        getWindow().setBackgroundDrawableResource(17170445);
    }
}
