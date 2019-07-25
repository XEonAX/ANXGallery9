package com.miui.gallery.share;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.content.DialogInterface;
import android.os.Bundle;
import android.os.Handler;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import com.google.common.collect.Lists;
import com.miui.gallery.R;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.cloud.GalleryCloudUtils;
import com.miui.gallery.share.AlbumShareUIManager.BlockMessage;
import com.miui.gallery.share.AlbumShareUIManager.OnCompletionListener;
import com.miui.gallery.share.CloudShareAlbumMediator.OnShareAlbumExitedListener;
import com.miui.gallery.share.ShareAlbumBaseActivity.UserCacheDescComparator;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public abstract class ShareAlbumSharerBaseActivity extends ShareAlbumBaseActivity implements OnClickListener, OnShareAlbumExitedListener {
    private Handler mHandler;
    private Button mViewExitShare;

    public static void exitShare(final Activity activity, final String str, final String str2, final Runnable runnable) {
        final AnonymousClass2 r0 = new OnCompletionListener<Path, Void>() {
            public void onCompletion(Path path, Void voidR, int i, boolean z) {
                if (z) {
                    UIHelper.toast((int) R.string.cancel_hint);
                    return;
                }
                if (i == 0) {
                    UIHelper.toast(activity, activity.getString(R.string.exit_share_successfully, new Object[]{activity.getString(R.string.quotation, new Object[]{str2})}));
                    runnable.run();
                } else {
                    UIHelper.toast(activity, activity.getString(R.string.exit_share_failed, new Object[]{activity.getString(R.string.quotation, new Object[]{str2})}));
                }
            }
        };
        final BlockMessage create = BlockMessage.create(activity, null, activity.getString(R.string.exit_share_in_process, new Object[]{str2}), false);
        new Builder(activity).setTitle(R.string.album_share_exit_confirm).setPositiveButton(R.string.exit, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                AlbumShareUIManager.exitAlbumShareAsync(Path.fromString(str), r0, create);
            }
        }).setNegativeButton(17039360, null).show();
    }

    /* access modifiers changed from: protected */
    public void doSyncFromServer(OnCompletionListener<Void, Void> onCompletionListener) {
        getUserCache().syncFromServer(this.mAlbumId, onCompletionListener);
    }

    /* access modifiers changed from: protected */
    public int getContentView() {
        return R.layout.share_album_sharer;
    }

    /* access modifiers changed from: protected */
    public List<CloudUserCacheEntry> getShareUsers() {
        ArrayList newArrayList = Lists.newArrayList();
        newArrayList.addAll(getUserCache().getCloudUserListByAlbumId(this.mAlbumId));
        Collections.sort(newArrayList, new UserCacheDescComparator());
        String str = this.mCreatorId;
        String accountName = GalleryCloudUtils.getAccountName();
        Iterator it = newArrayList.iterator();
        CloudUserCacheEntry cloudUserCacheEntry = null;
        while (it.hasNext()) {
            CloudUserCacheEntry cloudUserCacheEntry2 = (CloudUserCacheEntry) it.next();
            String str2 = cloudUserCacheEntry2.mUserId;
            if (TextUtils.equals(str2, str)) {
                it.remove();
            } else if (TextUtils.equals(str2, accountName)) {
                it.remove();
                cloudUserCacheEntry = cloudUserCacheEntry2;
            }
        }
        if (cloudUserCacheEntry != null) {
            newArrayList.add(0, cloudUserCacheEntry);
        } else {
            CloudUserCacheEntry cloudUserCacheEntry3 = new CloudUserCacheEntry(this.mAlbumId, accountName, 0, null, null, null, null);
            newArrayList.add(0, cloudUserCacheEntry3);
        }
        newArrayList.add(0, getOwnerEntry(str));
        return newArrayList;
    }

    /* access modifiers changed from: protected */
    public CloudUserCache getUserCache() {
        return CloudUserCache.getSharerUserCache();
    }

    /* JADX WARNING: type inference failed for: r3v0, types: [com.miui.gallery.share.ShareAlbumSharerBaseActivity, android.app.Activity] */
    public void onClick(View view) {
        if (view.getId() == R.id.exit_share) {
            exitShare(this, this.mPath, this.mAlbumName, new Runnable() {
                public void run() {
                    ShareAlbumSharerBaseActivity.this.setResult(-1);
                    ShareAlbumSharerBaseActivity.this.finish();
                }
            });
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Invalid view id, id=");
        sb.append(view.getId());
        throw new UnsupportedOperationException(sb.toString());
    }

    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (!isFinishing()) {
            if (!CloudUtils.isValidAlbumId(this.mAlbumId)) {
                finish();
                return;
            }
            this.mViewExitShare = (Button) findViewById(R.id.exit_share);
            this.mViewExitShare.setOnClickListener(this);
            syncFromServer();
            this.mHandler = new Handler();
            CloudShareAlbumMediator.getInstance().addListener(this);
        }
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        super.onDestroy();
        CloudShareAlbumMediator.getInstance().removeListener(this);
    }
}
