package com.miui.gallery.ui;

import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.view.View;
import android.view.ViewGroup.OnHierarchyChangeListener;
import com.miui.gallery.adapter.PhotoPageAdapter;
import com.miui.gallery.error.core.ErrorCode;
import com.miui.gallery.model.BaseDataItem;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.ui.PhotoPageItem.TransitionListener;
import com.miui.gallery.util.photoview.ItemViewInfo;
import com.miui.gallery.util.photoview.TrimMemoryCallback;
import com.miui.gallery.util.uil.CloudImageLoadingListener;
import com.miui.gallery.widget.ViewPager;
import com.miui.gallery.widget.ViewPager.OnPageChangeListener;
import java.util.LinkedList;
import uk.co.senab.photoview.PhotoViewAttacher.OnBackgroundAlphaChangedListener;
import uk.co.senab.photoview.PhotoViewAttacher.OnMatrixChangedListener;
import uk.co.senab.photoview.PhotoViewAttacher.OnScaleChangeListener;
import uk.co.senab.photoview.PhotoViewAttacher.OnViewTapListener;

public class PhotoPagerHelper {
    /* access modifiers changed from: private */
    public OnAlphaChangedListener mAlphaChangedListener;
    /* access modifiers changed from: private */
    public OnDisplayRectChangedListener mDisplayRectChangedListener;
    /* access modifiers changed from: private */
    public CloudImageLoadingListener mDownloadListener;
    /* access modifiers changed from: private */
    public OnExitListener mExitListener;
    private OnBackgroundAlphaChangedListener mInternalAlphaChangedListener = new OnBackgroundAlphaChangedListener() {
        public void onAlphaChanged(float f) {
            if (PhotoPagerHelper.this.mAlphaChangedListener != null) {
                PhotoPagerHelper.this.mAlphaChangedListener.onAlphaChanged(f);
            }
        }
    };
    private uk.co.senab.photoview.PhotoViewAttacher.OnExitListener mInternalExitListener = new uk.co.senab.photoview.PhotoViewAttacher.OnExitListener() {
        public void onExit() {
            if (PhotoPagerHelper.this.mExitListener != null) {
                PhotoPagerHelper.this.mExitListener.onExit();
            }
        }
    };
    private OnHierarchyChangeListener mInternalHierarchyChangeListener = new OnHierarchyChangeListener() {
        public void onChildViewAdded(View view, View view2) {
        }

        public void onChildViewRemoved(View view, View view2) {
        }
    };
    private CloudImageLoadingListener mInternalImageLoadingListener = new CloudImageLoadingListener() {
        public void onDownloadComplete(Uri uri, DownloadType downloadType, View view, String str) {
            if (PhotoPagerHelper.this.mDownloadListener != null) {
                PhotoPagerHelper.this.mDownloadListener.onDownloadComplete(uri, downloadType, view, str);
            }
        }

        public void onLoadingCancelled(Uri uri, DownloadType downloadType, View view) {
            if (PhotoPagerHelper.this.mDownloadListener != null) {
                PhotoPagerHelper.this.mDownloadListener.onLoadingCancelled(uri, downloadType, view);
            }
        }

        public void onLoadingComplete(Uri uri, DownloadType downloadType, View view, Bitmap bitmap) {
            if (PhotoPagerHelper.this.mDownloadListener != null) {
                PhotoPagerHelper.this.mDownloadListener.onLoadingComplete(uri, downloadType, view, bitmap);
            }
        }

        public void onLoadingFailed(Uri uri, DownloadType downloadType, View view, ErrorCode errorCode) {
            if (PhotoPagerHelper.this.mDownloadListener != null) {
                PhotoPagerHelper.this.mDownloadListener.onLoadingFailed(uri, downloadType, view, errorCode);
            }
        }

        public void onLoadingStarted(Uri uri, DownloadType downloadType, View view) {
            if (PhotoPagerHelper.this.mDownloadListener != null) {
                PhotoPagerHelper.this.mDownloadListener.onLoadingStarted(uri, downloadType, view);
            }
        }
    };
    private OnMatrixChangedListener mInternalMatrixListener = new OnMatrixChangedListener() {
        public void onMatrixChanged(RectF rectF) {
            if (PhotoPagerHelper.this.mDisplayRectChangedListener != null) {
                PhotoPagerHelper.this.mDisplayRectChangedListener.onDisplayRectChanged(rectF);
            }
        }
    };
    private com.miui.gallery.ui.PhotoPageItem.OnImageLoadFinishListener mInternalOnImageLoadFinishListener = new com.miui.gallery.ui.PhotoPageItem.OnImageLoadFinishListener() {
        public void onImageLoadFinish(boolean z, String str) {
            if (PhotoPagerHelper.this.mOnImageLoadFinishListener != null) {
                PhotoPagerHelper.this.mOnImageLoadFinishListener.onImageLoadFinish(str);
            }
        }
    };
    private com.miui.gallery.ui.PhotoPageItem.OnPlayVideoListener mInternalOnPlayVideoListener = new com.miui.gallery.ui.PhotoPageItem.OnPlayVideoListener() {
        public void onPlayVideo(BaseDataItem baseDataItem) {
            if (PhotoPagerHelper.this.mOnPlayVideoListener != null) {
                PhotoPagerHelper.this.mOnPlayVideoListener.onPlayVideo(baseDataItem);
            }
        }
    };
    private OnPageChangeListener mInternalPageChangedListener = new OnPageChangeListener() {
        public void onPageScrollStateChanged(int i) {
            PhotoPagerHelper.this.setPageScrollStateChanged(i);
        }

        public void onPageScrolled(int i, float f, int i2) {
            PhotoPagerHelper.this.setOnPageScrolled(i, f, i2);
        }

        public void onPageSelected(int i) {
            PhotoPagerHelper.this.setPageChanged(i);
        }
    };
    private com.miui.gallery.widget.ViewPager.OnPageSettledListener mInternalPageSettledListener = new com.miui.gallery.widget.ViewPager.OnPageSettledListener() {
        public void onPageSettled(int i) {
            PhotoPagerHelper.this.setPageSettled(i);
        }
    };
    private OnScaleChangeListener mInternalScaleListener = new OnScaleChangeListener() {
        public void onScaleChange(float f, float f2, float f3, float f4, float f5) {
            if (PhotoPagerHelper.this.mScaleChangedListener != null) {
                PhotoPagerHelper.this.mScaleChangedListener.onScaleChanged(f, f2, f5);
            }
        }
    };
    private OnViewTapListener mInternalTapListener = new OnViewTapListener() {
        public void onViewTap(View view, float f, float f2) {
            if (PhotoPagerHelper.this.mTapListener != null) {
                PhotoPagerHelper.this.mTapListener.onTap(f, f2);
            }
        }
    };
    private TrimMemoryCallback mInternalTrimMemoryCallback = new TrimMemoryCallback() {
        public void onStopTrimMemory(int i) {
            for (int i2 = 0; i2 < PhotoPagerHelper.this.getActiveItemCount(); i2++) {
                PhotoPageItem itemByNativeIndex = PhotoPagerHelper.this.getItemByNativeIndex(i2);
                if (itemByNativeIndex != null) {
                    itemByNativeIndex.onStopTrimMemory(i);
                }
            }
        }

        public void onTrimMemory(int i) {
            LinkedList linkedList = new LinkedList();
            int currentItem = PhotoPagerHelper.this.mViewPager.getCurrentItem();
            for (int i2 = currentItem - 1; i2 <= currentItem + 1; i2++) {
                PhotoPageItem item = PhotoPagerHelper.this.getItem(i2);
                if (item != null) {
                    linkedList.add(item);
                }
            }
            for (int i3 = 0; i3 < PhotoPagerHelper.this.getActiveItemCount(); i3++) {
                PhotoPageItem itemByNativeIndex = PhotoPagerHelper.this.getItemByNativeIndex(i3);
                if (itemByNativeIndex != null && !linkedList.contains(itemByNativeIndex)) {
                    itemByNativeIndex.onTrimMemory(i);
                }
            }
        }
    };
    /* access modifiers changed from: private */
    public OnImageLoadFinishListener mOnImageLoadFinishListener;
    /* access modifiers changed from: private */
    public OnPlayVideoListener mOnPlayVideoListener;
    private OnPageChangedListener mPageChangedListener;
    private OnPageSettledListener mPageSettledListener;
    /* access modifiers changed from: private */
    public OnScaleChangedListener mScaleChangedListener;
    /* access modifiers changed from: private */
    public OnSingleTapListener mTapListener;
    /* access modifiers changed from: private */
    public ViewPager mViewPager;

