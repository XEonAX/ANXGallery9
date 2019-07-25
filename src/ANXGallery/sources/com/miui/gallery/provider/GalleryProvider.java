package com.miui.gallery.provider;

import android.content.ContentProviderOperation;
import android.content.ContentProviderResult;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.OperationApplicationException;
import android.database.ContentObserver;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.database.MergeCursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.miui.gallery.cloud.base.SyncRequest.Builder;
import com.miui.gallery.cloud.base.SyncType;
import com.miui.gallery.dao.GalleryLiteEntityManager;
import com.miui.gallery.picker.helper.PickerSqlHelper;
import com.miui.gallery.provider.GalleryContract.Album;
import com.miui.gallery.provider.GalleryContract.Cloud;
import com.miui.gallery.provider.GalleryContract.CloudUser;
import com.miui.gallery.provider.GalleryContract.ExtendedCloud;
import com.miui.gallery.provider.GalleryContract.Favorites;
import com.miui.gallery.provider.GalleryContract.Media;
import com.miui.gallery.provider.GalleryContract.PeopleFace;
import com.miui.gallery.provider.GalleryContract.RecentDiscoveredMedia;
import com.miui.gallery.provider.GalleryContract.ShareUser;
import com.miui.gallery.provider.cache.MediaManager;
import com.miui.gallery.provider.cache.MediaManager.InitializeListener;
import com.miui.gallery.provider.cloudmanager.CloudManager;
import com.miui.gallery.provider.deprecated.GalleryCloudProvider;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.Numbers;
import com.miui.gallery.util.SyncUtil;
import com.miui.gallery.util.UriUtil;
import com.miui.gallery.util.face.PeopleItem;
import com.nexstreaming.nexeditorsdk.nexClip;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class GalleryProvider extends GalleryCloudProvider {
    private ContentResolver mContentResolver;
    private InitializeListener mInitializeListener = new InitializeListener() {
        public void onProgressUpdate() {
            GalleryProvider.this.notifyChange(Cloud.CLOUD_URI, null, 0);
        }
    };

    private class ContentResolver extends GalleryContentResolver {
        private ContentResolver() {
        }

        /* access modifiers changed from: protected */
        public Object matchUri(Uri uri) {
            return Integer.valueOf(GalleryProvider.sUriMatcher.match(uri));
        }

        /* access modifiers changed from: protected */
        /* JADX WARNING: Removed duplicated region for block: B:23:0x01df  */
        /* JADX WARNING: Removed duplicated region for block: B:25:? A[RETURN, SYNTHETIC] */
        public void notifyInternal(Uri uri, ContentObserver contentObserver, long j) {
            int match = GalleryProvider.sUriMatcher.match(uri);
            if (match != 75) {
                if (match == 92) {
                    GalleryProvider.this.getContext().getContentResolver().notifyChange(PeopleFace.PERSONS_URI, contentObserver, false);
                    GalleryProvider.this.getContext().getContentResolver().notifyChange(PeopleFace.IGNORE_PERSONS_URI, contentObserver, false);
                    GalleryProvider.this.getContext().getContentResolver().notifyChange(PeopleFace.ONE_PERSON_URI, contentObserver, false);
                } else if (match != 110) {
                    if (match != 112) {
                        if (match == 152) {
                            GalleryProvider.this.getContext().getContentResolver().notifyChange(RecentDiscoveredMedia.URI, contentObserver, false);
                            GalleryProvider.this.getContext().getContentResolver().notifyChange(RecentDiscoveredMedia.URI_COVER, contentObserver, false);
                            GalleryProvider.this.getContext().getContentResolver().notifyChange(Album.URI, contentObserver, false);
                        } else if (match != 180) {
                            switch (match) {
                                case 70:
                                case 71:
                                    break;
                                default:
                                    switch (match) {
                                        case BaiduSceneResult.INVOICE /*131*/:
                                            break;
                                        case BaiduSceneResult.VARIOUS_TICKETS /*132*/:
                                        case BaiduSceneResult.EXPRESS_ORDER /*133*/:
                                            GalleryProvider.this.getContext().getContentResolver().notifyChange(CloudUser.CLOUD_USER_URI, contentObserver, false);
                                            GalleryProvider.this.getContext().getContentResolver().notifyChange(Album.URI_SHARE_ALL, contentObserver, false);
                                            break;
                                    }
                            }
                        } else {
                            GalleryProvider.this.getContext().getContentResolver().notifyChange(Favorites.URI, contentObserver, false);
                            GalleryProvider.this.getContext().getContentResolver().notifyChange(Album.URI, contentObserver, false);
                            GalleryProvider.this.getContext().getContentResolver().notifyChange(Media.URI, contentObserver, false);
                            GalleryProvider.this.getContext().getContentResolver().notifyChange(Media.URI_OWNER_ALBUM_MEDIA, contentObserver, false);
                            GalleryProvider.this.getContext().getContentResolver().notifyChange(Media.URI_ALL, contentObserver, false);
                        }
                    }
                    GalleryProvider.this.getContext().getContentResolver().notifyChange(ShareUser.SHARE_USER_URI, contentObserver, false);
                    GalleryProvider.this.getContext().getContentResolver().notifyChange(Album.URI_SHARE_ALL, contentObserver, false);
                } else {
                    GalleryProvider.this.getContext().getContentResolver().notifyChange(Album.URI, contentObserver, false);
                    GalleryProvider.this.getContext().getContentResolver().notifyChange(Media.URI_OTHER_ALBUM_MEDIA, contentObserver, false);
                    GalleryProvider.this.getContext().getContentResolver().notifyChange(Media.URI_ALL, contentObserver, false);
                }
                if (j == 0) {
                    SyncUtil.requestSync(GalleryProvider.this.getContext(), new Builder().setSyncType(SyncType.NORMAL).setSyncReason(j).setDelayUpload(true).build());
                    return;
                }
                return;
            }
            GalleryProvider.this.getContext().getContentResolver().notifyChange(Cloud.CLOUD_URI, contentObserver, false);
            GalleryProvider.this.getContext().getContentResolver().notifyChange(Album.URI, contentObserver, false);
            GalleryProvider.this.getContext().getContentResolver().notifyChange(Media.URI, contentObserver, false);
            GalleryProvider.this.getContext().getContentResolver().notifyChange(Media.URI_OWNER_ALBUM_MEDIA, contentObserver, false);
            GalleryProvider.this.getContext().getContentResolver().notifyChange(Media.URI_ALL, contentObserver, false);
            GalleryProvider.this.getContext().getContentResolver().notifyChange(Media.URI_OTHER_ALBUM_MEDIA, contentObserver, false);
            GalleryProvider.this.getContext().getContentResolver().notifyChange(PeopleFace.ONE_PERSON_URI, contentObserver, false);
            GalleryProvider.this.getContext().getContentResolver().notifyChange(RecentDiscoveredMedia.URI, contentObserver, false);
            GalleryProvider.this.getContext().getContentResolver().notifyChange(RecentDiscoveredMedia.URI_COVER, contentObserver, false);
            GalleryProvider.this.getContext().getContentResolver().notifyChange(PeopleFace.PERSONS_URI, contentObserver, false);
            if (j == 0) {
            }
        }
    }

    static {
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "album", 72);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "media", 51);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "media/#", 52);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "album_media", 73);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "share_album_media/#", BaiduSceneResult.FOUNTAIN);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "persons", 90);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "ignore_persons", 97);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "person", 91);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "gallery_cloud", 70);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "gallery_cloud/#", 71);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "cloud_owner_sububi/#", 74);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "share_image", BaiduSceneResult.CASTLE);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "share_image/#", BaiduSceneResult.WESTERN_ARCHITECTURE);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "share_image_sububi/#", BaiduSceneResult.BUILDING_OTHER);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "person_recommend", 94);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "peopleFace", 92);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "cloud_and_share", 50);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "owner_and_other_album", BaiduSceneResult.STREET_VIEW);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "other_share_album", BaiduSceneResult.BRIDGE);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "cloud_write_bulk_notify", 75);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "person_item", 93);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "share_user", BaiduSceneResult.VISA);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "share_user/#", BaiduSceneResult.INVOICE);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "cloud_user", BaiduSceneResult.VARIOUS_TICKETS);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "cloud_user/#", BaiduSceneResult.EXPRESS_ORDER);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "people_face_cover", 95);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "discovery_message", 150);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "discovery_message/#", 151);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "recent_discovered_media", 152);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "recent_discovered_cover", 153);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "cloudControl", 170);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "cloudControl/#", 171);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "people_cover", 96);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "image_face", 98);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "people_tag", 99);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "favorites", nexClip.kClip_Rotate_180);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "extended_cloud", 76);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "pick_cloud_and_share", 87);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "persons_item", 100);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "month_media", 53);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "people_snapshot", BaiduSceneResult.SHOOTING);
    }

    private String buildNonProcessingSelection(String str) {
        List queryProcessingMediaPaths = ProcessingMediaManager.queryProcessingMediaPaths();
        if (!MiscUtil.isValid(queryProcessingMediaPaths)) {
            return str;
        }
        StringBuilder sb = new StringBuilder("localFile NOT IN (");
        for (int i = 0; i < queryProcessingMediaPaths.size(); i++) {
            if (!TextUtils.isEmpty((CharSequence) queryProcessingMediaPaths.get(i))) {
                DatabaseUtils.appendEscapedSQLString(sb, (String) queryProcessingMediaPaths.get(i));
                if (i != queryProcessingMediaPaths.size() - 1) {
                    sb.append(", ");
                }
            }
        }
        sb.append(")");
        return DatabaseUtils.concatenateWhere(str, sb.toString());
    }

    private long doInsertWithNoNotify(Uri uri, int i, ContentValues contentValues) {
        SQLiteDatabase writableDatabase = sDBHelper.getWritableDatabase();
        if (i == 70 || i == 75) {
            writableDatabase.beginTransactionNonExclusive();
            try {
                long onPreInsert = onPreInsert(writableDatabase, "cloud", contentValues);
                if (onPreInsert == -1) {
                    onPreInsert = writableDatabase.insert("cloud", null, appendValuesForCloud(contentValues, true));
                    if (onPreInsert != -1) {
                        this.mMediaManager.insert(onPreInsert, contentValues);
                        if (contentValues.containsKey("serverType") && Numbers.equals(contentValues.getAsInteger("serverType"), 0)) {
                            Long asLong = contentValues.getAsLong("attributes");
                            this.mMediaManager.insertAttributes(onPreInsert, asLong == null ? 0 : asLong.longValue());
                        }
                    }
                }
                writableDatabase.setTransactionSuccessful();
                return onPreInsert;
            } finally {
                writableDatabase.endTransaction();
            }
        } else if (i == 92) {
            return writableDatabase.insert("peopleFace", null, appendValuesForCloud(contentValues, true));
        } else {
            if (i == 110) {
                return writableDatabase.insert("shareImage", null, appendValuesForCloud(contentValues, true));
            }
            if (i != 152) {
                return -1;
            }
            return writableDatabase.insertWithOnConflict("recentDiscoveredMedia", null, contentValues, 5);
        }
    }

    private List<String> getSha1ListFromFavorites(String str, String[] strArr, boolean z) {
        Throwable th;
        Cursor cursor = null;
        if (z) {
            try {
                if (TextUtils.isEmpty(str)) {
                    str = "isFavorite NOT NULL AND isFavorite> 0";
                } else {
                    StringBuilder sb = new StringBuilder();
                    sb.append(str);
                    sb.append(" AND (isFavorite NOT NULL AND isFavorite> 0)");
                    str = sb.toString();
                }
            } catch (Throwable th2) {
                th = th2;
                MiscUtil.closeSilently(cursor);
                throw th;
            }
        }
        Cursor query = sDBHelper.query("favorites", new String[]{"sha1"}, str, strArr, null, null, null, null);
        if (query != null) {
            try {
                if (query.getCount() > 0) {
                    ArrayList arrayList = new ArrayList(query.getCount());
                    while (query.moveToNext()) {
                        String string = query.getString(0);
                        if (!TextUtils.isEmpty(string)) {
                            arrayList.add(string);
                        }
                    }
                    MiscUtil.closeSilently(query);
                    return arrayList;
                }
            } catch (Throwable th3) {
                cursor = query;
                th = th3;
                MiscUtil.closeSilently(cursor);
                throw th;
            }
        }
        ArrayList arrayList2 = new ArrayList();
        MiscUtil.closeSilently(query);
        return arrayList2;
    }

    private boolean isBlockedByMediaManager(int i) {
        switch (i) {
            case 170:
            case 171:
                return false;
            default:
                return true;
        }
    }

    private static boolean isCloudUri(int i) {
        return isSpecificUri(i, 70, 76);
    }

    private static boolean isFaceUri(int i) {
        return isSpecificUri(i, 90, BaiduSceneResult.SHOOTING);
    }

    private static boolean isFavoriteUri(int i) {
        return isSpecificUri(i, nexClip.kClip_Rotate_180, nexClip.kClip_Rotate_180);
    }

    private static boolean isMediaUri(int i) {
        return isSpecificUri(i, 50, 53);
    }

    private static boolean isShareUri(int i) {
        return isSpecificUri(i, BaiduSceneResult.CASTLE, BaiduSceneResult.BUILDING_OTHER);
    }

    private static boolean isSpecificUri(int i, int i2, int i3) {
        return i >= i2 && i <= i3;
    }

    private static boolean isUserUri(int i) {
        return isSpecificUri(i, BaiduSceneResult.VISA, BaiduSceneResult.EXPRESS_ORDER);
    }

    private boolean needDelayNotify(Uri uri) {
        if (sUriMatcher.match(uri) != 75) {
            return uri.getBooleanQueryParameter("delay_notify", false);
        }
        return true;
    }

    private boolean needNotifyUpdate(Uri uri, int i, ContentValues contentValues) {
        boolean z = true;
        if (i == 71 || i == 92) {
            return true;
        }
        if (i == 75 || i == 70) {
            if (!contentValues.containsKey("sha1") && !contentValues.containsKey("title") && !contentValues.containsKey("specialTypeFlags")) {
                z = false;
            }
            return z;
        } else if (i != 180 || !contentValues.containsKey("sha1")) {
            return uri.getBooleanQueryParameter("requireNotifyUri", false);
        } else {
            return true;
        }
    }

    /* access modifiers changed from: private */
    public void notifyChange(Uri uri, ContentObserver contentObserver, long j) {
        if (needDelayNotify(uri)) {
            this.mContentResolver.notifyChangeDelay(uri, contentObserver, j);
        } else {
            this.mContentResolver.notifyChange(uri, contentObserver, j);
        }
    }

    private String parseSelection(String str, String str2, String[] strArr) {
        String str3;
        String format = String.format(str2, (Object[]) strArr);
        StringBuilder sb = new StringBuilder();
        sb.append(format);
        if (!TextUtils.isEmpty(str)) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append(" AND (");
            sb2.append(str);
            sb2.append(")");
            str3 = sb2.toString();
        } else {
            str3 = "";
        }
        sb.append(str3);
        return sb.toString();
    }

    private static long parseSyncReason(Uri uri, ContentValues contentValues) {
        if (shouldRequestSync(uri, contentValues)) {
            int match = sUriMatcher.match(uri);
            if (isMediaUri(match) || isCloudUri(match) || isFavoriteUri(match)) {
                return 33;
            }
            if (isFaceUri(match)) {
                return 136;
            }
            if (isShareUri(match) || isUserUri(match)) {
                return 528;
            }
        }
        return 0;
    }

    private void registerNotifyUri(Cursor cursor, int i) {
        switch (i) {
            case 50:
                cursor.setNotificationUri(getContext().getContentResolver(), Media.URI_ALL);
                return;
            case 51:
            case 52:
            case 53:
                cursor.setNotificationUri(getContext().getContentResolver(), Media.URI);
                return;
            case 70:
            case 71:
                cursor.setNotificationUri(getContext().getContentResolver(), Cloud.CLOUD_URI);
                return;
            case 72:
                cursor.setNotificationUri(getContext().getContentResolver(), Album.URI);
                return;
            case 73:
                cursor.setNotificationUri(getContext().getContentResolver(), Media.URI_OWNER_ALBUM_MEDIA);
                return;
            case 76:
                cursor.setNotificationUri(getContext().getContentResolver(), ExtendedCloud.URI);
                return;
            case 90:
                cursor.setNotificationUri(getContext().getContentResolver(), PeopleFace.PERSONS_URI);
                return;
            case BaiduSceneResult.RIDING /*91*/:
                cursor.setNotificationUri(getContext().getContentResolver(), PeopleFace.ONE_PERSON_URI);
                return;
            case BaiduSceneResult.YOGA /*95*/:
                cursor.setNotificationUri(getContext().getContentResolver(), PeopleFace.PERSONS_URI);
                return;
            case BaiduSceneResult.DANCE /*96*/:
                cursor.setNotificationUri(getContext().getContentResolver(), PeopleFace.PERSONS_URI);
                return;
            case BaiduSceneResult.SKATEBOARD /*97*/:
                cursor.setNotificationUri(getContext().getContentResolver(), PeopleFace.IGNORE_PERSONS_URI);
                return;
            case BaiduSceneResult.STREET_VIEW /*112*/:
                cursor.setNotificationUri(getContext().getContentResolver(), Album.URI_SHARE_ALL);
                return;
            case BaiduSceneResult.FOUNTAIN /*113*/:
                cursor.setNotificationUri(getContext().getContentResolver(), Media.URI_OTHER_ALBUM_MEDIA);
                return;
            case BaiduSceneResult.VISA /*130*/:
            case BaiduSceneResult.INVOICE /*131*/:
                cursor.setNotificationUri(getContext().getContentResolver(), ShareUser.SHARE_USER_URI);
                return;
            case BaiduSceneResult.VARIOUS_TICKETS /*132*/:
            case BaiduSceneResult.EXPRESS_ORDER /*133*/:
                cursor.setNotificationUri(getContext().getContentResolver(), CloudUser.CLOUD_USER_URI);
                return;
            case 152:
                cursor.setNotificationUri(getContext().getContentResolver(), RecentDiscoveredMedia.URI);
                return;
            case 153:
                cursor.setNotificationUri(getContext().getContentResolver(), RecentDiscoveredMedia.URI_COVER);
                return;
            case nexClip.kClip_Rotate_180 /*180*/:
                cursor.setNotificationUri(getContext().getContentResolver(), Favorites.URI);
                return;
            default:
                return;
        }
    }

    private static boolean shouldRequestSync(Uri uri, ContentValues contentValues) {
        if (uri.getQueryParameter("URI_PARAM_REQUEST_SYNC") != null) {
            return uri.getBooleanQueryParameter("URI_PARAM_REQUEST_SYNC", false);
        }
        return false;
    }

    public ContentProviderResult[] applyBatch(ArrayList<ContentProviderOperation> arrayList) throws OperationApplicationException {
        if (!this.mMediaManager.initialized()) {
            return null;
        }
        SQLiteDatabase writableDatabase = sDBHelper.getWritableDatabase();
        writableDatabase.beginTransaction();
        try {
            ContentProviderResult[] applyBatch = super.applyBatch(arrayList);
            writableDatabase.setTransactionSuccessful();
            return applyBatch;
        } finally {
            writableDatabase.endTransaction();
        }
    }

    public int bulkInsert(Uri uri, ContentValues[] contentValuesArr) {
        int match = sUriMatcher.match(uri);
        int i = 0;
        if (isBlockedByMediaManager(match) && !this.mMediaManager.initialized()) {
            return 0;
        }
        if (contentValuesArr != null) {
            SQLiteDatabase writableDatabase = sDBHelper.getWritableDatabase();
            writableDatabase.beginTransaction();
            ContentValues contentValues = null;
            int i2 = 0;
            while (i < contentValuesArr.length) {
                try {
                    if (doInsertWithNoNotify(uri, match, contentValuesArr[i]) != -1) {
                        i2++;
                        contentValues = contentValuesArr[i];
                    }
                    i++;
                } finally {
                    writableDatabase.endTransaction();
                }
            }
            writableDatabase.setTransactionSuccessful();
            if (i2 > 0) {
                notifyChange(uri, null, parseSyncReason(uri, contentValues));
            }
            i = i2;
        }
        return i;
    }

    public Bundle call(String str, String str2, Bundle bundle) {
        if (!this.mMediaManager.initialized()) {
            return null;
        }
        SQLiteDatabase writableDatabase = sDBHelper.getWritableDatabase();
        if (!CloudManager.canHandle(str)) {
            return super.call(str, str2, bundle);
        }
        Bundle call = CloudManager.call(getContext(), writableDatabase, this.mMediaManager, str, str2, bundle);
        long j = 0;
        if (call.getBoolean("should_request_sync")) {
            j = 561;
        }
        notifyChange(Cloud.CLOUD_URI, null, j);
        return call;
    }

    public int delete(Uri uri, String str, String[] strArr) {
        int match = sUriMatcher.match(uri);
        if (isBlockedByMediaManager(match) && !this.mMediaManager.initialized()) {
            return 0;
        }
        SQLiteDatabase writableDatabase = sDBHelper.getWritableDatabase();
        int i = -1;
        switch (match) {
            case 51:
            case 52:
                break;
            case 70:
            case 75:
                String genIDSelection = genIDSelection(str, strArr);
                this.mMediaManager.delete(genIDSelection, null);
                i = writableDatabase.delete("cloud", str, strArr);
                if (i > 0) {
                    deleteAttributes(genIDSelection);
                    break;
                }
                break;
            case BaiduSceneResult.SURF /*92*/:
                i = writableDatabase.delete("peopleFace", str, strArr);
                break;
            case BaiduSceneResult.CASTLE /*110*/:
                i = writableDatabase.delete("shareImage", str, strArr);
                break;
            case BaiduSceneResult.VISA /*130*/:
                i = writableDatabase.delete("shareUser", str, strArr);
                break;
            case BaiduSceneResult.VARIOUS_TICKETS /*132*/:
                i = writableDatabase.delete("cloudUser", str, strArr);
                break;
            case 150:
                i = writableDatabase.delete("discoveryMessage", str, strArr);
                break;
            case 152:
                i = writableDatabase.delete("recentDiscoveredMedia", str, strArr);
                break;
            case 170:
                i = writableDatabase.delete("cloudControl", str, strArr);
                break;
            case nexClip.kClip_Rotate_180 /*180*/:
                List<String> sha1ListFromFavorites = getSha1ListFromFavorites(str, strArr, true);
                i = writableDatabase.delete("favorites", str, strArr);
                if (i > 0 && MiscUtil.isValid(sha1ListFromFavorites)) {
                    for (String removeFromFavorites : sha1ListFromFavorites) {
                        this.mMediaManager.removeFromFavorites(removeFromFavorites);
                    }
                    break;
                }
            default:
                return super.delete(uri, str, strArr);
        }
        if (i > 0) {
            notifyChange(uri, null, parseSyncReason(uri, null));
        }
        return i;
    }

    public Uri insert(Uri uri, ContentValues contentValues) {
        long j;
        int match = sUriMatcher.match(uri);
        if (isBlockedByMediaManager(match) && !this.mMediaManager.initialized()) {
            return null;
        }
        SQLiteDatabase writableDatabase = sDBHelper.getWritableDatabase();
        if (match == 70 || match == 75 || match == 92 || match == 110) {
            j = doInsertWithNoNotify(uri, match, contentValues);
        } else if (match == 130) {
            j = writableDatabase.insert("shareUser", null, contentValues);
        } else if (match == 132) {
            j = writableDatabase.insert("cloudUser", null, contentValues);
        } else if (match == 150) {
            j = writableDatabase.insert("discoveryMessage", null, contentValues);
        } else if (match == 152) {
            j = writableDatabase.insertWithOnConflict("recentDiscoveredMedia", null, contentValues, 5);
        } else if (match == 170) {
            j = writableDatabase.insertWithOnConflict("cloudControl", null, contentValues, 5);
        } else if (match != 180) {
            return super.insert(uri, contentValues);
        } else {
            j = writableDatabase.insert("favorites", null, contentValues);
            if (j > 0 && contentValues.containsKey("sha1") && contentValues.containsKey("isFavorite")) {
                String asString = contentValues.getAsString("sha1");
                if (contentValues.getAsInteger("isFavorite").intValue() > 0) {
                    this.mMediaManager.insertToFavorites(asString);
                }
            }
        }
        if (j != -1) {
            notifyChange(uri, null, parseSyncReason(uri, contentValues));
        }
        return ContentUris.withAppendedId(uri, j);
    }

    public boolean onCreate() {
        super.onCreate();
        this.mContentResolver = new ContentResolver();
        this.mMediaManager = MediaManager.getInstance();
        this.mMediaManager.addInitializeListener(this.mInitializeListener);
        this.mMediaManager.load(sDBHelper);
        return true;
    }

    /* JADX WARNING: type inference failed for: r2v2 */
    /* JADX WARNING: type inference failed for: r2v3 */
    /* JADX WARNING: type inference failed for: r7v0, types: [java.lang.String] */
    /* JADX WARNING: type inference failed for: r2v10, types: [java.lang.String] */
    /* JADX WARNING: type inference failed for: r2v11, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v13, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v17, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v18, types: [java.lang.Integer] */
    /* JADX WARNING: type inference failed for: r2v19 */
    /* JADX WARNING: type inference failed for: r25v0 */
    /* JADX WARNING: type inference failed for: r16v1, types: [java.lang.Integer] */
    /* JADX WARNING: type inference failed for: r2v22, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v23 */
    /* JADX WARNING: type inference failed for: r7v5, types: [java.lang.String] */
    /* JADX WARNING: type inference failed for: r2v25, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v26, types: [java.lang.String] */
    /* JADX WARNING: type inference failed for: r2v27 */
    /* JADX WARNING: type inference failed for: r2v28, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v31, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v33, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v34, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v35, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v36, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v37, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v38, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v39, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v40, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v41, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v43, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v45, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v48, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v50, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v52, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v54, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v56, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v59, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v65, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v69, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v71, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v75, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v77, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v78, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v80, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v82, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v84, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v85, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v86 */
    /* JADX WARNING: type inference failed for: r2v87 */
    /* JADX WARNING: type inference failed for: r2v88 */
    /* JADX WARNING: type inference failed for: r2v89 */
    /* JADX WARNING: type inference failed for: r2v90 */
    /* JADX WARNING: type inference failed for: r2v91 */
    /* JADX WARNING: type inference failed for: r2v92 */
    /* JADX WARNING: type inference failed for: r2v93 */
    /* JADX WARNING: type inference failed for: r2v94 */
    /* JADX WARNING: type inference failed for: r2v95 */
    /* JADX WARNING: type inference failed for: r2v96 */
    /* JADX WARNING: type inference failed for: r2v97 */
    /* JADX WARNING: type inference failed for: r2v98 */
    /* JADX WARNING: type inference failed for: r2v99 */
    /* JADX WARNING: type inference failed for: r2v100 */
    /* JADX WARNING: type inference failed for: r2v101 */
    /* JADX WARNING: type inference failed for: r2v102 */
    /* JADX WARNING: type inference failed for: r2v103 */
    /* JADX WARNING: type inference failed for: r2v104 */
    /* JADX WARNING: type inference failed for: r2v105 */
    /* JADX WARNING: type inference failed for: r2v106 */
    /* JADX WARNING: type inference failed for: r2v107 */
    /* JADX WARNING: type inference failed for: r2v108 */
    /* JADX WARNING: type inference failed for: r2v109 */
    /* JADX WARNING: type inference failed for: r2v110 */
    /* JADX WARNING: type inference failed for: r2v111 */
    /* JADX WARNING: type inference failed for: r2v112 */
    /* JADX WARNING: type inference failed for: r2v113 */
    /* JADX WARNING: type inference failed for: r2v114 */
    /* JADX WARNING: type inference failed for: r2v115 */
    /* JADX WARNING: type inference failed for: r2v116 */
    /* JADX WARNING: type inference failed for: r2v117 */
    /* JADX WARNING: type inference failed for: r2v118 */
    /* JADX WARNING: type inference failed for: r2v119 */
    /* JADX WARNING: type inference failed for: r2v120 */
    /* JADX WARNING: type inference failed for: r2v121 */
    /* JADX WARNING: type inference failed for: r2v122 */
    /* JADX WARNING: Code restructure failed: missing block: B:69:0x040c, code lost:
        if (r2 == 0) goto L_0x0413;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:70:0x040e, code lost:
        registerNotifyUri(r2, r26);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:71:0x0413, code lost:
        return r2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:9:0x0034, code lost:
        r26 = r14;
        r2 = r2;
     */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v2
  assigns: [?[int, float, boolean, short, byte, char, OBJECT, ARRAY], java.lang.Integer, java.lang.String, android.database.Cursor]
  uses: [?[OBJECT, ARRAY], ?[int, boolean, OBJECT, ARRAY, byte, short, char], android.database.Cursor]
  mth insns count: 459
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
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 40 */
    public Cursor query(Uri uri, String[] strArr, String str, String[] strArr2, String str2) {
        Cursor cursor;
        int i;
        ? r2;
        Uri uri2 = uri;
        String[] strArr3 = strArr;
        String str3 = str;
        String[] strArr4 = strArr2;
        String str4 = str2;
        SQLiteDatabase readableDatabase = sDBHelper.getReadableDatabase();
        int match = sUriMatcher.match(uri2);
        int i2 = 1;
        ? r22 = 0;
        switch (match) {
            case 50:
            case 51:
                break;
            default:
                switch (match) {
                    case 70:
                        i = match;
                        r2 = readableDatabase.query(UriUtil.getDistinct(uri), "cloud", strArr, str, strArr2, UriUtil.getGroupBy(uri), UriUtil.getHaving(uri), str2, UriUtil.getLimit(uri));
                        break;
                    case 71:
                        i = match;
                        r2 = readableDatabase.query("cloud", strArr, parseSelection(str3, "_id = %s", new String[]{String.valueOf(ContentUris.parseId(uri))}), strArr2, null, null, str2);
                        break;
                    case 72:
                        boolean booleanQueryParameter = uri2.getBooleanQueryParameter("join_video", false);
                        boolean booleanQueryParameter2 = uri2.getBooleanQueryParameter("join_face", false);
                        boolean booleanQueryParameter3 = uri2.getBooleanQueryParameter("join_share", false);
                        boolean booleanQueryParameter4 = uri2.getBooleanQueryParameter("join_pano", false);
                        boolean booleanQueryParameter5 = uri2.getBooleanQueryParameter("join_recent", false);
                        boolean booleanQueryParameter6 = uri2.getBooleanQueryParameter("join_favorites", false);
                        boolean booleanQueryParameter7 = uri2.getBooleanQueryParameter("exclude_empty_album", false);
                        boolean booleanQueryParameter8 = uri2.getBooleanQueryParameter("all_except_deleted", false);
                        boolean booleanQueryParameter9 = uri2.getBooleanQueryParameter("fill_covers", true);
                        boolean booleanQueryParameter10 = uri2.getBooleanQueryParameter("stub_for_virtual_albums", false);
                        String queryParameter = uri2.getQueryParameter("media_type");
                        if (queryParameter != null) {
                            r22 = Integer.valueOf(queryParameter);
                        }
                        i = match;
                        r2 = AlbumManager.query(readableDatabase, strArr, str, strArr2, str2, booleanQueryParameter, booleanQueryParameter2, booleanQueryParameter3, booleanQueryParameter4, booleanQueryParameter5, booleanQueryParameter6, booleanQueryParameter7, booleanQueryParameter8, uri2.getBooleanQueryParameter("remove_duplicate_items", false), r22, booleanQueryParameter9, booleanQueryParameter10, UriUtil.getLimit(uri));
                        break;
                    case 73:
                        boolean booleanQueryParameter11 = uri2.getBooleanQueryParameter("remove_duplicate_items", false);
                        boolean booleanQueryParameter12 = uri2.getBooleanQueryParameter("generate_headers", false);
                        boolean booleanQueryParameter13 = uri2.getBooleanQueryParameter("remove_processing_items", false);
                        Bundle bundle = new Bundle();
                        bundle.putBoolean("extra_generate_header", booleanQueryParameter12);
                        String buildNonProcessingSelection = booleanQueryParameter13 ? buildNonProcessingSelection(str3) : str3;
                        MediaManager mediaManager = this.mMediaManager;
                        if (booleanQueryParameter11) {
                            r22 = "sha1";
                        }
                        r22 = mediaManager.query(strArr, buildNonProcessingSelection, strArr2, str2, r22, bundle);
                        break;
                    case 74:
                        uri.getLastPathSegment();
                        break;
                    default:
                        switch (match) {
                            case 90:
                                r22 = rawQuery(FaceManager.buildPersonsQuery(), null);
                                break;
                            case BaiduSceneResult.RIDING /*91*/:
                                r22 = FaceManager.queryOnePersonAlbum(readableDatabase, strArr, str, str2, strArr4[0], strArr4[1], uri2.getBooleanQueryParameter("generate_headers", false));
                                break;
                            case BaiduSceneResult.SURF /*92*/:
                                r22 = readableDatabase.query("peopleFace", strArr, str, strArr2, UriUtil.getGroupBy(uri), UriUtil.getHaving(uri), str2, UriUtil.getLimit(uri));
                                break;
                            case BaiduSceneResult.SNORKELING_DIVE /*93*/:
                                r22 = rawQuery(FaceManager.buildOnePersonItemQuery(strArr3, strArr4[0]), null);
                                break;
                            case BaiduSceneResult.PARACHUTE /*94*/:
                                r22 = rawQuery(FaceManager.buildRecommendFacesOfOnePersonQuery(strArr3, str4, strArr4[0]), null);
                                break;
                            case BaiduSceneResult.YOGA /*95*/:
                                r22 = AlbumManager.queryFaceAlbumCover(readableDatabase);
                                break;
                            case BaiduSceneResult.DANCE /*96*/:
                                r22 = rawQuery(FaceManager.buildPeopleCoverQuery(strArr3, uri2.getQueryParameter("serverId"), uri2.getQueryParameter("_id")), null);
                                break;
                            case BaiduSceneResult.SKATEBOARD /*97*/:
                                r22 = rawQuery(FaceManager.buildIgnorePersonsQuery(), null);
                                break;
                            case BaiduSceneResult.GOLF /*98*/:
                                r22 = rawQuery(FaceManager.buildImageFaceQuery(strArr3, uri2.getQueryParameter("serverId"), uri2.getQueryParameter("image_server_id")), null);
                                break;
                            case BaiduSceneResult.VOLLEYBALL /*99*/:
                                r22 = rawQuery(FaceManager.buildPeopleTagQuery(), null);
                                break;
                            case 100:
                                r22 = rawQuery(FaceManager.buildPersonsItemQuery(strArr3, str3, str4, strArr4[0], strArr4[1]), null);
                                break;
                            case BaiduSceneResult.SHOOTING /*101*/:
                                r22 = GalleryLiteEntityManager.getInstance().rawQuery(PeopleItem.class, strArr, str, strArr2, UriUtil.getGroupBy(uri), UriUtil.getHaving(uri), str2, UriUtil.getLimit(uri));
                                break;
                            default:
                                switch (match) {
                                    case BaiduSceneResult.CASTLE /*110*/:
                                        r22 = readableDatabase.query(UriUtil.getDistinct(uri), "shareImage", strArr, str, strArr2, UriUtil.getGroupBy(uri), UriUtil.getHaving(uri), str2, UriUtil.getLimit(uri));
                                        break;
                                    case BaiduSceneResult.WESTERN_ARCHITECTURE /*111*/:
                                        r22 = readableDatabase.query("shareImage", strArr, parseSelection(str3, "_id = %s", new String[]{uri.getLastPathSegment()}), strArr2, null, null, str2);
                                        break;
                                    case BaiduSceneResult.STREET_VIEW /*112*/:
                                        r22 = ShareAlbumManager.query(getContext(), readableDatabase, strArr, str, strArr2, str2);
                                        break;
                                    case BaiduSceneResult.FOUNTAIN /*113*/:
                                        r22 = ShareMediaManager.query(readableDatabase, strArr, parseSelection(str3, "localGroupId = %s", new String[]{String.valueOf(ShareAlbumManager.getOriginalAlbumId(ContentUris.parseId(uri)))}), strArr2, uri2.getBooleanQueryParameter("remove_duplicate_items", false) ? "sha1" : null, str2);
                                        break;
                                    case BaiduSceneResult.BRIDGE /*114*/:
                                        r22 = readableDatabase.query("shareAlbum", strArr, str, strArr2, null, null, str2);
                                        break;
                                    case BaiduSceneResult.BUILDING_OTHER /*115*/:
                                        uri.getLastPathSegment();
                                        break;
                                    default:
                                        switch (match) {
                                            case 150:
                                                r22 = readableDatabase.query(UriUtil.getDistinct(uri), "discoveryMessage", strArr, str, strArr2, UriUtil.getGroupBy(uri), UriUtil.getHaving(uri), str2, UriUtil.getLimit(uri));
                                                break;
                                            case 151:
                                                r22 = readableDatabase.query("discoveryMessage", strArr, parseSelection(str3, "_id = %s", new String[]{uri.getLastPathSegment()}), strArr2, null, null, str2);
                                                break;
                                            case 152:
                                                r22 = RecentDiscoveryMediaManager.query(readableDatabase, strArr, uri2.getBooleanQueryParameter("remove_processing_items", false) ? buildNonProcessingSelection(str3) : str3, strArr2, UriUtil.getGroupBy(uri), str2, uri2.getBooleanQueryParameter("remove_duplicate_items", false), uri2.getBooleanQueryParameter("generate_headers", false));
                                                break;
                                            case 153:
                                                boolean booleanQueryParameter14 = uri2.getBooleanQueryParameter("remove_duplicate_items", false);
                                                try {
                                                    i2 = Integer.parseInt(uri2.getQueryParameter("album_cover_count"));
                                                } catch (NumberFormatException e) {
                                                    Log.e("GalleryProvider", e.getMessage());
                                                }
                                                r22 = RecentDiscoveryMediaManager.queryAlbumCover(readableDatabase, i2, booleanQueryParameter14);
                                                break;
                                            default:
                                                switch (match) {
                                                    case 170:
                                                        r22 = readableDatabase.query(UriUtil.getDistinct(uri), "cloudControl", strArr, str, strArr2, UriUtil.getGroupBy(uri), UriUtil.getHaving(uri), str2, UriUtil.getLimit(uri));
                                                        break;
                                                    case 171:
                                                        r22 = readableDatabase.query("cloudControl", strArr, parseSelection(str3, "_id = %s", new String[]{String.valueOf(ContentUris.parseId(uri))}), strArr2, null, null, str2);
                                                        break;
                                                    default:
                                                        switch (match) {
                                                            case 53:
                                                                break;
                                                            case 76:
                                                                r22 = readableDatabase.query(UriUtil.getDistinct(uri), "extended_cloud", strArr, str, strArr2, UriUtil.getGroupBy(uri), UriUtil.getHaving(uri), str2, UriUtil.getLimit(uri));
                                                                break;
                                                            case BaiduSceneResult.BADMINTON /*87*/:
                                                                r22 = rawQuery(PickerSqlHelper.buildPickerResultQuery(strArr3, str3, strArr4, UriUtil.getGroupBy(uri), str4), null);
                                                                break;
                                                            case BaiduSceneResult.VISA /*130*/:
                                                                r22 = readableDatabase.query(UriUtil.getDistinct(uri), "shareUser", strArr, str, strArr2, UriUtil.getGroupBy(uri), UriUtil.getHaving(uri), str2, UriUtil.getLimit(uri));
                                                                break;
                                                            case BaiduSceneResult.VARIOUS_TICKETS /*132*/:
                                                                r22 = readableDatabase.query(UriUtil.getDistinct(uri), "cloudUser", strArr, str, strArr2, UriUtil.getGroupBy(uri), UriUtil.getHaving(uri), str2, UriUtil.getLimit(uri));
                                                                break;
                                                            case nexClip.kClip_Rotate_180 /*180*/:
                                                                r22 = readableDatabase.query(UriUtil.getDistinct(uri), "favorites", strArr, str, strArr2, UriUtil.getGroupBy(uri), UriUtil.getHaving(uri), str2, UriUtil.getLimit(uri));
                                                                break;
                                                            default:
                                                                r22 = super.query(uri, strArr, str, strArr2, str2);
                                                                break;
                                                        }
                                                }
                                        }
                                }
                        }
                }
        }
        if (uri2.getBooleanQueryParameter("require_full_load", false)) {
            this.mMediaManager.initialized();
        } else {
            this.mMediaManager.ensureMinimumPartDone();
        }
        boolean booleanQueryParameter15 = uri2.getBooleanQueryParameter("remove_duplicate_items", false);
        boolean booleanQueryParameter16 = uri2.getBooleanQueryParameter("generate_headers", false);
        boolean booleanQueryParameter17 = uri2.getBooleanQueryParameter("remove_processing_items", false);
        Bundle bundle2 = new Bundle();
        bundle2.putBoolean("extra_generate_header", booleanQueryParameter16);
        bundle2.putInt("extra_media_group_by", match == 53 ? 1 : 0);
        String buildNonProcessingSelection2 = booleanQueryParameter17 ? buildNonProcessingSelection(str3) : str3;
        MediaManager mediaManager2 = this.mMediaManager;
        if (booleanQueryParameter15) {
            r22 = "sha1";
        }
        Cursor query = mediaManager2.query(strArr, buildNonProcessingSelection2, strArr2, str2, r22, bundle2);
        if (query != null) {
            registerNotifyUri(query, match);
        }
        if (match == 50) {
            Cursor query2 = ShareMediaManager.query(readableDatabase, strArr, buildNonProcessingSelection2, strArr2, "sha1", str2);
            if (query2 != null) {
                registerNotifyUri(query2, match);
            }
            cursor = new MergeCursor(new Cursor[]{query, query2});
        } else {
            cursor = query;
        }
        return cursor;
    }

    public int update(Uri uri, ContentValues contentValues, String str, String[] strArr) {
        int i;
        int match = sUriMatcher.match(uri);
        if (isBlockedByMediaManager(match) && !this.mMediaManager.initialized()) {
            return 0;
        }
        SQLiteDatabase writableDatabase = sDBHelper.getWritableDatabase();
        boolean z = true;
        switch (match) {
            case 70:
            case 75:
                appendValuesForCloud(contentValues, false);
                String genIDSelection = genIDSelection(str, strArr);
                if (contentValues.containsKey("attributes")) {
                    updateAttributes(writableDatabase, "cloud", genIDSelection, contentValues);
                }
                this.mMediaManager.update(genIDSelection, null, contentValues);
                i = writableDatabase.update("cloud", contentValues, str, strArr);
                break;
            case 71:
                Set keySet = contentValues.keySet();
                if (keySet.size() == 1 && keySet.contains("sync_status")) {
                    i = this.mMediaManager.update(genIDSelection(str, strArr), null, contentValues);
                    break;
                } else {
                    throw new IllegalArgumentException("only support key: sync_status");
                }
                break;
            case BaiduSceneResult.SURF /*92*/:
                i = writableDatabase.update("peopleFace", contentValues, str, strArr);
                break;
            case BaiduSceneResult.CASTLE /*110*/:
                i = writableDatabase.update("shareImage", appendValuesForCloud(contentValues, false), str, strArr);
                break;
            case BaiduSceneResult.BRIDGE /*114*/:
                i = writableDatabase.update("shareAlbum", contentValues, str, strArr);
                break;
            case BaiduSceneResult.VISA /*130*/:
            case BaiduSceneResult.INVOICE /*131*/:
                i = writableDatabase.update("shareUser", contentValues, str, strArr);
                break;
            case BaiduSceneResult.VARIOUS_TICKETS /*132*/:
            case BaiduSceneResult.EXPRESS_ORDER /*133*/:
                i = writableDatabase.update("cloudUser", contentValues, str, strArr);
                break;
            case 150:
            case 151:
                i = writableDatabase.update("discoveryMessage", contentValues, str, strArr);
                break;
            case 170:
            case 171:
                i = writableDatabase.update("cloudControl", contentValues, str, strArr);
                break;
            case nexClip.kClip_Rotate_180 /*180*/:
                i = writableDatabase.update("favorites", contentValues, str, strArr);
                if (i > 0 && contentValues.containsKey("isFavorite")) {
                    if (contentValues.getAsInteger("isFavorite").intValue() <= 0) {
                        z = false;
                    }
                    for (String str2 : getSha1ListFromFavorites(str, strArr, false)) {
                        if (z) {
                            this.mMediaManager.insertToFavorites(str2);
                        } else {
                            this.mMediaManager.removeFromFavorites(str2);
                        }
                    }
                    break;
                }
            default:
                i = super.update(uri, contentValues, str, strArr);
                break;
        }
        if (i > 0 && needNotifyUpdate(uri, match, contentValues)) {
            notifyChange(uri, null, parseSyncReason(uri, contentValues));
        }
        return i;
    }
}
