package com.miui.gallery.cloud;

import android.content.ContentValues;
import android.database.Cursor;
import com.google.common.collect.Maps;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloud.SpaceFullHandler.SpaceFullListener;
import com.miui.gallery.cloud.base.GallerySyncCode;
import com.miui.gallery.cloud.base.SyncRequest.Builder;
import com.miui.gallery.cloud.base.SyncType;
import com.miui.gallery.data.DBImage;
import com.miui.gallery.util.GalleryUtils;
import com.miui.gallery.util.SyncLog;
import com.miui.gallery.util.SyncUtil;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.SocketTimeoutException;
import java.net.URISyntaxException;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import org.apache.http.client.ClientProtocolException;
import org.json.JSONException;
import org.json.JSONObject;

public class ServerErrorCode {
    private static final GalleryErrorHandler sAlbumNotEmptyHandler = new GalleryErrorHandler() {
        public void onError(JSONObject jSONObject, RequestItemBase requestItemBase, SpaceFullListener spaceFullListener) {
            SyncLog.e("ServerErrorCode", "special error, album not empty %s", jSONObject == null ? "" : jSONObject.toString());
            if (requestItemBase != null && (requestItemBase instanceof RequestCloudItem)) {
                DBImage dBImage = ((RequestCloudItem) requestItemBase).dbCloud;
                if (!dBImage.isItemType() && dBImage.getLocalFlag() == 2 && !ServerErrorCode.hasDeleteItemsInAGroup(dBImage.getId())) {
                    ServerErrorCode.cancelDeleteGroupOperation(dBImage.getId());
                }
            }
        }
    };
    private static final GalleryErrorHandler sAlbumNotExistsHandler = new GalleryErrorHandler() {
        public void onError(JSONObject jSONObject, RequestItemBase requestItemBase, SpaceFullListener spaceFullListener) {
            SyncLog.e("ServerErrorCode", "special error, album not exist: %s", jSONObject == null ? "" : jSONObject.toString());
            if (requestItemBase != null && (requestItemBase instanceof RequestCloudItem)) {
                DBImage dBImage = ((RequestCloudItem) requestItemBase).dbCloud;
                if ((dBImage.isItemType() || dBImage.getLocalFlag() != 2) && !dBImage.isShareItem() && dBImage.isItemType() && ((dBImage.getLocalFlag() == 6 || dBImage.getLocalFlag() == 9 || dBImage.getLocalFlag() == 8 || dBImage.getLocalFlag() == 5) && !ServerErrorCode.hasUnCreatedGroupInLocalDB(dBImage.getLocalGroupId()))) {
                    SyncLog.d("ServerErrorCode", "this album is need to recreate later %d", (Object) dBImage.getLocalGroupId());
                    CreateGroupItem.recreateGroup(dBImage.getLocalGroupId());
                }
            }
        }
    };
    private static Map<Class<?>, Integer> sExceptionMap = Maps.newHashMap();
    private static final GalleryErrorHandler sGalleryNotFoundHandler = new GalleryErrorHandler() {
        public void onError(JSONObject jSONObject, RequestItemBase requestItemBase, SpaceFullListener spaceFullListener) {
            SyncLog.e("ServerErrorCode", "server can't found this item: %s", jSONObject == null ? "" : jSONObject.toString());
            if (requestItemBase != null && (requestItemBase instanceof RequestCloudItem)) {
                CloudUtils.deleteDirty(((RequestCloudItem) requestItemBase).dbCloud);
            }
        }
    };
    public static final HashMap<Integer, GalleryErrorCodeItem> sGalleryServerErrors = new HashMap<>();
    private static final GalleryErrorHandler sNoErrorHandler = new GalleryErrorHandler() {
        public void onError(JSONObject jSONObject, RequestItemBase requestItemBase, SpaceFullListener spaceFullListener) {
            if (spaceFullListener != null) {
                spaceFullListener.handleSpaceNotFull((RequestCloudItem) requestItemBase);
            }
        }
    };
    private static final GalleryErrorHandler sNotRetryErrorHandler = new GalleryErrorHandler() {
        public void onError(JSONObject jSONObject, RequestItemBase requestItemBase, SpaceFullListener spaceFullListener) throws JSONException {
            SyncLog.e("ServerErrorCode", "not retry error: %s", jSONObject == null ? "" : jSONObject.toString());
        }
    };
    private static final GalleryErrorHandler sRetryErrorHandler = new GalleryErrorHandler() {
        public void onError(JSONObject jSONObject, RequestItemBase requestItemBase, SpaceFullListener spaceFullListener) throws JSONException {
            if (requestItemBase != null && jSONObject.has("data")) {
                JSONObject jSONObject2 = jSONObject.getJSONObject("data");
                if (jSONObject2.has("retryAfter")) {
                    requestItemBase.retryAfter = CloudUtils.getLongAttributeFromJson(jSONObject2, "retryAfter");
                }
            }
            SyncLog.e("ServerErrorCode", "retry error: %s", jSONObject == null ? "" : jSONObject.toString());
        }
    };
    private static final GalleryErrorHandler sSpaceFullHandler = new GalleryErrorHandler() {
        public void onError(JSONObject jSONObject, RequestItemBase requestItemBase, SpaceFullListener spaceFullListener) {
            SyncLog.e("ServerErrorCode", "not retry error, gallery space full %s", jSONObject == null ? "" : jSONObject.toString());
            if (spaceFullListener != null) {
                spaceFullListener.handleSpaceFullError((RequestCloudItem) requestItemBase);
            }
        }
    };

