package com.miui.gallery.share;

import android.app.Activity;
import android.app.NotificationManager;
import android.content.ActivityNotFoundException;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.cloud.base.SyncRequest.Builder;
import com.miui.gallery.cloud.base.SyncType;
import com.miui.gallery.provider.ShareAlbumManager;
import com.miui.gallery.share.AlbumShareInvitationReceiver.AddListener;
import com.miui.gallery.share.AlbumShareUIManager.BlockMessage;
import com.miui.gallery.share.AlbumShareUIManager.OnCompletionListener;
import com.miui.gallery.util.StaticContext;
import com.miui.gallery.util.SyncUtil;
import java.lang.ref.WeakReference;

public class AlbumShareInvitationHandler {

    private static class AbsListener {
        protected final WeakReference<Activity> mActivityRef;
        protected final boolean mFinishActivity;

        public AbsListener(Activity activity, boolean z) {
            this.mActivityRef = new WeakReference<>(activity);
            this.mFinishActivity = z;
        }

        protected static void removeNotification() {
            ((NotificationManager) GalleryApp.sGetAndroidContext().getSystemService("notification")).cancel(1);
        }

        /* access modifiers changed from: protected */
        public void tryToFinishActivity() {
            if (this.mFinishActivity) {
                Activity activity = (Activity) this.mActivityRef.get();
                if (activity != null) {
                    activity.finish();
                }
            }
        }
    }

    private static class AcceptListener extends AbsListener implements OnCompletionListener<Path, Long> {
        public AcceptListener(Activity activity, boolean z) {
            super(activity, z);
        }

        public void onCompletion(Path path, Long l, int i, boolean z) {
            removeNotification();
            if (i == -1003) {
                tryToFinishActivity();
                return;
            }
            if (z) {
                UIHelper.toast((int) R.string.cancel_hint);
            } else {
                UIHelper.toastError(i);
            }
            if (i == -4) {
                Activity activity = (Activity) this.mActivityRef.get();
                if (activity != null) {
                    AlbumShareInvitationHandler.startCloudPage(activity);
                }
            } else {
                if (i != 0) {
                    path = (i != -10 || l == null || l.longValue() == 0) ? null : CloudSharerMediaSet.buildPathById(l.longValue());
                }
                if (path != null) {
                    Activity activity2 = (Activity) this.mActivityRef.get();
                    if (activity2 != null) {
                        AlbumShareInvitationHandler.startShareAlbumView(activity2, path);
                    }
                }
            }
            tryToFinishActivity();
        }
    }

    private static class AlreadyApplyListener extends AbsListener implements OnCancelListener, OnClickListener {
        private final Path mPath;

        public AlreadyApplyListener(Activity activity, Path path, boolean z) {
            super(activity, z);
            this.mPath = path;
        }

        public void onCancel(DialogInterface dialogInterface) {
            removeNotification();
            tryToFinishActivity();
        }

        public void onClick(DialogInterface dialogInterface, int i) {
            removeNotification();
            tryToFinishActivity();
            if (i == -1) {
                Activity activity = (Activity) this.mActivityRef.get();
                if (activity != null) {
                    AlbumShareInvitationHandler.startShareAlbumView(activity, this.mPath);
                }
            }
        }
    }

    private static class ApplyListener extends AbsListener implements OnCompletionListener<Path, Void> {
        private boolean mNeedAlert;

        public ApplyListener(Activity activity, boolean z, boolean z2) {
            super(activity, z);
            this.mNeedAlert = z2;
        }

        public void onCompletion(Path path, Void voidR, int i, boolean z) {
            if (this.mNeedAlert) {
                UIHelper.toastError(i);
            }
            Activity activity = (Activity) this.mActivityRef.get();
            if (activity == null) {
                return;
            }
            if (i != -9) {
                activity.finish();
            } else if (this.mNeedAlert) {
                new AlreadyApplyListener(activity, path, this.mFinishActivity);
            } else {
                removeNotification();
                tryToFinishActivity();
                AlbumShareInvitationHandler.startShareAlbumView(activity, path);
            }
        }
    }

    private static class CancelListener extends AbsListener implements OnCancelListener {
        public CancelListener(Activity activity, boolean z) {
            super(activity, z);
        }

        public void onCancel(DialogInterface dialogInterface) {
            tryToFinishActivity();
        }
    }

    private static class DenyListener extends AbsListener implements OnCompletionListener<Path, Void> {
        public DenyListener(Activity activity, boolean z) {
            super(activity, z);
        }

        public void onCompletion(Path path, Void voidR, int i, boolean z) {
            removeNotification();
            tryToFinishActivity();
        }
    }

    public static void acceptShareInvitation(Activity activity, Path path) {
        AlbumShareUIManager.tryToAccept(path, activity, new AcceptListener(activity, true), new CancelListener(activity, true), null);
    }

    public static void acceptShareInvitation(final Activity activity, String str, int i, final BlockMessage blockMessage) {
        AlbumShareInvitationReceiver.handleInvitation(str, i, (String) null, (String) null, new AddListener(i, new OnCompletionListener<Path, String>() {
            public void onCompletion(Path path, String str, int i, boolean z) {
                if ((i != 0 || str == null) && i != -9) {
                    UIHelper.toastError(activity, i);
                    activity.finish();
                    return;
                }
                AlbumShareUIManager.applyToShareAlbum(activity, path, new ApplyListener(activity, true, false), new AcceptListener(activity, true), null, new CancelListener(activity, true), blockMessage, false);
            }
        }));
    }

    public static void applyToShareAlbum(Activity activity, Path path, boolean z, BlockMessage blockMessage) {
        AlbumShareUIManager.applyToShareAlbum(activity, path, new ApplyListener(activity, z, true), new AcceptListener(activity, z), new DenyListener(activity, z), new CancelListener(activity, z), blockMessage, true);
    }

    /* access modifiers changed from: private */
    public static void startCloudPage(Activity activity) {
        Intent intent = new Intent("com.miui.gallery.action.VIEW_ALBUM");
        intent.setFlags(67108864);
        try {
            activity.startActivity(intent);
        } catch (ActivityNotFoundException unused) {
        }
    }

    /* access modifiers changed from: private */
    public static void startShareAlbumView(Activity activity, Path path) {
        Intent intent = new Intent(!TextUtils.isEmpty(path.getMediaSet().getSharerInfo()) ? "com.miui.gallery.action.VIEW_SHARED_BABY_ALBUM" : "com.miui.gallery.action.VIEW_SHARED_ALBUM");
        intent.setFlags(268435456);
        intent.putExtra("album_id", ShareAlbumManager.getUniformAlbumId(path.getId()));
        intent.putExtra("album_name", path.getMediaSet().getDisplayName());
        intent.putExtra("other_share_album", true);
        try {
            activity.startActivity(intent);
            SyncUtil.requestSync(StaticContext.sGetAndroidContext(), new Builder().setSyncType(SyncType.NORMAL).setSyncReason(17).build());
        } catch (ActivityNotFoundException unused) {
        }
    }
}
