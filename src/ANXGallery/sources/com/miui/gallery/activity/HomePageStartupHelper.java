package com.miui.gallery.activity;

import android.content.Context;
import android.database.Cursor;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.adapter.HomePageAdapter;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.ui.HomePageFragment;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.assist.ViewScaleType;
import com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme;
import java.util.ArrayList;
import java.util.Iterator;

public class HomePageStartupHelper {
    /* access modifiers changed from: private */
    public static String TAG = "HomePageStartupHelper";
    private final int MICRO_THUMB_COLUMN_NUMBER = ThumbConfig.get().sMicroThumbColumnsPortrait;
    private final int MICRO_THUMB_PRELOAD_MAX_COUNT = (this.MICRO_THUMB_COLUMN_NUMBER * 6);
    private Attacher mAttacher;
    /* access modifiers changed from: private */
    public Context mContext;
    /* access modifiers changed from: private */
    public Object mCursorLock = new Object();
    private Future mDataLoadFuture;
    /* access modifiers changed from: private */
    public DataLoadListener mDataLoadListener;
    /* access modifiers changed from: private */
    public volatile Cursor mHomePageCursor;
    /* access modifiers changed from: private */
    public volatile boolean mIsDataInitialized = false;
    /* access modifiers changed from: private */
    public volatile boolean mIsDestroyed = false;

    public interface Attacher {
        HomePageStartupHelper getStartupHelper();

        void onStartup();
    }

    public interface DataLoadListener {
        void onDataLoadFinish(Cursor cursor);
    }

    class ImageDisplayItem {
        /* access modifiers changed from: private */
        public long mFileLength;
        /* access modifiers changed from: private */
        public String mFilePath;

        public ImageDisplayItem(String str, long j) {
            this.mFilePath = str;
            this.mFileLength = j;
        }
    }

    public HomePageStartupHelper(Context context, Attacher attacher) {
        this.mContext = context;
        this.mAttacher = attacher;
    }

    /* access modifiers changed from: private */
    public void closeCursor() {
        synchronized (this.mCursorLock) {
            if (this.mHomePageCursor != null) {
                this.mHomePageCursor.close();
            }
        }
    }

    /* access modifiers changed from: private */
    public int getPreloadImageCount(ArrayList<Integer> arrayList) {
        int i = 0;
        if (!MiscUtil.isValid(arrayList)) {
            return 0;
        }
        int i2 = this.MICRO_THUMB_COLUMN_NUMBER;
        int i3 = this.MICRO_THUMB_PRELOAD_MAX_COUNT;
        Iterator it = arrayList.iterator();
        int i4 = 0;
        while (it.hasNext()) {
            int intValue = ((Integer) it.next()).intValue();
            i += intValue;
            if (i + i4 > i3) {
                break;
            }
            int i5 = intValue % i2;
            if (i5 != 0) {
                i4 += i2 - i5;
            }
        }
        if (i4 + i >= i3) {
            i = i3 - i4;
        }
        Log.d(TAG, "preload image count %d", (Object) Integer.valueOf(i));
        return i;
    }

