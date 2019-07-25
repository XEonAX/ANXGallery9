package com.miui.gallery.share;

import android.content.ActivityNotFoundException;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.lib.MiuiGalleryUtils;
import com.miui.gallery.share.AlbumShareUIManager.OnCompletionListener;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.util.deviceprovider.ApplicationHelper;
import com.nexstreaming.nexeditorsdk.nexExportFormat;

public class AlbumShareInvitationReceiver extends BroadcastReceiver {

    public static class AddListener implements OnCompletionListener<Void, Long> {
        private final int mOpt;
        /* access modifiers changed from: private */
        public final OnCompletionListener<Path, String> mUpdateListener;

        public AddListener(int i, OnCompletionListener<Path, String> onCompletionListener) {
            this.mOpt = i;
            this.mUpdateListener = onCompletionListener;
        }

        public void onCompletion(Void voidR, Long l, int i, boolean z) {
            Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
            int i2 = this.mOpt;
            if (!((i2 & 1) == 0 || l == null)) {
                l.longValue();
            }
            if (!((i2 & 2) == 0 || l == null || l.longValue() == 0)) {
                Intent intent = new Intent("com.miui.gallery.intent.action.CLOUD_VIEW");
                intent.setFlags(268435456);
                try {
                    sGetAndroidContext.startActivity(intent);
                } catch (ActivityNotFoundException unused) {
                }
            }
            if ((i2 & 4) == 0 && (i2 & 16) == 0) {
                if ((i2 & 8) == 0) {
                    return;
                }
                if (l == null || l.longValue() == 0) {
                    UIHelper.toastError(-2);
                } else {
                    AlbumShareInvitationReceiver.openInvitation(CloudSharerMediaSet.buildPathById(l.longValue()), 0);
                }
            } else if (l != null && l.longValue() != 0) {
                final Path buildPathById = CloudSharerMediaSet.buildPathById(l.longValue());
                AlbumShareUIManager.updateShareUrlLongAuto(buildPathById, new OnCompletionListener<Path, Void>() {
                    public void onCompletion(Path path, Void voidR, int i, boolean z) {
                        AddListener.this.mUpdateListener.onCompletion(buildPathById, null, i, z);
                        StringBuilder sb = new StringBuilder();
                        sb.append("updateShareUrlLongAuto: error code=");
                        sb.append(i);
                        Log.d("AlbumShareInvitationReceiver", sb.toString());
                    }
                }, this.mUpdateListener);
            }
        }
    }

    private static class UpdateListener implements OnCompletionListener<Path, String> {
        private UpdateListener() {
        }

        public void onCompletion(Path path, String str, int i, boolean z) {
            if ((i != 0 || str == null) && i != -9) {
                UIHelper.toastError(i);
            } else {
                AlbumShareInvitationReceiver.openInvitation(path, i);
            }
        }
    }

    public static void handleInvitation(String str, int i, String str2, String str3, AddListener addListener) {
        AlbumShareUIManager.addInvitationToDBAsync(str, addListener);
    }

    /* access modifiers changed from: private */
    public static void openInvitation(Path path, int i) {
        Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
        Intent intent = new Intent("com.miui.gallery.intent.action.OPEN_INVIATAION");
        intent.setPackage(sGetAndroidContext.getPackageName());
        intent.putExtra(nexExportFormat.TAG_FORMAT_PATH, path.toString());
        intent.putExtra("error_code", i);
        sGetAndroidContext.sendOrderedBroadcast(intent, null);
    }

    /* access modifiers changed from: protected */
    public void handleInvitation(String str, int i, String str2, String str3, String str4) {
        handleInvitation(str, i, str2, str3, new AddListener(i, new UpdateListener()));
    }

    public void onReceive(Context context, Intent intent) {
        String action = intent.getAction();
        StringBuilder sb = new StringBuilder();
        sb.append("AlbumShareInvitationReceiveronReceive = ");
        sb.append(action);
        Log.d("AlbumShareInvitationReceiver", sb.toString());
        if ("com.miui.gallery.ACTION_ALBUM_SHARE_INVITATION".equals(action)) {
            String stringExtra = intent.getStringExtra("invitation_url");
            String stringExtra2 = intent.getStringExtra("invitation_type");
            String stringExtra3 = intent.getStringExtra("invitation_title");
            String stringExtra4 = intent.getStringExtra("invitation_content");
            int intExtra = intent.getIntExtra("invitation_opt", 5);
            if (MiuiGalleryUtils.isAlbumShareInvitationUrl(stringExtra)) {
                if (!ApplicationHelper.supportShare()) {
                    ToastUtils.makeText(context, (int) R.string.error_share_not_support);
                    return;
                }
                handleInvitation(stringExtra, intExtra, stringExtra2, stringExtra3, stringExtra4);
            }
        }
    }
}
