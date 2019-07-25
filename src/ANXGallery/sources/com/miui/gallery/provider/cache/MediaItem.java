package com.miui.gallery.provider.cache;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.CursorWindow;
import android.text.TextUtils;
import android.util.ArrayMap;
import android.util.ArraySet;
import com.miui.gallery.provider.MediaSortDateHelper.SortDate;
import com.miui.gallery.provider.cache.CacheItem.ColumnMapper;
import com.miui.gallery.provider.cache.CacheItem.Merger;
import com.miui.gallery.provider.cache.Filter.Comparator;
import com.miui.gallery.provider.cache.Filter.CompareFilter;
import com.miui.gallery.sdk.SyncStatus;
import com.miui.gallery.sdk.uploadstatus.ItemType;
import com.miui.gallery.sdk.uploadstatus.SyncProxy;
import com.miui.gallery.sdk.uploadstatus.UploadStatusItem;
import com.miui.gallery.util.GalleryDateUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.Numbers;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

class MediaItem implements CacheItem {
    /* access modifiers changed from: private */
    public static final HashMap<String, Integer> PROJECTION = new HashMap<>();
    /* access modifiers changed from: private */
    public Long mAlbumId;
    /* access modifiers changed from: private */
    public String mAlbumServerId;
    /* access modifiers changed from: private */
    public int mAliasCreateDate;
    /* access modifiers changed from: private */
    public int mAliasModifyDate;
    private int mAliasSortDate;
    /* access modifiers changed from: private */
    public long mAliasSortTime;
    /* access modifiers changed from: private */
    public long mBurstGroupId;
    /* access modifiers changed from: private */
    public String mCreatorId;
    /* access modifiers changed from: private */
    public long mDateModified;
    /* access modifiers changed from: private */
    public AlbumDelegate mDelegate;
    /* access modifiers changed from: private */
    public String mDescription;
    /* access modifiers changed from: private */
    public Long mDuration;
    /* access modifiers changed from: private */
    public FavoritesDelegate mFavoritesDelegate;
    /* access modifiers changed from: private */
    public String mFilePath;
    /* access modifiers changed from: private */
    public Integer mHeight;
    /* access modifiers changed from: private */
    public long mId;
    /* access modifiers changed from: private */
    public Boolean mIsSyncing;
    /* access modifiers changed from: private */
    public String mLatitude;
    /* access modifiers changed from: private */
    public Character mLatitudeRef;
    /* access modifiers changed from: private */
    public Long mLocalFlag;
    /* access modifiers changed from: private */
    public String mLocation;
    /* access modifiers changed from: private */
    public String mLongitude;
    /* access modifiers changed from: private */
    public Character mLongitudeRef;
    /* access modifiers changed from: private */
    public String mMicroThumb;
    /* access modifiers changed from: private */
    public String mMimeType;
    /* access modifiers changed from: private */
    public long mMixedTime;
    /* access modifiers changed from: private */
    public Integer mOrientation;
    /* access modifiers changed from: private */
    public byte[] mSecretKey;
    /* access modifiers changed from: private */
    public String mServerId;
    /* access modifiers changed from: private */
    public String mServerStatus;
    /* access modifiers changed from: private */
    public Long mServerTag;
    /* access modifiers changed from: private */
    public String mSha1;
    /* access modifiers changed from: private */
    public Long mSize;
    /* access modifiers changed from: private */
    public Long mSpecialTypeFlags;
    /* access modifiers changed from: private */
    public String mThumbnail;
    /* access modifiers changed from: private */
    public String mTitle;
    /* access modifiers changed from: private */
    public Integer mType;
    /* access modifiers changed from: private */
    public Integer mWidth;

    private static class AliasClearThumbnailFilter extends CompareFilter<MediaItem> {
        private static final Pattern DELIMITER_PATTERN = Pattern.compile("'\\s*,\\s*'");
        private String mAliasClearThumbnail;
        private Set<String> mFileSet;

        public AliasClearThumbnailFilter(Comparator comparator, String str) {
            super(-1, comparator, str);
            if (comparator == Comparator.EQUALS || comparator == Comparator.NOT_EQUALS) {
                this.mAliasClearThumbnail = str;
            } else if (comparator == Comparator.IN || comparator == Comparator.NOT_IN) {
                StringBuilder sb = new StringBuilder(str);
                int length = sb.length();
                if (length <= 0 || sb.charAt(0) != '(') {
                    throw new IllegalArgumentException("argument must start with '('");
                }
                sb.deleteCharAt(0);
                int i = length - 1;
                while (i > 0 && sb.charAt(0) == ' ') {
                    sb.deleteCharAt(0);
                    i--;
                }
                if (i > 0 && sb.charAt(0) == '\'') {
                    sb.deleteCharAt(0);
                    i--;
                }
                if (i > 0) {
                    int i2 = i - 1;
                    if (sb.charAt(i2) == ')') {
                        sb.deleteCharAt(i2);
                        int i3 = i - 1;
                        while (i3 > 0) {
                            int i4 = i3 - 1;
                            if (sb.charAt(i4) != ' ') {
                                break;
                            }
                            sb.deleteCharAt(i4);
                            i3--;
                        }
                        if (i3 > 0) {
                            int i5 = i3 - 1;
                            if (sb.charAt(i5) == '\'') {
                                sb.deleteCharAt(i5);
                                i3--;
                            }
                        }
                        this.mFileSet = new HashSet();
                        if (i3 > 0) {
                            Collections.addAll(this.mFileSet, TextUtils.split(sb.toString(), DELIMITER_PATTERN));
                            return;
                        }
                        return;
                    }
                }
                throw new IllegalArgumentException("argument must end with ')'");
            }
        }

        public MediaItem filter(MediaItem mediaItem) {
            if (this.mComparator == Comparator.EQUALS && TextUtils.equals(mediaItem.getAliasClearThumbnail(), this.mAliasClearThumbnail)) {
                return mediaItem;
            }
            if (this.mComparator == Comparator.NOT_NULL && !TextUtils.isEmpty(mediaItem.getAliasClearThumbnail())) {
                return mediaItem;
            }
            if (this.mComparator == Comparator.NOT_EQUALS && !TextUtils.equals(mediaItem.getAliasClearThumbnail(), this.mAliasClearThumbnail)) {
                return mediaItem;
            }
            if (this.mComparator == Comparator.IN && this.mFileSet.contains(mediaItem.getAliasClearThumbnail())) {
                return mediaItem;
            }
            if (this.mComparator != Comparator.NOT_IN || this.mFileSet.contains(mediaItem.getAliasClearThumbnail())) {
                return null;
            }
            return mediaItem;
        }
    }

    public static class Generator implements com.miui.gallery.provider.cache.CacheItem.Generator<MediaItem> {
        /* access modifiers changed from: private */
        public static final Map<String, Integer> COLUMN_MAP = new ArrayMap(PROJECTION.length);
        private static final ColumnMapper COLUMN_MAPPER = new ColumnMapper() {
            public int getIndex(String str) {
                Integer num = (Integer) Generator.COLUMN_MAP.get(str);
                if (num != null) {
                    return num.intValue();
                }
                Log.w(".provider.cache.MediaItem", "column '%s' not found", str);
                return -1;
            }
        };
        private static final String[] PROJECTION = {"_id", "sha1", "microthumbfile", "thumbnailFile", "localFile", "serverType", "title", "duration", "description", "location", "size", "localGroupId", "mimeType", "exifGPSLatitude", "exifGPSLatitudeRef", "exifGPSLongitude", "exifGPSLongitudeRef", "secretKey", "localFlag", "mixedDateTime", "exifImageWidth", "exifImageLength", "serverStatus", "dateModified", "creatorId", "serverTag", "serverId", "groupId", "specialTypeFlags", "exifOrientation"};
        private AlbumDelegate mAlbumDelegate;
        private FavoritesDelegate mFavoritesDelegate;

        private static class CloudIdFilter extends CompareFilter<MediaItem> {
            private static final Pattern ID_PATTERN = Pattern.compile("\\d+");
            private long mId;
            private Set<Long> mIdSet;

            public CloudIdFilter(Comparator comparator, String str) {
                super(0, comparator, str);
                if (comparator == Comparator.EQUALS) {
                    this.mId = Long.parseLong(str);
                } else if (comparator == Comparator.IN) {
                    this.mIdSet = new ArraySet();
                    Matcher matcher = ID_PATTERN.matcher(str);
                    while (matcher.find()) {
                        this.mIdSet.add(Long.valueOf(Long.parseLong(matcher.group())));
                    }
                }
            }