    public static class ExceptionWithErrorCode extends Error {
        private static final long serialVersionUID = 1;
        public final int mErrorCode;
    }

    public static class GalleryErrorCodeItem {
        int code;
        GalleryErrorHandler errorHandler;
        GallerySyncCode result;

        public GalleryErrorCodeItem(int i, GallerySyncCode gallerySyncCode, GalleryErrorHandler galleryErrorHandler) {
            this.code = i;
            this.result = gallerySyncCode;
            this.errorHandler = galleryErrorHandler;
        }
    }

    public interface GalleryErrorHandler {
        void onError(JSONObject jSONObject, RequestItemBase requestItemBase, SpaceFullListener spaceFullListener) throws JSONException;
    }

    public static class MiCloudServerExceptionHandler {
        private static Exception sMicloudServerException;

        public static synchronized void checkMiCloudServerException() throws GalleryMiCloudServerException {
            synchronized (MiCloudServerExceptionHandler.class) {
                if (hasMiCloudServerException()) {
                    Exception miCloudServerException = getMiCloudServerException();
                    cleanMiCloudServerException();
                    throw new GalleryMiCloudServerException(miCloudServerException);
                }
            }
        }

        private static void cleanMiCloudServerException() {
            sMicloudServerException = null;
        }

        private static Exception getMiCloudServerException() {
            return sMicloudServerException;
        }

        public static synchronized boolean handleMiCloudException(Exception exc) {
            synchronized (MiCloudServerExceptionHandler.class) {
                String str = "MiCloudServerExceptionHandler";
                StringBuilder sb = new StringBuilder();
                sb.append("handleMiCloudException: ");
                sb.append(exc);
                SyncLog.d(str, sb.toString());
                sMicloudServerException = exc;
                SyncUtil.requestSync(GalleryApp.sGetAndroidContext(), new Builder().setSyncType(SyncType.NORMAL).setSyncReason(Long.MAX_VALUE).build());
            }
            return true;
        }

        private static boolean hasMiCloudServerException() {
            return sMicloudServerException != null;
        }
    }

