package com.miui.gallery.util;

import android.graphics.Bitmap;
import android.graphics.RectF;
import android.net.Uri;
import android.os.Looper;
import android.text.TextUtils;
import android.view.View;
import android.widget.ImageView;
import com.miui.gallery.R;
import com.miui.gallery.error.core.ErrorCode;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.util.uil.CloudImageHolder;
import com.miui.gallery.util.uil.CloudImageLoader;
import com.miui.gallery.util.uil.CloudImageLoadingListener;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.assist.FailReason;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme;
import com.nostra13.universalimageloader.core.imageaware.ImageAware;
import com.nostra13.universalimageloader.core.imageaware.ImageViewAware;
import com.nostra13.universalimageloader.core.imageaware.ViewAware;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;

public class BindImageHelper {
    /* access modifiers changed from: private */
    public static final Object PLACE_HOLDER = new Object();

    public interface OnImageLoadingCompleteListener {
        void onLoadingComplete();

        void onLoadingFailed();
    }

    /* access modifiers changed from: private */
    public static void bindCloudImage(ImageAware imageAware) {
        if (imageAware == null) {
            Log.e("BindImageHelper", "bindCloudImage view is null");
            return;
        }
        CloudImageHolder imageHolder = CloudImageHolder.getImageHolder(imageAware);
        Log.i("BindImageHelper", "downloadImage %s", (Object) imageHolder.getUri());
        CloudImageLoader.getInstance().displayImage(imageHolder.getUri(), imageHolder.getImageType(), imageAware, imageHolder.getDisplayImageOptions(), imageHolder.getImageSize(), imageHolder.getImageLoadingListener(), imageHolder.getImageLoadingProgressListener(), imageHolder.getRegionDecodeRect(), imageHolder.isDelayRequest(), imageHolder.isShowLoadingImage());
    }

    public static void bindFaceImage(String str, Uri uri, ImageView imageView, DisplayImageOptions displayImageOptions, ImageSize imageSize, RectF rectF, boolean z) {
        bindFaceImage(str, uri, (ImageAware) new ImageViewAware(imageView), displayImageOptions, imageSize, rectF, z);
    }

    public static void bindFaceImage(String str, Uri uri, ImageAware imageAware, DisplayImageOptions displayImageOptions, ImageSize imageSize, RectF rectF, boolean z) {
        bindImage(str, uri, DownloadType.THUMBNAIL, imageAware, displayImageOptions, imageSize, rectF);
        if (!TextUtils.isEmpty(str)) {
            String str2 = str;
            if (str.indexOf("MIUI/Gallery/cloud/.microthumbnailFile") != -1) {
                bindImage((String) null, uri, DownloadType.THUMBNAIL, imageAware, displayImageOptions, imageSize, rectF, z, false);
            }
        }
    }

    public static void bindImage(String str, Uri uri, DownloadType downloadType, ImageView imageView, DisplayImageOptions displayImageOptions, ImageSize imageSize) {
        bindImage(str, uri, downloadType, imageView, displayImageOptions, imageSize, (RectF) null);
    }

    public static void bindImage(String str, Uri uri, DownloadType downloadType, ImageView imageView, DisplayImageOptions displayImageOptions, ImageSize imageSize, RectF rectF) {
        bindImage(str, uri, downloadType, imageView, displayImageOptions, imageSize, rectF, true, true);
    }

    public static void bindImage(String str, Uri uri, DownloadType downloadType, ImageView imageView, DisplayImageOptions displayImageOptions, ImageSize imageSize, RectF rectF, boolean z, boolean z2) {
        bindImage(str, uri, downloadType, imageView, displayImageOptions, imageSize, rectF, z, z2, (OnImageLoadingCompleteListener) null);
    }

    public static void bindImage(String str, Uri uri, DownloadType downloadType, ImageView imageView, DisplayImageOptions displayImageOptions, ImageSize imageSize, RectF rectF, boolean z, boolean z2, OnImageLoadingCompleteListener onImageLoadingCompleteListener) {
        ImageView imageView2 = imageView;
        bindImage(str, uri, downloadType, (ImageAware) new ImageViewAware(imageView), displayImageOptions, imageSize, rectF, z, z2, onImageLoadingCompleteListener);
    }

    public static void bindImage(String str, Uri uri, DownloadType downloadType, ImageAware imageAware, DisplayImageOptions displayImageOptions, ImageSize imageSize) {
        bindImage(str, uri, downloadType, imageAware, displayImageOptions, imageSize, (RectF) null);
    }

    public static void bindImage(String str, Uri uri, DownloadType downloadType, ImageAware imageAware, DisplayImageOptions displayImageOptions, ImageSize imageSize, RectF rectF) {
        bindImage(str, uri, downloadType, imageAware, displayImageOptions, imageSize, rectF, true, true);
    }

