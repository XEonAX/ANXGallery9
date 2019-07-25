package com.miui.gallery.collage;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory.Options;
import android.net.Uri;
import android.os.AsyncTask;
import android.util.DisplayMetrics;
import com.miui.gallery.editor.photo.utils.Bitmaps;
import com.miui.gallery.util.ExifUtil;
import com.miui.gallery.util.Log;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.HashMap;

public class BitmapManager {
    /* access modifiers changed from: private */
    public BitmapLoaderListener mBitmapLoaderListener;
    /* access modifiers changed from: private */
    public HashMap<Bitmap, Uri> mBitmapUriMap = new HashMap<>();
    /* access modifiers changed from: private */
    public Bitmap[] mBitmaps;
    private Context mContext;
    private DecodeBitmapTask mDecodeTask;

    interface BitmapLoaderListener {
        void onBitmapLoad(Bitmap[] bitmapArr);

        void onBitmapReplace(Bitmap bitmap, Bitmap bitmap2);
    }

    private interface CustomLoadListener {
        void onBitmapLoad(Bitmap[] bitmapArr);
    }

    private static class DecodeBitmapTask extends AsyncTask<Uri, Void, Bitmap[]> {
        Context mContext;
        CustomLoadListener mLoadListener;

        DecodeBitmapTask(CustomLoadListener customLoadListener, Context context) {
            this.mLoadListener = customLoadListener;
            this.mContext = context;
        }

        /* access modifiers changed from: protected */
        public Bitmap[] doInBackground(Uri... uriArr) {
            ArrayList arrayList = new ArrayList();
            for (Uri loadSuitableBitmapOnScreen : uriArr) {
                Bitmap loadSuitableBitmapOnScreen2 = BitmapManager.loadSuitableBitmapOnScreen(this.mContext, loadSuitableBitmapOnScreen);
                if (loadSuitableBitmapOnScreen2 != null) {
                    arrayList.add(loadSuitableBitmapOnScreen2);
                }
            }
            return (Bitmap[]) arrayList.toArray(new Bitmap[arrayList.size()]);
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Bitmap[] bitmapArr) {
            if (bitmapArr != null && bitmapArr.length > 0 && this.mLoadListener != null) {
                this.mLoadListener.onBitmapLoad(bitmapArr);
            }
        }
    }

    public BitmapManager(Context context, BitmapLoaderListener bitmapLoaderListener) {
        this.mContext = context.getApplicationContext();
        this.mBitmapLoaderListener = bitmapLoaderListener;
    }

    private static Bitmap loadSuitableBitmapBySize(Context context, int i, int i2, Uri uri) {
        try {
            Options options = new Options();
            options.inJustDecodeBounds = true;
            Bitmaps.decodeUri(context, uri, options);
            int max = Math.max(Math.max(options.outHeight / i2, options.outWidth / i), 1);
            options.inJustDecodeBounds = false;
            options.inMutable = true;
            options.inSampleSize = Integer.highestOneBit(max) << 1;
            return Bitmaps.joinExif(Bitmaps.decodeUri(context, uri, options), ExifUtil.getRotationDegrees(Bitmaps.readExif(context, uri)), options);
        } catch (FileNotFoundException e) {
            Log.e("BitmapManager", (Throwable) e);
            return null;
        }
    }

    public static Bitmap loadSuitableBitmapOnScreen(Context context, Uri uri) {
        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
        return loadSuitableBitmapBySize(context, displayMetrics.widthPixels, displayMetrics.heightPixels, uri);
    }

    public Bitmap[] data() {
        return this.mBitmaps;
    }

    public Uri getOriginUriByBitmap(Bitmap bitmap) {
        return (Uri) this.mBitmapUriMap.get(bitmap);
    }

    public boolean isEmpty() {
        return this.mBitmaps == null || this.mBitmaps.length == 0;
    }

    public void loadBitmapAsync(final Uri[] uriArr) {
        this.mDecodeTask = new DecodeBitmapTask(new CustomLoadListener() {
            public void onBitmapLoad(Bitmap[] bitmapArr) {
                BitmapManager.this.mBitmapUriMap.clear();
                BitmapManager.this.mBitmaps = bitmapArr;
                for (int i = 0; i < bitmapArr.length; i++) {
                    BitmapManager.this.mBitmapUriMap.put(bitmapArr[i], uriArr[i]);
                }
                if (BitmapManager.this.mBitmapLoaderListener != null) {
                    BitmapManager.this.mBitmapLoaderListener.onBitmapLoad(bitmapArr);
                }
            }
        }, this.mContext);
        this.mDecodeTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, uriArr);
    }

    public Bitmap loadSuitableBitmapBySize(int i, int i2, Uri uri) {
        return loadSuitableBitmapBySize(this.mContext, i, i2, uri);
    }

    public void replaceBitmap(final Bitmap bitmap, final Uri uri) {
        new DecodeBitmapTask(new CustomLoadListener() {
            public void onBitmapLoad(Bitmap[] bitmapArr) {
                int i = 0;
                Bitmap bitmap = bitmapArr[0];
                while (true) {
                    if (i >= BitmapManager.this.mBitmaps.length) {
                        break;
                    } else if (BitmapManager.this.mBitmaps[i] == bitmap) {
                        BitmapManager.this.mBitmaps[i] = bitmap;
                        break;
                    } else {
                        i++;
                    }
                }
                BitmapManager.this.mBitmapUriMap.remove(bitmap);
                BitmapManager.this.mBitmapUriMap.put(bitmap, uri);
                if (BitmapManager.this.mBitmapLoaderListener != null) {
                    BitmapManager.this.mBitmapLoaderListener.onBitmapReplace(bitmap, bitmap);
                }
            }
        }, this.mContext).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Uri[]{uri});
    }

    public void setBitmapLoaderListener(BitmapLoaderListener bitmapLoaderListener) {
        this.mBitmapLoaderListener = bitmapLoaderListener;
    }

    public int size() {
        if (this.mBitmaps == null) {
            return 0;
        }
        return this.mBitmaps.length;
    }
}
