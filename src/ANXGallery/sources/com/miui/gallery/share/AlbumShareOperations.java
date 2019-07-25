package com.miui.gallery.share;

import android.accounts.Account;
import android.content.ContentProviderOperation;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.OperationApplicationException;
import android.database.Cursor;
import android.graphics.RectF;
import android.net.Uri;
import android.os.RemoteException;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Base64;
import android.util.Pair;
import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import com.miui.account.AccountHelper;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloud.CheckResult;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.cloud.CreateGroupItem;
import com.miui.gallery.cloud.GalleryCloudUtils;
import com.miui.gallery.cloud.GalleryMiCloudServerException;
import com.miui.gallery.cloud.HostManager.AlbumShareOperation;
import com.miui.gallery.cloud.NetworkUtils;
import com.miui.gallery.cloud.RequestCloudItem;
import com.miui.gallery.cloud.ServerErrorCode;
import com.miui.gallery.cloud.SyncOwnerUserForAlbum;
import com.miui.gallery.cloud.SyncSharerUserForAlbum;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.cloud.base.GallerySyncCode;
import com.miui.gallery.cloud.base.GallerySyncResult;
import com.miui.gallery.cloud.base.SyncRequest.Builder;
import com.miui.gallery.cloud.base.SyncType;
import com.miui.gallery.data.DBImage;
import com.miui.gallery.lib.MiuiGalleryUtils;
import com.miui.gallery.preference.GalleryPreferences.CTA;
import com.miui.gallery.share.AlbumShareUIManager.OnCompletionListener;
import com.miui.gallery.util.GalleryUtils;
import com.miui.gallery.util.GalleryUtils.ConcatConverter;
import com.miui.gallery.util.StaticContext;
import com.miui.gallery.util.SyncLog;
import com.miui.gallery.util.SyncUtil;
import com.miui.gallery.util.deviceprovider.ApplicationHelper;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.Callable;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.keyczar.Keyczar;

public class AlbumShareOperations {
    private static UserInfo sSelf;

    public static final class IncomingInvitation {
        private String mAlbumName;
        private boolean mHasSharerInfo;
        private String mOwnerName;

        IncomingInvitation(List<NameValuePair> list) {
            for (NameValuePair nameValuePair : list) {
                if ("albumName".equals(nameValuePair.getName())) {
                    this.mAlbumName = AlbumShareOperations.decode(nameValuePair.getValue());
                } else if ("userName".equals(nameValuePair.getName())) {
                    this.mOwnerName = AlbumShareOperations.decode(nameValuePair.getValue());
                } else if ("sharerInfo".equals(nameValuePair.getName())) {
                    this.mHasSharerInfo = TextUtils.equals("true", nameValuePair.getValue());
                }
                if (this.mAlbumName != null && this.mOwnerName != null && this.mHasSharerInfo) {
                    return;
                }
            }
        }

        public String getAlbumName() {
            return this.mAlbumName;
        }

        public String getOwnerName() {
            return this.mOwnerName;
        }

        public boolean hasSharerInfo() {
            return this.mHasSharerInfo;
        }
    }

    public static final class OutgoingInvitation {
        private final String mDescription;
        private final String mUrl;

        public OutgoingInvitation(String str, String str2) {
            this.mDescription = str;
            this.mUrl = str2;
        }

        public static OutgoingInvitation fromCache(String str) {
            try {
                JSONObject jSONObject = new JSONObject(str);
                return new OutgoingInvitation(jSONObject.getString("text"), jSONObject.getString("url"));
            } catch (JSONException unused) {
                return null;
            }
        }

        public String getDescription() {
            return this.mDescription;
        }

        public String getUrl() {
            return this.mUrl;
        }

        public String toCache() {
            JSONObject jSONObject = new JSONObject();
            try {
                jSONObject.put("text", this.mDescription);
                jSONObject.put("url", this.mUrl);
                return jSONObject.toString();
            } catch (JSONException unused) {
                return null;
            }
        }