            public MediaItem filter(MediaItem mediaItem) {
                if (this.mComparator == Comparator.EQUALS && mediaItem.mId == this.mId) {
                    return mediaItem;
                }
                if (this.mComparator != Comparator.IN || !this.mIdSet.contains(Long.valueOf(mediaItem.mId))) {
                    return null;
                }
                return mediaItem;
            }
        }

        static {
            COLUMN_MAP.put("_id", Integer.valueOf(0));
            COLUMN_MAP.put("sha1", Integer.valueOf(1));
            COLUMN_MAP.put("microthumbfile", Integer.valueOf(2));
            COLUMN_MAP.put("thumbnailFile", Integer.valueOf(3));
            COLUMN_MAP.put("localFile", Integer.valueOf(4));
            COLUMN_MAP.put("serverType", Integer.valueOf(5));
            COLUMN_MAP.put("title", Integer.valueOf(6));
            COLUMN_MAP.put("duration", Integer.valueOf(7));
            COLUMN_MAP.put("description", Integer.valueOf(8));
            COLUMN_MAP.put("location", Integer.valueOf(9));
            COLUMN_MAP.put("size", Integer.valueOf(10));
            COLUMN_MAP.put("localGroupId", Integer.valueOf(11));
            COLUMN_MAP.put("mimeType", Integer.valueOf(12));
            COLUMN_MAP.put("exifGPSLatitude", Integer.valueOf(13));
            COLUMN_MAP.put("exifGPSLatitudeRef", Integer.valueOf(14));
            COLUMN_MAP.put("exifGPSLongitude", Integer.valueOf(15));
            COLUMN_MAP.put("exifGPSLongitudeRef", Integer.valueOf(16));
            COLUMN_MAP.put("secretKey", Integer.valueOf(17));
            COLUMN_MAP.put("localFlag", Integer.valueOf(18));
            COLUMN_MAP.put("mixedDateTime", Integer.valueOf(19));
            COLUMN_MAP.put("exifImageWidth", Integer.valueOf(20));
            COLUMN_MAP.put("exifImageLength", Integer.valueOf(21));
            COLUMN_MAP.put("serverStatus", Integer.valueOf(22));
            COLUMN_MAP.put("dateModified", Integer.valueOf(23));
            COLUMN_MAP.put("creatorId", Integer.valueOf(24));
            COLUMN_MAP.put("serverTag", Integer.valueOf(25));
            COLUMN_MAP.put("serverId", Integer.valueOf(26));
            COLUMN_MAP.put("groupId", Integer.valueOf(27));
            COLUMN_MAP.put("specialTypeFlags", Integer.valueOf(28));
            COLUMN_MAP.put("exifOrientation", Integer.valueOf(29));
        }

        public Generator(AlbumDelegate albumDelegate, FavoritesDelegate favoritesDelegate) {
            this.mAlbumDelegate = albumDelegate;
            this.mFavoritesDelegate = favoritesDelegate;
        }

        public MediaItem from(long j, ContentValues contentValues) {
            MediaItem mediaItem = new MediaItem();
            mediaItem.mId = j;
            mediaItem.mSha1 = contentValues.getAsString(PROJECTION[1]);
            mediaItem.mAlbumId = contentValues.getAsLong(PROJECTION[11]);
            mediaItem.mMicroThumb = contentValues.getAsString(PROJECTION[2]);
            mediaItem.mThumbnail = contentValues.getAsString(PROJECTION[3]);
            mediaItem.mFilePath = contentValues.getAsString(PROJECTION[4]);
            mediaItem.mType = contentValues.getAsInteger(PROJECTION[5]);
            mediaItem.mTitle = contentValues.getAsString(PROJECTION[6]);
            mediaItem.mDuration = contentValues.getAsLong(PROJECTION[7]);
            mediaItem.mDescription = contentValues.getAsString(PROJECTION[8]);
            mediaItem.mLocation = contentValues.getAsString(PROJECTION[9]);
            Long asLong = contentValues.getAsLong(PROJECTION[10]);
            long j2 = 0;
            mediaItem.mSize = Long.valueOf(asLong == null ? 0 : asLong.longValue());
            mediaItem.mMimeType = contentValues.getAsString(PROJECTION[12]);
            mediaItem.mLatitude = contentValues.getAsString(PROJECTION[13]);
            String asString = contentValues.getAsString(PROJECTION[14]);
            Character ch = null;
            mediaItem.mLatitudeRef = TextUtils.isEmpty(asString) ? null : Character.valueOf(asString.charAt(0));
            mediaItem.mLongitude = contentValues.getAsString(PROJECTION[15]);
            String asString2 = contentValues.getAsString(PROJECTION[16]);
            if (!TextUtils.isEmpty(asString2)) {
                ch = Character.valueOf(asString2.charAt(0));
            }
            mediaItem.mLongitudeRef = ch;
            mediaItem.mSecretKey = contentValues.getAsByteArray(PROJECTION[17]);
            mediaItem.mLocalFlag = contentValues.getAsLong(PROJECTION[18]);
            mediaItem.mWidth = contentValues.getAsInteger(PROJECTION[20]);
            mediaItem.mHeight = contentValues.getAsInteger(PROJECTION[21]);
            mediaItem.mServerStatus = contentValues.getAsString(PROJECTION[22]);
            Long asLong2 = contentValues.getAsLong(PROJECTION[19]);
            mediaItem.mMixedTime = asLong2 == null ? 0 : asLong2.longValue();
            Long asLong3 = contentValues.getAsLong(PROJECTION[23]);
            if (asLong3 != null) {
                j2 = asLong3.longValue();
            }
            mediaItem.mDateModified = j2;
            mediaItem.mAliasCreateDate = GalleryDateUtils.format(mediaItem.mMixedTime);
            mediaItem.mCreatorId = contentValues.getAsString(PROJECTION[24]);
            mediaItem.mDelegate = this.mAlbumDelegate;
            mediaItem.mServerTag = contentValues.getAsLong(PROJECTION[25]);
            mediaItem.mServerId = contentValues.getAsString(PROJECTION[26]);
            mediaItem.mAliasModifyDate = GalleryDateUtils.format(mediaItem.mDateModified);
            mediaItem.mFavoritesDelegate = this.mFavoritesDelegate;
            mediaItem.mAlbumServerId = contentValues.getAsString(PROJECTION[27]);
            mediaItem.mSpecialTypeFlags = contentValues.getAsLong(PROJECTION[28]);
            mediaItem.regenerateSortTimeAndDate();
            mediaItem.mOrientation = contentValues.getAsInteger(PROJECTION[29]);
            mediaItem.mBurstGroupId = MediaItem.generateBurstGroupId(mediaItem.mTitle);
            return mediaItem;
        }

        public MediaItem from(Cursor cursor) {
            MediaItem mediaItem = new MediaItem();
            mediaItem.mId = cursor.getLong(0);
            mediaItem.mSha1 = ParseUtils.getString(cursor, 1);
            mediaItem.mAlbumId = ParseUtils.getLong(cursor, 11);
            mediaItem.mMicroThumb = ParseUtils.getString(cursor, 2);
            mediaItem.mThumbnail = ParseUtils.getString(cursor, 3);
            mediaItem.mFilePath = ParseUtils.getString(cursor, 4);
            mediaItem.mType = ParseUtils.getInt(cursor, 5);
            mediaItem.mTitle = ParseUtils.getString(cursor, 6);
            mediaItem.mDuration = ParseUtils.getLong(cursor, 7);
            mediaItem.mDescription = ParseUtils.getString(cursor, 8);
            mediaItem.mLocation = ParseUtils.getString(cursor, 9);
            mediaItem.mSize = Long.valueOf(cursor.getLong(10));
            mediaItem.mMimeType = ParseUtils.getString(cursor, 12);
            mediaItem.mLatitude = ParseUtils.getString(cursor, 13);
            mediaItem.mLatitudeRef = ParseUtils.getChar(cursor, 14);
            mediaItem.mLongitude = ParseUtils.getString(cursor, 15);
            mediaItem.mLongitudeRef = ParseUtils.getChar(cursor, 16);
            mediaItem.mSecretKey = ParseUtils.getBlob(cursor, 17);
            mediaItem.mLocalFlag = ParseUtils.getLong(cursor, 18);
            mediaItem.mWidth = ParseUtils.getInt(cursor, 20);
            mediaItem.mHeight = ParseUtils.getInt(cursor, 21);
            mediaItem.mServerStatus = ParseUtils.getString(cursor, 22);
            mediaItem.mMixedTime = cursor.getLong(19);
            mediaItem.mDateModified = cursor.getLong(23);
            mediaItem.mAliasCreateDate = GalleryDateUtils.format(mediaItem.mMixedTime);
            mediaItem.mCreatorId = cursor.getString(24);
            mediaItem.mDelegate = this.mAlbumDelegate;
            mediaItem.mServerTag = Long.valueOf(cursor.getLong(25));
            mediaItem.mServerId = cursor.getString(26);
            mediaItem.mAliasModifyDate = GalleryDateUtils.format(mediaItem.mDateModified);
            mediaItem.mFavoritesDelegate = this.mFavoritesDelegate;
            mediaItem.mAlbumServerId = ParseUtils.getString(cursor, 27);
            mediaItem.mSpecialTypeFlags = ParseUtils.getLong(cursor, 28);
            mediaItem.regenerateSortTimeAndDate();
            mediaItem.mOrientation = ParseUtils.getInt(cursor, 29);
            mediaItem.mBurstGroupId = MediaItem.generateBurstGroupId(mediaItem.mTitle);
            return mediaItem;
        }

