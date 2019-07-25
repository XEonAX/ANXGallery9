package com.miui.gallery.provider;

import android.content.ComponentName;
import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.UriMatcher;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager.NameNotFoundException;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.ParcelFileDescriptor;
import android.support.media.ExifInterface;
import android.text.TextUtils;
import com.miui.gallery.data.LocationUtil;
import com.miui.gallery.scanner.SaveToCloudUtil;
import com.miui.gallery.util.ExifUtil;
import com.miui.gallery.util.FileMimeUtil;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.Numbers;
import com.miui.gallery.util.VideoAttrsReader;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Arrays;

public class GalleryOpenProvider extends ContentProvider {
    private static final String[] CLOUD_COLUMNS = {"_id", "serverType", "exifGPSLatitude", "exifGPSLatitudeRef", "exifGPSLongitude", "exifGPSLongitudeRef", "dateTaken", "exifOrientation", "localGroupId", "microthumbfile", "thumbnailFile", "localFile", "size", "fileName", "title", "dateModified", "mimeType", "exifImageWidth", "exifImageLength", "duration"};
    /* access modifiers changed from: private */
    public static final String[] MEDIA_COLUMNS = {"_id", "_data", "_size", "_display_name", "title", "date_added", "date_modified", "mime_type", nexExportFormat.TAG_FORMAT_WIDTH, nexExportFormat.TAG_FORMAT_HEIGHT, "description", "picasa_id", "isprivate", "latitude", "longitude", "datetaken", "orientation", "mini_thumb_magic", "bucket_id", "bucket_display_name", "bookmark", "album", "artist", "category", "duration", "language", "resolution", "tags", "mini_thumb_data", "media_type"};
    private static final String[] NEED_RETURN_CONTENT_URI_SYSTEM_APPS = {"com.android.bluetooth"};
    private static final String[] PRIVACY_COLUMNS = {"latitude", "longitude"};
    /* access modifiers changed from: private */
    public static final String TAG = "GalleryOpenProvider";
    private SQLiteDatabase mCacheDB;
    /* access modifiers changed from: private */
    public SQLiteDatabase mDatabase;
    private UriMatcher mUriMatcher = new UriMatcher(-1);

    private class MediaInfo {
        String mAlbumName;
        long mBucketId;
        String mBucketName;
        Long mDateModified;
        Long mDateTaken;
        Long mDuration;
        String mFileName;
        Integer mHeight;
        long mId;
        Double mLatitude;
        Double mLongitude;
        String mMimeType;
        Integer mOrientation;
        String mPath;
        String mResolution;
        Long mSize;
        String mTitle;
        int mType;
        Integer mWidth;

        private MediaInfo() {
        }

        private void decodeBounds(String str) {
            Options options = new Options();
            options.inJustDecodeBounds = true;
            BitmapFactory.decodeFile(this.mPath, options);
            this.mWidth = Integer.valueOf(options.outWidth);
            this.mHeight = Integer.valueOf(options.outHeight);
        }

        /* access modifiers changed from: 0000 */
        public boolean fillByFile(String str) {
            Log.d(GalleryOpenProvider.TAG, "try fill with %s", (Object) str);
            this.mPath = str;
            if (!new File(str).exists()) {
                Log.e(GalleryOpenProvider.TAG, "file not exists");
                return false;
            }
            this.mSize = Long.valueOf(new File(this.mPath).length());
            this.mOrientation = Integer.valueOf(0);
            decodeBounds(str);
            return true;
        }