        public String toMessage() {
            StringBuilder sb = new StringBuilder();
            sb.append(this.mDescription);
            sb.append(this.mUrl);
            return sb.toString();
        }
    }

    public static final class SharerInfo {
        public final String mAlbumNickName;
        public final RectF mFaceRelativePos;
        public final String mOwnerRelationText;
        public final String mSharerRelationText;
        public final String mThumbnailUrl;

        SharerInfo(String str) throws JSONException {
            JSONObject jSONObject = new JSONObject(str);
            this.mAlbumNickName = jSONObject.getString("albumNickName");
            this.mOwnerRelationText = jSONObject.getString("ownerRelationText");
            this.mSharerRelationText = jSONObject.getString("sharerRelationText");
            this.mThumbnailUrl = jSONObject.optString("thumbnail");
            JSONObject optJSONObject = jSONObject.optJSONObject("thumbnailFaceInfo");
            if (optJSONObject != null) {
                float f = (float) optJSONObject.getDouble("faceXScale");
                float f2 = (float) optJSONObject.getDouble("faceYScale");
                this.mFaceRelativePos = new RectF(f, f2, ((float) optJSONObject.getDouble("faceWScale")) + f, ((float) optJSONObject.getDouble("faceHScale")) + f2);
                return;
            }
            this.mFaceRelativePos = null;
        }
    }