        public CompareFilter<MediaItem> getFilter(int i, Comparator comparator, String str) {
            return i == 0 ? new CloudIdFilter(comparator, str) : i == 1 ? new Sha1Filter(comparator, str) : Filter.NOT_SUPPORTED_FILTER;
        }

        public ColumnMapper getMapper() {
            return COLUMN_MAPPER;
        }

        public String[] getProjection() {
            return PROJECTION;
        }

        public void update(MediaItem mediaItem, ContentValues contentValues) {
            boolean z;
            if (contentValues.containsKey(PROJECTION[1])) {
                mediaItem.mSha1 = contentValues.getAsString(PROJECTION[1]);
            }
            boolean z2 = false;
            if (contentValues.containsKey(PROJECTION[11])) {
                mediaItem.mAlbumId = contentValues.getAsLong(PROJECTION[11]);
                z = true;
            } else {
                z = false;
            }
            if (contentValues.containsKey(PROJECTION[2])) {
                mediaItem.mMicroThumb = contentValues.getAsString(PROJECTION[2]);
            }
            if (contentValues.containsKey(PROJECTION[3])) {
                mediaItem.mThumbnail = contentValues.getAsString(PROJECTION[3]);
            }
            if (contentValues.containsKey(PROJECTION[4])) {
                mediaItem.mFilePath = contentValues.getAsString(PROJECTION[4]);
            }
            if (contentValues.containsKey(PROJECTION[5])) {
                mediaItem.mType = contentValues.getAsInteger(PROJECTION[5]);
            }
            if (contentValues.containsKey(PROJECTION[6])) {
                mediaItem.mTitle = contentValues.getAsString(PROJECTION[6]);
                mediaItem.mBurstGroupId = MediaItem.generateBurstGroupId(mediaItem.mTitle);
            }
            if (contentValues.containsKey(PROJECTION[7])) {
                mediaItem.mDuration = contentValues.getAsLong(PROJECTION[7]);
            }
            if (contentValues.containsKey(PROJECTION[8])) {
                mediaItem.mDescription = contentValues.getAsString(PROJECTION[8]);
            }
            if (contentValues.containsKey(PROJECTION[9])) {
                mediaItem.mLocation = contentValues.getAsString(PROJECTION[9]);
            }
            long j = 0;
            if (contentValues.containsKey(PROJECTION[10])) {
                Long asLong = contentValues.getAsLong(PROJECTION[10]);
                mediaItem.mSize = Long.valueOf(asLong == null ? 0 : asLong.longValue());
            }
            if (contentValues.containsKey(PROJECTION[12])) {
                mediaItem.mMimeType = contentValues.getAsString(PROJECTION[12]);
            }
            if (contentValues.containsKey(PROJECTION[13])) {
                mediaItem.mLatitude = contentValues.getAsString(PROJECTION[13]);
            }
            if (contentValues.containsKey(PROJECTION[14])) {
                String asString = contentValues.getAsString(PROJECTION[14]);
                mediaItem.mLatitudeRef = asString == null ? null : Character.valueOf(asString.charAt(0));
            }
            if (contentValues.containsKey(PROJECTION[15])) {
                mediaItem.mLongitude = contentValues.getAsString(PROJECTION[15]);
            }
            if (contentValues.containsKey(PROJECTION[16])) {
                String asString2 = contentValues.getAsString(PROJECTION[16]);
                mediaItem.mLongitudeRef = asString2 == null ? null : Character.valueOf(asString2.charAt(0));
            }
            if (contentValues.containsKey(PROJECTION[19])) {
                Long asLong2 = contentValues.getAsLong(PROJECTION[19]);
                mediaItem.mMixedTime = asLong2 == null ? 0 : asLong2.longValue();
                mediaItem.mAliasCreateDate = GalleryDateUtils.format(mediaItem.mMixedTime);
                z = true;
            }
            if (contentValues.containsKey(PROJECTION[17])) {
                mediaItem.mSecretKey = contentValues.getAsByteArray(PROJECTION[17]);
            }
            if (contentValues.containsKey(PROJECTION[18])) {
                mediaItem.mLocalFlag = contentValues.getAsLong(PROJECTION[18]);
            }
            if (contentValues.containsKey("sync_status")) {
                if (SyncStatus.valueOf(contentValues.getAsString("sync_status")) == SyncStatus.STATUS_INIT) {
                    z2 = true;
                }
                mediaItem.mIsSyncing = Boolean.valueOf(z2);
            }
            if (contentValues.containsKey(PROJECTION[20])) {
                mediaItem.mWidth = contentValues.getAsInteger(PROJECTION[20]);
            }
            if (contentValues.containsKey(PROJECTION[21])) {
                mediaItem.mHeight = contentValues.getAsInteger(PROJECTION[21]);
            }
            if (contentValues.containsKey(PROJECTION[22])) {
                mediaItem.mServerStatus = contentValues.getAsString(PROJECTION[22]);
            }
            if (contentValues.containsKey(PROJECTION[23])) {
                Long asLong3 = contentValues.getAsLong(PROJECTION[23]);
                if (asLong3 != null) {
                    j = asLong3.longValue();
                }
                mediaItem.mDateModified = j;
                mediaItem.mAliasModifyDate = GalleryDateUtils.format(mediaItem.mDateModified);
                z = true;
            }
            if (contentValues.containsKey(PROJECTION[24])) {
                mediaItem.mCreatorId = contentValues.getAsString(PROJECTION[24]);
            }
            if (contentValues.containsKey(PROJECTION[25])) {
                mediaItem.mServerTag = contentValues.getAsLong(PROJECTION[25]);
            }
            if (contentValues.containsKey(PROJECTION[26])) {
                mediaItem.mServerId = contentValues.getAsString(PROJECTION[26]);
            }
            if (contentValues.containsKey(PROJECTION[27])) {
                mediaItem.mAlbumServerId = contentValues.getAsString(PROJECTION[27]);
            }
            if (contentValues.containsKey(PROJECTION[28])) {
                mediaItem.mSpecialTypeFlags = contentValues.getAsLong(PROJECTION[28]);
            }
            if (z) {
                mediaItem.regenerateSortTimeAndDate();
            }
            if (contentValues.containsKey(PROJECTION[29])) {
                mediaItem.mOrientation = contentValues.getAsInteger(PROJECTION[29]);
            }
        }
    }

    public static class QueryFactory implements com.miui.gallery.provider.cache.CacheItem.QueryFactory<MediaItem> {
        private static final ColumnMapper COLUMN_MAPPER = new ColumnMapper() {
            public int getIndex(String str) {
                Integer num = (Integer) MediaItem.PROJECTION.get(str);
                if (num != null) {
                    return num.intValue();
                }
                Log.e(".provider.cache.MediaItem", "column '%s' not found", (Object) str);
                return -1;
            }
        };
        private static CompareFilter<MediaItem> IS_FAVORITE_FILTER = new CompareFilter<MediaItem>(33, null, null) {
            public MediaItem filter(MediaItem mediaItem) {
                if (mediaItem.getAliasIsFavorite() == CacheItem.TRUE) {
                    return mediaItem;
                }
                return null;
            }
        };
        private static CompareFilter<MediaItem> NOT_HIDDEN_FILTER = new CompareFilter<MediaItem>(27, null, null) {
            public MediaItem filter(MediaItem mediaItem) {
                if (mediaItem.getAliasHidden() == CacheItem.FALSE) {
                    return mediaItem;
                }
                return null;
            }
        };
        private static final Merger<MediaItem> SHA1_MERGER = new Merger<MediaItem>() {
            public MediaItem merge(MediaItem mediaItem, MediaItem mediaItem2, int i) {
                return mediaItem.getAliasSyncState().longValue() < mediaItem2.getAliasSyncState().longValue() ? mediaItem : mediaItem2;
            }
        };
        private static CompareFilter<MediaItem> SHOW_IN_HOMEPAGE_FILTER = new CompareFilter<MediaItem>(24, null, null) {
            public MediaItem filter(MediaItem mediaItem) {
                if (mediaItem.getAliasShowInHomePage() == CacheItem.TRUE) {
                    return mediaItem;
                }
                return null;
            }
        };

