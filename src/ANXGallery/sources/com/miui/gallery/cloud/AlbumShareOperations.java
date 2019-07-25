package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.ContentProviderOperation;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.OperationApplicationException;
import android.database.Cursor;
import android.net.Uri;
import android.os.RemoteException;
import android.os.SystemClock;
import android.text.TextUtils;
import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import com.miui.account.AccountHelper;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloud.HostManager.AlbumShareOperation;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.cloud.base.SyncRequest.Builder;
import com.miui.gallery.cloud.base.SyncType;
import com.miui.gallery.preference.GalleryPreferences.CTA;
import com.miui.gallery.util.AsyncResult;
import com.miui.gallery.util.GalleryUtils;
import com.miui.gallery.util.GalleryUtils.ConcatConverter;
import com.miui.gallery.util.StaticContext;
import com.miui.gallery.util.SyncLog;
import com.miui.gallery.util.SyncUtil;
import com.miui.gallery.util.deviceprovider.ApplicationHelper;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.Callable;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class AlbumShareOperations {
    private static UserInfo sSelf;

    /* access modifiers changed from: private */
    public static void addNameValuePair(List<NameValuePair> list, String str, String str2, GalleryExtendedAuthToken galleryExtendedAuthToken) throws IllegalBlockSizeException, BadPaddingException, UnsupportedEncodingException {
        list.add(new BasicNameValuePair(str, str2));
    }

    /* access modifiers changed from: private */
    public static void collectAllUserId(ContentResolver contentResolver, Uri uri, String str, Collection<String> collection) {
        Cursor query = contentResolver.query(CloudUtils.getCloudDistinctUri(uri), new String[]{str}, null, null, null);
        if (query != null) {
            while (query.moveToNext()) {
                try {
                    collection.add(String.valueOf(query.getLong(0)));
                } finally {
                    query.close();
                }
            }
        }
    }

    /* access modifiers changed from: private */
    public static List<UserInfo> doRequestUserInfo(List<String> list) throws BadPaddingException, IllegalBlockSizeException, IOException, GalleryMiCloudServerException, JSONException {
        ArrayList newArrayList = Lists.newArrayList();
        if (!CTA.canConnectNetwork()) {
            return newArrayList;
        }
        Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
        Account xiaomiAccount = AccountHelper.getXiaomiAccount(sGetAndroidContext);
        if (xiaomiAccount == null) {
            return newArrayList;
        }
        GalleryExtendedAuthToken extToken = CloudUtils.getExtToken(sGetAndroidContext, xiaomiAccount);
        if (extToken == null) {
            return newArrayList;
        }
        String requestUserInfoUrl = AlbumShareOperation.getRequestUserInfoUrl();
        ArrayList arrayList = new ArrayList();
        arrayList.add(new BasicNameValuePair("users", GalleryUtils.concatAll(list, ",")));
        JSONObject postToXiaomi = CloudUtils.postToXiaomi(requestUserInfoUrl, arrayList, null, xiaomiAccount, extToken, 0, false);
        if (CheckResult.parseErrorCode(postToXiaomi) == 0) {
            JSONArray jSONArray = postToXiaomi.getJSONObject("data").getJSONArray("list");
            for (int i = 0; i < jSONArray.length(); i++) {
                JSONObject jSONObject = jSONArray.getJSONObject(i);
                String string = jSONObject.getString("userId");
                if (!TextUtils.isEmpty(string)) {
                    UserInfo userInfo = new UserInfo(string);
                    userInfo.setAliasNick(jSONObject.optString("aliasNick"));
                    userInfo.setMiliaoNick(jSONObject.optString("nickname"));
                    userInfo.setMiliaoIconUrl(jSONObject.optString("icon"));
                    newArrayList.add(userInfo);
                }
            }
        }
        return newArrayList;
    }

    private static <V> AsyncResult<V> execute(Callable<AsyncResult<V>> callable) {
        AsyncResult<V> create;
        String str;
        StringBuilder sb;
        long uptimeMillis = SystemClock.uptimeMillis();
        String methodName = new Throwable().getStackTrace()[1].getMethodName();
        StringBuilder sb2 = new StringBuilder();
        sb2.append("start callable: ");
        sb2.append(methodName);
        SyncLog.d("AlbumShareOperations", sb2.toString());
        if (!ApplicationHelper.supportShare()) {
            return AsyncResult.create(-1);
        }
        try {
            create = (AsyncResult) callable.call();
            str = "AlbumShareOperations";
            sb = new StringBuilder();
        } catch (Throwable th) {
            StringBuilder sb3 = new StringBuilder();
            sb3.append("end callable: ");
            sb3.append(methodName);
            sb3.append(", cost time=");
            sb3.append(SystemClock.uptimeMillis() - uptimeMillis);
            SyncLog.d("AlbumShareOperations", sb3.toString());
            throw th;
        }
        sb.append("end callable: ");
        sb.append(methodName);
        sb.append(", cost time=");
        sb.append(SystemClock.uptimeMillis() - uptimeMillis);
        SyncLog.d(str, sb.toString());
        SyncLog.d("AlbumShareOperations", String.format("result error=%d", new Object[]{Integer.valueOf(create.mError)}));
        return create;
    }

    /* access modifiers changed from: private */
    public static void insertUserInfoToDB(ContentResolver contentResolver, Uri uri, List<UserInfo> list) {
        ArrayList newArrayList = Lists.newArrayList();
        for (UserInfo userInfo : list) {
            newArrayList.add(ContentProviderOperation.newInsert(GalleryCloudUtils.USER_INFO_URI).withValue("user_id", userInfo.getUserId()).withValue("alias_nick", userInfo.getAliasNick()).withValue("miliao_nick", userInfo.getMiliaoNick()).withValue("miliao_icon_url", userInfo.getMiliaoIconUrl()).build());
            if (newArrayList.size() > 100) {
                try {
                    contentResolver.applyBatch("com.miui.gallery.cloud.provider", newArrayList);
                } catch (RemoteException e) {
                    e.printStackTrace();
                } catch (OperationApplicationException e2) {
                    e2.printStackTrace();
                } catch (Throwable th) {
                    newArrayList.clear();
                    throw th;
                }
                newArrayList.clear();
            }
        }
        if (!newArrayList.isEmpty()) {
            try {
                contentResolver.applyBatch("com.miui.gallery.cloud.provider", newArrayList);
            } catch (RemoteException e3) {
                e3.printStackTrace();
            } catch (OperationApplicationException e4) {
                e4.printStackTrace();
            }
        }
    }

    public static String myName() {
        UserInfo self = self();
        return self != null ? self.getDisplayName() : GalleryCloudUtils.getAccountName();
    }

    /* access modifiers changed from: private */
    public static void persisitCache(String str, String str2, String str3, String str4, int i) {
        if (!TextUtils.isEmpty(str4)) {
            ContentResolver contentResolver = GalleryApp.sGetAndroidContext().getContentResolver();
            ContentValues contentValues = new ContentValues();
            contentValues.put(str2, str4);
            contentValues.put(str3, Long.valueOf(System.currentTimeMillis() + ((long) i)));
            if (contentResolver.update(GalleryCloudUtils.CLOUD_CACHE_URI, contentValues, "serverId=?", new String[]{str}) == 0) {
                contentValues.put("serverId", str);
                contentResolver.insert(GalleryCloudUtils.CLOUD_CACHE_URI, contentValues);
            }
        }
    }

    /* access modifiers changed from: private */
    public static String readCache(String str, String str2, String str3, int i) {
        Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
        long currentTimeMillis = System.currentTimeMillis();
        Cursor query = sGetAndroidContext.getContentResolver().query(CloudUtils.getLimitUri(GalleryCloudUtils.CLOUD_CACHE_URI, 1), new String[]{str2}, String.format(Locale.US, "(%s=?) AND (%s<%d) AND (%s>%d) AND (%s)", new Object[]{"serverId", str3, Long.valueOf(((long) i) + currentTimeMillis), str3, Long.valueOf(currentTimeMillis), CloudUtils.sqlNotEmptyStr(str2)}), new String[]{str}, null);
        if (query == null) {
            return null;
        }
        try {
            if (query.moveToFirst()) {
                return query.getString(0);
            }
            query.close();
            return null;
        } finally {
            query.close();
        }
    }

    public static AsyncResult<String> requestPublicUrl(final String str, final boolean z) {
        return execute(new Callable<AsyncResult<String>>() {
            public AsyncResult<String> call() throws Exception {
                if (!CTA.canConnectNetwork()) {
                    return AsyncResult.create(-11);
                }
                Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
                Account xiaomiAccount = AccountHelper.getXiaomiAccount(sGetAndroidContext);
                if (xiaomiAccount == null) {
                    return AsyncResult.create(-4);
                }
                GalleryExtendedAuthToken extToken = CloudUtils.getExtToken(sGetAndroidContext, xiaomiAccount);
                if (extToken == null) {
                    return AsyncResult.create(-3);
                }
                String sharerRequestPublicUrl = z ? AlbumShareOperation.getSharerRequestPublicUrl() : AlbumShareOperation.getOwnerRequestPublicUrl(str);
                ArrayList arrayList = new ArrayList();
                if (z) {
                    arrayList.add(new BasicNameValuePair("sharedAlbumId", str));
                }
                JSONObject fromXiaomi = CloudUtils.getFromXiaomi(sharerRequestPublicUrl, arrayList, xiaomiAccount, extToken, 0, false);
                int parseErrorCode = CheckResult.parseErrorCode(fromXiaomi);
                if (parseErrorCode != 0) {
                    return AsyncResult.create(parseErrorCode);
                }
                String optString = fromXiaomi.getJSONObject("data").optString("url");
                AlbumShareOperations.savePublicInfo(str, !TextUtils.isEmpty(optString), optString, z);
                return AsyncResult.create(0, optString);
            }
        });
    }

    private static void requestSyncToHandleUnauthorized() {
        SyncUtil.requestSync(StaticContext.sGetAndroidContext(), new Builder().setSyncType(SyncType.NORMAL).setSyncReason(16).build());
    }

    public static AsyncResult<String> requestUrlForBarcode(final String str) {
        return execute(new Callable<AsyncResult<String>>() {
            public AsyncResult<String> call() throws Exception {
                String access$000 = AlbumShareOperations.readCache(str, "barcodeData", "barcodeDataDeadline", 43200000);
                if (!TextUtils.isEmpty(access$000)) {
                    return AsyncResult.create(0, access$000);
                }
                if (!CTA.canConnectNetwork()) {
                    return AsyncResult.create(-11);
                }
                Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
                Account xiaomiAccount = AccountHelper.getXiaomiAccount(sGetAndroidContext);
                if (xiaomiAccount == null) {
                    return AsyncResult.create(-4);
                }
                GalleryExtendedAuthToken extToken = CloudUtils.getExtToken(sGetAndroidContext, xiaomiAccount);
                if (extToken == null) {
                    return AsyncResult.create(-3);
                }
                String myName = AlbumShareOperations.myName();
                if (TextUtils.isEmpty(myName)) {
                    return AsyncResult.create(-5);
                }
                String barcodeShareUrl = AlbumShareOperation.getBarcodeShareUrl(str);
                ArrayList newArrayList = Lists.newArrayList();
                AlbumShareOperations.addNameValuePair(newArrayList, "userName", myName, extToken);
                JSONObject postToXiaomi = CloudUtils.postToXiaomi(barcodeShareUrl, newArrayList, null, xiaomiAccount, extToken, 0, false);
                int parseErrorCode = CheckResult.parseErrorCode(postToXiaomi);
                if (parseErrorCode != 0) {
                    return AsyncResult.create(parseErrorCode);
                }
                String string = postToXiaomi.getJSONObject("data").getString("url");
                if (!TextUtils.isEmpty(string)) {
                    AlbumShareOperations.persisitCache(str, "barcodeData", "barcodeDataDeadline", string, 43200000);
                }
                SyncLog.d("AlbumShareOperations", "request barcode url success.");
                return AsyncResult.create(0, string);
            }
        });
    }

    public static AsyncResult<List<UserInfo>> requestUserInfo(final List<String> list) {
        return execute(new Callable<AsyncResult<List<UserInfo>>>() {
            public AsyncResult<List<UserInfo>> call() throws Exception {
                ArrayList newArrayList = Lists.newArrayList();
                int i = 0;
                while (i < list.size()) {
                    int i2 = i + 20;
                    List access$500 = AlbumShareOperations.doRequestUserInfo(list.subList(i, Math.min(list.size(), i2)));
                    if (access$500 != null) {
                        newArrayList.addAll(access$500);
                    }
                    i = i2;
                }
                return AsyncResult.create(0, newArrayList);
            }
        });
    }

    public static void resetAccountInfo() {
        synchronized (AlbumShareOperations.class) {
            sSelf = null;
        }
    }

    /* access modifiers changed from: private */
    public static void savePublicInfo(String str, boolean z, String str2, boolean z2) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("isPublic", Boolean.valueOf(z));
        contentValues.put("publicUrl", str2);
        Uri uri = z2 ? GalleryCloudUtils.SHARE_ALBUM_URI : GalleryCloudUtils.CLOUD_URI;
        StringBuilder sb = new StringBuilder();
        sb.append(z2 ? "albumId" : "serverId");
        sb.append(" = ? ");
        GalleryUtils.safeUpdate(uri, contentValues, sb.toString(), new String[]{str});
    }

    private static synchronized UserInfo self() {
        UserInfo userInfo;
        synchronized (AlbumShareOperations.class) {
            if (sSelf == null) {
                Account xiaomiAccount = AccountHelper.getXiaomiAccount(GalleryApp.sGetAndroidContext());
                if (xiaomiAccount != null) {
                    ArrayList newArrayList = Lists.newArrayList();
                    newArrayList.add(xiaomiAccount.name);
                    AsyncResult requestUserInfo = requestUserInfo(newArrayList);
                    if (requestUserInfo != null && requestUserInfo.mError == 0) {
                        List list = (List) requestUserInfo.mData;
                        if (list != null && !list.isEmpty()) {
                            UserInfo userInfo2 = (UserInfo) list.get(0);
                            sSelf = userInfo2;
                            if (userInfo2 != null) {
                                ContentValues contentValues = new ContentValues();
                                contentValues.put("user_id", userInfo2.getUserId());
                                contentValues.put("alias_nick", userInfo2.getAliasNick());
                                contentValues.put("miliao_nick", userInfo2.getMiliaoNick());
                                contentValues.put("miliao_icon_url", userInfo2.getMiliaoIconUrl());
                                synchronized (GalleryCloudUtils.USER_INFO_URI) {
                                    if (GalleryUtils.safeUpdate(GalleryCloudUtils.USER_INFO_URI, contentValues, "user_id=?", new String[]{sSelf.getUserId()}) == 0) {
                                        GalleryUtils.safeInsert(GalleryCloudUtils.USER_INFO_URI, contentValues);
                                    }
                                }
                            }
                        }
                    }
                }
            }
            userInfo = sSelf;
        }
        return userInfo;
    }

    public static AsyncResult<Void> syncAllUserInfoFromNetwork() {
        return execute(new Callable<AsyncResult<Void>>() {
            public AsyncResult<Void> call() throws Exception {
                ContentResolver contentResolver = GalleryApp.sGetAndroidContext().getContentResolver();
                HashSet newHashSet = Sets.newHashSet();
                AlbumShareOperations.collectAllUserId(contentResolver, GalleryCloudUtils.CLOUD_USER_URI, "userId", newHashSet);
                AlbumShareOperations.collectAllUserId(contentResolver, GalleryCloudUtils.SHARE_USER_URI, "userId", newHashSet);
                String accountName = GalleryCloudUtils.getAccountName();
                if (!TextUtils.isEmpty(accountName)) {
                    newHashSet.add(accountName);
                }
                synchronized (GalleryCloudUtils.USER_INFO_URI) {
                    GalleryUtils.safeDelete(GalleryCloudUtils.USER_INFO_URI, String.format("%s NOT IN (%s)", new Object[]{"user_id", GalleryUtils.concatAll(newHashSet, ",")}), null);
                }
                long currentTimeMillis = System.currentTimeMillis();
                Cursor query = contentResolver.query(GalleryCloudUtils.USER_INFO_URI, new String[]{"user_id"}, String.format("(%s<?)AND(%s>?)", new Object[]{"date_modified", "date_modified"}), new String[]{String.valueOf(currentTimeMillis), String.valueOf(currentTimeMillis - 86400000)}, null);
                if (query != null) {
                    while (query.moveToNext()) {
                        try {
                            newHashSet.remove(String.valueOf(query.getString(0)));
                        } finally {
                            query.close();
                        }
                    }
                }
                if (!newHashSet.isEmpty()) {
                    ArrayList newArrayList = Lists.newArrayList();
                    newArrayList.addAll(newHashSet);
                    AsyncResult requestUserInfo = AlbumShareOperations.requestUserInfo(newArrayList);
                    if (requestUserInfo != null && requestUserInfo.mError == 0) {
                        List list = (List) requestUserInfo.mData;
                        if (list != null && !list.isEmpty()) {
                            String concatAll = GalleryUtils.concatAll(list, ",", new ConcatConverter<UserInfo>() {
                                public String convertToString(UserInfo userInfo) {
                                    return userInfo.getUserId();
                                }
                            });
                            synchronized (GalleryCloudUtils.USER_INFO_URI) {
                                int safeDelete = GalleryUtils.safeDelete(GalleryCloudUtils.USER_INFO_URI, String.format("%s IN (%s)", new Object[]{"user_id", concatAll}), null);
                                AlbumShareOperations.insertUserInfoToDB(contentResolver, GalleryCloudUtils.USER_INFO_URI, list);
                                SyncLog.d("AlbumShareOperations", String.format("syncAllUserNameFromNetwork: delete=%d, insert=%d", new Object[]{Integer.valueOf(safeDelete), Integer.valueOf(list.size())}));
                            }
                        }
                    }
                }
                return AsyncResult.create(0);
            }
        });
    }
}