    public static AsyncResult<Long> acceptInvitation(final ContentResolver contentResolver, final String str, final CloudSharerMediaSet cloudSharerMediaSet) {
        return execute(new Callable<AsyncResult<Long>>() {
            public AsyncResult<Long> call() throws Exception {
                if (!CTA.canConnectNetwork()) {
                    return AsyncResult.create(-11);
                }
                ArrayList access$900 = AlbumShareOperations.requestInvitationDetail(contentResolver, str, cloudSharerMediaSet);
                if (access$900 == null) {
                    return AsyncResult.create(-1001);
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
                String acceptInvitationUrl = AlbumShareOperation.getAcceptInvitationUrl();
                ArrayList newArrayList = Lists.newArrayList();
                Iterator it = access$900.iterator();
                while (it.hasNext()) {
                    NameValuePair nameValuePair = (NameValuePair) it.next();
                    AlbumShareOperations.addNameValuePair(newArrayList, nameValuePair.getName(), nameValuePair.getValue(), extToken);
                }
                JSONObject postToXiaomi = CloudUtils.postToXiaomi(acceptInvitationUrl, newArrayList, null, xiaomiAccount, extToken, 0, false);
                int parseErrorCode = CheckResult.parseErrorCode(postToXiaomi);
                if (parseErrorCode != 0) {
                    AlbumShareOperations.deleteInvitationIfInvalid(contentResolver, parseErrorCode, str);
                    return AsyncResult.create(parseErrorCode);
                }
                JSONObject jSONObject = postToXiaomi.getJSONObject("data");
                String string = jSONObject.getString("shareId");
                String string2 = jSONObject.getString("creatorId");
                int i = -2;
                long j = 0;
                if (!TextUtils.isEmpty(string)) {
                    Uri uri = GalleryCloudUtils.SHARE_ALBUM_URI;
                    synchronized (uri) {
                        long itemId = CloudUtils.getItemId(uri, "albumId", string);
                        if (itemId == 0) {
                            ContentValues contentValues = new ContentValues();
                            contentValues.put("albumStatus", "normal");
                            contentValues.put("albumId", string);
                            contentValues.put("creatorId", string2);
                            contentResolver.update(uri, contentValues, String.format("%s=? AND %s=?", new Object[]{"shareUrl", "albumStatus"}), new String[]{str, "invited"});
                            j = CloudUtils.getItemId(uri, "albumId", string);
                            i = 0;
                        } else {
                            ContentValues contentValues2 = new ContentValues();
                            contentValues2.put("sharerInfo", cloudSharerMediaSet.getSharerInfo());
                            contentResolver.update(uri, contentValues2, String.format("%s=?", new Object[]{"albumId"}), new String[]{string});
                            contentResolver.delete(uri, String.format("%s=? AND %s=?", new Object[]{"shareUrl", "albumStatus"}), new String[]{str, "invited"});
                            j = itemId;
                            i = -10;
                        }
                    }
                }
                AlbumShareUIManager.syncUserListForAlbumAsync(string, true, new OnCompletionListener<Void, Void>() {
                    public void onCompletion(Void voidR, Void voidR2, int i, boolean z) {
                        AlbumShareUIManager.syncAllUserInfoFromNetworkAsync(null);
                    }
                });
                return AsyncResult.create(i, Long.valueOf(j));
            }
        });
    }

    public static long addInvitation(String str) {
        Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
        synchronized (GalleryCloudUtils.SHARE_ALBUM_URI) {
            long itemId = CloudUtils.getItemId(GalleryCloudUtils.SHARE_ALBUM_URI, "shareUrl", str);
            if (itemId != 0) {
                return itemId;
            }
            ContentValues contentValues = new ContentValues(2);
            contentValues.put("shareUrl", str);
            contentValues.put("albumStatus", "invited");
            contentValues.put("fileName", "");
            Uri insert = sGetAndroidContext.getContentResolver().insert(GalleryCloudUtils.SHARE_ALBUM_URI, contentValues);
            if (insert == null) {
                SyncLog.e("AlbumShareOperations", "Insert invitation error.");
                return 0;
            }
            long longValue = Long.valueOf(insert.getLastPathSegment()).longValue();
            return longValue;
        }
    }

    /* access modifiers changed from: private */
    public static void addNameValuePair(List<NameValuePair> list, String str, String str2, GalleryExtendedAuthToken galleryExtendedAuthToken) throws IllegalBlockSizeException, BadPaddingException, UnsupportedEncodingException {
        list.add(new BasicNameValuePair(str, str2));
    }

    public static AsyncResult<String> changePublicStatus(final String str, final boolean z) {
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
                String changePublicUrl = AlbumShareOperation.getChangePublicUrl(str);
                ArrayList newArrayList = Lists.newArrayList();
                AlbumShareOperations.addNameValuePair(newArrayList, "isPublic", String.valueOf(z), extToken);
                JSONObject postToXiaomi = CloudUtils.postToXiaomi(changePublicUrl, newArrayList, null, xiaomiAccount, extToken, 0, false);
                int parseErrorCode = CheckResult.parseErrorCode(postToXiaomi);
                if (parseErrorCode != 0) {
                    return AsyncResult.create(parseErrorCode);
                }
                String optString = postToXiaomi.getJSONObject("data").optString("url");
                AlbumShareOperations.savePublicInfo(str, z, optString, false);
                return AsyncResult.create(0, optString);
            }
        });
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
    public static String decode(String str) {
        if (TextUtils.isEmpty(str)) {
            return str;
        }
        try {
            return new String(Base64.decode(str, 8), Keyczar.DEFAULT_ENCODING);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void deleteInvitationIfInvalid(ContentResolver contentResolver, int i, String str) {
        if (i == 50019 || i == 50025 || i == 50030 || i == 50012) {
            contentResolver.delete(GalleryCloudUtils.SHARE_ALBUM_URI, String.format("%s=? AND %s=?", new Object[]{"shareUrl", "albumStatus"}), new String[]{str, "invited"});
        }
    }

    public static AsyncResult<Pair<List<String>, List<String>>> deleteSharers(final ContentResolver contentResolver, final String str, final List<String> list) {
        return execute(new Callable<AsyncResult<Pair<List<String>, List<String>>>>() {
            public AsyncResult<Pair<List<String>, List<String>>> call() throws Exception {
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
                ArrayList newArrayList = Lists.newArrayList();
                ArrayList newArrayList2 = Lists.newArrayList();
                int i = 0;
                while (i < list.size()) {
                    int i2 = i + 50;
                    Pair access$500 = AlbumShareOperations.doDeleteSharers(contentResolver, str, list.subList(i, Math.min(list.size(), i2)), xiaomiAccount, extToken);
                    if (access$500 != null) {
                        newArrayList.addAll((Collection) access$500.first);
                        newArrayList2.addAll((Collection) access$500.second);
                    }
                    i = i2;
                }
                return AsyncResult.create(0, Pair.create(newArrayList, newArrayList2));
            }
        });
    }

    public static AsyncResult<Void> denyInvitation(final ContentResolver contentResolver, final String str, final CloudSharerMediaSet cloudSharerMediaSet) {
        return execute(new Callable<AsyncResult<Void>>() {
            public AsyncResult<Void> call() throws Exception {
                if (!CTA.canConnectNetwork()) {
                    return AsyncResult.create(-11);
                }
                ArrayList access$900 = AlbumShareOperations.requestInvitationDetail(contentResolver, str, cloudSharerMediaSet);
                if (access$900 == null) {
                    return AsyncResult.create(-1001);
                }
                String refuseInvitationUrl = AlbumShareOperation.getRefuseInvitationUrl();
                ArrayList newArrayList = Lists.newArrayList();
                Iterator it = access$900.iterator();
                while (it.hasNext()) {
                    NameValuePair nameValuePair = (NameValuePair) it.next();
                    AlbumShareOperations.addNameValuePair(newArrayList, nameValuePair.getName(), nameValuePair.getValue(), null);
                }
                int parseErrorCode = CheckResult.parseErrorCode(CloudUtils.postToXiaomi(refuseInvitationUrl, newArrayList, null, null, null, 0, false));
                if (ServerErrorCode.isClientError(parseErrorCode)) {
                    return AsyncResult.create(parseErrorCode);
                }
                contentResolver.delete(GalleryCloudUtils.SHARE_ALBUM_URI, String.format("%s=? AND %s=?", new Object[]{"shareUrl", "albumStatus"}), new String[]{str, "invited"});
                return AsyncResult.create(parseErrorCode);
            }
        });
    }

    /* access modifiers changed from: private */
    public static Pair<List<String>, List<String>> doDeleteSharers(ContentResolver contentResolver, String str, List<String> list, Account account, GalleryExtendedAuthToken galleryExtendedAuthToken) throws IllegalBlockSizeException, BadPaddingException, JSONException, IOException, GalleryMiCloudServerException {
        String deleteSharerUrl = AlbumShareOperation.getDeleteSharerUrl(str);
        ArrayList newArrayList = Lists.newArrayList();
        addNameValuePair(newArrayList, "sharerIdList", GalleryUtils.concatAll(list, ","), galleryExtendedAuthToken);
        JSONObject postToXiaomi = CloudUtils.postToXiaomi(deleteSharerUrl, newArrayList, null, account, galleryExtendedAuthToken, 0, false);
        if (CheckResult.parseErrorCode(postToXiaomi) != 0) {
            return null;
        }
        JSONObject jSONObject = postToXiaomi.getJSONObject("data");
        JSONArray jSONArray = jSONObject.getJSONArray("succ");
        JSONArray jSONArray2 = jSONObject.getJSONArray("fail");
        ArrayList newArrayList2 = Lists.newArrayList();
        ArrayList newArrayList3 = Lists.newArrayList();
        for (int i = 0; i < jSONArray.length(); i++) {
            newArrayList2.add(jSONArray.getString(i));
        }
        for (int i2 = 0; i2 < jSONArray2.length(); i2++) {
            newArrayList3.add(jSONArray2.getString(i2));
        }
        if (!newArrayList2.isEmpty()) {
            int delete = contentResolver.delete(GalleryCloudUtils.CLOUD_USER_URI, "userId in (?) AND albumId = ?", new String[]{GalleryUtils.concatAll(newArrayList2, ","), str});
            StringBuilder sb = new StringBuilder();
            sb.append("Local delete count=");
            sb.append(delete);
            sb.append(", Server delete count=");
            sb.append(newArrayList2.size());
            SyncLog.d("AlbumShareOperations", sb.toString());
        }
        return Pair.create(newArrayList2, newArrayList3);
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
        AsyncResult<V> asyncResult;
        SystemClock.uptimeMillis();
        new Throwable().getStackTrace()[1].getMethodName();
        if (!ApplicationHelper.supportShare()) {
            return AsyncResult.create(-1);
        }
        try {
            asyncResult = (AsyncResult) callable.call();
        } catch (Throwable th) {
            int fromThrowable = ServerErrorCode.fromThrowable(th);
            if (fromThrowable == -105 && ((GalleryMiCloudServerException) th).getStatusCode() == 401) {
                requestSyncToHandleUnauthorized();
            }
            StringBuilder sb = new StringBuilder();
            sb.append("Error code=");
            sb.append(fromThrowable);
            SyncLog.e("AlbumShareOperations", sb.toString(), th);
            asyncResult = AsyncResult.create(fromThrowable);
        }
        SyncLog.d("AlbumShareOperations", String.format("result error=%d", new Object[]{Integer.valueOf(asyncResult.mError)}));
        return asyncResult;
    }

    public static AsyncResult<Void> exitAlbumShare(final String str, final String str2) {
        return execute(new Callable<AsyncResult<Void>>() {
            public AsyncResult<Void> call() throws Exception {
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
                String exitShareUrl = AlbumShareOperation.getExitShareUrl();
                ArrayList arrayList = new ArrayList();
                arrayList.add(new BasicNameValuePair("sharedAlbumId", str));
                int parseErrorCode = CheckResult.parseErrorCode(CloudUtils.postToXiaomi(exitShareUrl, arrayList, null, xiaomiAccount, extToken, 0, false));
                if (parseErrorCode == 0) {
                    CloudUtils.deleteShareAlbumInLocal(str, str2);
                }
                SyncLog.d("AlbumShareOperations", "exit share album success.");
                return AsyncResult.create(parseErrorCode);
            }
        });
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

    public static IncomingInvitation parseInvitation(String str) {
        ArrayList parseParamsFromUrl = parseParamsFromUrl(str);
        if (parseParamsFromUrl != null) {
            return new IncomingInvitation(parseParamsFromUrl);
        }
        return null;
    }

    private static ArrayList<NameValuePair> parseParamsFromUrl(String str) {
        String[] split;
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        ArrayList<NameValuePair> newArrayList = Lists.newArrayList();
        int indexOf = str.indexOf("?");
        if (indexOf >= 0) {
            for (String str2 : str.substring(indexOf + 1).split("&")) {
                int indexOf2 = str2.indexOf("=");
                if (indexOf2 > 0) {
                    newArrayList.add(new BasicNameValuePair(str2.substring(0, indexOf2), str2.substring(indexOf2 + 1)));
                }
            }
        }
        return newArrayList;
    }

    /* access modifiers changed from: private */
    public static String parseRedirectLocation(Map<String, List<String>> map) {
        String str = null;
        if (map == null) {
            return null;
        }
        List list = (List) map.get("Location");
        if (list != null && !list.isEmpty()) {
            str = (String) list.get(0);
        }
        return str;
    }

    public static SharerInfo parseSharerInfo(String str) {
        try {
            return new SharerInfo(str);
        } catch (JSONException e) {
            SyncLog.e("AlbumShareOperations", "parseSharerInfo error.", e);
            return null;
        }
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

    /* access modifiers changed from: private */
    /* JADX WARNING: Removed duplicated region for block: B:22:0x0064  */
    public static Map<String, List<String>> requestHeaders(String str) throws MalformedURLException, IOException {
        HttpURLConnection httpURLConnection;
        Throwable th;
        try {
            httpURLConnection = (HttpURLConnection) new URL(str).openConnection();
            try {
                httpURLConnection.setInstanceFollowRedirects(false);
                httpURLConnection.setConnectTimeout(30000);
                httpURLConnection.setReadTimeout(30000);
                httpURLConnection.setUseCaches(false);
                httpURLConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
                httpURLConnection.setRequestProperty("User-Agent", ApplicationHelper.getMiCloudProvider().getCloudManager().getUserAgent());
                httpURLConnection.setDoInput(true);
                httpURLConnection.setRequestMethod("GET");
                httpURLConnection.connect();
                int responseCode = httpURLConnection.getResponseCode();
                if (responseCode == 301 || responseCode == 302) {
                    Map<String, List<String>> headerFields = httpURLConnection.getHeaderFields();
                    if (httpURLConnection != null) {
                        httpURLConnection.disconnect();
                    }
                    return headerFields;
                }
                if (httpURLConnection != null) {
                    httpURLConnection.disconnect();
                }
                return null;
            } catch (Throwable th2) {
                th = th2;
                if (httpURLConnection != null) {
                    httpURLConnection.disconnect();
                }
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            httpURLConnection = null;
            if (httpURLConnection != null) {
            }
            throw th;
        }
    }

    /* access modifiers changed from: private */
    public static ArrayList<NameValuePair> requestInvitationDetail(ContentResolver contentResolver, String str, CloudSharerMediaSet cloudSharerMediaSet) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        ContentResolver contentResolver2 = contentResolver;
        Cursor query = contentResolver2.query(CloudUtils.getLimitUri(GalleryCloudUtils.SHARE_ALBUM_URI, 1), new String[]{"shareUrlLong", "sharerInfo", "shareUrl"}, "shareUrl=?", new String[]{str}, null);
        if (query == null) {
            return null;
        }
        try {
            if (!query.moveToFirst()) {
                return null;
            }
            String string = query.getString(0);
            String string2 = query.getString(1);
            if (TextUtils.isEmpty(string) || TextUtils.isEmpty(string2)) {
                AsyncResult updateInvitation = updateInvitation(contentResolver, str, string2, cloudSharerMediaSet);
                if (updateInvitation != null && updateInvitation.mError == 0) {
                    string = updateInvitation.mData;
                }
            }
            ArrayList<NameValuePair> parseParamsFromUrl = parseParamsFromUrl(string);
            query.close();
            return parseParamsFromUrl;
        } finally {
            query.close();
        }
    }

    public static AsyncResult<OutgoingInvitation> requestInvitationForSms(String str, String str2, String str3, String str4, String str5) {
        final String str6 = str;
        final String str7 = str2;
        final String str8 = str4;
        final String str9 = str5;
        final String str10 = str3;
        AnonymousClass5 r0 = new Callable<AsyncResult<OutgoingInvitation>>() {
            public AsyncResult<OutgoingInvitation> call() throws Exception {
                String access$100 = AlbumShareOperations.readCache(str6, "smsShareData", "smsShareDataDeadline", 43200000);
                if (!TextUtils.isEmpty(access$100)) {
                    OutgoingInvitation fromCache = OutgoingInvitation.fromCache(access$100);
                    if (fromCache != null) {
                        return AsyncResult.create(0, fromCache);
                    }
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
                String smsShareUrl = AlbumShareOperation.getSmsShareUrl(str6);
                ArrayList newArrayList = Lists.newArrayList();
                AlbumShareOperations.addNameValuePair(newArrayList, "userName", myName, extToken);
                if (!TextUtils.isEmpty(str7)) {
                    try {
                        JSONObject jSONObject = new JSONObject();
                        jSONObject.put("ownerRelation", str8);
                        jSONObject.put("ownerRelationText", str9);
                        jSONObject.put("sharerRelation", str7);
                        jSONObject.put("sharerRelationText", str10);
                        AlbumShareOperations.addNameValuePair(newArrayList, "relationShip", jSONObject.toString(), extToken);
                    } catch (JSONException e) {
                        e.printStackTrace();
                        return AsyncResult.create(-7);
                    }
                }
                JSONObject postToXiaomi = CloudUtils.postToXiaomi(smsShareUrl, newArrayList, null, xiaomiAccount, extToken, 0, false);
                int parseErrorCode = CheckResult.parseErrorCode(postToXiaomi);
                if (parseErrorCode != 0) {
                    return AsyncResult.create(parseErrorCode);
                }
                JSONObject jSONObject2 = postToXiaomi.getJSONObject("data");
                OutgoingInvitation outgoingInvitation = new OutgoingInvitation(jSONObject2.getString("text"), jSONObject2.getString("url"));
                if (TextUtils.isEmpty(str7)) {
                    AlbumShareOperations.persisitCache(str6, "smsShareData", "smsShareDataDeadline", outgoingInvitation.toCache(), 43200000);
                }
                SyncLog.d("AlbumShareOperations", "request sms url success.");
                return AsyncResult.create(0, outgoingInvitation);
            }
        };
        return execute(r0);
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

    public static AsyncResult<String> requestSharerInfo(ContentResolver contentResolver, String str, String str2) throws Exception {
        if (TextUtils.isEmpty(str2)) {
            return AsyncResult.create(-7);
        }
        String httpGetRequestForString = NetworkUtils.httpGetRequestForString(String.format("%s&%s=%s", new Object[]{str2, "ability", "baby"}), null);
        if (TextUtils.isEmpty(httpGetRequestForString)) {
            return AsyncResult.create(-7);
        }
        JSONObject jSONObject = new JSONObject(httpGetRequestForString);
        int parseErrorCode = CheckResult.parseErrorCode(jSONObject);
        if (parseErrorCode == 0) {
            String string = jSONObject.getString("data");
            return !TextUtils.isEmpty(string) ? AsyncResult.create(0, string) : AsyncResult.create(-7);
        }
        deleteInvitationIfInvalid(contentResolver, parseErrorCode, str);
        return AsyncResult.create(parseErrorCode);
    }

    private static void requestSyncToHandleUnauthorized() {
        SyncUtil.requestSync(StaticContext.sGetAndroidContext(), new Builder().setSyncType(SyncType.NORMAL).setSyncReason(16).build());
    }

    public static AsyncResult<String> requestUrlForBarcode(final String str) {
        return execute(new Callable<AsyncResult<String>>() {
            public AsyncResult<String> call() throws Exception {
                String access$100 = AlbumShareOperations.readCache(str, "barcodeData", "barcodeDataDeadline", 43200000);
                if (!TextUtils.isEmpty(access$100)) {
                    return AsyncResult.create(0, access$100);
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
                    List access$1000 = AlbumShareOperations.doRequestUserInfo(list.subList(i, Math.min(list.size(), i2)));
                    if (access$1000 != null) {
                        newArrayList.addAll(access$1000);
                    }
                    i = i2;
                }
                return AsyncResult.create(0, newArrayList);
            }
        });
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

    public static AsyncResult<Void> syncUserListForAlbum(final String str, final boolean z) {
        return execute(new Callable<AsyncResult<Void>>() {
            public AsyncResult<Void> call() throws Exception {
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
                if (!NetworkUtils.isNetworkConnected()) {
                    return AsyncResult.create(-6);
                }
                if (z) {
                    new SyncSharerUserForAlbum(sGetAndroidContext, xiaomiAccount, extToken, str).sync();
                } else {
                    new SyncOwnerUserForAlbum(sGetAndroidContext, xiaomiAccount, extToken, str).sync();
                }
                AlbumShareOperations.syncAllUserInfoFromNetwork();
                return AsyncResult.create(0);
            }
        });
    }

    public static AsyncResult<String> tryToCreateCloudAlbum(final String str) {
        return execute(new Callable<AsyncResult<String>>() {
            public AsyncResult<String> call() throws Exception {
                if (!CTA.canConnectNetwork()) {
                    return AsyncResult.create(-11);
                }
                Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
                DBImage item = CloudUtils.getItem(GalleryCloudUtils.CLOUD_URI, sGetAndroidContext, "_id", str);
                if (item == null) {
                    return AsyncResult.create(-2);
                }
                String serverId = item.getServerId();
                if (CloudUtils.isValidAlbumId(serverId)) {
                    return AsyncResult.create(0, serverId);
                }
                Account xiaomiAccount = AccountHelper.getXiaomiAccount(sGetAndroidContext);
                if (xiaomiAccount == null) {
                    return AsyncResult.create(-4);
                }
                GalleryExtendedAuthToken extToken = CloudUtils.getExtToken(sGetAndroidContext, xiaomiAccount);
                if (extToken == null) {
                    return AsyncResult.create(-3);
                }
                GallerySyncResult execute = new CreateGroupItem(sGetAndroidContext).execute(xiaomiAccount, extToken, null, new RequestCloudItem(0, item));
                return (execute == null || execute.code != GallerySyncCode.OK) ? AsyncResult.create(-2) : AsyncResult.create(0, CloudUtils.getItem(GalleryCloudUtils.CLOUD_URI, sGetAndroidContext, "_id", str).getServerId());
            }
        });
    }

    public static AsyncResult<String> updateInvitation(final ContentResolver contentResolver, final String str, final String str2, final CloudSharerMediaSet cloudSharerMediaSet) {
        return execute(new Callable<AsyncResult<String>>() {
            public AsyncResult<String> call() throws Exception {
                AsyncResult<String> asyncResult;
                if (!MiuiGalleryUtils.isAlbumShareUrl(str) || !ApplicationHelper.supportShare()) {
                    return AsyncResult.create(-1000);
                }
                String access$700 = !TextUtils.isEmpty(str2) ? str2 : AlbumShareOperations.parseRedirectLocation(AlbumShareOperations.requestHeaders(str));
                if (TextUtils.isEmpty(access$700)) {
                    return AsyncResult.create(-7);
                }
                ContentValues contentValues = new ContentValues();
                contentValues.put("shareUrlLong", access$700);
                IncomingInvitation parseInvitation = AlbumShareOperations.parseInvitation(access$700);
                if (parseInvitation == null || !parseInvitation.hasSharerInfo()) {
                    asyncResult = AsyncResult.create(0, access$700);
                } else {
                    AsyncResult<String> requestSharerInfo = AlbumShareOperations.requestSharerInfo(contentResolver, str, access$700);
                    if (requestSharerInfo.mError != 0) {
                        return requestSharerInfo;
                    }
                    contentValues.put("sharerInfo", (String) requestSharerInfo.mData);
                    asyncResult = AsyncResult.create(requestSharerInfo.mError, access$700);
                }
                if (parseInvitation != null && !TextUtils.isEmpty(parseInvitation.getAlbumName())) {
                    contentValues.put("fileName", parseInvitation.getAlbumName());
                }
                AlbumShareOperations.updateShareAlbumInfos(contentResolver, str, contentValues, cloudSharerMediaSet);
                return asyncResult;
            }
        });
    }

    /* access modifiers changed from: private */
    public static void updateShareAlbumInfos(ContentResolver contentResolver, String str, ContentValues contentValues, CloudSharerMediaSet cloudSharerMediaSet) {
        cloudSharerMediaSet.setLongUrl(contentValues.getAsString("shareUrlLong"));
        cloudSharerMediaSet.setSharerInfo(contentValues.getAsString("sharerInfo"));
        contentResolver.update(GalleryCloudUtils.SHARE_ALBUM_URI, contentValues, String.format("%s=? AND %s=?", new Object[]{"shareUrl", "albumStatus"}), new String[]{str, "invited"});
    }
}