    public interface OnAlphaChangedListener {
        void onAlphaChanged(float f);
    }

    public interface OnDisplayRectChangedListener {
        void onDisplayRectChanged(RectF rectF);
    }

    public interface OnExitListener {
        void onExit();
    }

    public interface OnImageLoadFinishListener {
        void onImageLoadFinish(String str);
    }

    public interface OnPageChangedListener {
        void onPageChanged(int i);

        void onPageScrollStateChanged(int i);

        void onPageScrolled(int i, float f, int i2);
    }

    public interface OnPageSettledListener {
        void onPageSettled(int i);
    }

    public interface OnPlayVideoListener {
        void onPlayVideo(BaseDataItem baseDataItem);
    }

    public interface OnScaleChangedListener {
        void onScaleChanged(float f, float f2, float f3);
    }

    public interface OnSingleTapListener {
        void onTap(float f, float f2);
    }

    public PhotoPagerHelper(ViewPager viewPager) {
        this.mViewPager = viewPager;
        this.mViewPager.setOnPageSettledListener(this.mInternalPageSettledListener);
        this.mViewPager.setOnPageChangeListener(this.mInternalPageChangedListener);
        this.mViewPager.setOnHierarchyChangeListener(this.mInternalHierarchyChangeListener);
    }

    public void clearTrimMemoryFlag() {
        int activeItemCount = getActiveItemCount();
        for (int i = 0; i < activeItemCount; i++) {
            PhotoPageItem itemByNativeIndex = getItemByNativeIndex(i);
            if (itemByNativeIndex != null) {
                itemByNativeIndex.clearTrimMemoryFlag();
            }
        }
    }

