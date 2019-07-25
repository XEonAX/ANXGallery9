package com.miui.gallery.util.face;

import android.accounts.Account;
import android.content.Context;
import android.util.Log;
import com.miui.account.AccountHelper;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.cloud.HostManager.PeopleFace;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import java.util.ArrayList;
import java.util.Iterator;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONArray;
import org.json.JSONObject;

public class FeedbackIgnoredPeople2Server {
    private static void doFeedback(Context context, Account account, GalleryExtendedAuthToken galleryExtendedAuthToken, String str, ArrayList<String> arrayList) throws Exception {
        if (str != null && arrayList != null && arrayList.size() != 0) {
            String peopleFeedBackUrl = PeopleFace.getPeopleFeedBackUrl();
            ArrayList arrayList2 = new ArrayList();
            arrayList2.add(new BasicNameValuePair("clientOpType", String.valueOf(7)));
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("targetPeopleId", str);
            JSONArray jSONArray = new JSONArray();
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                jSONArray.put((String) it.next());
            }
            jSONObject.put("rejectPeopleIds", jSONArray);
            arrayList2.add(new BasicNameValuePair("data", jSONObject.toString()));
            JSONObject postToXiaomi = CloudUtils.postToXiaomi(peopleFeedBackUrl, arrayList2, null, account, galleryExtendedAuthToken, 3, false);
            String str2 = "FeedbackIgnoredPeople2Server";
            StringBuilder sb = new StringBuilder();
            sb.append("doFeedback peopleId is:");
            sb.append(str);
            sb.append("  json is:");
            sb.append(postToXiaomi == null ? "error" : postToXiaomi.toString());
            Log.d(str2, sb.toString());
        }
    }

    public static void startFeedbackIgnoredPeople2Server(String str, ArrayList<String> arrayList) {
        Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
        Account xiaomiAccount = AccountHelper.getXiaomiAccount(sGetAndroidContext);
        if (xiaomiAccount == null) {
            Log.d("FeedbackIgnoredPeople2Server", "FeedbackIgnoredPeople2Server  account is null");
            return;
        }
        GalleryExtendedAuthToken extToken = CloudUtils.getExtToken(sGetAndroidContext, xiaomiAccount);
        if (extToken == null) {
            Log.d("FeedbackIgnoredPeople2Server", "FeedbackIgnoredPeople2Server  token is null");
            return;
        }
        try {
            doFeedback(sGetAndroidContext, xiaomiAccount, extToken, str, arrayList);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