        private static class AlbumFilter extends CompareFilter<MediaItem> {
            private long mAlbumId;

            public AlbumFilter(Comparator comparator, String str) {
                super(-1, comparator, str);
                this.mAlbumId = Long.parseLong(str);
            }

            public MediaItem filter(MediaItem mediaItem) {
                if (this.mComparator == Comparator.EQUALS && Numbers.equals(mediaItem.mAlbumId, this.mAlbumId)) {
                    return mediaItem;
                }
                if (this.mComparator != Comparator.NOT_EQUALS || Numbers.equals(mediaItem.mAlbumId, this.mAlbumId)) {
                    return null;
                }
                return mediaItem;
            }
        }

        private static class AlbumServerIdFilter extends CompareFilter<MediaItem> {
            private String mAlbumServerId;

            public AlbumServerIdFilter(Comparator comparator, String str) {
                super(-1, comparator, str);
                this.mAlbumServerId = str;
            }

            public MediaItem filter(MediaItem mediaItem) {
                if (this.mComparator == Comparator.EQUALS && TextUtils.equals(mediaItem.mAlbumServerId, this.mAlbumServerId)) {
                    return mediaItem;
                }
                if (this.mComparator != Comparator.NOT_EQUALS || TextUtils.equals(mediaItem.mAlbumServerId, this.mAlbumServerId)) {
                    return null;
                }
                return mediaItem;
            }
        }

        private static class AliasCreateDateFilter extends CompareFilter<MediaItem> {
            private static final Pattern ID_PATTERN = Pattern.compile("\\d+");
            private int mAliasCreateDate;
            private Set<Integer> mCreateDateSet;

            public AliasCreateDateFilter(Comparator comparator, String str) {
                super(-1, comparator, str);
                if (comparator == Comparator.EQUALS) {
                    this.mAliasCreateDate = Integer.parseInt(str);
                } else if (comparator == Comparator.IN) {
                    this.mCreateDateSet = new HashSet();
                    Matcher matcher = ID_PATTERN.matcher(str);
                    while (matcher.find()) {
                        this.mCreateDateSet.add(Integer.valueOf(Integer.parseInt(matcher.group())));
                    }
                }
            }

            public MediaItem filter(MediaItem mediaItem) {
                if (this.mComparator == Comparator.EQUALS && mediaItem.mAliasCreateDate == this.mAliasCreateDate) {
                    return mediaItem;
                }
                if (this.mComparator != Comparator.IN || !this.mCreateDateSet.contains(Integer.valueOf(mediaItem.mAliasCreateDate))) {
                    return null;
                }
                return mediaItem;
            }
        }

        private static class DateModifiedComparator extends TimeComparator {
            public DateModifiedComparator(boolean z) {
                super(z);
            }

            public int compare(MediaItem mediaItem, MediaItem mediaItem2) {
                int compare = Long.compare(mediaItem.mDateModified, mediaItem2.mDateModified);
                return compare == 0 ? super.compare(mediaItem, mediaItem2) : this.mDescent ? -compare : compare;
            }
        }

        private static class IdFilter extends CompareFilter<MediaItem> {
            private static final Pattern ID_PATTERN = Pattern.compile("\\d+");
            private long mId;
            private Set<Long> mIdSet;

            public IdFilter(Comparator comparator, String str) {
                super(-1, comparator, str);
                if (comparator == Comparator.EQUALS) {
                    this.mId = Long.parseLong(str);
                } else if (comparator == Comparator.IN) {
                    this.mIdSet = new ArraySet();
                    Matcher matcher = ID_PATTERN.matcher(str);
                    while (matcher.find()) {
                        this.mIdSet.add(Long.valueOf(Long.parseLong(matcher.group())));
                    }
                }
            }

            public MediaItem filter(MediaItem mediaItem) {
                if (this.mComparator == Comparator.EQUALS && mediaItem.mId == this.mId) {
                    return mediaItem;
                }
                if (this.mComparator != Comparator.IN || !this.mIdSet.contains(Long.valueOf(mediaItem.mId))) {
                    return null;
                }
                return mediaItem;
            }
        }

        private static class LocalFileFilter extends CompareFilter<MediaItem> {
            private static final Pattern DELIMITER_PATTERN = Pattern.compile("'\\s*,\\s*'");
            private String mLocalFile;
            private Set<String> mLocalFileSet;

            public LocalFileFilter(Comparator comparator, String str) {
                super(-1, comparator, str);
                if (comparator == Comparator.EQUALS || comparator == Comparator.NOT_EQUALS) {
                    this.mLocalFile = str;
                } else if (comparator == Comparator.IN || comparator == Comparator.NOT_IN) {
                    StringBuilder sb = new StringBuilder(str);
                    int length = sb.length();
                    if (length <= 0 || sb.charAt(0) != '(') {
                        throw new IllegalArgumentException("argument must start with '('");
                    }
                    sb.deleteCharAt(0);
                    int i = length - 1;
                    while (i > 0 && sb.charAt(0) == ' ') {
                        sb.deleteCharAt(0);
                        i--;
                    }
                    if (i > 0 && sb.charAt(0) == '\'') {
                        sb.deleteCharAt(0);
                        i--;
                    }
                    if (i > 0) {
                        int i2 = i - 1;
                        if (sb.charAt(i2) == ')') {
                            sb.deleteCharAt(i2);
                            int i3 = i - 1;
                            while (i3 > 0) {
                                int i4 = i3 - 1;
                                if (sb.charAt(i4) != ' ') {
                                    break;
                                }
                                sb.deleteCharAt(i4);
                                i3--;
                            }
                            if (i3 > 0) {
                                int i5 = i3 - 1;
                                if (sb.charAt(i5) == '\'') {
                                    sb.deleteCharAt(i5);
                                    i3--;
                                }
                            }
                            this.mLocalFileSet = new HashSet();
                            if (i3 > 0) {
                                Collections.addAll(this.mLocalFileSet, TextUtils.split(sb.toString(), DELIMITER_PATTERN));
                                return;
                            }
                            return;
                        }
                    }
                    throw new IllegalArgumentException("argument must end with ')'");
                }
            }

            public MediaItem filter(MediaItem mediaItem) {
                if (this.mComparator == Comparator.EQUALS && TextUtils.equals(mediaItem.mFilePath, this.mLocalFile)) {
                    return mediaItem;
                }
                if (this.mComparator == Comparator.NOT_NULL && !TextUtils.isEmpty(mediaItem.mFilePath)) {
                    return mediaItem;
                }
                if (this.mComparator == Comparator.NOT_EQUALS && !TextUtils.equals(mediaItem.mFilePath, this.mLocalFile)) {
                    return mediaItem;
                }
                if (this.mComparator == Comparator.IN && this.mLocalFileSet.contains(mediaItem.mFilePath)) {
                    return mediaItem;
                }
                if (this.mComparator != Comparator.NOT_IN || this.mLocalFileSet.contains(mediaItem.mFilePath)) {
                    return null;
                }
                return mediaItem;
            }
        }

        private static class LocalFlagFilter extends CompareFilter<MediaItem> {
            private int mLocalFlag;

            public LocalFlagFilter(Comparator comparator, String str) {
                super(-1, comparator, str);
                this.mLocalFlag = Integer.parseInt(str);
            }

            public MediaItem filter(MediaItem mediaItem) {
                if (this.mComparator == Comparator.EQUALS && Numbers.equals(mediaItem.mLocalFlag, this.mLocalFlag)) {
                    return mediaItem;
                }
                if (this.mComparator != Comparator.NOT_EQUALS || Numbers.equals(mediaItem.mLocalFlag, this.mLocalFlag)) {
                    return null;
                }
                return mediaItem;
            }
        }

        private static class LocationFilter extends CompareFilter<MediaItem> {
            private String mLocation;

            public LocationFilter(Comparator comparator, String str) {
                super(-1, comparator, str);
                this.mLocation = str;
            }

            public MediaItem filter(MediaItem mediaItem) {
                if (this.mComparator == Comparator.EQUALS && TextUtils.equals(mediaItem.mLocation, this.mLocation)) {
                    return mediaItem;
                }
                if (this.mComparator != Comparator.NOT_NULL || mediaItem.mLocation == null) {
                    return null;
                }
                return mediaItem;
            }
        }

