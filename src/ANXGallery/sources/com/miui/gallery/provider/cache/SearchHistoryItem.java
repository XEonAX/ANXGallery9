package com.miui.gallery.provider.cache;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.CursorWindow;
import android.text.TextUtils;
import android.util.ArrayMap;
import com.google.gson.annotations.SerializedName;
import com.miui.gallery.provider.cache.CacheItem.ColumnMapper;
import com.miui.gallery.provider.cache.CacheItem.Merger;
import com.miui.gallery.provider.cache.Filter.Comparator;
import com.miui.gallery.provider.cache.Filter.CompareFilter;
import java.util.Map;

class SearchHistoryItem implements CacheItem {
    /* access modifiers changed from: private */
    public static final Map<String, Integer> COLUMN_MAP = new ArrayMap(PROJECTION.length);
    /* access modifiers changed from: private */
    public static final ColumnMapper COLUMN_MAPPER = new ColumnMapper() {
        public int getIndex(String str) {
            Integer num = (Integer) SearchHistoryItem.COLUMN_MAP.get(str);
            if (num == null) {
                return -1;
            }
            return num.intValue();
        }
    };
    protected static final String[] PROJECTION = {"title", "subTitle", "actionUri", "icon", "timestamp"};
    @SerializedName("icon")
    public String icon;
    @SerializedName("url")
    public String intentActionURI;
    @SerializedName("subtitle")
    public String subTitle;
    @SerializedName("timestamp")
    public Long timestamp;
    @SerializedName("title")
    public String title;

    public static class Generator implements com.miui.gallery.provider.cache.CacheItem.Generator<SearchHistoryItem> {
        public SearchHistoryItem from(long j, ContentValues contentValues) {
            SearchHistoryItem generate = generate();
            update(generate, contentValues);
            generate.timestamp = contentValues.getAsLong(SearchHistoryItem.PROJECTION[4]);
            return generate;
        }

        public SearchHistoryItem from(Cursor cursor) {
            SearchHistoryItem generate = generate();
            generate.title = cursor.getString(0);
            generate.subTitle = cursor.getString(1);
            generate.intentActionURI = cursor.getString(2);
            generate.icon = cursor.getString(3);
            generate.timestamp = Long.valueOf(cursor.getLong(4));
            return generate;
        }

        public SearchHistoryItem generate() {
            return new SearchHistoryItem();
        }

        public CompareFilter<SearchHistoryItem> getFilter(int i, Comparator comparator, String str) {
            return null;
        }

        public ColumnMapper getMapper() {
            return SearchHistoryItem.COLUMN_MAPPER;
        }

        public String[] getProjection() {
            return SearchHistoryItem.PROJECTION;
        }

        public void update(SearchHistoryItem searchHistoryItem, ContentValues contentValues) {
            if (contentValues.containsKey(SearchHistoryItem.PROJECTION[0])) {
                searchHistoryItem.title = contentValues.getAsString(SearchHistoryItem.PROJECTION[0]);
            }
            if (contentValues.containsKey(SearchHistoryItem.PROJECTION[1])) {
                searchHistoryItem.subTitle = contentValues.getAsString(SearchHistoryItem.PROJECTION[1]);
            }
            if (contentValues.containsKey(SearchHistoryItem.PROJECTION[2])) {
                searchHistoryItem.intentActionURI = contentValues.getAsString(SearchHistoryItem.PROJECTION[2]);
            }
            if (contentValues.containsKey(SearchHistoryItem.PROJECTION[3])) {
                searchHistoryItem.icon = contentValues.getAsString(SearchHistoryItem.PROJECTION[3]);
            }
            if (contentValues.containsKey(SearchHistoryItem.PROJECTION[4])) {
                searchHistoryItem.timestamp = contentValues.getAsLong(SearchHistoryItem.PROJECTION[4]);
            }
        }
    }

    public static class QueryFactory implements com.miui.gallery.provider.cache.CacheItem.QueryFactory<SearchHistoryItem> {

        private static class SubTitleFilter extends CompareFilter<SearchHistoryItem> {
            public SubTitleFilter(Comparator comparator, String str) {
                super(-1, comparator, str);
            }