        /* JADX INFO: finally extract failed */
        /* access modifiers changed from: 0000 */
        public boolean init(Cursor cursor) {
            this.mId = cursor.getLong(0);
            int i = cursor.getInt(1);
            if (i == 1) {
                this.mType = 1;
            } else if (i == 2) {
                this.mType = 2;
            } else {
                Log.e(GalleryOpenProvider.TAG, "%d is not a media type", (Object) Integer.valueOf(i));
                return false;
            }
            String string = cursor.getString(2);
            String string2 = cursor.getString(3);
            if (!(string == null || string2 == null)) {
                this.mLatitude = Double.valueOf(LocationUtil.convertRationalLatLonToDouble(string, string2));
            }
            String string3 = cursor.getString(4);
            String string4 = cursor.getString(5);
            if (!(string3 == null || string4 == null)) {
                this.mLongitude = Double.valueOf(LocationUtil.convertRationalLatLonToDouble(string3, string4));
            }
            this.mDateTaken = Numbers.getLong(cursor, 6);
            this.mBucketId = cursor.getLong(8);
            this.mFileName = cursor.getString(13);
            this.mTitle = cursor.getString(14);
            this.mDateModified = Long.valueOf(cursor.getLong(15));
            this.mMimeType = cursor.getString(16);
            Cursor query = GalleryOpenProvider.this.mDatabase.query("cloud", new String[]{"fileName"}, "_id=?", new String[]{Long.toString(this.mBucketId)}, null, null, null);
            try {
                if (query.moveToNext()) {
                    this.mBucketName = query.getString(0);
                }
                query.close();
                if (this.mType == 2) {
                    this.mDuration = Long.valueOf(cursor.getLong(19));
                }
                String string5 = cursor.getString(11);
                this.mPath = string5;
                if (!TextUtils.isEmpty(string5)) {
                    this.mSize = Long.valueOf(cursor.getLong(12));
                    this.mWidth = Integer.valueOf(cursor.getInt(17));
                    this.mHeight = Integer.valueOf(cursor.getInt(18));
                    if (!cursor.isNull(7)) {
                        this.mOrientation = Integer.valueOf(ExifUtil.exifOrientationToDegrees(cursor.getShort(7)));
                    }
                    if (this.mType == 2) {
                        StringBuilder sb = new StringBuilder();
                        sb.append(this.mWidth);
                        sb.append("x");
                        sb.append(this.mHeight);
                        this.mResolution = sb.toString();
                        this.mAlbumName = this.mBucketName;
                    }
                    return true;
                } else if (this.mType == 2) {
                    Log.e(GalleryOpenProvider.TAG, "current type is video, but no file path");
                    return false;
                } else {
                    String string6 = cursor.getString(10);
                    this.mPath = string6;
                    if (TextUtils.isEmpty(string6)) {
                        String string7 = cursor.getString(9);
                        this.mPath = string7;
                        if (TextUtils.isEmpty(string7)) {
                            Log.e(GalleryOpenProvider.TAG, "no path return");
                            return false;
                        }
                    }
                    return fillByFile(this.mPath);
                }
            } catch (Throwable th) {
                query.close();
                throw th;
            }
        }

        /* access modifiers changed from: 0000 */
        public boolean init(String str) {
            Log.d(GalleryOpenProvider.TAG, "query media info for file: %s", (Object) str);
            File file = new File(str);
            if (!file.exists()) {
                return false;
            }
            this.mId = Long.MAX_VALUE;
            this.mMimeType = FileMimeUtil.getMimeType(str);
            if (!FileMimeUtil.isImageFromMimeType(this.mMimeType) && !FileMimeUtil.isVideoFromMimeType(this.mMimeType)) {
                this.mMimeType = FileMimeUtil.getMimeTypeByParseFile(str);
                if (!FileMimeUtil.isImageFromMimeType(this.mMimeType) && !FileMimeUtil.isVideoFromMimeType(this.mMimeType)) {
                    return false;
                }
            }
            this.mType = FileMimeUtil.isImageFromMimeType(this.mMimeType) ? 1 : 2;
            this.mBucketId = Long.MAX_VALUE;
            this.mBucketName = file.getParentFile().getName();
            this.mPath = str;
            this.mSize = Long.valueOf(file.length());
            this.mFileName = file.getName();
            this.mTitle = FileUtils.getFileTitle(this.mFileName);
            this.mDateModified = Long.valueOf(file.lastModified());
            if (this.mType != 1) {
                Log.d(GalleryOpenProvider.TAG, "is video, reading video info");
                this.mAlbumName = this.mBucketName;
                try {
                    VideoAttrsReader read = VideoAttrsReader.read(str);
                    String title = read.getTitle();
                    if (title != null) {
                        this.mTitle = title;
                    }
                    this.mDateTaken = Long.valueOf(read.getDateTaken());
                    this.mDuration = Long.valueOf(read.getDuration());
                    this.mWidth = Integer.valueOf(read.getVideoWidth());
                    this.mHeight = Integer.valueOf(read.getVideoHeight());
                    StringBuilder sb = new StringBuilder();
                    sb.append(this.mWidth);
                    sb.append("x");
                    sb.append(this.mHeight);
                    this.mResolution = sb.toString();
                } catch (Exception e) {
                    Log.w(GalleryOpenProvider.TAG, (Throwable) e);
                }
            } else if (FileMimeUtil.hasExif(str)) {
                Log.d(GalleryOpenProvider.TAG, "reading exif");
                ExifInterface exifInterface = (ExifInterface) ExifUtil.sSupportExifCreator.create(str);
                if (exifInterface == null) {
                    Log.e(GalleryOpenProvider.TAG, "Failed to read exif for path %s", (Object) str);
                } else {
                    double[] latLong = exifInterface.getLatLong();
                    if (latLong != null) {
                        this.mLatitude = Double.valueOf(latLong[0]);
                        this.mLongitude = Double.valueOf(latLong[1]);
                    }
                    this.mOrientation = Integer.valueOf(ExifUtil.getRotationDegrees(exifInterface));
                    this.mDateTaken = Long.valueOf(SaveToCloudUtil.getDateTaken(exifInterface, this.mDateModified.longValue()));
                    this.mWidth = Integer.valueOf(exifInterface.getAttributeInt("ImageWidth", 0));
                    this.mHeight = Integer.valueOf(exifInterface.getAttributeInt("ImageLength", 0));
                    if (this.mWidth.intValue() <= 0 || this.mHeight.intValue() <= 0) {
                        decodeBounds(str);
                    }
                }
            } else {
                Log.d(GalleryOpenProvider.TAG, "no exif found");
                decodeBounds(str);
                this.mOrientation = Integer.valueOf(0);
                this.mDateTaken = this.mDateModified;
            }
            return true;
        }

