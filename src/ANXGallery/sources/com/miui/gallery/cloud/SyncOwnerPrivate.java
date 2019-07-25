package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.Context;
import android.text.TextUtils;
import com.miui.gallery.cloud.GalleryCloudSyncTagUtils.SyncTagItem;
import com.miui.gallery.cloud.HostManager.SyncPull;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONObject;

public final class SyncOwnerPrivate extends SyncOwnerCloud {
    private String mSyncIgnoreTag = String.valueOf(0);
    private long mSyncTag = 0;

    public SyncOwnerPrivate(Context context, Account account, GalleryExtendedAuthToken galleryExtendedAuthToken) {
        super(context, account, galleryExtendedAuthToken);
    }

    /* access modifiers changed from: protected */
    public void appendParams(ArrayList<NameValuePair> arrayList, ArrayList<SyncTagItem> arrayList2) throws UnsupportedEncodingException, IllegalBlockSizeException, BadPaddingException {
        arrayList.add(new BasicNameValuePair("returnHiddenType", "all"));
    }

    /* access modifiers changed from: protected */
    public void appendSyncInfo(ArrayList<NameValuePair> arrayList, ArrayList<SyncTagItem> arrayList2) throws UnsupportedEncodingException, IllegalBlockSizeException, BadPaddingException {
        arrayList.add(new BasicNameValuePair("syncIgnoreTag", this.mSyncIgnoreTag));
    }

    /* access modifiers changed from: protected */
    public ArrayList<SyncTagItem> getCurrentSyncTag() {
        ArrayList<SyncTagItem> syncTagList = getSyncTagList();
        if (!(syncTagList == null || syncTagList.size() == 0)) {
            ((SyncTagItem) syncTagList.get(0)).currentValue = this.mSyncTag;
        }
        return syncTagList;
    }

    /* access modifiers changed from: protected */
    public String getSyncUrl() {
        return SyncPull.getPullOwnerPrivateUrl();
    }

    /* access modifiers changed from: protected */
    public void updateSyncInfo(JSONObject jSONObject, ArrayList<SyncTagItem> arrayList) {
        String optString = jSONObject.optString("syncIgnoreTag");
        if (!TextUtils.isEmpty(optString)) {
            this.mSyncIgnoreTag = optString;
        }
    }

    /* access modifiers changed from: protected */
    public void updateSyncTag(ArrayList<SyncTagItem> arrayList) {
        if (arrayList != null && arrayList.size() != 0) {
            this.mSyncTag = ((SyncTagItem) arrayList.get(0)).serverValue;
        }
    }
}