        private static class MineTypeFilter extends CompareFilter<MediaItem> {
            private String mMineType;

            public MineTypeFilter(Comparator comparator, String str) {
                super(-1, comparator, str);
                this.mMineType = str;
            }

            public MediaItem filter(MediaItem mediaItem) {
                if (this.mComparator == Comparator.EQUALS && TextUtils.equals(mediaItem.mMimeType, this.mMineType)) {
                    return mediaItem;
                }
                if (this.mComparator != Comparator.NOT_EQUALS || TextUtils.equals(mediaItem.mMimeType, this.mMineType)) {
                    return null;
                }
                return mediaItem;
            }
        }

        private static class ServerIdFilter extends CompareFilter<MediaItem> {
            private static final Pattern ID_PATTERN = Pattern.compile("[0-9]+");
            private Set<String> mIdSet;
            private String mServerId;

            public ServerIdFilter(Comparator comparator, String str) {
                super(-1, comparator, str);
                if (comparator == Comparator.EQUALS) {
                    this.mServerId = str;
                } else if (comparator == Comparator.IN) {
                    this.mIdSet = new HashSet();
                    Matcher matcher = ID_PATTERN.matcher(str);
                    while (matcher.find()) {
                        this.mIdSet.add(matcher.group());
                    }
                }
            }

            public MediaItem filter(MediaItem mediaItem) {
                if (this.mComparator == Comparator.EQUALS && TextUtils.equals(mediaItem.mServerId, this.mServerId)) {
                    return mediaItem;
                }
                if (this.mComparator == Comparator.IN && this.mIdSet.contains(mediaItem.mServerId)) {
                    return mediaItem;
                }
                if (this.mComparator != Comparator.NOT_NULL || mediaItem.mServerId == null) {
                    return null;
                }
                return mediaItem;
            }
        }

        private static class ServerTagFilter extends CompareFilter<MediaItem> {
            private long mServerTag;

            public ServerTagFilter(Comparator comparator, String str) {
                super(-1, comparator, str);
                this.mServerTag = Long.parseLong(str);
            }

            public MediaItem filter(MediaItem mediaItem) {
                if (this.mComparator != Comparator.GREATER_OR_EQUAL || Numbers.compare(Long.valueOf(this.mServerTag), mediaItem.mServerTag) > 0) {
                    return null;
                }
                return mediaItem;
            }
        }

        private static class Sha1Filter extends CompareFilter<MediaItem> {
            private static final Pattern SHA1_PATTERN = Pattern.compile("[0-9a-fA-F]+");
            private String mSha1;
            private Set<String> mSha1Set;

            public Sha1Filter(Comparator comparator, String str) {
                super(-1, comparator, str);
                if (comparator == Comparator.EQUALS) {
                    this.mSha1 = str;
                } else if (comparator == Comparator.IN) {
                    this.mSha1Set = new ArraySet();
                    Matcher matcher = SHA1_PATTERN.matcher(str);
                    while (matcher.find()) {
                        this.mSha1Set.add(matcher.group());
                    }
                }
            }

            public MediaItem filter(MediaItem mediaItem) {
                if (this.mComparator == Comparator.EQUALS && TextUtils.equals(mediaItem.mSha1, this.mSha1)) {
                    return mediaItem;
                }
                if (this.mComparator == Comparator.IN && this.mSha1Set.contains(mediaItem.mSha1)) {
                    return mediaItem;
                }
                if (this.mComparator != Comparator.NOT_NULL || mediaItem.mSha1 == null) {
                    return null;
                }
                return mediaItem;
            }
        }

        private static class SizeComparator implements java.util.Comparator<MediaItem> {
            private boolean mDescent;

            public SizeComparator(boolean z) {
                this.mDescent = z;
            }

            public int compare(MediaItem mediaItem, MediaItem mediaItem2) {
                int compare = Long.compare(mediaItem.mSize.longValue(), mediaItem2.mSize.longValue());
                return this.mDescent ? -compare : compare;
            }
        }

        private static class SizeFilter extends CompareFilter<MediaItem> {
            private long mSize;

            public SizeFilter(Comparator comparator, String str) {
                super(-1, comparator, str);
                this.mSize = Long.parseLong(str);
            }

            public MediaItem filter(MediaItem mediaItem) {
                if (this.mComparator == Comparator.EQUALS && mediaItem.mSize.longValue() == this.mSize) {
                    return mediaItem;
                }
                if (this.mComparator == Comparator.GREATER && mediaItem.mSize.longValue() > this.mSize) {
                    return mediaItem;
                }
                if (this.mComparator == Comparator.GREATER_OR_EQUAL && mediaItem.mSize.longValue() >= this.mSize) {
                    return mediaItem;
                }
                if (this.mComparator == Comparator.LESS && mediaItem.mSize.longValue() < this.mSize) {
                    return mediaItem;
                }
                if (this.mComparator != Comparator.LESS_OR_EQUAL || mediaItem.mSize.longValue() > this.mSize) {
                    return null;
                }
                return mediaItem;
            }
        }

        private static class SortTimeComparator extends TimeComparator {
            public SortTimeComparator(boolean z) {
                super(z);
            }

            public int compare(MediaItem mediaItem, MediaItem mediaItem2) {
                int compare = Long.compare(mediaItem.mAliasSortTime, mediaItem2.mAliasSortTime);
                return compare == 0 ? super.compare(mediaItem, mediaItem2) : this.mDescent ? -compare : compare;
            }
        }

        private static class SyncStateFilter extends CompareFilter<MediaItem> {
            private int mSyncState;

            public SyncStateFilter(Comparator comparator, String str) {
                super(-1, comparator, str);
                this.mSyncState = Integer.parseInt(str);
            }

            public MediaItem filter(MediaItem mediaItem) {
                if (this.mComparator == Comparator.EQUALS && ((long) this.mSyncState) == mediaItem.getAliasSyncState().longValue()) {
                    return mediaItem;
                }
                return null;
            }
        }

        private static class ThumbnailFilter extends CompareFilter<MediaItem> {
            private static final Pattern THUMBNAIL_PATTERN = Pattern.compile("[0-9a-fA-F]+");
            private String mThumbnail;

            public ThumbnailFilter(Comparator comparator, String str) {
                super(-1, comparator, str);
                if (comparator == Comparator.EQUALS || comparator == Comparator.NOT_EQUALS) {
                    this.mThumbnail = str;
                }
            }

            public MediaItem filter(MediaItem mediaItem) {
                if (this.mComparator == Comparator.EQUALS && TextUtils.equals(mediaItem.mThumbnail, this.mThumbnail)) {
                    return mediaItem;
                }
                if (this.mComparator == Comparator.NOT_NULL && mediaItem.mThumbnail != null) {
                    return mediaItem;
                }
                if (this.mComparator != Comparator.NOT_EQUALS || TextUtils.equals(mediaItem.mThumbnail, this.mThumbnail)) {
                    return null;
                }
                return mediaItem;
            }
        }

        private static class TimeComparator implements java.util.Comparator<MediaItem> {
            protected boolean mDescent;

            public TimeComparator(boolean z) {
                this.mDescent = z;
            }

            public int compare(MediaItem mediaItem, MediaItem mediaItem2) {
                int compare = Long.compare(mediaItem.mMixedTime, mediaItem2.mMixedTime);
                if (compare == 0 && mediaItem.mDateModified != mediaItem2.mDateModified) {
                    compare = Long.compare(mediaItem.mDateModified, mediaItem2.mDateModified);
                } else if (compare == 0) {
                    compare = Long.compare(mediaItem.mId, mediaItem2.mId);
                }
                return this.mDescent ? -compare : compare;
            }
        }

        private static class TitleComparator implements java.util.Comparator<MediaItem> {
            private boolean mDescent;

            public TitleComparator(boolean z) {
                this.mDescent = z;
            }

            public int compare(MediaItem mediaItem, MediaItem mediaItem2) {
                int i;
                if (mediaItem.mTitle != null && mediaItem2.mTitle != null) {
                    i = mediaItem.mTitle.compareTo(mediaItem2.mTitle);
                } else if (mediaItem.mTitle != null) {
                    i = 1;
                } else if (mediaItem2.mTitle == null) {
                    return 0;
                } else {
                    i = -1;
                }
                if (this.mDescent) {
                    i = -i;
                }
                return i;
            }
        }

        private static class TitleFilter extends CompareFilter<MediaItem> {
            private int mFilterType = -1;