        /* access modifiers changed from: 0000 */
        public ContentValues toContentValue() {
            ContentValues contentValues = new ContentValues(GalleryOpenProvider.MEDIA_COLUMNS.length);
            for (int i = 0; i < GalleryOpenProvider.MEDIA_COLUMNS.length; i++) {
                String str = GalleryOpenProvider.MEDIA_COLUMNS[i];
                switch (i) {
                    case 1:
                        contentValues.put(str, this.mPath);
                        break;
                    case 2:
                        contentValues.put(str, this.mSize);
                        break;
                    case 3:
                        contentValues.put(str, this.mFileName);
                        break;
                    case 4:
                        contentValues.put(str, this.mTitle);
                        break;
                    case 5:
                        contentValues.put(str, this.mDateTaken);
                        break;
                    case 6:
                        contentValues.put(str, this.mDateModified);
                        break;
                    case 7:
                        contentValues.put(str, this.mMimeType);
                        break;
                    case 8:
                        contentValues.put(str, this.mWidth);
                        break;
                    case 9:
                        contentValues.put(str, this.mHeight);
                        break;
                    case 13:
                        contentValues.put(str, this.mLatitude);
                        break;
                    case 14:
                        contentValues.put(str, this.mLongitude);
                        break;
                    case 15:
                        contentValues.put(str, this.mDateTaken);
                        break;
                    case 16:
                        contentValues.put(str, this.mOrientation);
                        break;
                    case 18:
                        contentValues.put(str, Long.valueOf(this.mBucketId));
                        break;
                    case 19:
                        contentValues.put(str, this.mBucketName);
                        break;
                    case 21:
                        contentValues.put(str, this.mAlbumName);
                        break;
                    case 24:
                        contentValues.put(str, this.mDuration);
                        break;
                    case 26:
                        contentValues.put(str, this.mResolution);
                        break;
                    case 29:
                        contentValues.put(str, Integer.valueOf(this.mType));
                        break;
                    default:
                        contentValues.putNull(str);
                        break;
                }
            }
            Log.d(GalleryOpenProvider.TAG, "trans cursor to %s", (Object) GalleryOpenProvider.filterPrivateColumns(contentValues));
            return contentValues;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("MediaInfo{mId=");
            sb.append(this.mId);
            sb.append(", mType=");
            sb.append(this.mType);
            sb.append(", mDateTaken=");
            sb.append(this.mDateTaken);
            sb.append(", mOrientation=");
            sb.append(this.mOrientation);
            sb.append(", mBucketId=");
            sb.append(this.mBucketId);
            sb.append(", mBucketName='");
            sb.append(this.mBucketName);
            sb.append('\'');
            sb.append(", mPath='");
            sb.append(this.mPath);
            sb.append('\'');
            sb.append(", mSize=");
            sb.append(this.mSize);
            sb.append(", mFileName='");
            sb.append(this.mFileName);
            sb.append('\'');
            sb.append(", mTitle='");
            sb.append(this.mTitle);
            sb.append('\'');
            sb.append(", mDateModified=");
            sb.append(this.mDateModified);
            sb.append(", mMimeType='");
            sb.append(this.mMimeType);
            sb.append('\'');
            sb.append(", mWidth=");
            sb.append(this.mWidth);
            sb.append(", mHeight=");
            sb.append(this.mHeight);
            sb.append(", mDuration=");
            sb.append(this.mDuration);
            sb.append(", mAlbumName='");
            sb.append(this.mAlbumName);
            sb.append('\'');
            sb.append(", mResolution='");
            sb.append(this.mResolution);
            sb.append('\'');
            sb.append('}');
            return sb.toString();
        }
    }

