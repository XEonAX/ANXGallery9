package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.Context;
import com.miui.gallery.cloud.GalleryCloudSyncTagUtils.SyncTagItem;
import com.miui.gallery.cloud.HostManager.SyncPull;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.util.deviceprovider.ApplicationHelper;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

public class SyncOwnerAll extends SyncOwnerCloud {
    public SyncOwnerAll(Context context, Account account, GalleryExtendedAuthToken galleryExtendedAuthToken) {
        super(context, account, galleryExtendedAuthToken);
    }

    /* access modifiers changed from: protected */
    public void appendParams(ArrayList<NameValuePair> arrayList, ArrayList<SyncTagItem> arrayList2) throws UnsupportedEncodingException, IllegalBlockSizeException, BadPaddingException {
        super.appendParams(arrayList, arrayList2);
        if (ApplicationHelper.isSecretAlbumFeatureOpen()) {
            arrayList.add(new BasicNameValuePair("returnHiddenData", String.valueOf(true)));
            arrayList.add(new BasicNameValuePair("returnHiddenType", "all"));
        }
        arrayList.add(new BasicNameValuePair("returnSystemAlbum", String.valueOf(true)));
    }

    /* access modifiers changed from: protected */
    public String getSyncUrl() {
        return SyncPull.getPullOwnerAllUrl();
    }
}