    private Future loadHomePageData() {
        return ThreadManager.getMiscPool().submit(new Job<Void>() {
            public Void run(JobContext jobContext) {
                ArrayList integerArrayList;
                try {
                    HomePageStartupHelper.this.mHomePageCursor = HomePageStartupHelper.this.mContext.getContentResolver().query(HomePageFragment.PHOTOS_LOADER_URI, HomePageFragment.PHOTOS_LOADER_PROJECTION, "alias_show_in_homepage=1 AND sha1 NOT NULL", null, "alias_sort_time DESC ");
                } catch (Exception e) {
                    String access$200 = HomePageStartupHelper.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("error when load data in home page ");
                    sb.append(e);
                    Log.e(access$200, sb.toString());
                }
                if (HomePageStartupHelper.this.mIsDestroyed) {
                    HomePageStartupHelper.this.closeCursor();
                    return null;
                }
                synchronized (HomePageStartupHelper.this.mCursorLock) {
                    integerArrayList = (HomePageStartupHelper.this.mHomePageCursor == null || HomePageStartupHelper.this.mHomePageCursor.isClosed()) ? null : HomePageStartupHelper.this.mHomePageCursor.getExtras().getIntegerArrayList("extra_timeline_item_count_in_group");
                }
                int access$600 = HomePageStartupHelper.this.getPreloadImageCount(integerArrayList);
                ArrayList arrayList = new ArrayList();
                int i = 0;
                while (true) {
                    int i2 = i + 1;
                    if (i >= access$600) {
                        break;
                    }
                    synchronized (HomePageStartupHelper.this.mCursorLock) {
                        if (HomePageStartupHelper.this.mHomePageCursor == null || HomePageStartupHelper.this.mHomePageCursor.isClosed()) {
                            break;
                        } else if (!HomePageStartupHelper.this.mHomePageCursor.moveToNext()) {
                            break;
                        } else {
                            String microPath = HomePageAdapter.getMicroPath(HomePageStartupHelper.this.mHomePageCursor, 12, 5);
                            if (microPath != null) {
                                arrayList.add(new ImageDisplayItem(microPath, HomePageStartupHelper.this.mHomePageCursor.getLong(16)));
                            }
                        }
                    }
                    i = i2;
                }
                ThreadManager.getMainHandler().post(new Runnable() {
                    public void run() {
                        if (HomePageStartupHelper.this.mDataLoadListener != null && !HomePageStartupHelper.this.mIsDestroyed) {
                            HomePageStartupHelper.this.mDataLoadListener.onDataLoadFinish(HomePageStartupHelper.this.mHomePageCursor);
                        }
                    }
                });
                HomePageStartupHelper.this.mIsDataInitialized = true;
                HomePageStartupHelper.this.preloadHomePageImages(arrayList);
                if (HomePageStartupHelper.this.mIsDestroyed) {
                    HomePageStartupHelper.this.closeCursor();
                }
                return null;
            }
        });
    }

    /* access modifiers changed from: private */
    public void preloadHomePageImages(ArrayList<ImageDisplayItem> arrayList) {
        if (this.mContext != null && !this.mIsDestroyed && MiscUtil.isValid(arrayList)) {
            ImageLoader.getInstance().resume();
            Builder highPriority = new Builder().cloneFrom(ThumbConfig.get().MICRO_THUMB_DISPLAY_IMAGE_OPTIONS_DEFAULT).highPriority(true);
            Iterator it = arrayList.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                ImageDisplayItem imageDisplayItem = (ImageDisplayItem) it.next();
                if (this.mIsDestroyed) {
                    Log.w(TAG, "preload home page images break");
                    break;
                }
                if (imageDisplayItem.mFileLength > 0) {
                    highPriority.considerFileLength(true).fileLength(imageDisplayItem.mFileLength);
                } else {
                    highPriority.considerFileLength(false);
                }
                ImageLoader.getInstance().displayImage(Scheme.FILE.wrap(imageDisplayItem.mFilePath), ImageLoader.getInstance().createImageAware(null, ThumbConfig.get().sMicroTargetSize, ViewScaleType.CROP), highPriority.build(), ThumbConfig.get().sMicroTargetSize, null, null, null);
            }
        }
    }

    public void onActivityCreate() {
        this.mDataLoadFuture = loadHomePageData();
    }

    public void onActivityDestroy() {
        this.mIsDestroyed = true;
        closeCursor();
        if (this.mAttacher != null) {
            this.mAttacher = null;
        }
        if (this.mDataLoadFuture != null) {
            this.mDataLoadFuture.cancel();
            this.mDataLoadFuture = null;
        }
    }

    public void onStartup() {
        if (this.mAttacher != null) {
            this.mAttacher.onStartup();
        }
    }

    public void setDataLoaderListener(DataLoadListener dataLoadListener) {
        if (this.mIsDataInitialized) {
            dataLoadListener.onDataLoadFinish(this.mHomePageCursor);
            return;
        }
        Log.w(TAG, "preload home page cursor failed");
        this.mDataLoadListener = dataLoadListener;
    }
}