    /* access modifiers changed from: private */
    public static ContentValues filterPrivateColumns(ContentValues contentValues) {
        ContentValues contentValues2 = new ContentValues(contentValues);
        for (String remove : PRIVACY_COLUMNS) {
            contentValues2.remove(remove);
        }
        return contentValues2;
    }

    private void initialize() {
        this.mUriMatcher.addURI("com.miui.gallery.open", "raw/*", 1);
    }

    private static boolean isNeedReturnContentUriApp(Context context, String str) {
        if (!isSystemApp(context, str)) {
            return true;
        }
        for (String equals : NEED_RETURN_CONTENT_URI_SYSTEM_APPS) {
            if (equals.equals(str)) {
                return true;
            }
        }
        return false;
    }

    private static boolean isSystemApp(Context context, String str) {
        if (TextUtils.isEmpty(str)) {
            Log.i(TAG, "no package name");
            return false;
        }
        try {
            ApplicationInfo applicationInfo = context.getPackageManager().getApplicationInfo(str, 0);
            if ((applicationInfo == null || (applicationInfo.flags & 1) == 0) ? false : true) {
                Log.i(TAG, "system app: %s", (Object) str);
                return true;
            }
        } catch (NameNotFoundException e) {
            Log.w(TAG, (Throwable) e);
        }
        Log.i(TAG, "data app: %s", (Object) str);
        return false;
    }

    public static boolean needReturnContentUri() {
        return VERSION.SDK_INT >= 24;
    }

    public static boolean needReturnContentUri(Context context, Intent intent) {
        if (needReturnContentUri()) {
            return true;
        }
        String str = intent.getPackage();
        if (TextUtils.isEmpty(str)) {
            ComponentName component = intent.getComponent();
            if (component != null) {
                str = component.getPackageName();
            }
        }
        if (!TextUtils.isEmpty(str)) {
            return isNeedReturnContentUriApp(context, str);
        }
        throw new IllegalArgumentException("no packageName assigned to intent");
    }

    public static boolean needReturnContentUri(Context context, String str) {
        return needReturnContentUri() || isNeedReturnContentUriApp(context, str);
    }

    private static SQLiteDatabase prepareDB() {
        SQLiteDatabase create = SQLiteDatabase.create(null);
        create.execSQL("CREATE TABLE media (_id INTEGER PRIMARY KEY AUTOINCREMENT,_data TEXT UNIQUE COLLATE NOCASE,_size INTEGER,date_added INTEGER,date_modified INTEGER,mime_type TEXT,title TEXT,description TEXT,_display_name TEXT,picasa_id TEXT,orientation INTEGER,latitude DOUBLE,longitude DOUBLE,datetaken INTEGER,mini_thumb_magic INTEGER,bucket_id TEXT,bucket_display_name TEXT,isprivate INTEGER,duration INTEGER,bookmark INTEGER,artist TEXT,album TEXT,resolution TEXT,tags TEXT,category TEXT,language TEXT,mini_thumb_data TEXT,media_type INTEGER,width INTEGER,height INTEGER)");
        create.execSQL("CREATE VIEW image AS SELECT _id,_data,_size,_display_name,mime_type,title,date_added,date_modified,description,picasa_id,isprivate,latitude,longitude,datetaken,orientation,mini_thumb_magic,bucket_id,bucket_display_name,width,height FROM media WHERE media_type=1");
        create.execSQL("CREATE VIEW video AS SELECT _id,_data,_display_name,_size,mime_type,date_added,date_modified,title,duration,artist,album,resolution,description,isprivate,tags,category,language,mini_thumb_data,latitude,longitude,datetaken,mini_thumb_magic,bucket_id,bucket_display_name,bookmark,width,height FROM media WHERE media_type=2");
        return create;
    }