            public TitleFilter(Comparator comparator, String str) {
                super(-1, comparator, str);
                if (this.mArgument.startsWith("PANO")) {
                    this.mFilterType = 1;
                } else if (this.mArgument.startsWith("Screenshot")) {
                    this.mFilterType = 2;
                }
            }

            private boolean isPanoItem(MediaItem mediaItem) {
                return isPanoItemSize(mediaItem) && isPanoItemNamed(mediaItem) && !isSecretAlbumItem(mediaItem);
            }

            private boolean isPanoItemNamed(MediaItem mediaItem) {
                return (mediaItem == null || mediaItem.mTitle == null || !mediaItem.mTitle.startsWith("PANO")) ? false : true;
            }

            private boolean isPanoItemSize(MediaItem mediaItem) {
                boolean z = false;
                if (mediaItem == null || mediaItem.mWidth == null || mediaItem.mHeight == null) {
                    return false;
                }
                if (mediaItem.mWidth.intValue() > 1080 && mediaItem.mHeight.intValue() != 0 && ((float) mediaItem.mWidth.intValue()) / ((float) mediaItem.mHeight.intValue()) > 3.0f) {
                    z = true;
                }
                return z;
            }

            private boolean isScreenshotItem(MediaItem mediaItem) {
                return (mediaItem == null || mediaItem.mTitle == null || !mediaItem.mTitle.startsWith("Screenshot")) ? false : true;
            }

            private boolean isSecretAlbumItem(MediaItem mediaItem) {
                return (mediaItem == null || mediaItem.mAlbumId == null || mediaItem.mAlbumId.longValue() != -1000) ? false : true;
            }

            public MediaItem filter(MediaItem mediaItem) {
                if (this.mComparator == Comparator.LIKE && this.mFilterType > 0) {
                    switch (this.mFilterType) {
                        case 1:
                            if (!isPanoItem(mediaItem)) {
                                mediaItem = null;
                            }
                            return mediaItem;
                        case 2:
                            if (!isScreenshotItem(mediaItem)) {
                                mediaItem = null;
                            }
                            return mediaItem;
                    }
                }
                return null;
            }
        }

        private static class TypeFilter extends CompareFilter<MediaItem> {
            private int mType;

            public TypeFilter(Comparator comparator, String str) {
                super(-1, comparator, str);
                this.mType = Integer.parseInt(str);
            }

            public MediaItem filter(MediaItem mediaItem) {
                if (this.mComparator != Comparator.EQUALS || !Numbers.equals(mediaItem.mType, this.mType)) {
                    return null;
                }
                return mediaItem;
            }
        }

        public java.util.Comparator<MediaItem> getComparator(int i, boolean z) {
            if (i == 18) {
                return new TimeComparator(z);
            }
            if (i == 7) {
                return new TitleComparator(z);
            }
            if (i == 10) {
                return new SizeComparator(z);
            }
            if (i == 30) {
                return new DateModifiedComparator(z);
            }
            if (i == 36) {
                return new SortTimeComparator(z);
            }
            return null;
        }

        public CompareFilter<MediaItem> getFilter(int i, Comparator comparator, String str) {
            return i == 24 ? SHOW_IN_HOMEPAGE_FILTER : i == 0 ? new IdFilter(comparator, str) : i == 2 ? new AlbumFilter(comparator, str) : i == 6 ? new TypeFilter(comparator, str) : i == 1 ? new Sha1Filter(comparator, str) : i == 20 ? new SyncStateFilter(comparator, str) : i == 7 ? new TitleFilter(comparator, str) : i == 5 ? new LocalFileFilter(comparator, str) : i == 4 ? new ThumbnailFilter(comparator, str) : i == 26 ? new LocalFlagFilter(comparator, str) : i == 27 ? NOT_HIDDEN_FILTER : i == 28 ? new ServerTagFilter(comparator, str) : i == 29 ? new ServerIdFilter(comparator, str) : i == 19 ? new AliasCreateDateFilter(comparator, str) : i == 33 ? IS_FAVORITE_FILTER : i == 11 ? new MineTypeFilter(comparator, str) : i == 34 ? new AlbumServerIdFilter(comparator, str) : i == 12 ? new LocationFilter(comparator, str) : i == 10 ? new SizeFilter(comparator, str) : i == 32 ? new AliasClearThumbnailFilter(comparator, str) : Filter.NOT_SUPPORTED_FILTER;
        }

        public ColumnMapper getMapper() {
            return COLUMN_MAPPER;
        }

        public Merger<MediaItem> getMerger(int i) {
            if (i == 1) {
                return SHA1_MERGER;
            }
            return null;
        }
    }

    static {
        PROJECTION.put("_id", Integer.valueOf(0));
        PROJECTION.put("sha1", Integer.valueOf(1));
        PROJECTION.put("localGroupId", Integer.valueOf(2));
        PROJECTION.put("microthumbfile", Integer.valueOf(3));
        PROJECTION.put("thumbnailFile", Integer.valueOf(4));
        PROJECTION.put("localFile", Integer.valueOf(5));
        PROJECTION.put("serverType", Integer.valueOf(6));
        PROJECTION.put("title", Integer.valueOf(7));
        PROJECTION.put("duration", Integer.valueOf(8));
        PROJECTION.put("description", Integer.valueOf(9));
        PROJECTION.put("size", Integer.valueOf(10));
        PROJECTION.put("mimeType", Integer.valueOf(11));
        PROJECTION.put("location", Integer.valueOf(12));
        PROJECTION.put("exifGPSLatitude", Integer.valueOf(13));
        PROJECTION.put("exifGPSLatitudeRef", Integer.valueOf(14));
        PROJECTION.put("exifGPSLongitude", Integer.valueOf(15));
        PROJECTION.put("exifGPSLongitudeRef", Integer.valueOf(16));
        PROJECTION.put("alias_micro_thumbnail", Integer.valueOf(17));
        PROJECTION.put("alias_create_time", Integer.valueOf(18));
        PROJECTION.put("alias_create_date", Integer.valueOf(19));
        PROJECTION.put("alias_sync_state", Integer.valueOf(20));
        PROJECTION.put("secretKey", Integer.valueOf(21));
        PROJECTION.put("exifImageWidth", Integer.valueOf(22));
        PROJECTION.put("exifImageLength", Integer.valueOf(23));
        PROJECTION.put("alias_show_in_homepage", Integer.valueOf(24));
        PROJECTION.put("creatorId", Integer.valueOf(25));
        PROJECTION.put("localFlag", Integer.valueOf(26));
        PROJECTION.put("alias_hidden", Integer.valueOf(27));
        PROJECTION.put("serverTag", Integer.valueOf(28));
        PROJECTION.put("serverId", Integer.valueOf(29));
        PROJECTION.put("dateModified", Integer.valueOf(30));
        PROJECTION.put("alias_modify_date", Integer.valueOf(31));
        PROJECTION.put("alias_clear_thumbnail", Integer.valueOf(32));
        PROJECTION.put("alias_is_favorite", Integer.valueOf(33));
        PROJECTION.put("groupId", Integer.valueOf(34));
        PROJECTION.put("specialTypeFlags", Integer.valueOf(35));
        PROJECTION.put("alias_sort_time", Integer.valueOf(36));
        PROJECTION.put("alias_sort_date", Integer.valueOf(37));
        PROJECTION.put("exifOrientation", Integer.valueOf(38));
        PROJECTION.put("burst_group_id", Integer.valueOf(39));
    }

    MediaItem() {
    }

    /* access modifiers changed from: private */
    public static long generateBurstGroupId(String str) {
        if (TextUtils.isEmpty(str) || !str.contains("_BURST")) {
            return (long) DEFAULT_INT.intValue();
        }
        String[] split = str.split("_");
        if (split == null || split.length < 4) {
            return (long) DEFAULT_INT.intValue();
        }
        try {
            return Long.parseLong(split[1].concat(split[2]));
        } catch (NumberFormatException e) {
            Log.e(".provider.cache.MediaItem", "generate burst group id error", (Object) e);
            return (long) DEFAULT_INT.intValue();
        }
    }

    /* access modifiers changed from: private */
    public Long getAliasSyncState() {
        if (this.mLocalFlag == null) {
            Log.e(".provider.cache.MediaItem", "localFlag is null!");
            return Long.valueOf(2147483647L);
        } else if (this.mLocalFlag.longValue() == 0) {
            return Long.valueOf(0);
        } else {
            if (this.mLocalFlag.longValue() == 5 || this.mLocalFlag.longValue() == 6 || this.mLocalFlag.longValue() == 9) {
                return Long.valueOf(1);
            }
            if (this.mAlbumId == null || !this.mDelegate.isAutoUpload(this.mAlbumId.longValue())) {
                return Long.valueOf(4);
            }
            if (this.mIsSyncing == null) {
                UploadStatusItem uploadStatus = SyncProxy.getInstance().getUploadStatusProxy().getUploadStatus(new UploadStatusItem(ItemType.OWNER, String.valueOf(this.mId)));
                this.mIsSyncing = Boolean.valueOf(uploadStatus != null && uploadStatus.mStatus == SyncStatus.STATUS_INIT);
            }
            return this.mIsSyncing.booleanValue() ? Long.valueOf(2) : Long.valueOf(3);
        }
    }