    public boolean doExitTransition(ItemViewInfo itemViewInfo, TransitionListener transitionListener) {
        PhotoPageItem currentItem = getCurrentItem();
        if (currentItem == null) {
            return false;
        }
        currentItem.animExit(itemViewInfo, transitionListener);
        return true;
    }

    public int getActiveItemCount() {
        return this.mViewPager.getActiveCount();
    }

    public RectF getCurItemDisplayRect() {
        PhotoPageItem currentItem = getCurrentItem();
        if (currentItem != null) {
            Drawable drawable = currentItem.mPhotoView.getDrawable();
            if (drawable != null) {
                RectF rectF = new RectF(0.0f, 0.0f, (float) drawable.getIntrinsicWidth(), (float) drawable.getIntrinsicHeight());
                currentItem.mPhotoView.getAbsoluteRect(rectF);
                return rectF;
            }
        }
        return null;
    }

    public PhotoPageItem getCurrentItem() {
        return getItem(this.mViewPager.getCurrentItem());
    }

    public PhotoPageItem getItem(int i) {
        Object item = this.mViewPager.getItem(i);
        if (PhotoPageAdapter.isItemValidate(item)) {
            return (PhotoPageItem) item;
        }
        return null;
    }

    public PhotoPageItem getItemByNativeIndex(int i) {
        Object itemByNativeIndex = this.mViewPager.getItemByNativeIndex(i);
        if (PhotoPageAdapter.isItemValidate(itemByNativeIndex)) {
            return (PhotoPageItem) itemByNativeIndex;
        }
        return null;
    }

    public void onActionBarVisibleChanged(boolean z, int i) {
        PhotoPageItem currentItem = getCurrentItem();
        if (currentItem != null) {
            currentItem.onActionBarVisibleChanged(Boolean.valueOf(z), i);
        }
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        PhotoPageItem currentItem = getCurrentItem();
        if (currentItem != null) {
            currentItem.onActivityResult(i, i2, intent);
        }
    }

    public void onActivityTransition() {
        int activeItemCount = getActiveItemCount();
        for (int i = 0; i < activeItemCount; i++) {
            PhotoPageItem itemByNativeIndex = getItemByNativeIndex(i);
            if (itemByNativeIndex != null) {
                itemByNativeIndex.onActivityTransition();
            }
        }
    }

    public void onPause() {
        int activeItemCount = getActiveItemCount();
        for (int i = 0; i < activeItemCount; i++) {
            PhotoPageItem itemByNativeIndex = getItemByNativeIndex(i);
            if (itemByNativeIndex != null) {
                itemByNativeIndex.onPause();
            }
        }
    }

    public void onResume() {
        int activeItemCount = getActiveItemCount();
        for (int i = 0; i < activeItemCount; i++) {
            PhotoPageItem itemByNativeIndex = getItemByNativeIndex(i);
            if (itemByNativeIndex != null) {
                itemByNativeIndex.onResume();
            }
        }
    }

    public void onStart() {
        PhotoPageItem currentItem = getCurrentItem();
        if (currentItem != null) {
            currentItem.onSelected(true);
        }
        int activeItemCount = getActiveItemCount();
        for (int i = 0; i < activeItemCount; i++) {
            PhotoPageItem itemByNativeIndex = getItemByNativeIndex(i);
            if (itemByNativeIndex != null) {
                itemByNativeIndex.onStopTrimMemory(2);
            }
        }
    }

    public void onStop() {
        PhotoPageItem currentItem = getCurrentItem();
        int activeItemCount = getActiveItemCount();
        for (int i = 0; i < activeItemCount; i++) {
            PhotoPageItem itemByNativeIndex = getItemByNativeIndex(i);
            if (!(itemByNativeIndex == null || currentItem == itemByNativeIndex)) {
                itemByNativeIndex.onTrimMemory(2);
            }
        }
        if (currentItem != null) {
            currentItem.onUnSelected(true);
        }
    }

