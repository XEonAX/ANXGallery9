package com.miui.gallery.data;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.text.TextUtils;
import com.miui.gallery.provider.GalleryContract.Cloud;
import com.miui.gallery.provider.GalleryContract.Media;
import com.miui.gallery.provider.GalleryContract.ShareImage;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;

public class LocationGenerator {
    private static LocationGenerator sInstance;
    /* access modifiers changed from: private */
    public String[] CLOUD_PROJECTION = {"_id", "exifGPSLatitude", "exifGPSLatitudeRef", "exifGPSLongitude", "exifGPSLongitudeRef", "fileName"};
    private Future mFuture;

    private LocationGenerator() {
    }

    public static synchronized LocationGenerator getInstance() {
        LocationGenerator locationGenerator;
        synchronized (LocationGenerator.class) {
            if (sInstance == null) {
                sInstance = new LocationGenerator();
            }
            locationGenerator = sInstance;
        }
        return locationGenerator;
    }

    /* access modifiers changed from: private */
    public ContentValues toValues(String str) {
        ContentValues contentValues = new ContentValues();
        if (TextUtils.isEmpty(str)) {
            contentValues.putNull("location");
        } else {
            contentValues.put("location", str);
        }
        return contentValues;
    }

    public synchronized void generate(final Context context) {
        if (this.mFuture == null || this.mFuture.isDone()) {
            this.mFuture = ThreadManager.getMiscPool().submit(new Job<Void>() {
                public Void run(JobContext jobContext) {
                    SafeDBUtil.safeQuery(context, Cloud.CLOUD_URI, LocationGenerator.this.CLOUD_PROJECTION, (String) null, (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<Void>() {
                        public Void handle(Cursor cursor) {
                            String str;
                            if (cursor != null) {
                                while (cursor.moveToNext()) {
                                    int i = cursor.getInt(0);
                                    String string = cursor.getString(1);
                                    String string2 = cursor.getString(2);
                                    String string3 = cursor.getString(3);
                                    String string4 = cursor.getString(4);
                                    String packageNameFromScreenshotFileName = FileUtils.getPackageNameFromScreenshotFileName(context, cursor.getString(5));
                                    if (!TextUtils.isEmpty(packageNameFromScreenshotFileName)) {
                                        str = packageNameFromScreenshotFileName;
                                    } else {
                                        if (!TextUtils.isEmpty(string) && !TextUtils.isEmpty(string3)) {
                                            String decode = CitySearcher.getInstance().decode(new Coordinate(string, string2, string3, string4));
                                            if (LocationUtil.isLocationValidate(decode)) {
                                                str = LocationUtil.getCityNameFromRes(context, decode);
                                            }
                                        }
                                        str = null;
                                    }
                                    SafeDBUtil.safeUpdate(context, Cloud.CLOUD_URI, LocationGenerator.this.toValues(str), "_id=?", new String[]{String.valueOf(i)});
                                }
                            }
                            return null;
                        }
                    });
                    SafeDBUtil.safeQuery(context, ShareImage.SHARE_URI, LocationGenerator.this.CLOUD_PROJECTION, (String) null, (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<Void>() {
                        public Void handle(Cursor cursor) {
                            String str;
                            if (cursor != null) {
                                while (cursor.moveToNext()) {
                                    int i = cursor.getInt(0);
                                    String string = cursor.getString(1);
                                    String string2 = cursor.getString(2);
                                    String string3 = cursor.getString(3);
                                    String string4 = cursor.getString(4);
                                    String packageNameFromScreenshotFileName = FileUtils.getPackageNameFromScreenshotFileName(context, cursor.getString(5));
                                    if (!TextUtils.isEmpty(packageNameFromScreenshotFileName)) {
                                        str = packageNameFromScreenshotFileName;
                                    } else {
                                        if (!TextUtils.isEmpty(string) && !TextUtils.isEmpty(string3)) {
                                            String decode = CitySearcher.getInstance().decode(new Coordinate(string, string2, string3, string4));
                                            if (LocationUtil.isLocationValidate(decode)) {
                                                str = LocationUtil.getCityNameFromRes(context, decode);
                                            }
                                        }
                                        str = null;
                                    }
                                    SafeDBUtil.safeUpdate(context, ShareImage.SHARE_URI, LocationGenerator.this.toValues(str), "_id=?", new String[]{String.valueOf(i)});
                                }
                            }
                            return null;
                        }
                    });
                    LocationGenerator.this.release();
                    context.getContentResolver().notifyChange(Media.URI, null, false);
                    return null;
                }
            });
        }
    }

    public synchronized void release() {
        if (this.mFuture != null) {
            this.mFuture.cancel();
        }
        sInstance = null;
    }
}
