package com.miui.gallery.search.core.source.local;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.text.TextUtils;
import android.util.Pair;
import com.miui.gallery.provider.GalleryContract.Cloud;
import com.miui.gallery.provider.GalleryContract.Common;
import com.miui.gallery.provider.GalleryContract.Media;
import com.miui.gallery.search.SearchConstants.SectionType;
import com.miui.gallery.search.SearchContract.Icon;
import com.miui.gallery.search.core.QueryInfo;
import com.miui.gallery.search.core.suggestion.BaseSuggestion;
import com.miui.gallery.search.core.suggestion.Suggestion;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;
import com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

public class AppScreenshotSource extends LocalCacheBackedSuggestionSource<List<Pair<String, Suggestion>>> {
    private static final Uri CONTENT_URI = Media.URI_OWNER_ALBUM_MEDIA;
    private static final String[] PROJECTION = {"_id", "alias_clear_thumbnail", "location"};

    public AppScreenshotSource(Context context) {
        super(context);
    }

    /* access modifiers changed from: private */
    public Suggestion createAppScreenshotSuggestion(String str, Cursor cursor) {
        BaseSuggestion baseSuggestion = new BaseSuggestion();
        baseSuggestion.setSuggestionTitle(str);
        String string = cursor.getString(1);
        baseSuggestion.setSuggestionIcon(TextUtils.isEmpty(string) ? Icon.LOCAL_IMAGE_URI.buildUpon().appendQueryParameter("id", cursor.getString(0)).build().toString() : Scheme.FILE.wrap(string));
        baseSuggestion.setIntentActionURI(Common.URI_ALBUM_PAGE.buildUpon().appendQueryParameter("serverId", String.valueOf(2)).appendQueryParameter("screenshotAppName", str).toString());
        return baseSuggestion;
    }

    private Long getScreenshotAlbumId() {
        return (Long) SafeDBUtil.safeQuery(this.mContext, Cloud.CLOUD_URI, new String[]{"_id"}, "serverId=? AND (serverType=0)", new String[]{String.valueOf(2)}, (String) null, (QueryHandler<T>) new QueryHandler<Long>() {
            public Long handle(Cursor cursor) {
                if (cursor == null || !cursor.moveToFirst()) {
                    return null;
                }
                return Long.valueOf(cursor.getLong(0));
            }
        });
    }

    public Uri getContentUri() {
        return CONTENT_URI;
    }

    public String getName() {
        return "local_app_screenshot_source";
    }

    /* access modifiers changed from: protected */
    public SectionType getSectionType() {
        return SectionType.SECTION_TYPE_APP_SCREENSHOT;
    }

    /* access modifiers changed from: protected */
    public List<Suggestion> handleQuery(List<Pair<String, Suggestion>> list, String str, QueryInfo queryInfo) {
        if (!MiscUtil.isValid(list)) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        for (Pair pair : list) {
            if (((String) pair.first).contains(str)) {
                arrayList.add(pair.second);
            }
        }
        return arrayList;
    }

    /* access modifiers changed from: protected */
    public boolean isFatalCondition(QueryInfo queryInfo, int i) {
        return super.isFatalCondition(queryInfo, i) || i == 14;
    }

    public List<Pair<String, Suggestion>> loadContent() {
        Long screenshotAlbumId = getScreenshotAlbumId();
        if (screenshotAlbumId == null) {
            return null;
        }
        return (List) SafeDBUtil.safeQuery(this.mContext, CONTENT_URI, PROJECTION, "localGroupId = ? AND location NOT NULL AND title like '?%'", new String[]{screenshotAlbumId.toString(), "Screenshot"}, "alias_create_time DESC", (QueryHandler<T>) new QueryHandler<List<Pair<String, Suggestion>>>() {
            public List<Pair<String, Suggestion>> handle(Cursor cursor) {
                if (cursor == null || !cursor.moveToFirst()) {
                    return null;
                }
                ArrayList arrayList = new ArrayList();
                HashSet hashSet = new HashSet();
                do {
                    String string = cursor.getString(2);
                    if (!TextUtils.isEmpty(string) && !hashSet.contains(string)) {
                        arrayList.add(new Pair(string.toLowerCase(), AppScreenshotSource.this.createAppScreenshotSuggestion(string, cursor)));
                        hashSet.add(string);
                    }
                } while (cursor.moveToNext());
                return arrayList;
            }
        });
    }
}