    public void setOnAlphaChangedListener(OnAlphaChangedListener onAlphaChangedListener) {
        this.mAlphaChangedListener = onAlphaChangedListener;
    }

    public void setOnDisplayRectChangedListener(OnDisplayRectChangedListener onDisplayRectChangedListener) {
        this.mDisplayRectChangedListener = onDisplayRectChangedListener;
    }

    public void setOnDownloadListener(CloudImageLoadingListener cloudImageLoadingListener) {
        this.mDownloadListener = cloudImageLoadingListener;
    }

    public void setOnExitListener(OnExitListener onExitListener) {
        this.mExitListener = onExitListener;
    }

    public void setOnImageLoadFinishListener(OnImageLoadFinishListener onImageLoadFinishListener) {
        this.mOnImageLoadFinishListener = onImageLoadFinishListener;
    }

    public void setOnPageChangedListener(OnPageChangedListener onPageChangedListener) {
        this.mPageChangedListener = onPageChangedListener;
    }

    public void setOnPageScrolled(int i, float f, int i2) {
        if (this.mPageChangedListener != null) {
            this.mPageChangedListener.onPageScrolled(i, f, i2);
        }
    }

    public void setOnPageSettledListener(OnPageSettledListener onPageSettledListener) {
        this.mPageSettledListener = onPageSettledListener;
    }

    public void setOnPlayVideoListener(OnPlayVideoListener onPlayVideoListener) {
        this.mOnPlayVideoListener = onPlayVideoListener;
    }

    public void setOnScaleChangedListener(OnScaleChangedListener onScaleChangedListener) {
        this.mScaleChangedListener = onScaleChangedListener;
    }

    public void setOnTapListener(OnSingleTapListener onSingleTapListener) {
        this.mTapListener = onSingleTapListener;
    }

    public void setPageChanged(int i) {
        if (this.mPageChangedListener != null) {
            this.mPageChangedListener.onPageChanged(i);
        }
    }

    public void setPageScrollStateChanged(int i) {
        PhotoPageItem currentItem = getCurrentItem();
        if (currentItem != null) {
            if (i == 1) {
                currentItem.onPageScrollDragging();
            } else if (i == 0) {
                currentItem.onPageScrollIdle();
            }
        }
        if (this.mPageChangedListener != null) {
            this.mPageChangedListener.onPageScrollStateChanged(i);
        }
    }

    public void setPageSettled(int i) {
        if (this.mPageSettledListener != null) {
            this.mPageSettledListener.onPageSettled(i);
        }
        int activeItemCount = getActiveItemCount();
        PhotoPageItem item = getItem(i);
        for (int i2 = 0; i2 < activeItemCount; i2++) {
            PhotoPageItem itemByNativeIndex = getItemByNativeIndex(i2);
            if (itemByNativeIndex != null) {
                if (itemByNativeIndex != item) {
                    itemByNativeIndex.onUnSelected(false);
                    itemByNativeIndex.setOnViewTapListener(null);
                    itemByNativeIndex.setCloudImageLoadingListener(null);
                    itemByNativeIndex.setOnExitListener(null);
                    itemByNativeIndex.setOnScaleChangeListener(null);
                    itemByNativeIndex.removeOnMatrixChangeListener(this.mInternalMatrixListener);
                    itemByNativeIndex.setOnBackgroundAlphaChangedListener(null);
                    itemByNativeIndex.setTrimMemoryCallback(null);
                    itemByNativeIndex.setOnPlayVideoListener(null);
                } else {
                    itemByNativeIndex.setOnViewTapListener(this.mInternalTapListener);
                    itemByNativeIndex.setCloudImageLoadingListener(this.mInternalImageLoadingListener);
                    itemByNativeIndex.setOnExitListener(this.mInternalExitListener);
                    itemByNativeIndex.setOnScaleChangeListener(this.mInternalScaleListener);
                    itemByNativeIndex.addOnMatrixChangeListener(this.mInternalMatrixListener);
                    itemByNativeIndex.setOnBackgroundAlphaChangedListener(this.mInternalAlphaChangedListener);
                    itemByNativeIndex.setTrimMemoryCallback(this.mInternalTrimMemoryCallback);
                    itemByNativeIndex.onSelected(false);
                    itemByNativeIndex.setOnPlayVideoListener(this.mInternalOnPlayVideoListener);
                }
                itemByNativeIndex.setOnImageLoadFinishListener(this.mInternalOnImageLoadFinishListener);
            }
        }
    }
}