            public SearchHistoryItem filter(SearchHistoryItem searchHistoryItem) {
                if (this.mComparator != Comparator.LIKE || TextUtils.isEmpty(this.mArgument) || !QueryFactory.containsIgnoreCase(searchHistoryItem.subTitle, this.mArgument)) {
                    return null;
                }
                return searchHistoryItem;
            }
        }

        private static class TimestampComparator implements java.util.Comparator<SearchHistoryItem> {
            private boolean mDescent;

            public TimestampComparator(boolean z) {
                this.mDescent = z;
            }

            public int compare(SearchHistoryItem searchHistoryItem, SearchHistoryItem searchHistoryItem2) {
                int i = searchHistoryItem.timestamp.longValue() < searchHistoryItem2.timestamp.longValue() ? -1 : searchHistoryItem.timestamp == searchHistoryItem2.timestamp ? 0 : 1;
                return this.mDescent ? -i : i;
            }
        }

        private static class TitleFilter extends CompareFilter<SearchHistoryItem> {
            public TitleFilter(Comparator comparator, String str) {
                super(-1, comparator, str);
            }

            public SearchHistoryItem filter(SearchHistoryItem searchHistoryItem) {
                if (this.mComparator != Comparator.LIKE || TextUtils.isEmpty(this.mArgument) || !QueryFactory.containsIgnoreCase(searchHistoryItem.title, this.mArgument)) {
                    return null;
                }
                return searchHistoryItem;
            }
        }

        /* access modifiers changed from: private */
        public static boolean containsIgnoreCase(String str, String str2) {
            return !TextUtils.isEmpty(str) && str.toLowerCase().contains(str2.toLowerCase());
        }

        public java.util.Comparator<SearchHistoryItem> getComparator(int i, boolean z) {
            if (i == 4) {
                return new TimestampComparator(z);
            }
            return null;
        }

        public CompareFilter<SearchHistoryItem> getFilter(int i, Comparator comparator, String str) {
            if (i == 0) {
                return new TitleFilter(comparator, str);
            }
            if (i == 1) {
                return new SubTitleFilter(comparator, str);
            }
            return null;
        }

        public ColumnMapper getMapper() {
            return SearchHistoryItem.COLUMN_MAPPER;
        }

        public Merger<SearchHistoryItem> getMerger(int i) {
            return null;
        }
    }

    static {
        COLUMN_MAP.put("title", Integer.valueOf(0));
        COLUMN_MAP.put("subTitle", Integer.valueOf(1));
        COLUMN_MAP.put("actionUri", Integer.valueOf(2));
        COLUMN_MAP.put("icon", Integer.valueOf(3));
        COLUMN_MAP.put("timestamp", Integer.valueOf(4));
    }

    SearchHistoryItem() {
    }

    public boolean fillWindow(CursorWindow cursorWindow, int i, int i2, int i3) {
        if (i3 == 0) {
            return ParseUtils.putString(cursorWindow, this.title, i, i2);
        }
        if (i3 == 1) {
            return ParseUtils.putString(cursorWindow, this.subTitle, i, i2);
        }
        if (i3 == 2) {
            return ParseUtils.putString(cursorWindow, this.intentActionURI, i, i2);
        }
        if (i3 == 3) {
            return ParseUtils.putString(cursorWindow, this.icon, i, i2);
        }
        if (i3 == 4) {
            return ParseUtils.putLong(cursorWindow, this.timestamp, i, i2);
        }
        throw new IllegalArgumentException(" not recognized column.");
    }

    public Object get(int i, boolean z) {
        if (i == 0) {
            return this.title;
        }
        if (i == 1) {
            return this.subTitle;
        }
        if (i == 2) {
            return this.intentActionURI;
        }
        if (i == 3) {
            return this.icon;
        }
        if (i == 4) {
            return this.timestamp;
        }
        throw new IllegalArgumentException(" not recognized column.");
    }

    public int getType(int i) {
        if (i == 0 || i == 1 || i == 2 || i == 3) {
            return 3;
        }
        if (i == 4) {
            return 1;
        }
        throw new IllegalArgumentException(" not recognized column.");
    }
}