    /* access modifiers changed from: private */
    public void regenerateSortTimeAndDate() {
        if (this.mAlbumId == null) {
            this.mAliasSortTime = this.mMixedTime;
            this.mAliasSortDate = this.mAliasCreateDate;
            return;
        }
        SortDate sortDate = this.mDelegate.getSortDate(this.mAlbumId.longValue());
        switch (sortDate) {
            case CREATE_TIME:
                this.mAliasSortTime = this.mMixedTime;
                this.mAliasSortDate = this.mAliasCreateDate;
                return;
            case MODIFY_TIME:
                this.mAliasSortTime = this.mDateModified;
                this.mAliasSortDate = this.mAliasModifyDate;
                return;
            default:
                StringBuilder sb = new StringBuilder();
                sb.append("Unsupported sort date ");
                sb.append(sortDate);
                throw new IllegalArgumentException(sb.toString());
        }
    }

    public boolean columnEquals(CacheItem cacheItem, int i) {
        return CacheUtils.columnEquals(this, cacheItem, i);
    }

    public boolean fillWindow(CursorWindow cursorWindow, int i, int i2, int i3) {
        String str = null;
        switch (i3) {
            case 0:
                return ParseUtils.putLong(cursorWindow, Long.valueOf(this.mId), i, i2);
            case 1:
                return ParseUtils.putString(cursorWindow, this.mSha1, i, i2);
            case 2:
                return ParseUtils.putLong(cursorWindow, this.mAlbumId, i, i2);
            case 3:
                return ParseUtils.putString(cursorWindow, this.mMicroThumb, i, i2);
            case 4:
                return ParseUtils.putString(cursorWindow, this.mThumbnail, i, i2);
            case 5:
                return ParseUtils.putString(cursorWindow, this.mFilePath, i, i2);
            case 6:
                return ParseUtils.putLong(cursorWindow, this.mType, i, i2);
            case 7:
                return ParseUtils.putString(cursorWindow, this.mTitle, i, i2);
            case 8:
                return ParseUtils.putLong(cursorWindow, this.mDuration, i, i2);
            case 9:
                return ParseUtils.putString(cursorWindow, this.mDescription, i, i2);
            case 10:
                return cursorWindow.putLong(this.mSize.longValue(), i, i2);
            case 11:
                return ParseUtils.putString(cursorWindow, this.mMimeType, i, i2);
            case 12:
                return ParseUtils.putString(cursorWindow, this.mLocation, i, i2);
            case 13:
                return ParseUtils.putString(cursorWindow, this.mLatitude, i, i2);
            case 14:
                if (this.mLatitudeRef != null) {
                    str = String.valueOf(this.mLatitudeRef);
                }
                return ParseUtils.putString(cursorWindow, str, i, i2);
            case 15:
                return ParseUtils.putString(cursorWindow, this.mLongitude, i, i2);
            case 16:
                if (this.mLongitudeRef != null) {
                    str = String.valueOf(this.mLongitudeRef);
                }
                return ParseUtils.putString(cursorWindow, str, i, i2);
            case 17:
                return ParseUtils.putString(cursorWindow, getAliasMicroThumbnail(), i, i2);
            case 18:
                return cursorWindow.putLong(this.mMixedTime, i, i2);
            case 19:
                return cursorWindow.putLong((long) this.mAliasCreateDate, i, i2);
            case 20:
                return ParseUtils.putLong(cursorWindow, getAliasSyncState(), i, i2);
            case 21:
                return ParseUtils.putBlob(cursorWindow, this.mSecretKey, i, i2);
            case 22:
                return ParseUtils.putLong(cursorWindow, this.mWidth, i, i2);
            case 23:
                return ParseUtils.putLong(cursorWindow, this.mHeight, i, i2);
            case 24:
                return ParseUtils.putLong(cursorWindow, getAliasShowInHomePage(), i, i2);
            case 25:
                return ParseUtils.putString(cursorWindow, this.mCreatorId, i, i2);
            case 26:
                return ParseUtils.putLong(cursorWindow, this.mLocalFlag, i, i2);
            case 27:
                return ParseUtils.putLong(cursorWindow, getAliasHidden(), i, i2);
            case 28:
                return ParseUtils.putLong(cursorWindow, this.mServerTag, i, i2);
            case 29:
                return ParseUtils.putString(cursorWindow, this.mServerId, i, i2);
            case 30:
                return ParseUtils.putLong(cursorWindow, Long.valueOf(this.mDateModified), i, i2);
            case 31:
                return ParseUtils.putLong(cursorWindow, Integer.valueOf(this.mAliasModifyDate), i, i2);
            case 32:
                return ParseUtils.putString(cursorWindow, getAliasClearThumbnail(), i, i2);
            case 33:
                return ParseUtils.putLong(cursorWindow, getAliasIsFavorite(), i, i2);
            case 34:
                return ParseUtils.putString(cursorWindow, this.mAlbumServerId, i, i2);
            case 35:
                return ParseUtils.putLong(cursorWindow, this.mSpecialTypeFlags, i, i2);
            case 36:
                return ParseUtils.putLong(cursorWindow, Long.valueOf(this.mAliasSortTime), i, i2);
            case 37:
                return ParseUtils.putLong(cursorWindow, Integer.valueOf(this.mAliasSortDate), i, i2);
            case 38:
                return ParseUtils.putLong(cursorWindow, this.mOrientation, i, i2);
            case 39:
                return ParseUtils.putLong(cursorWindow, Long.valueOf(this.mBurstGroupId), i, i2);
            default:
                throw new IllegalArgumentException(" not recognized column.");
        }
    }

    public Object get(int i, boolean z) {
        Object obj = null;
        switch (i) {
            case 0:
                return Long.valueOf(this.mId);
            case 1:
                if (this.mSha1 != null) {
                    obj = this.mSha1;
                } else if (z) {
                    obj = "";
                }
                return obj;
            case 2:
                if (this.mAlbumId != null) {
                    obj = this.mAlbumId;
                } else if (z) {
                    obj = DEFAULT_LONG;
                }
                return obj;
            case 3:
                if (this.mMicroThumb != null) {
                    obj = this.mMicroThumb;
                } else if (z) {
                    obj = "";
                }
                return obj;
            case 4:
                if (this.mThumbnail != null) {
                    obj = this.mThumbnail;
                } else if (z) {
                    obj = "";
                }
                return obj;
            case 5:
                if (this.mFilePath != null) {
                    obj = this.mFilePath;
                } else if (z) {
                    obj = "";
                }
                return obj;
            case 6:
                if (this.mType != null) {
                    obj = this.mType;
                } else if (z) {
                    obj = DEFAULT_INT;
                }
                return obj;
            case 7:
                if (this.mTitle != null) {
                    obj = this.mTitle;
                } else if (z) {
                    obj = "";
                }
                return obj;
            case 8:
                if (this.mDuration != null) {
                    obj = this.mDuration;
                } else if (z) {
                    obj = DEFAULT_LONG;
                }
                return obj;
            case 9:
                if (this.mDescription != null) {
                    obj = this.mDescription;
                } else if (z) {
                    obj = "";
                }
                return obj;
            case 10:
                return this.mSize;
            case 11:
                if (this.mMimeType != null) {
                    obj = this.mMimeType;
                } else if (z) {
                    obj = "";
                }
                return obj;
            case 12:
                if (this.mLocation != null) {
                    obj = this.mLocation;
                } else if (z) {
                    obj = "";
                }
                return obj;
            case 13:
                if (this.mLatitude != null) {
                    obj = this.mLatitude;
                } else if (z) {
                    obj = DEFAULT_LONG;
                }
                return obj;
            case 14:
                if (this.mLatitudeRef != null) {
                    obj = this.mLatitudeRef;
                } else if (z) {
                    obj = Character.valueOf(' ');
                }
                return obj;
            case 15:
                if (this.mLongitude != null) {
                    obj = this.mLongitude;
                } else if (z) {
                    obj = DEFAULT_LONG;
                }
                return obj;
            case 16:
                if (this.mLongitudeRef != null) {
                    obj = this.mLongitudeRef;
                } else if (z) {
                    obj = Character.valueOf(' ');
                }
                return obj;
            case 17:
                Object aliasMicroThumbnail = getAliasMicroThumbnail();
                if (aliasMicroThumbnail != null) {
                    obj = aliasMicroThumbnail;
                } else if (z) {
                    obj = DEFAULT_LONG;
                }
                return obj;
            case 18:
                return Long.valueOf(this.mMixedTime);
            case 19:
                return Integer.valueOf(this.mAliasCreateDate);
            case 20:
                return getAliasSyncState();
            case 21:
                if (this.mSecretKey != null) {
                    obj = this.mSecretKey;
                } else if (z) {
                    obj = new byte[0];
                }
                return obj;
            case 22:
                if (this.mWidth != null) {
                    obj = this.mWidth;
                } else if (z) {
                    obj = DEFAULT_INT;
                }
                return obj;
            case 23:
                if (this.mHeight != null) {
                    obj = this.mHeight;
                } else if (z) {
                    obj = DEFAULT_INT;
                }
                return obj;
            case 24:
                return TRUE;
            case 25:
                return this.mCreatorId;
            case 26:
                return this.mLocalFlag;
            case 27:
                return getAliasHidden();
            case 28:
                return this.mServerTag;
            case 29:
                return this.mServerId;
            case 30:
                return Long.valueOf(this.mDateModified);
            case 31:
                return Integer.valueOf(this.mAliasModifyDate);
            case 32:
                Object aliasClearThumbnail = getAliasClearThumbnail();
                if (aliasClearThumbnail != null) {
                    obj = aliasClearThumbnail;
                } else if (z) {
                    obj = "";
                }
                return obj;
            case 33:
                return getAliasIsFavorite();
            case 34:
                if (this.mAlbumServerId != null) {
                    obj = this.mAlbumServerId;
                } else if (z) {
                    obj = "";
                }
                return obj;
            case 35:
                return this.mSpecialTypeFlags;
            case 36:
                return Long.valueOf(this.mAliasSortTime);
            case 37:
                return Integer.valueOf(this.mAliasSortDate);
            case 38:
                if (this.mOrientation != null) {
                    obj = this.mOrientation;
                } else if (z) {
                    obj = DEFAULT_INT;
                }
                return obj;
            case 39:
                return Long.valueOf(this.mBurstGroupId);
            default:
                throw new IllegalArgumentException(" not recognized column. ");
        }
    }

