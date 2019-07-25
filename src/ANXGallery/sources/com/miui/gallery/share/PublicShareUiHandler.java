package com.miui.gallery.share;

import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.net.Uri;
import android.os.Handler;
import android.os.Message;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceClickListener;
import android.preference.PreferenceCategory;
import android.preference.PreferenceScreen;
import android.text.TextUtils;
import com.miui.gallery.R;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.share.AlbumShareUIManager.OnCompletionListener;
import com.miui.gallery.threadpool.Future;

public abstract class PublicShareUiHandler {
    protected ShareAlbumBaseActivity mActivity;
    protected String mAlbumId;
    private String mAlbumName;
    protected CloudSharerMediaSet mCloudSingleMediaSet;
    protected Future<?> mFuturePublic;
    private final Handler mHandler = new Handler() {
        public void handleMessage(Message message) {
            PublicShareUiHandler.this.updateProgressBarDirectly(message.arg1);
        }
    };
    protected PreferenceCategory mPublicPreference;
    private DescriptPreference mPublicUrlDescriptPreference;
    private PreferenceScreen mSendPublicUrlPreference;
    protected PreferenceCategory mSharersPreference;

    public PublicShareUiHandler(ShareAlbumBaseActivity shareAlbumBaseActivity, String str, CloudSharerMediaSet cloudSharerMediaSet) {
        this.mActivity = shareAlbumBaseActivity;
        this.mAlbumName = str;
        this.mCloudSingleMediaSet = cloudSharerMediaSet;
    }

    /* JADX WARNING: type inference failed for: r2v0, types: [com.miui.gallery.share.ShareAlbumBaseActivity, android.app.Activity] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v0, types: [com.miui.gallery.share.ShareAlbumBaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.share.ShareAlbumBaseActivity]
  uses: [android.app.Activity]
  mth insns count: 12
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
    private void sendPublicPreference(String str) {
        this.mSendPublicUrlPreference.setIntent(PhoneShareAlbumProvider.getInstance().getShareUrlIntent(this.mActivity, this.mAlbumName, "", str, true));
        this.mPublicPreference.addPreference(this.mSendPublicUrlPreference);
    }

    /* access modifiers changed from: private */
    public void updateProgressBarDirectly(int i) {
        if (i == 1) {
            this.mSharersPreference.setSummary(R.string.loading_members);
        } else {
            this.mSharersPreference.setSummary(null);
        }
    }

    /* access modifiers changed from: 0000 */
    public void initPreferences() {
        this.mSharersPreference = (PreferenceCategory) this.mActivity.findPreference("sharers");
        this.mSharersPreference.setTitle(this.mActivity.getString(R.string.album_member, new Object[]{""}));
        this.mPublicPreference = (PreferenceCategory) this.mActivity.findPreference("public_share");
        this.mSendPublicUrlPreference = (PreferenceScreen) this.mActivity.findPreference("send_public_url");
    }

    public void onDestroy() {
        if (this.mFuturePublic != null) {
            this.mFuturePublic.cancel();
        }
    }

    /* access modifiers changed from: protected */
    public abstract Future<?> requestPublicUrl(String str, OnCompletionListener<Void, String> onCompletionListener);

    /* access modifiers changed from: 0000 */
    public void updateProgressBar(int i) {
        this.mHandler.removeMessages(1);
        if (i != 1) {
            this.mHandler.sendMessageDelayed(Message.obtain(this.mHandler, 1, i, 0), 2000);
            return;
        }
        updateProgressBarDirectly(i);
    }

    /* JADX WARNING: type inference failed for: r0v2, types: [android.content.Context, com.miui.gallery.share.ShareAlbumBaseActivity] */
    /* access modifiers changed from: protected */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v2, types: [android.content.Context, com.miui.gallery.share.ShareAlbumBaseActivity]
  assigns: [com.miui.gallery.share.ShareAlbumBaseActivity]
  uses: [android.content.Context]
  mth insns count: 44
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
    public void updatePublicPreference(boolean z, final String str) {
        if (z) {
            if (this.mSendPublicUrlPreference != null) {
                sendPublicPreference(str);
            }
            if (this.mPublicUrlDescriptPreference == null) {
                this.mPublicUrlDescriptPreference = new DescriptPreference(this.mActivity, null);
                this.mPublicUrlDescriptPreference.setKey("public_url_descript");
                this.mPublicUrlDescriptPreference.setDescriptTitle((int) R.string.public_url_descript);
            }
            if (!TextUtils.isEmpty(str)) {
                this.mPublicUrlDescriptPreference.setDescriptDetail(str);
                this.mPublicUrlDescriptPreference.setDescriptDetailVisibility(0);
                this.mPublicUrlDescriptPreference.setOnPreferenceClickListener(new OnPreferenceClickListener() {
                    public boolean onPreferenceClick(Preference preference) {
                        Intent intent = new Intent();
                        intent.setAction("android.intent.action.VIEW");
                        intent.setData(Uri.parse(str));
                        try {
                            PublicShareUiHandler.this.mActivity.startActivity(intent);
                        } catch (ActivityNotFoundException unused) {
                        }
                        return false;
                    }
                });
            }
            if (this.mPublicPreference.findPreference("public_url_descript") == null) {
                this.mPublicPreference.addPreference(this.mPublicUrlDescriptPreference);
                return;
            }
            return;
        }
        if (this.mSendPublicUrlPreference != null) {
            this.mPublicPreference.removePreference(this.mSendPublicUrlPreference);
        }
        if (this.mPublicUrlDescriptPreference != null) {
            this.mPublicPreference.removePreference(this.mPublicUrlDescriptPreference);
        }
    }

    /* access modifiers changed from: 0000 */
    public void updateSharers(int i) {
        if (!CloudUtils.isValidAlbumId(this.mAlbumId)) {
            return;
        }
        if (i > 0) {
            PreferenceCategory preferenceCategory = this.mSharersPreference;
            ShareAlbumBaseActivity shareAlbumBaseActivity = this.mActivity;
            StringBuilder sb = new StringBuilder();
            sb.append("(");
            sb.append(i);
            sb.append(")");
            preferenceCategory.setTitle(shareAlbumBaseActivity.getString(R.string.album_member, new Object[]{sb.toString()}));
            return;
        }
        this.mSharersPreference.setTitle(this.mActivity.getString(R.string.album_member, new Object[]{""}));
    }
}
