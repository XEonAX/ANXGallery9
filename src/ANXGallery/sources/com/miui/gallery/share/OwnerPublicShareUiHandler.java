package com.miui.gallery.share;

import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import com.miui.gallery.R;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.share.AlbumShareUIManager.OnCompletionListener;
import com.miui.gallery.threadpool.Future;
import java.util.LinkedList;

public class OwnerPublicShareUiHandler extends PublicShareUiHandler {
    private static long CLICK_PUBLIC_INTERNAL = 60000;
    private static long CLICK_PUBLIC_LIMIT = 10;
    private static LinkedList<Long> sClickTimes;
    /* access modifiers changed from: private */
    public CheckBoxPreference mOpenPublicPreference;
    /* access modifiers changed from: private */
    public PublishProgressPreference mProgressPreference;

    public OwnerPublicShareUiHandler(NormalShareAlbumOwnerActivity normalShareAlbumOwnerActivity, String str, CloudSharerMediaSet cloudSharerMediaSet) {
        super(normalShareAlbumOwnerActivity, str, cloudSharerMediaSet);
    }

    private boolean canClickPublic() {
        long currentTimeMillis = System.currentTimeMillis();
        if (sClickTimes == null) {
            sClickTimes = new LinkedList<>();
            sClickTimes.addLast(Long.valueOf(currentTimeMillis));
            return true;
        } else if (((long) sClickTimes.size()) < CLICK_PUBLIC_LIMIT) {
            sClickTimes.addLast(Long.valueOf(currentTimeMillis));
            return true;
        } else if (currentTimeMillis - ((Long) sClickTimes.getFirst()).longValue() > CLICK_PUBLIC_INTERNAL) {
            sClickTimes.removeFirst();
            sClickTimes.addLast(Long.valueOf(currentTimeMillis));
            return true;
        } else if (currentTimeMillis - ((Long) sClickTimes.getFirst()).longValue() <= CLICK_PUBLIC_INTERNAL && currentTimeMillis - ((Long) sClickTimes.getFirst()).longValue() >= 0 && ((long) sClickTimes.size()) >= CLICK_PUBLIC_LIMIT) {
            return false;
        } else {
            sClickTimes.clear();
            return true;
        }
    }

    /* JADX WARNING: type inference failed for: r2v5, types: [android.content.Context, com.miui.gallery.share.ShareAlbumBaseActivity] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v5, types: [android.content.Context, com.miui.gallery.share.ShareAlbumBaseActivity]
  assigns: [com.miui.gallery.share.ShareAlbumBaseActivity]
  uses: [android.content.Context]
  mth insns count: 43
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    private void tryToChangePublicStatus() {
        if (this.mFuturePublic != null && !this.mFuturePublic.isDone() && !this.mFuturePublic.isCancelled()) {
            this.mPublicPreference.removePreference(this.mProgressPreference);
            if (this.mFuturePublic != null) {
                this.mFuturePublic.cancel();
            }
        } else if (!canClickPublic()) {
            UIHelper.toast((int) R.string.operation_too_often);
            this.mOpenPublicPreference.setChecked(true ^ this.mOpenPublicPreference.isChecked());
        } else {
            if (this.mProgressPreference == null) {
                this.mProgressPreference = new PublishProgressPreference(this.mActivity);
            }
            this.mPublicPreference.addPreference(this.mProgressPreference);
            this.mProgressPreference.setProgress(true, this.mOpenPublicPreference.isChecked());
            this.mFuturePublic = AlbumShareUIManager.changePublicStatusAsync(this.mAlbumId, this.mOpenPublicPreference.isChecked(), new OnCompletionListener<Void, String>() {
                public void onCompletion(Void voidR, String str, int i, boolean z) {
                    OwnerPublicShareUiHandler.this.mPublicPreference.removePreference(OwnerPublicShareUiHandler.this.mProgressPreference);
                    if (!z) {
                        if (i == 0) {
                            OwnerPublicShareUiHandler.this.updatePublicPreference(OwnerPublicShareUiHandler.this.mOpenPublicPreference.isChecked(), str);
                            UIHelper.toast(OwnerPublicShareUiHandler.this.mOpenPublicPreference.isChecked() ? R.string.publish_succeeded : R.string.unpublish_succeeded);
                            OwnerPublicShareUiHandler.this.mOpenPublicPreference.setChecked(OwnerPublicShareUiHandler.this.mOpenPublicPreference.isChecked());
                        } else {
                            OwnerPublicShareUiHandler.this.updatePublicPreference(!OwnerPublicShareUiHandler.this.mOpenPublicPreference.isChecked(), str);
                            UIHelper.toast(OwnerPublicShareUiHandler.this.mOpenPublicPreference.isChecked() ? R.string.publish_failed : R.string.unpublish_failed);
                            OwnerPublicShareUiHandler.this.mOpenPublicPreference.setChecked(!OwnerPublicShareUiHandler.this.mOpenPublicPreference.isChecked());
                        }
                    }
                }
            });
        }
    }

    /* access modifiers changed from: protected */
    public void initPreferences() {
        super.initPreferences();
        this.mOpenPublicPreference = (CheckBoxPreference) this.mActivity.findPreference("open_public_share");
    }

    /* access modifiers changed from: 0000 */
    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        if (!"open_public_share".equals(preference.getKey())) {
            return false;
        }
        tryToChangePublicStatus();
        return true;
    }

    /* access modifiers changed from: protected */
    public final Future<?> requestPublicUrl(String str, OnCompletionListener<Void, String> onCompletionListener) {
        return AlbumShareUIManager.requestPublicUrlForOwnerAsync(str, onCompletionListener);
    }

    /* access modifiers changed from: 0000 */
    public void updateStatus() {
        this.mAlbumId = this.mCloudSingleMediaSet.getAlbumId();
        if (CloudUtils.isValidAlbumId(this.mAlbumId)) {
            updatePublicPreference(this.mCloudSingleMediaSet.isPublic(), this.mCloudSingleMediaSet.getPublicUrl());
            this.mOpenPublicPreference.setChecked(this.mCloudSingleMediaSet.isPublic());
            return;
        }
        updatePublicPreference(false, null);
        this.mOpenPublicPreference.setChecked(false);
    }
}