    /* JADX INFO: finally extract failed */
    private MediaInfo query(Uri uri) {
        Cursor cursor;
        if (this.mDatabase == null) {
            this.mDatabase = GalleryDBHelper.getInstance().getReadableDatabase();
        }
        String lastPathSegment = uri.getLastPathSegment();
        if (this.mUriMatcher.match(uri) != 1) {
            cursor = null;
        } else {
            Log.d(TAG, "internal query for file: %s", (Object) lastPathSegment);
            cursor = this.mDatabase.query("cloud", CLOUD_COLUMNS, "microthumbfile=? OR thumbnailFile = ? OR localFile = ?", new String[]{lastPathSegment, lastPathSegment, lastPathSegment}, null, null, null);
        }
        try {
            MediaInfo mediaInfo = new MediaInfo();
            if (cursor != null && cursor.moveToNext() && mediaInfo.init(cursor)) {
                Log.d(TAG, "translate cursor to MediaInfo success: %s", (Object) mediaInfo);
                if (cursor != null) {
                    cursor.close();
                }
                return mediaInfo;
            } else if (mediaInfo.init(lastPathSegment)) {
                Log.d(TAG, "translate file to MediaInfo success: %s", (Object) mediaInfo);
                if (cursor != null) {
                    cursor.close();
                }
                return mediaInfo;
            } else {
                Log.d(TAG, "translate into MediaInfo failed: %s", (Object) uri);
                if (cursor != null) {
                    cursor.close();
                }
                return null;
            }
        } catch (Throwable th) {
            if (cursor != null) {
                cursor.close();
            }
            throw th;
        }
    }

    public static Uri translateToContent(String str) {
        return Uri.parse("content://com.miui.gallery.open/raw").buildUpon().appendPath(str).build();
    }

    public int delete(Uri uri, String str, String[] strArr) {
        return 0;
    }

    public String getType(Uri uri) {
        Log.d(TAG, "query type for %s", (Object) uri);
        MediaInfo query = query(uri);
        if (query != null) {
            return query.mMimeType;
        }
        Log.e(TAG, "query type for %s failed.", (Object) uri);
        return "*/*";
    }

    public Uri insert(Uri uri, ContentValues contentValues) {
        return null;
    }

    public boolean onCreate() {
        initialize();
        return true;
    }

    public ParcelFileDescriptor openFile(Uri uri, String str) throws FileNotFoundException {
        Log.d(TAG, "open file for: %s", (Object) uri.toString());
        File file = new File(uri.getLastPathSegment());
        if (file.exists()) {
            return ParcelFileDescriptor.open(file, 268435456);
        }
        StringBuilder sb = new StringBuilder();
        sb.append("file not found: ");
        sb.append(file);
        throw new FileNotFoundException(sb.toString());
    }

    public Cursor query(Uri uri, String[] strArr, String str, String[] strArr2, String str2) {
        Log.d(TAG, "query uri: %s, %s, %s", uri, Arrays.toString(strArr), str);
        synchronized (this) {
            if (this.mCacheDB == null) {
                this.mCacheDB = prepareDB();
            }
        }
        MediaInfo query = query(uri);
        if (query == null) {
            Log.e(TAG, "query failed, return a empty");
            return new MatrixCursor(strArr);
        }
        long insertWithOnConflict = this.mCacheDB.insertWithOnConflict("media", null, query.toContentValue(), 5);
        if (insertWithOnConflict > 0) {
            Log.d(TAG, "insert cache success: %d", (Object) Long.valueOf(insertWithOnConflict));
            return this.mCacheDB.query(query.mType == 1 ? "image" : "video", strArr, "_id=?", new String[]{Long.toString(insertWithOnConflict)}, null, null, null);
        }
        Log.e(TAG, "insert failed, return null");
        return new MatrixCursor(strArr);
    }

    public int update(Uri uri, ContentValues contentValues, String str, String[] strArr) {
        return 0;
    }
}