    public static void bindImage(String str, Uri uri, DownloadType downloadType, ImageAware imageAware, DisplayImageOptions displayImageOptions, ImageSize imageSize, RectF rectF, boolean z, boolean z2) {
        bindImage(str, uri, downloadType, imageAware, displayImageOptions, imageSize, rectF, z, z2, (OnImageLoadingCompleteListener) null);
    }

    public static void bindImage(String str, Uri uri, DownloadType downloadType, ImageAware imageAware, DisplayImageOptions displayImageOptions, ImageSize imageSize, RectF rectF, boolean z, boolean z2, OnImageLoadingCompleteListener onImageLoadingCompleteListener) {
        if (imageAware == null) {
            Log.e("BindImageHelper", "bindImage view is null");
            return;
        }
        imageAware.setTag(R.id.item_has_bind_drawable, null);
        setCloudHolder(uri, downloadType, imageAware, displayImageOptions, imageSize, rectF, z, z2, onImageLoadingCompleteListener);
        if (TextUtils.isEmpty(str)) {
            ImageLoader.getInstance().cancelDisplayTask(imageAware);
            bindCloudImage(imageAware);
        } else {
            String str2 = str;
            ImageLoader.getInstance().displayImage(Scheme.FILE.wrap(str), imageAware, displayImageOptions, imageSize, getLocalLoadingListener(imageAware, onImageLoadingCompleteListener), null, rectF);
        }
    }

    private static ImageLoadingListener getLocalLoadingListener(final ImageAware imageAware, final OnImageLoadingCompleteListener onImageLoadingCompleteListener) {
        Object tag = imageAware.getTag(R.id.tag_local_loading_listener);
        if (tag == null) {
            tag = new ImageLoadingListener() {
                public void onLoadingCancelled(String str, View view) {
                }

                public void onLoadingComplete(String str, View view, Bitmap bitmap) {
                    if (onImageLoadingCompleteListener != null) {
                        onImageLoadingCompleteListener.onLoadingComplete();
                    }
                    imageAware.setTag(R.id.item_has_bind_drawable, BindImageHelper.PLACE_HOLDER);
                }

                public void onLoadingFailed(String str, View view, FailReason failReason) {
                    if (!(imageAware instanceof ViewAware) || imageAware.getWrappedView() != null) {
                        AnonymousClass1 r1 = new Runnable() {
                            public void run() {
                                BindImageHelper.bindCloudImage(imageAware);
                            }
                        };
                        if (Looper.myLooper() == Looper.getMainLooper()) {
                            r1.run();
                        } else {
                            ThreadManager.getMainHandler().post(r1);
                        }
                    }
                    if (onImageLoadingCompleteListener != null) {
                        onImageLoadingCompleteListener.onLoadingFailed();
                    }
                }

                public void onLoadingStarted(String str, View view) {
                }
            };
            imageAware.setTag(R.id.tag_local_loading_listener, tag);
        }
        return (ImageLoadingListener) tag;
    }

    public static boolean isViewBindDrawable(ImageView imageView) {
        return imageView.getTag(R.id.item_has_bind_drawable) != null;
    }

    public static boolean isViewBindDrawable(ImageAware imageAware) {
        return imageAware.getTag(R.id.item_has_bind_drawable) != null;
    }

    private static void setCloudHolder(Uri uri, DownloadType downloadType, final ImageAware imageAware, DisplayImageOptions displayImageOptions, ImageSize imageSize, RectF rectF, boolean z, boolean z2, final OnImageLoadingCompleteListener onImageLoadingCompleteListener) {
        CloudImageHolder imageHolder = CloudImageHolder.getImageHolder(imageAware);
        imageHolder.setUri(uri).setImageType(downloadType).setDisplayImageOptions(displayImageOptions).setImageSize(imageSize).setRegionDecodeRect(rectF).setNeedDisplay(true).setDelayRequest(z).setShowLoadingImage(z2);
        if (onImageLoadingCompleteListener != null) {
            imageHolder.setImageLoadingListener(new CloudImageLoadingListener() {
                public void onDownloadComplete(Uri uri, DownloadType downloadType, View view, String str) {
                }

                public void onLoadingCancelled(Uri uri, DownloadType downloadType, View view) {
                }

                public void onLoadingComplete(Uri uri, DownloadType downloadType, View view, Bitmap bitmap) {
                    onImageLoadingCompleteListener.onLoadingComplete();
                    imageAware.setTag(R.id.item_has_bind_drawable, BindImageHelper.PLACE_HOLDER);
                }

                public void onLoadingFailed(Uri uri, DownloadType downloadType, View view, ErrorCode errorCode) {
                    onImageLoadingCompleteListener.onLoadingFailed();
                }

                public void onLoadingStarted(Uri uri, DownloadType downloadType, View view) {
                }
            });
        }
    }
}
