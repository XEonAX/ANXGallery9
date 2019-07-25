package com.miui.gallery.util.face;

import android.accounts.Account;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.os.Handler;
import android.util.Log;
import com.miui.account.AccountHelper;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloud.CheckResult;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.cloud.HostManager.PeopleFace;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.cloud.peopleface.FaceDataManager;
import com.miui.gallery.preference.GalleryPreferences.CTA;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import org.json.JSONArray;
import org.json.JSONObject;

public class CheckoutRecommendPeople {
    private final Handler mHandler;
    /* access modifiers changed from: private */
    public CheckoutStatusListener mListener;

    public interface CheckoutStatusListener {
        void onFinishCheckoutPeopleFace(int i);
    }

    public CheckoutRecommendPeople(Handler handler, CheckoutStatusListener checkoutStatusListener) {
        this.mHandler = handler;
        this.mListener = checkoutStatusListener;
    }

    /* access modifiers changed from: private */
    public void doGetRecommendPeopleFromNet(Context context, Account account, GalleryExtendedAuthToken galleryExtendedAuthToken, String str) throws Exception {
        JSONObject fromXiaomi = CloudUtils.getFromXiaomi(PeopleFace.getPeopleRecommendUrl(str), null, account, galleryExtendedAuthToken, 0, false);
        String str2 = "syncface";
        StringBuilder sb = new StringBuilder();
        sb.append("doGetRecommendPeopleFromNet peopleId is:");
        sb.append(str);
        sb.append("  json is:");
        sb.append(fromXiaomi == null ? "error" : fromXiaomi.toString());
        Log.d(str2, sb.toString());
        if (CheckResult.parseErrorCode(fromXiaomi) == 0) {
            JSONObject jSONObject = fromXiaomi.getJSONObject("data");
            if (jSONObject.has("recommendPeoples")) {
                JSONArray jSONArray = jSONObject.getJSONArray("recommendPeoples");
                if (jSONArray != null && jSONArray.length() > 0) {
                    ContentValues contentValues = new ContentValues();
                    contentValues.put("peopleServerId", str);
                    contentValues.put("recommendPeoplesJson", fromXiaomi.toString());
                    String str3 = "peopleServerId = ?";
                    String[] strArr = {str};
                    Cursor safeQueryPeopleRecommend = FaceDataManager.safeQueryPeopleRecommend(CloudUtils.getProjectionAll(), str3, strArr);
                    if (safeQueryPeopleRecommend == null || safeQueryPeopleRecommend.getCount() <= 0) {
                        FaceDataManager.safeInsertPeopleRecommend(contentValues);
                    } else {
                        FaceDataManager.safeUpdatePeopleRecommend(contentValues, str3, strArr);
                    }
                    if (safeQueryPeopleRecommend != null) {
                        safeQueryPeopleRecommend.close();
                    }
                    notifyStatus(jSONArray.length());
                }
            }
        }
    }

    private void notifyStatus(final int i) {
        if (this.mListener == null) {
            return;
        }
        if (this.mHandler != null) {
            this.mHandler.post(new Runnable() {
                public void run() {
                    CheckoutRecommendPeople.this.mListener.onFinishCheckoutPeopleFace(i);
                }
            });
        } else {
            this.mListener.onFinishCheckoutPeopleFace(i);
        }
    }

    public void clearListener() {
        this.mListener = null;
    }

    public void getRecommendPeopleFromNet(final String str) {
        ThreadManager.getMiscPool().submit(new Job<Void>() {
            public Void run(JobContext jobContext) {
                if (!CTA.canConnectNetwork()) {
                    Log.d("syncface", "getRecommendPeopleFromNet  cta not allowed");
                    return null;
                }
                Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
                Account xiaomiAccount = AccountHelper.getXiaomiAccount(sGetAndroidContext);
                if (xiaomiAccount == null) {
                    Log.d("syncface", "getRecommendPeopleFromNet  account is null");
                    return null;
                }
                GalleryExtendedAuthToken extToken = CloudUtils.getExtToken(sGetAndroidContext, xiaomiAccount);
                if (extToken == null) {
                    Log.d("syncface", "getRecommendPeopleFromNet  token is null");
                    return null;
                }
                try {
                    CheckoutRecommendPeople.this.doGetRecommendPeopleFromNet(sGetAndroidContext, xiaomiAccount, extToken, str);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return null;
            }
        });
    }
}