    public String getAliasClearThumbnail() {
        if (!TextUtils.isEmpty(this.mFilePath)) {
            return this.mFilePath;
        }
        if (!TextUtils.isEmpty(this.mThumbnail)) {
            return this.mThumbnail;
        }
        if (!TextUtils.isEmpty(this.mMicroThumb)) {
            return this.mMicroThumb;
        }
        return null;
    }

    public Long getAliasHidden() {
        if (this.mAlbumId == null) {
            return FALSE;
        }
        return this.mDelegate.isHidden(this.mAlbumId.longValue()) ? TRUE : FALSE;
    }

    public Long getAliasIsFavorite() {
        if (this.mSha1 == null) {
            return FALSE;
        }
        return this.mFavoritesDelegate.isFavorite(this.mSha1) ? TRUE : FALSE;
    }

    public String getAliasMicroThumbnail() {
        if (!TextUtils.isEmpty(this.mMicroThumb)) {
            return this.mMicroThumb;
        }
        if (!TextUtils.isEmpty(this.mThumbnail)) {
            return this.mThumbnail;
        }
        if (!TextUtils.isEmpty(this.mFilePath)) {
            return this.mFilePath;
        }
        return null;
    }

    public Long getAliasShowInHomePage() {
        if (this.mAlbumId == null) {
            return FALSE;
        }
        return this.mDelegate.isShowInHomePage(this.mAlbumId.longValue()) ? TRUE : FALSE;
    }

    public int getAliasSortDate() {
        return this.mAliasSortDate;
    }

    public long getAliasSortTime() {
        return this.mAliasSortTime;
    }

    public long getId() {
        return this.mId;
    }

    public String getLocation() {
        return this.mLocation;
    }

    public int getType(int i) {
        int i2 = 3;
        int i3 = 0;
        switch (i) {
            case 0:
                return 1;
            case 1:
                if (this.mSha1 == null) {
                    i2 = 0;
                }
                return i2;
            case 2:
                if (this.mAlbumId != null) {
                    i3 = 1;
                }
                return i3;
            case 3:
                if (this.mMicroThumb == null) {
                    i2 = 0;
                }
                return i2;
            case 4:
                if (this.mThumbnail == null) {
                    i2 = 0;
                }
                return i2;
            case 5:
                if (this.mFilePath == null) {
                    i2 = 0;
                }
                return i2;
            case 6:
                if (this.mType != null) {
                    i3 = 1;
                }
                return i3;
            case 7:
                if (this.mTitle == null) {
                    i2 = 0;
                }
                return i2;
            case 8:
                if (this.mDuration != null) {
                    i3 = 1;
                }
                return i3;
            case 9:
                if (this.mDescription == null) {
                    i2 = 0;
                }
                return i2;
            case 10:
                return 1;
            case 11:
                if (this.mMimeType == null) {
                    i2 = 0;
                }
                return i2;
            case 12:
                if (this.mLocation == null) {
                    i2 = 0;
                }
                return i2;
            case 13:
                if (this.mLatitude == null) {
                    i2 = 0;
                }
                return i2;
            case 14:
                if (this.mLatitudeRef == null) {
                    i2 = 0;
                }
                return i2;
            case 15:
                if (this.mLongitude == null) {
                    i2 = 0;
                }
                return i2;
            case 16:
                if (this.mLongitudeRef == null) {
                    i2 = 0;
                }
                return i2;
            case 17:
                if (getAliasMicroThumbnail() == null) {
                    i2 = 0;
                }
                return i2;
            case 18:
                return 1;
            case 19:
                return 1;
            case 20:
                return 1;
            case 21:
                if (this.mSecretKey != null) {
                    i3 = 4;
                }
                return i3;
            case 22:
                if (this.mWidth != null) {
                    i3 = 1;
                }
                return i3;
            case 23:
                if (this.mHeight != null) {
                    i3 = 1;
                }
                return i3;
            case 24:
                return 1;
            case 25:
                return 3;
            case 26:
                return 1;
            case 27:
                return 1;
            case 28:
                return 1;
            case 29:
                return 3;
            case 30:
                return 1;
            case 31:
                return 1;
            case 32:
                if (getAliasClearThumbnail() == null) {
                    i2 = 0;
                }
                return i2;
            case 33:
                return 1;
            case 34:
                if (this.mAlbumServerId == null) {
                    i2 = 0;
                }
                return i2;
            case 35:
                return 1;
            case 36:
                return 1;
            case 37:
                return 1;
            case 38:
                if (this.mOrientation != null) {
                    i3 = 1;
                }
                return i3;
            case 39:
                return 1;
            default:
                throw new IllegalArgumentException(" not recognized column. ");
        }
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("MediaItem{mId=");
        sb.append(this.mId);
        sb.append(", mSha1='");
        sb.append(this.mSha1);
        sb.append('\'');
        sb.append(", mAlbumId=");
        sb.append(this.mAlbumId);
        sb.append(", mMicroThumb='");
        sb.append(this.mMicroThumb);
        sb.append('\'');
        sb.append(", mThumbnail='");
        sb.append(this.mThumbnail);
        sb.append('\'');
        sb.append(", mFilePath='");
        sb.append(this.mFilePath);
        sb.append('\'');
        sb.append(", mType=");
        sb.append(this.mType);
        sb.append(", mTitle='");
        sb.append(this.mTitle);
        sb.append('\'');
        sb.append(", mMimeType='");
        sb.append(this.mMimeType);
        sb.append('\'');
        sb.append(", mLocalFlag=");
        sb.append(this.mLocalFlag);
        sb.append(", mIsSyncing=");
        sb.append(this.mIsSyncing);
        sb.append(", mSecretKey=");
        sb.append(Arrays.toString(this.mSecretKey));
        sb.append(", mMixedTime=");
        sb.append(this.mMixedTime);
        sb.append(", mAliasCreateDate=");
        sb.append(this.mAliasCreateDate);
        sb.append(", mDateModified=");
        sb.append(this.mDateModified);
        sb.append(", mAilasSortTime=");
        sb.append(this.mAliasSortTime);
        sb.append(", mAlbumServerId=");
        sb.append(this.mAlbumServerId);
        sb.append(", mSpecialTypeFlags=");
        sb.append(this.mSpecialTypeFlags);
        sb.append('}');
        return sb.toString();
    }
}
