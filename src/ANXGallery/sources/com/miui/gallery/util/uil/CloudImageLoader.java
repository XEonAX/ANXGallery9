package com.miui.gallery.util.uil;

import android.content.ContentUris;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import android.text.TextUtils;
import android.view.View;
import android.widget.ImageView;
import com.miui.gallery.Config.ImageDownload;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.error.core.ErrorCode;
import com.miui.gallery.sdk.download.DownloadOptions;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.sdk.download.ImageDownloader;
import com.miui.gallery.sdk.download.assist.DownloadFailReason;
import com.miui.gallery.sdk.download.assist.DownloadItemStatus;
import com.miui.gallery.sdk.download.assist.DownloadedItem;
import com.miui.gallery.sdk.download.listener.DownloadListener;
import com.miui.gallery.sdk.download.listener.DownloadProgressListener;
import com.miui.gallery.sdk.download.util.DownloadUtil;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.assist.FailReason;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme;
import com.nostra13.universalimageloader.core.imageaware.ImageAware;
import com.nostra13.universalimageloader.core.imageaware.ImageViewAware;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class CloudImageLoader implements Callback {
    private static CloudImageLoader sLoader;
    private final Map<DownloadType, Map<String, Set<ViewAware>>> mDelayRequest = new HashMap();
    private DownloadListener mDownloadListener = new DownloadListener() {
        public void onDownloadCancel(Uri uri, DownloadType downloadType) {
            Log.d("CloudImageLoader", "onDownloadCancel %s", (Object) uri);
            CloudImageLoader.this.dispatchMessage(3, new DownloadWrapper(CloudImageLoader.this, uri, downloadType));
        }

        public void onDownloadFail(Uri uri, DownloadType downloadType, DownloadFailReason downloadFailReason) {
            Log.d("CloudImageLoader", "onDownloadFail %s", (Object) uri);
            CloudImageLoader.this.dispatchMessage(2, new DownloadWrapper(CloudImageLoader.this, uri, downloadType, downloadFailReason));
        }

        public void onDownloadStarted(Uri uri, DownloadType downloadType) {
            Log.d("CloudImageLoader", "onAddItem %s", (Object) uri);
            CloudImageLoader.this.dispatchMessage(0, new DownloadWrapper(CloudImageLoader.this, uri, downloadType));
        }

        public void onDownloadSuccess(Uri uri, DownloadType downloadType, DownloadedItem downloadedItem) {
            Log.d("CloudImageLoader", "onDownloadSuccess %s", (Object) uri);
            CloudImageLoader.this.dispatchMessage(1, new DownloadWrapper(CloudImageLoader.this, uri, downloadType, downloadedItem));
        }
    };
    private Handler mMainThreadHandler;
    private volatile boolean mPauseLoading;
    private final Map<String, Set<ViewAware>> mPendingRequest = new HashMap();
    private DownloadProgressListener mProgressListener = new DownloadProgressListener() {
        public void onDownloadProgress(Uri uri, DownloadType downloadType, long j, long j2) {
            CloudImageLoader cloudImageLoader = CloudImageLoader.this;
            DownloadWrapper downloadWrapper = new DownloadWrapper(CloudImageLoader.this, uri, downloadType, j, j2);
            cloudImageLoader.dispatchMessage(4, downloadWrapper);
        }
    };
    private final Map<String, Set<ViewAware>> mRequestingRequest = new HashMap();

    private interface Caller {
        void call(ViewAware viewAware);
    }

    private class DecodeListenerWrapper implements ImageLoadingListener {
        private ViewAware mAware;
        private final DownloadType mType;
        private final Uri mUri;

        public DecodeListenerWrapper(ViewAware viewAware) {
            this.mUri = viewAware.getUri();
            this.mType = viewAware.getDownloadType();
            this.mAware = viewAware;
        }

        private boolean isViewReused() {
            return !TextUtils.equals(this.mAware.getKey(), CloudImageLoader.generateKey(this.mUri, this.mType));
        }

        private ErrorCode translateFailReason(FailReason failReason) {
            return ErrorCode.DECODE_ERROR;
        }

        public void onLoadingCancelled(String str, View view) {
            if (!isViewReused()) {
                CloudImageLoadingListener loadingListener = this.mAware.getLoadingListener();
                if (loadingListener != null) {
                    loadingListener.onLoadingCancelled(this.mUri, this.mType, view);
                }
            }
        }

        public void onLoadingComplete(String str, View view, Bitmap bitmap) {
            if (!isViewReused()) {
                CloudImageLoadingListener loadingListener = this.mAware.getLoadingListener();
                if (loadingListener != null) {
                    loadingListener.onLoadingComplete(this.mUri, this.mType, view, bitmap);
                }
            }
        }

        public void onLoadingFailed(String str, View view, FailReason failReason) {
            if (!isViewReused()) {
                CloudImageLoadingListener loadingListener = this.mAware.getLoadingListener();
                if (loadingListener != null) {
                    loadingListener.onLoadingFailed(this.mUri, this.mType, view, translateFailReason(failReason));
                }
            }
        }

        public void onLoadingStarted(String str, View view) {
        }
    }

    private class DownloadWrapper {
        /* access modifiers changed from: private */
        public final long curSize;
        /* access modifiers changed from: private */
        public final DownloadedItem downloadedItem;
        /* access modifiers changed from: private */
        public final DownloadFailReason failReason;
        /* access modifiers changed from: private */
        public final long totalSize;
        /* access modifiers changed from: private */
        public final DownloadType type;
        /* access modifiers changed from: private */
        public final Uri uri;

        DownloadWrapper(CloudImageLoader cloudImageLoader, Uri uri2, DownloadType downloadType) {
            this(uri2, downloadType, null, null, 0, 0);
        }

        DownloadWrapper(CloudImageLoader cloudImageLoader, Uri uri2, DownloadType downloadType, long j, long j2) {
            this(uri2, downloadType, null, null, j, j2);
        }

        DownloadWrapper(CloudImageLoader cloudImageLoader, Uri uri2, DownloadType downloadType, DownloadFailReason downloadFailReason) {
            this(uri2, downloadType, null, downloadFailReason, 0, 0);
        }

        DownloadWrapper(CloudImageLoader cloudImageLoader, Uri uri2, DownloadType downloadType, DownloadedItem downloadedItem2) {
            this(uri2, downloadType, downloadedItem2, null, 0, 0);
        }

        DownloadWrapper(Uri uri2, DownloadType downloadType, DownloadedItem downloadedItem2, DownloadFailReason downloadFailReason, long j, long j2) {
            this.uri = uri2;
            this.type = downloadType;
            this.downloadedItem = downloadedItem2;
            this.failReason = downloadFailReason;
            this.curSize = j;
            this.totalSize = j2;
        }
    }

    public interface GetStatusCallBack {
        void onStatusGotten(DownloadItemStatus downloadItemStatus);
    }

    private class NonViewAwareImpl extends ViewAware {
        private CloudImageLoadingListener mLoadingListener;
        private CloudImageLoadingProgressListener mProgressListener;

        public NonViewAwareImpl(Uri uri, DownloadType downloadType, CloudImageLoadingListener cloudImageLoadingListener, CloudImageLoadingProgressListener cloudImageLoadingProgressListener) {
            super(uri, downloadType);
            this.mLoadingListener = cloudImageLoadingListener;
            this.mProgressListener = cloudImageLoadingProgressListener;
        }

        public DisplayImageOptions getDisplayOptions() {
            return null;
        }

        public DownloadType getDownloadType() {
            return getInternalDownloadType();
        }

        public ImageAware getImageAware() {
            return null;
        }

        public ImageSize getImageSize() {
            return null;
        }

        public String getKey() {
            return CloudImageLoader.generateKey(getUri(), getDownloadType());
        }

        public CloudImageLoadingListener getLoadingListener() {
            return this.mLoadingListener;
        }

        public CloudImageLoadingProgressListener getLoadingProgressListener() {
            return this.mProgressListener;
        }

        public Uri getUri() {
            return getInternalUri();
        }

        public boolean needDisplay() {
            return false;
        }
    }

    private abstract class ViewAware implements Comparable<ViewAware> {
        protected final DownloadType mInternalType;
        private final Uri mInternalUri;
        private final long mRequestTime = System.currentTimeMillis();

        public ViewAware(Uri uri, DownloadType downloadType) {
            this.mInternalUri = uri;
            this.mInternalType = downloadType;
        }

        public int compareTo(ViewAware viewAware) {
            if (viewAware == null) {
                return 1;
            }
            long requestTime = getRequestTime() - viewAware.getRequestTime();
            if (requestTime > 0) {
                return 1;
            }
            return requestTime < 0 ? -1 : 0;
        }

        public boolean equals(Object obj) {
            boolean z = false;
            if (obj == null || !(obj instanceof ViewAware)) {
                return false;
            }
            if (getWrappedView() == null && ((ViewAware) obj).getWrappedView() == null) {
                if (this == obj) {
                    z = true;
                }
                return z;
            }
            if (getWrappedView() == ((ViewAware) obj).getWrappedView()) {
                z = true;
            }
            return z;
        }

        public abstract DisplayImageOptions getDisplayOptions();

        public abstract DownloadType getDownloadType();

        public abstract ImageAware getImageAware();

        public abstract ImageSize getImageSize();

        /* access modifiers changed from: 0000 */
        public final DownloadType getInternalDownloadType() {
            return this.mInternalType;
        }

        /* access modifiers changed from: 0000 */
        public final String getInternalKey() {
            return CloudImageLoader.generateKey(getInternalUri(), getInternalDownloadType());
        }

        /* access modifiers changed from: 0000 */
        public final Uri getInternalUri() {
            return this.mInternalUri;
        }

        public abstract String getKey();

        public abstract CloudImageLoadingListener getLoadingListener();

        public abstract CloudImageLoadingProgressListener getLoadingProgressListener();

        public RectF getRegionDecodeRect() {
            return null;
        }

        public final long getRequestTime() {
            return this.mRequestTime;
        }

        public abstract Uri getUri();

        public View getWrappedView() {
            if (getImageAware() != null) {
                return getImageAware().getWrappedView();
            }
            return null;
        }

        public int hashCode() {
            View wrappedView = getWrappedView();
            return wrappedView != null ? wrappedView.hashCode() : super.hashCode();
        }

        public abstract boolean needDisplay();
    }

    private class WeakRefViewAwareImpl extends ViewAware {
        private ImageAware mImageAware;

        public WeakRefViewAwareImpl(CloudImageLoader cloudImageLoader, Uri uri, DownloadType downloadType, ImageAware imageAware, DisplayImageOptions displayImageOptions, ImageSize imageSize, CloudImageLoadingListener cloudImageLoadingListener, CloudImageLoadingProgressListener cloudImageLoadingProgressListener, RectF rectF) {
            this(uri, downloadType, imageAware, displayImageOptions, imageSize, cloudImageLoadingListener, cloudImageLoadingProgressListener, rectF, true);
        }

        public WeakRefViewAwareImpl(Uri uri, DownloadType downloadType, ImageAware imageAware, DisplayImageOptions displayImageOptions, ImageSize imageSize, CloudImageLoadingListener cloudImageLoadingListener, CloudImageLoadingProgressListener cloudImageLoadingProgressListener, RectF rectF, boolean z) {
            super(uri, downloadType);
            CloudImageHolder.getImageHolder(imageAware).setUri(uri).setImageType(downloadType).setDisplayImageOptions(displayImageOptions).setImageSize(imageSize).setImageLoadingListener(cloudImageLoadingListener).setImageLoadingProgressListener(cloudImageLoadingProgressListener).setRegionDecodeRect(rectF).setNeedDisplay(z);
            this.mImageAware = imageAware;
        }

        public DisplayImageOptions getDisplayOptions() {
            return CloudImageHolder.getImageHolder(this.mImageAware).getDisplayImageOptions();
        }

        public DownloadType getDownloadType() {
            return CloudImageHolder.getImageHolder(this.mImageAware).getImageType();
        }

        public ImageAware getImageAware() {
            return this.mImageAware;
        }

        public ImageSize getImageSize() {
            return CloudImageHolder.getImageHolder(this.mImageAware).getImageSize();
        }

        public String getKey() {
            return CloudImageLoader.generateKey(getUri(), getDownloadType());
        }

        public CloudImageLoadingListener getLoadingListener() {
            return CloudImageHolder.getImageHolder(this.mImageAware).getImageLoadingListener();
        }

        public CloudImageLoadingProgressListener getLoadingProgressListener() {
            return CloudImageHolder.getImageHolder(this.mImageAware).getImageLoadingProgressListener();
        }

        public RectF getRegionDecodeRect() {
            return CloudImageHolder.getImageHolder(this.mImageAware).getRegionDecodeRect();
        }

        public Uri getUri() {
            return CloudImageHolder.getImageHolder(this.mImageAware).getUri();
        }

        public boolean needDisplay() {
            return CloudImageHolder.getImageHolder(this.mImageAware).needDisplay();
        }
    }

    private CloudImageLoader(Context context) {
        this.mMainThreadHandler = new Handler(context.getMainLooper(), this);
    }

    private void cancelInvalidRequest(DownloadType downloadType) {
        if (downloadType != null) {
            List<ViewAware> allRequestingAware = getAllRequestingAware();
            HashSet hashSet = new HashSet();
            for (ViewAware viewAware : allRequestingAware) {
                if (viewAware.getInternalDownloadType() == downloadType) {
                    String internalKey = viewAware.getInternalKey();
                    if (isValidRequest(internalKey, viewAware)) {
                        hashSet.add(internalKey);
                    }
                }
            }
            for (ViewAware viewAware2 : allRequestingAware) {
                if (viewAware2.getInternalDownloadType() == downloadType && !hashSet.contains(viewAware2.getInternalKey())) {
                    Log.i("CloudImageLoader", "cancel invalid request %s", (Object) viewAware2.getInternalKey());
                    ImageDownloader.getInstance().cancel(viewAware2.getInternalUri(), viewAware2.getInternalDownloadType());
                }
            }
        }
    }

    private void directShowImage(final ImageAware imageAware, final Drawable drawable) {
        if (Looper.myLooper() == Looper.getMainLooper()) {
            imageAware.setImageDrawable(drawable);
        } else {
            ThreadManager.getMainHandler().post(new Runnable() {
                public void run() {
                    imageAware.setImageDrawable(drawable);
                }
            });
        }
    }

    private void dispatchListener(DownloadWrapper downloadWrapper, Caller caller, boolean z) {
        List<ViewAware> matchAware = getMatchAware(downloadWrapper, z);
        for (ViewAware viewAware : matchAware) {
            if (viewAware != null) {
                caller.call(viewAware);
            }
        }
        if (matchAware.size() == 0) {
            Log.e("CloudImageLoader", "The ref for %s should not be null", (Object) downloadWrapper.uri);
        }
    }

    /* access modifiers changed from: private */
    public void dispatchMessage(int i, DownloadWrapper downloadWrapper) {
        Message obtainMessage = this.mMainThreadHandler.obtainMessage();
        obtainMessage.what = i;
        obtainMessage.obj = downloadWrapper;
        this.mMainThreadHandler.sendMessage(obtainMessage);
    }

    private void doRequestDelay(DownloadType downloadType) {
        Map map;
        List<ViewAware> map2List;
        synchronized (this.mDelayRequest) {
            map = (Map) this.mDelayRequest.get(downloadType);
        }
        if (map != null) {
            synchronized (map) {
                map2List = map2List(map);
                map.clear();
            }
            Iterator it = map2List.iterator();
            while (it.hasNext()) {
                ViewAware viewAware = (ViewAware) it.next();
                if (viewAware != null && !isValidRequest(viewAware.getInternalKey(), viewAware)) {
                    it.remove();
                    onInvalidDownloadItem(viewAware.getInternalUri(), viewAware.getInternalDownloadType(), viewAware.getWrappedView(), viewAware.getLoadingListener());
                }
            }
            if (MiscUtil.isValid(map2List)) {
                Collections.sort(map2List);
                if (!requestLoading(map2List)) {
                    for (ViewAware putToPending : map2List) {
                        putToPending(putToPending);
                    }
                }
            }
        }
    }

    /* access modifiers changed from: private */
    public static String generateKey(Uri uri, DownloadType downloadType) {
        return DownloadUtil.generateKey(uri, downloadType);
    }

    private List<ViewAware> getAllRequestingAware() {
        List<ViewAware> map2List;
        synchronized (this.mRequestingRequest) {
            map2List = map2List(this.mRequestingRequest);
        }
        return map2List;
    }

    private Map<String, Set<ViewAware>> getDelayMap(DownloadType downloadType) {
        Map<String, Set<ViewAware>> map;
        synchronized (this.mDelayRequest) {
            map = (Map) this.mDelayRequest.get(downloadType);
            if (map == null) {
                map = new HashMap<>();
                this.mDelayRequest.put(downloadType, map);
            }
        }
        return map;
    }

    private int getDelayMessage(DownloadType downloadType) {
        switch (downloadType) {
            case MICRO:
                return 5;
            case THUMBNAIL:
                return 6;
            default:
                return -1;
        }
    }

    public static CloudImageLoader getInstance() {
        return sLoader;
    }

    private List<ViewAware> getMatchAware(DownloadWrapper downloadWrapper, boolean z) {
        List<ViewAware> requestingAwareBy;
        String generateKey = generateKey(downloadWrapper.uri, downloadWrapper.type);
        synchronized (this.mRequestingRequest) {
            requestingAwareBy = getRequestingAwareBy(generateKey);
            if (z) {
                removeMatchAware(downloadWrapper);
            }
        }
        Iterator it = requestingAwareBy.iterator();
        while (it.hasNext()) {
            if (!isValidRequest(generateKey, (ViewAware) it.next())) {
                it.remove();
            }
        }
        return requestingAwareBy;
    }

    private List<ViewAware> getRequestingAwareBy(String str) {
        List<ViewAware> list;
        synchronized (this.mRequestingRequest) {
            list = set2List((Set) this.mRequestingRequest.get(str));
        }
        return list;
    }

    private Resources getResources(ImageAware imageAware) {
        View wrappedView = imageAware.getWrappedView();
        return wrappedView != null ? wrappedView.getResources() : GalleryApp.sGetAndroidContext().getResources();
    }

    public static synchronized void init(Context context) {
        synchronized (CloudImageLoader.class) {
            if (sLoader == null) {
                sLoader = new CloudImageLoader(context);
            }
        }
    }

    private boolean isValidRequest(String str, ViewAware viewAware) {
        if (viewAware != null && !TextUtils.isEmpty(viewAware.getKey()) && TextUtils.equals(str, viewAware.getKey())) {
            return viewAware.getImageAware() == null || !viewAware.getImageAware().isCollected();
        }
        return false;
    }

    private void loadImageDelay(ViewAware viewAware) {
        Map delayMap = getDelayMap(viewAware.getDownloadType());
        synchronized (delayMap) {
            if (put(delayMap, viewAware)) {
                sendDelayMessage(viewAware.getDownloadType());
            }
        }
    }

    private static <E, T> List<T> map2List(Map<E, Set<T>> map) {
        LinkedList linkedList = new LinkedList();
        for (Entry value : map.entrySet()) {
            Set<Object> set = (Set) value.getValue();
            if (set != null) {
                for (Object add : set) {
                    linkedList.add(add);
                }
            }
        }
        return linkedList;
    }

    private boolean needCancelInvalidRequest(DownloadType downloadType) {
        return !isOrigin(downloadType);
    }

    private boolean onCancelLoading(final DownloadWrapper downloadWrapper) {
        Log.i("CloudImageLoader", "onLoadingCancelled %s", (Object) downloadWrapper.uri);
        dispatchListener(downloadWrapper, new Caller() {
            public void call(ViewAware viewAware) {
                CloudImageLoadingListener loadingListener = viewAware.getLoadingListener();
                if (loadingListener != null) {
                    loadingListener.onLoadingCancelled(downloadWrapper.uri, downloadWrapper.type, viewAware.getWrappedView());
                }
            }
        }, true);
        return true;
    }

    private boolean onFailLoading(final DownloadWrapper downloadWrapper) {
        Log.d("CloudImageLoader", "onLoadingFailed %s", (Object) downloadWrapper.uri);
        dispatchListener(downloadWrapper, new Caller() {
            public void call(ViewAware viewAware) {
                CloudImageLoadingListener loadingListener = viewAware.getLoadingListener();
                if (loadingListener != null) {
                    loadingListener.onLoadingFailed(downloadWrapper.uri, downloadWrapper.type, viewAware.getWrappedView(), downloadWrapper.failReason == null ? ErrorCode.UNKNOWN : downloadWrapper.failReason.getCode());
                }
            }
        }, true);
        return true;
    }

    private void onInvalidDownloadItem(Uri uri, DownloadType downloadType, View view, CloudImageLoadingListener cloudImageLoadingListener) {
        if (cloudImageLoadingListener != null) {
            if (uri == null) {
                uri = null;
            }
            cloudImageLoadingListener.onLoadingFailed(uri, downloadType, view, ErrorCode.PARAMS_ERROR);
        }
    }

    private boolean onProgressUpdate(final DownloadWrapper downloadWrapper) {
        Log.d("CloudImageLoader", "onProgressUpdate(%d/%d) %s", Long.valueOf(downloadWrapper.curSize), Long.valueOf(downloadWrapper.totalSize), downloadWrapper.uri.toString());
        dispatchListener(downloadWrapper, new Caller() {
            public void call(ViewAware viewAware) {
                CloudImageLoadingProgressListener loadingProgressListener = viewAware.getLoadingProgressListener();
                if (loadingProgressListener != null) {
                    loadingProgressListener.onProgressUpdate(downloadWrapper.uri, downloadWrapper.type, viewAware.getWrappedView(), (int) downloadWrapper.curSize, (int) downloadWrapper.totalSize);
                }
            }
        }, false);
        return true;
    }

    private boolean onStartLoading(final DownloadWrapper downloadWrapper) {
        Log.d("CloudImageLoader", "onStartLoading %s", (Object) downloadWrapper.uri);
        dispatchListener(downloadWrapper, new Caller() {
            public void call(ViewAware viewAware) {
                CloudImageLoadingListener loadingListener = viewAware.getLoadingListener();
                if (loadingListener != null) {
                    loadingListener.onLoadingStarted(downloadWrapper.uri, downloadWrapper.type, viewAware.getWrappedView());
                }
            }
        }, false);
        return true;
    }

    private boolean onSuccessLoading(final DownloadWrapper downloadWrapper) {
        Log.d("CloudImageLoader", "onEndLoading remove requesting item %s", (Object) downloadWrapper.uri.toString());
        dispatchListener(downloadWrapper, new Caller() {
            public void call(ViewAware viewAware) {
                CloudImageLoadingListener loadingListener = viewAware.getLoadingListener();
                if (loadingListener != null) {
                    loadingListener.onDownloadComplete(downloadWrapper.uri, downloadWrapper.type, viewAware.getWrappedView(), downloadWrapper.downloadedItem.getFilePath());
                }
                if (viewAware.needDisplay()) {
                    DisplayImageOptions displayOptions = viewAware.getDisplayOptions();
                    if (downloadWrapper.downloadedItem.getFileCipher() != null) {
                        displayOptions = displayOptions != null ? new Builder().cloneFrom(displayOptions).secretKey(downloadWrapper.downloadedItem.getFileCipher()).build() : new Builder().secretKey(downloadWrapper.downloadedItem.getFileCipher()).build();
                    }
                    ImageLoader.getInstance().displayImage(Scheme.FILE.wrap(downloadWrapper.downloadedItem.getFilePath()), viewAware.getImageAware(), displayOptions, viewAware.getImageSize(), new DecodeListenerWrapper(viewAware), null, viewAware.getRegionDecodeRect());
                } else if (loadingListener != null) {
                    loadingListener.onLoadingComplete(downloadWrapper.uri, downloadWrapper.type, viewAware.getWrappedView(), null);
                }
            }
        }, true);
        return true;
    }

    private static boolean put(Map<String, Set<ViewAware>> map, ViewAware viewAware) {
        String key = viewAware.getKey();
        if (TextUtils.isEmpty(key)) {
            return false;
        }
        Set set = (Set) map.get(key);
        if (set == null) {
            set = new HashSet();
            map.put(key, set);
        }
        return set.add(viewAware);
    }

    private boolean putToPending(ViewAware viewAware) {
        boolean put;
        synchronized (this.mPendingRequest) {
            put = put(this.mPendingRequest, viewAware);
        }
        return put;
    }

    private boolean putToRequesting(ViewAware viewAware) {
        boolean put;
        synchronized (this.mRequestingRequest) {
            put = put(this.mRequestingRequest, viewAware);
        }
        return put;
    }

    private void removeMatchAware(DownloadWrapper downloadWrapper) {
        String generateKey = generateKey(downloadWrapper.uri, downloadWrapper.type);
        synchronized (this.mRequestingRequest) {
            this.mRequestingRequest.remove(generateKey);
        }
    }

    private boolean requestLoading(ViewAware viewAware) {
        boolean z = false;
        if (this.mPauseLoading) {
            return false;
        }
        DownloadType downloadType = viewAware.getDownloadType();
        boolean putToRequesting = putToRequesting(viewAware);
        boolean z2 = isOrigin(downloadType) || isThumbnail(downloadType);
        boolean isOrigin = isOrigin(downloadType);
        if (viewAware.getDisplayOptions() != null) {
            z = viewAware.getDisplayOptions().isManual();
        }
        ImageDownloader.getInstance().load(viewAware.getUri(), viewAware.getDownloadType(), new DownloadOptions.Builder().setRequireWLAN(ImageDownload.requireWLAN(downloadType)).setQueueFirst(z2).setInterruptExecuting(isOrigin).setManual(z).build(), this.mDownloadListener, this.mProgressListener);
        if (putToRequesting && needCancelInvalidRequest(downloadType)) {
            cancelInvalidRequest(downloadType);
        }
        return true;
    }

    private boolean requestLoading(List<ViewAware> list) {
        if (this.mPauseLoading) {
            return false;
        }
        int i = 0;
        boolean z = false;
        while (true) {
            boolean z2 = true;
            if (i >= list.size()) {
                break;
            }
            ViewAware viewAware = (ViewAware) list.get(i);
            DownloadType downloadType = viewAware.getDownloadType();
            z |= putToRequesting(viewAware);
            boolean z3 = isOrigin(downloadType) || isThumbnail(downloadType);
            if (!isOrigin(downloadType) || i != 0) {
                z2 = false;
            }
            ImageDownloader.getInstance().load(viewAware.getUri(), viewAware.getDownloadType(), new DownloadOptions.Builder().setRequireWLAN(ImageDownload.requireWLAN(downloadType)).setQueueFirst(z3).setInterruptExecuting(z2).setManual(viewAware.getDisplayOptions() != null ? viewAware.getDisplayOptions().isManual() : false).build(), this.mDownloadListener, this.mProgressListener);
            i++;
        }
        if (z && list.size() > 0) {
            DownloadType downloadType2 = ((ViewAware) list.get(0)).getDownloadType();
            if (needCancelInvalidRequest(downloadType2)) {
                cancelInvalidRequest(downloadType2);
            }
        }
        return true;
    }

    private void sendDelayMessage(DownloadType downloadType) {
        int delayMessage = getDelayMessage(downloadType);
        if (delayMessage >= 0) {
            this.mMainThreadHandler.removeMessages(delayMessage);
            Message obtainMessage = this.mMainThreadHandler.obtainMessage();
            obtainMessage.what = delayMessage;
            this.mMainThreadHandler.sendMessageDelayed(obtainMessage, 200);
        }
    }

    private static <T> List<T> set2List(Set<T> set) {
        LinkedList linkedList = new LinkedList();
        if (set != null) {
            for (T add : set) {
                linkedList.add(add);
            }
        }
        return linkedList;
    }

    public void cancel(Uri uri, DownloadType downloadType) {
        String generateKey = generateKey(uri, downloadType);
        synchronized (this.mPendingRequest) {
            this.mPendingRequest.remove(generateKey);
        }
        ImageDownloader.getInstance().cancel(uri, downloadType);
        if (isOrigin(downloadType)) {
            ImageDownloader.getInstance().cancel(uri, downloadType == DownloadType.ORIGIN ? DownloadType.ORIGIN_FORCE : DownloadType.ORIGIN);
        }
    }

    public void displayImage(Uri uri, DownloadType downloadType, ImageView imageView, DisplayImageOptions displayImageOptions, ImageSize imageSize, RectF rectF, boolean z, boolean z2) {
        displayImage(uri, downloadType, imageView, displayImageOptions, imageSize, (CloudImageLoadingListener) null, (CloudImageLoadingProgressListener) null, rectF, z, z2);
    }

    public void displayImage(Uri uri, DownloadType downloadType, ImageView imageView, DisplayImageOptions displayImageOptions, ImageSize imageSize, CloudImageLoadingListener cloudImageLoadingListener, CloudImageLoadingProgressListener cloudImageLoadingProgressListener) {
        displayImage(uri, downloadType, imageView, displayImageOptions, imageSize, cloudImageLoadingListener, cloudImageLoadingProgressListener, (RectF) null, false, false);
    }

    public void displayImage(Uri uri, DownloadType downloadType, ImageView imageView, DisplayImageOptions displayImageOptions, ImageSize imageSize, CloudImageLoadingListener cloudImageLoadingListener, CloudImageLoadingProgressListener cloudImageLoadingProgressListener, RectF rectF, boolean z, boolean z2) {
        ImageView imageView2 = imageView;
        displayImage(uri, downloadType, (ImageAware) new ImageViewAware(imageView), displayImageOptions, imageSize, cloudImageLoadingListener, cloudImageLoadingProgressListener, rectF, z, z2);
    }

    public void displayImage(Uri uri, DownloadType downloadType, ImageAware imageAware, DisplayImageOptions displayImageOptions, ImageSize imageSize, CloudImageLoadingListener cloudImageLoadingListener, CloudImageLoadingProgressListener cloudImageLoadingProgressListener, RectF rectF, boolean z, boolean z2) {
        DownloadType downloadType2 = downloadType;
        ImageAware imageAware2 = imageAware;
        DisplayImageOptions displayImageOptions2 = displayImageOptions;
        CloudImageLoadingListener cloudImageLoadingListener2 = cloudImageLoadingListener;
        if (uri == null) {
            Log.w("CloudImageLoader", "Can't display an image with null uri");
            if (displayImageOptions2 != null && displayImageOptions.shouldShowImageForEmptyUri()) {
                directShowImage(imageAware2, displayImageOptions2.getImageForEmptyUri(getResources(imageAware2)));
            }
            onInvalidDownloadItem(uri, downloadType, imageAware.getWrappedView(), cloudImageLoadingListener2);
            return;
        }
        long parseId = ContentUris.parseId(uri);
        if (parseId <= 0) {
            Log.w("CloudImageLoader", "Can't display an image with illegal id %s", Long.valueOf(parseId));
            if (displayImageOptions2 != null && displayImageOptions.shouldShowImageOnFail()) {
                directShowImage(imageAware2, displayImageOptions2.getImageOnFail(getResources(imageAware2)));
            }
            if (cloudImageLoadingListener2 != null) {
                cloudImageLoadingListener2.onLoadingFailed(uri, downloadType, imageAware.getWrappedView(), ErrorCode.UNKNOWN);
            }
            return;
        }
        if (displayImageOptions2 != null && displayImageOptions.shouldShowImageOnLoading() && z2) {
            directShowImage(imageAware2, displayImageOptions2.getImageOnLoading(getResources(imageAware2)));
        }
        WeakRefViewAwareImpl weakRefViewAwareImpl = new WeakRefViewAwareImpl(this, uri, downloadType, imageAware, displayImageOptions, imageSize, cloudImageLoadingListener, cloudImageLoadingProgressListener, rectF);
        if (downloadType2 == DownloadType.MICRO || z) {
            loadImageDelay(weakRefViewAwareImpl);
        } else if (!requestLoading((ViewAware) weakRefViewAwareImpl)) {
            putToPending(weakRefViewAwareImpl);
        }
    }

    public void getStatusAsync(final Uri uri, final DownloadType downloadType, final GetStatusCallBack getStatusCallBack) {
        new AsyncTask<Void, Void, DownloadItemStatus>() {
            /* access modifiers changed from: protected */
            public DownloadItemStatus doInBackground(Void... voidArr) {
                return ImageDownloader.getInstance().getStatusSync(uri, downloadType);
            }

            /* access modifiers changed from: protected */
            public void onPostExecute(DownloadItemStatus downloadItemStatus) {
                if (getStatusCallBack != null) {
                    getStatusCallBack.onStatusGotten(downloadItemStatus);
                }
            }
        }.execute(new Void[0]);
    }

    public boolean handleMessage(Message message) {
        DownloadWrapper downloadWrapper = message.obj != null ? (DownloadWrapper) message.obj : null;
        switch (message.what) {
            case 0:
                return onStartLoading(downloadWrapper);
            case 1:
                return onSuccessLoading(downloadWrapper);
            case 2:
                return onFailLoading(downloadWrapper);
            case 3:
                return onCancelLoading(downloadWrapper);
            case 4:
                return onProgressUpdate(downloadWrapper);
            case 5:
                doRequestDelay(DownloadType.MICRO);
                return false;
            case 6:
                doRequestDelay(DownloadType.THUMBNAIL);
                return false;
            default:
                return false;
        }
    }

    public boolean isOrigin(DownloadType downloadType) {
        return downloadType != null && (downloadType == DownloadType.ORIGIN || downloadType == DownloadType.ORIGIN_FORCE);
    }

    public boolean isRequesting(Uri uri, DownloadType downloadType) {
        String generateKey = generateKey(uri, downloadType);
        return this.mPendingRequest.containsKey(generateKey) || this.mRequestingRequest.containsKey(generateKey);
    }

    public boolean isThumbnail(DownloadType downloadType) {
        return downloadType != null && downloadType == DownloadType.THUMBNAIL;
    }

    public void loadImages(List<Uri> list, List<DownloadType> list2, List<CloudImageLoadingListener> list3, List<CloudImageLoadingProgressListener> list4) {
        List<Uri> list5 = list;
        List<DownloadType> list6 = list2;
        List<CloudImageLoadingListener> list7 = list3;
        List<CloudImageLoadingProgressListener> list8 = list4;
        if (MiscUtil.isValid(list)) {
            ArrayList<ViewAware> arrayList = new ArrayList<>(list.size());
            for (int i = 0; i < list.size(); i++) {
                if (list.get(i) == null) {
                    Log.w("CloudImageLoader", "Null download uri!");
                    onInvalidDownloadItem((Uri) list.get(i), (DownloadType) list6.get(i), null, list7 == null ? null : (CloudImageLoadingListener) list7.get(i));
                } else {
                    NonViewAwareImpl nonViewAwareImpl = new NonViewAwareImpl((Uri) list.get(i), (DownloadType) list6.get(i), list7 == null ? null : (CloudImageLoadingListener) list7.get(i), list8 == null ? null : (CloudImageLoadingProgressListener) list8.get(i));
                    arrayList.add(nonViewAwareImpl);
                }
            }
            if (!requestLoading((List<ViewAware>) arrayList)) {
                for (ViewAware putToPending : arrayList) {
                    putToPending(putToPending);
                }
            }
        }
    }
}