    static {
        sGalleryServerErrors.put(Integer.valueOf(0), new GalleryErrorCodeItem(0, GallerySyncCode.OK, sNoErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(10001), new GalleryErrorCodeItem(10001, GallerySyncCode.RETRY_ERROR, sRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(10032), new GalleryErrorCodeItem(10032, GallerySyncCode.RETRY_ERROR, sRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(20607), new GalleryErrorCodeItem(20607, GallerySyncCode.RETRY_ERROR, sRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(23000), new GalleryErrorCodeItem(23000, GallerySyncCode.RETRY_ERROR, sRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(50005), new GalleryErrorCodeItem(50005, GallerySyncCode.RETRY_ERROR, sRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(50002), new GalleryErrorCodeItem(50002, GallerySyncCode.RETRY_ERROR, sRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(50003), new GalleryErrorCodeItem(50003, GallerySyncCode.RETRY_ERROR, sRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(50007), new GalleryErrorCodeItem(50007, GallerySyncCode.RETRY_ERROR, sRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(50010), new GalleryErrorCodeItem(50010, GallerySyncCode.RETRY_ERROR, sRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(50017), new GalleryErrorCodeItem(50017, GallerySyncCode.RETRY_ERROR, sRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(50022), new GalleryErrorCodeItem(50022, GallerySyncCode.RETRY_ERROR, sRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(50006), new GalleryErrorCodeItem(50006, GallerySyncCode.NOT_CONTINUE_ERROR, sSpaceFullHandler));
        sGalleryServerErrors.put(Integer.valueOf(50016), new GalleryErrorCodeItem(50016, GallerySyncCode.NOT_CONTINUE_ERROR, sRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(50019), new GalleryErrorCodeItem(50019, GallerySyncCode.NOT_RETRY_ERROR, sNotRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(10008), new GalleryErrorCodeItem(10008, GallerySyncCode.NOT_RETRY_ERROR, sNotRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(10017), new GalleryErrorCodeItem(10017, GallerySyncCode.NOT_RETRY_ERROR, sNotRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(20014), new GalleryErrorCodeItem(20014, GallerySyncCode.NOT_RETRY_ERROR, sNotRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(50001), new GalleryErrorCodeItem(50001, GallerySyncCode.NOT_RETRY_ERROR, sNotRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(50004), new GalleryErrorCodeItem(50004, GallerySyncCode.NOT_RETRY_ERROR, sNotRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(50008), new GalleryErrorCodeItem(50008, GallerySyncCode.NOT_RETRY_ERROR, sGalleryNotFoundHandler));
        sGalleryServerErrors.put(Integer.valueOf(50009), new GalleryErrorCodeItem(50009, GallerySyncCode.NOT_RETRY_ERROR, sNotRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(50011), new GalleryErrorCodeItem(50011, GallerySyncCode.NOT_RETRY_ERROR, sNotRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(50013), new GalleryErrorCodeItem(50013, GallerySyncCode.NOT_RETRY_ERROR, sNotRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(50015), new GalleryErrorCodeItem(50015, GallerySyncCode.NOT_RETRY_ERROR, sNotRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(50018), new GalleryErrorCodeItem(50018, GallerySyncCode.NOT_RETRY_ERROR, sNotRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(50019), new GalleryErrorCodeItem(50019, GallerySyncCode.NOT_RETRY_ERROR, sNotRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(50020), new GalleryErrorCodeItem(50020, GallerySyncCode.NOT_RETRY_ERROR, sNotRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(50021), new GalleryErrorCodeItem(50021, GallerySyncCode.NOT_RETRY_ERROR, sNotRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(50023), new GalleryErrorCodeItem(50023, GallerySyncCode.NOT_RETRY_ERROR, sNotRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(50024), new GalleryErrorCodeItem(50024, GallerySyncCode.NOT_RETRY_ERROR, sNotRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(50025), new GalleryErrorCodeItem(50025, GallerySyncCode.NOT_RETRY_ERROR, sNotRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(50026), new GalleryErrorCodeItem(50026, GallerySyncCode.NOT_RETRY_ERROR, sNotRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(50027), new GalleryErrorCodeItem(50027, GallerySyncCode.NOT_RETRY_ERROR, sNotRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(50028), new GalleryErrorCodeItem(50028, GallerySyncCode.NOT_RETRY_ERROR, sNotRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(50029), new GalleryErrorCodeItem(50029, GallerySyncCode.NOT_RETRY_ERROR, sNotRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(50030), new GalleryErrorCodeItem(50030, GallerySyncCode.NOT_RETRY_ERROR, sNotRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(80004), new GalleryErrorCodeItem(80004, GallerySyncCode.NOT_RETRY_ERROR, sNotRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(50012), new GalleryErrorCodeItem(50012, GallerySyncCode.ALBUM_NOT_EXIST, sAlbumNotExistsHandler));
        sGalleryServerErrors.put(Integer.valueOf(50014), new GalleryErrorCodeItem(50014, GallerySyncCode.ALBUM_NOT_EMPTY, sAlbumNotEmptyHandler));
        sGalleryServerErrors.put(Integer.valueOf(40003), new GalleryErrorCodeItem(40003, GallerySyncCode.NOT_RETRY_ERROR, sNotRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(10016), new GalleryErrorCodeItem(10016, GallerySyncCode.NOT_RETRY_ERROR, sNotRetryErrorHandler));
        sGalleryServerErrors.put(Integer.valueOf(52000), new GalleryErrorCodeItem(52000, GallerySyncCode.RESET_SYNC_TAG, null));
        sExceptionMap.put(IllegalBlockSizeException.class, Integer.valueOf(-101));
        sExceptionMap.put(BadPaddingException.class, Integer.valueOf(-102));
        sExceptionMap.put(JSONException.class, Integer.valueOf(-103));
        sExceptionMap.put(IOException.class, Integer.valueOf(-104));
        sExceptionMap.put(GalleryMiCloudServerException.class, Integer.valueOf(-105));
        sExceptionMap.put(MalformedURLException.class, Integer.valueOf(-106));
        sExceptionMap.put(UnsupportedEncodingException.class, Integer.valueOf(-107));
        sExceptionMap.put(ClientProtocolException.class, Integer.valueOf(-108));
        sExceptionMap.put(URISyntaxException.class, Integer.valueOf(-109));
        sExceptionMap.put(UnsupportedOperationException.class, Integer.valueOf(-110));
        sExceptionMap.put(SocketTimeoutException.class, Integer.valueOf(-111));
        sExceptionMap.put(UnknownHostException.class, Integer.valueOf(-112));
    }

    /* access modifiers changed from: private */
    public static void cancelDeleteGroupOperation(String str) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("localFlag", Integer.valueOf(0));
        GalleryUtils.safeUpdate(GalleryCloudUtils.CLOUD_URI, contentValues, "_id = ? ", new String[]{str});
    }

    public static int fromThrowable(Throwable th) {
        if (th instanceof ExceptionWithErrorCode) {
            return ((ExceptionWithErrorCode) th).mErrorCode;
        }
        int i = -2;
        Class<Object> cls = th.getClass();
        while (true) {
            if (cls == Object.class) {
                break;
            }
            Integer num = (Integer) sExceptionMap.get(th.getClass());
            if (num != null) {
                i = num.intValue();
                break;
            }
            cls = cls.getSuperclass();
        }
        return i;
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Removed duplicated region for block: B:17:0x0043  */
    public static boolean hasDeleteItemsInAGroup(String str) {
        Cursor cursor = null;
        try {
            Cursor query = GalleryApp.sGetAndroidContext().getContentResolver().query(CloudUtils.getCloudLimit1Uri(), new String[]{"_id"}, "localFlag = ?  AND localGroupId = ? ", new String[]{String.valueOf(2), str}, null);
            if (query != null) {
                try {
                    if (query.moveToNext()) {
                        if (query != null) {
                            query.close();
                        }
                        return true;
                    }
                } catch (Throwable th) {
                    Throwable th2 = th;
                    cursor = query;
                    th = th2;
                    if (cursor != null) {
                    }
                    throw th;
                }
            }
            if (query != null) {
                query.close();
            }
            return false;
        } catch (Throwable th3) {
            th = th3;
            if (cursor != null) {
                cursor.close();
            }
            throw th;
        }
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Removed duplicated region for block: B:17:0x0045  */
    public static boolean hasUnCreatedGroupInLocalDB(String str) {
        Cursor cursor = null;
        try {
            Cursor query = GalleryApp.sGetAndroidContext().getContentResolver().query(CloudUtils.getCloudLimit1Uri(), new String[]{"_id"}, "localFlag = ?  AND _id = ? ", new String[]{String.valueOf(8), str}, null);
            if (query != null) {
                try {
                    if (query.moveToNext()) {
                        if (query != null) {
                            query.close();
                        }
                        return true;
                    }
                } catch (Throwable th) {
                    Throwable th2 = th;
                    cursor = query;
                    th = th2;
                    if (cursor != null) {
                    }
                    throw th;
                }
            }
            if (query != null) {
                query.close();
            }
            return false;
        } catch (Throwable th3) {
            th = th3;
            if (cursor != null) {
                cursor.close();
            }
            throw th;
        }
    }

    public static boolean isClientError(int i) {
        return i < 0;
    }
}
