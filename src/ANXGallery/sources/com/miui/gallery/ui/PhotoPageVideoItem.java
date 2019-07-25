package com.miui.gallery.ui;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.RectF;
import android.graphics.SurfaceTexture;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.Surface;
import android.view.TextureView;
import android.view.TextureView.SurfaceTextureListener;
import android.view.View;
import android.widget.ProgressBar;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.meicam.themehelper.BuildConfig;
import com.miui.gallery.R;
import com.miui.gallery.adapter.PhotoPageAdapter.ChoiceModeInterface;
import com.miui.gallery.error.core.ErrorCode;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.ui.PhotoPageItem.TransitionListener;
import com.miui.gallery.util.FormatUtil;
import com.miui.gallery.util.IntentUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.util.photoview.ItemViewInfo;
import com.miui.gallery.util.uil.CloudImageLoader;
import com.miui.gallery.widget.AntiDoubleClickListener;
import com.miui.gallery.widget.CircleStrokeProgressBar;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;
import com.nostra13.universalimageloader.core.listener.ImageLoadingProgressListener;
import miui.view.animation.SineEaseInOutInterpolator;

public class PhotoPageVideoItem extends PhotoPageItem {
    private AntiDoubleClickListener mAntiDoubleClickListener = new AntiDoubleClickListener() {
        public void onAntiDoubleClick(View view) {
            if (PhotoPageVideoItem.this.mDataItem == null) {
                return;
            }
            if (!TextUtils.isEmpty(PhotoPageVideoItem.this.mDataItem.getOriginalPath())) {
                PhotoPageVideoItem.this.playVideo();
            } else {
                PhotoPageVideoItem.this.handNoFileExist();
            }
        }
    };
    /* access modifiers changed from: private */
    public OnSurfacePreparedListener mOnSurfacePreparedListener;
    private VideoPreviewManager mPreviewManager;
    /* access modifiers changed from: private */
    public View mVideoIcon;
    private Runnable mVideoItemRunnable;

    public interface OnSurfacePreparedListener {
        void onSurfacePrepared(Surface surface);
    }

    protected class VideoCheckManager extends CheckManager {
        protected TextView mVideoSmallText;

        protected VideoCheckManager() {
            super();
        }

        public void endCheck() {
            super.endCheck();
            PhotoPageVideoItem.this.mVideoIcon.setAlpha(1.0f);
            this.mVideoSmallText.setVisibility(8);
        }

        /* access modifiers changed from: protected */
        public void ensureInflated() {
            super.ensureInflated();
            this.mVideoSmallText = (TextView) PhotoPageVideoItem.this.findViewById(R.id.video_small_icon_duration);
        }

        public void refreshCheck(ChoiceModeInterface... choiceModeInterfaceArr) {
            super.refreshCheck(choiceModeInterfaceArr);
            if (PhotoPageVideoItem.this.mDataItem != null) {
                this.mVideoSmallText.setVisibility(0);
                this.mVideoSmallText.setText(FormatUtil.formatVideoDuration((long) PhotoPageVideoItem.this.mDataItem.getDuration()));
                return;
            }
            this.mVideoSmallText.setVisibility(8);
        }

        public void startCheck(ChoiceModeInterface... choiceModeInterfaceArr) {
            super.startCheck(choiceModeInterfaceArr);
            PhotoPageVideoItem.this.mVideoIcon.setAlpha(0.0f);
            if (PhotoPageVideoItem.this.mDataItem != null) {
                this.mVideoSmallText.setVisibility(0);
                this.mVideoSmallText.setText(FormatUtil.formatVideoDuration((long) PhotoPageVideoItem.this.mDataItem.getDuration()));
            }
        }
    }

    private class VideoDownloadManager extends DownloadManager {
        private ProgressBar mOriginProgressBar;

        private VideoDownloadManager() {
            super();
        }

        private ProgressBar initOriginProgressBar() {
            CircleStrokeProgressBar circleStrokeProgressBar = new CircleStrokeProgressBar(PhotoPageVideoItem.this.getContext());
            circleStrokeProgressBar.setDrawablesForLevels(new int[]{R.drawable.photo_download_progress_bg_big}, new int[]{R.drawable.photo_download_progress_second_big}, (int[]) null);
            circleStrokeProgressBar.setMiddleStrokeColors(new int[]{PhotoPageVideoItem.this.getResources().getColor(R.color.download_progress_shadow_color)}, (float) PhotoPageVideoItem.this.getResources().getDimensionPixelSize(R.dimen.download_progress_shadow_radius));
            LayoutParams layoutParams = new LayoutParams(-2, -2);
            layoutParams.addRule(13);
            layoutParams.addRule(13);
            circleStrokeProgressBar.setVisibility(8);
            PhotoPageVideoItem.this.addView(circleStrokeProgressBar, layoutParams);
            return circleStrokeProgressBar;
        }

        /* access modifiers changed from: protected */
        public void adjustProgressBarLocation(boolean z, RectF rectF, boolean z2) {
            if (!CloudImageLoader.getInstance().isOrigin(getCurDownloadType())) {
                super.adjustProgressBarLocation(z, rectF, z2);
            }
        }

        /* access modifiers changed from: protected */
        public void doOnDownloaded(DownloadType downloadType, String str) {
            super.doOnDownloaded(downloadType, str);
            if (CloudImageLoader.getInstance().isOrigin(downloadType) && PhotoPageVideoItem.this.canPlay()) {
                PhotoPageVideoItem.this.playVideo();
            }
        }

        /* access modifiers changed from: protected */
        public void doOnProgressVisibilityChanged(boolean z) {
            super.doOnProgressVisibilityChanged(z);
            if (CloudImageLoader.getInstance().isOrigin(getCurDownloadType())) {
                if (!z && PhotoPageVideoItem.this.canPlay()) {
                    PhotoPageVideoItem.this.setVideoItemVisibleDelay(!z);
                } else {
                    PhotoPageVideoItem.this.setVideoItemVisible(!z);
                }
                if (z) {
                    PhotoPageVideoItem.this.mEmptyView.setVisible(false);
                }
            }
        }

        /* access modifiers changed from: protected */
        public boolean filterError(ErrorCode errorCode) {
            return errorCode == ErrorCode.DECODE_ERROR && PhotoPageVideoItem.this.mPhotoView.getDrawable() != null;
        }

        /* access modifiers changed from: protected */
        public CharSequence getErrorTip() {
            if (!CloudImageLoader.getInstance().isOrigin(getCurDownloadType())) {
                return super.getErrorTip();
            }
            return PhotoPageVideoItem.this.getResources().getString(R.string.download_error_format, new Object[]{PhotoPageVideoItem.this.getResources().getString(R.string.origin_video_name)});
        }

        /* access modifiers changed from: protected */
        public ProgressBar getProgressBar() {
            if (!CloudImageLoader.getInstance().isOrigin(getCurDownloadType())) {
                return super.getProgressBar();
            }
            if (this.mOriginProgressBar == null) {
                this.mOriginProgressBar = initOriginProgressBar();
            }
            return this.mOriginProgressBar;
        }

        public boolean isProgressVisible() {
            return this.mOriginProgressBar != null && this.mOriginProgressBar.getVisibility() == 0;
        }

        /* access modifiers changed from: protected */
        public boolean needShowDownloadView() {
            if (!CloudImageLoader.getInstance().isOrigin(getCurDownloadType())) {
                return super.needShowDownloadView();
            }
            return !PhotoPageVideoItem.this.isInActionMode() && !isDrawableDisplayInside();
        }
    }

    class VideoItemRunnable implements Runnable {
        private final boolean visible;

        public VideoItemRunnable(boolean z) {
            this.visible = z;
        }

        public void run() {
            PhotoPageVideoItem.this.doSetVideoItemVisible(this.visible);
        }
    }

    private class VideoPreviewManager {
        private Bitmap mBitmap;
        private Runnable mHideRunnable;
        private boolean mIsPreviewUpdated;
        private boolean mIsShowPreview;
        private LayoutParams mLayoutParams;
        private boolean mPreviewStarted;
        /* access modifiers changed from: private */
        public Surface mSurface;
        private SurfaceTextureListener mSurfaceTextureListener;
        private TextureView mTextureView;
        private RectF mVideoRect;

        private VideoPreviewManager() {
            this.mHideRunnable = new Runnable() {
                public final void run() {
                    VideoPreviewManager.lambda$new$10(VideoPreviewManager.this);
                }
            };
            this.mSurfaceTextureListener = new SurfaceTextureListener() {
                public void onSurfaceTextureAvailable(SurfaceTexture surfaceTexture, int i, int i2) {
                    VideoPreviewManager.this.mSurface = new Surface(surfaceTexture);
                    if (PhotoPageVideoItem.this.mOnSurfacePreparedListener != null) {
                        PhotoPageVideoItem.this.mOnSurfacePreparedListener.onSurfacePrepared(VideoPreviewManager.this.mSurface);
                    }
                }

                public boolean onSurfaceTextureDestroyed(SurfaceTexture surfaceTexture) {
                    VideoPreviewManager.this.mSurface = null;
                    return true;
                }

                public void onSurfaceTextureSizeChanged(SurfaceTexture surfaceTexture, int i, int i2) {
                }

                public void onSurfaceTextureUpdated(SurfaceTexture surfaceTexture) {
                }
            };
        }

        private void addTextureView() {
            if (this.mTextureView == null) {
                Log.d("VideoItemPreviewManager", "addTextureView");
                RectF videoRect = getVideoRect();
                if (videoRect != null) {
                    if (this.mLayoutParams == null) {
                        this.mLayoutParams = new LayoutParams(-1, -1);
                        this.mLayoutParams.addRule(13);
                    }
                    this.mLayoutParams.width = (int) videoRect.width();
                    this.mLayoutParams.height = (int) videoRect.height();
                    this.mTextureView = new TextureView(PhotoPageVideoItem.this.getContext());
                    this.mTextureView.setSurfaceTextureListener(this.mSurfaceTextureListener);
                    PhotoPageVideoItem.this.addView(this.mTextureView, 0, this.mLayoutParams);
                }
            }
        }

        private RectF getVideoRect() {
            Drawable drawable = PhotoPageVideoItem.this.mPhotoView.getDrawable();
            if (drawable == null) {
                return null;
            }
            if (this.mVideoRect == null) {
                this.mVideoRect = new RectF();
            }
            this.mVideoRect.set(0.0f, 0.0f, (float) drawable.getIntrinsicWidth(), (float) drawable.getIntrinsicHeight());
            PhotoPageVideoItem.this.mPhotoView.getDisplayMatrix().mapRect(this.mVideoRect);
            return this.mVideoRect;
        }

        private void hideTextureView() {
            if (this.mSurface != null) {
                Log.d("VideoItemPreviewManager", "hideTextureView");
                this.mTextureView.removeCallbacks(this.mHideRunnable);
                PhotoPageVideoItem.this.mPhotoView.setVisibility(0);
                if (this.mIsPreviewUpdated) {
                    this.mIsPreviewUpdated = false;
                    if (this.mBitmap == null) {
                        this.mBitmap = Bitmap.createBitmap(PhotoPageVideoItem.this.getResources().getDisplayMetrics(), this.mTextureView.getWidth(), this.mTextureView.getHeight(), Config.ARGB_8888);
                    }
                    this.mTextureView.getBitmap(this.mBitmap);
                    this.mIsShowPreview = true;
                    PhotoPageVideoItem.this.mPhotoView.setImageBitmap(this.mBitmap);
                }
            }
        }

        private void hideTextureViewDelay() {
            if (this.mTextureView != null) {
                this.mTextureView.removeCallbacks(this.mHideRunnable);
                this.mTextureView.postDelayed(this.mHideRunnable, 100);
            }
        }

        public static /* synthetic */ void lambda$new$10(VideoPreviewManager videoPreviewManager) {
            Log.w("VideoItemPreviewManager", "hideTextureViewDelay");
            videoPreviewManager.hideTextureView();
        }

        /* access modifiers changed from: private */
        public void release() {
            this.mIsShowPreview = false;
            removeTextureView(BuildConfig.BUILD_TYPE);
        }

        private void removeTextureView(String str) {
            if (this.mTextureView != null) {
                Log.d("VideoItemPreviewManager", "removeTextureView %s", (Object) str);
                hideTextureView();
                PhotoPageVideoItem.this.mPhotoView.setVisibility(0);
                this.mTextureView.setSurfaceTextureListener(null);
                this.mTextureView.removeCallbacks(this.mHideRunnable);
                PhotoPageVideoItem.this.removeView(this.mTextureView);
                this.mPreviewStarted = false;
                this.mIsPreviewUpdated = false;
                this.mSurface = null;
                this.mTextureView = null;
            }
        }

        /* access modifiers changed from: 0000 */
        public Surface getSurface() {
            addTextureView();
            return this.mSurface;
        }

        /* access modifiers changed from: 0000 */
        public boolean isShowPreview() {
            return this.mIsShowPreview;
        }

        /* access modifiers changed from: 0000 */
        public void onConfigurationChanged() {
            removeTextureView("configChanged");
        }

        /* access modifiers changed from: 0000 */
        public void onExit() {
            removeTextureView("exit");
        }

        /* access modifiers changed from: 0000 */
        public void onMatrixChanged() {
            if (this.mTextureView != null) {
                RectF videoRect = getVideoRect();
                if (videoRect != null && (videoRect.width() != ((float) this.mTextureView.getWidth()) || videoRect.height() != ((float) this.mTextureView.getHeight()))) {
                    removeTextureView("matrixChanged");
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public void onPreviewStart() {
            this.mPreviewStarted = true;
            if (this.mTextureView != null) {
                this.mTextureView.removeCallbacks(this.mHideRunnable);
            }
        }

        /* access modifiers changed from: 0000 */
        public void onPreviewStop() {
            this.mPreviewStarted = false;
            hideTextureViewDelay();
        }

        /* access modifiers changed from: 0000 */
        public void onPreviewUpdate(boolean z) {
            if (this.mSurface != null) {
                Log.d("VideoItemPreviewManager", "onPreviewUpdate %b", (Object) Boolean.valueOf(z));
                this.mIsPreviewUpdated = true;
                if (!z || this.mPreviewStarted) {
                    PhotoPageVideoItem.this.mPhotoView.setVisibility(8);
                } else {
                    hideTextureView();
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public void onUnSelected(boolean z) {
            removeTextureView("unSelected");
            if (!z && this.mIsShowPreview) {
                this.mIsShowPreview = false;
                if (this.mBitmap != null) {
                    Log.d("VideoItemPreviewManager", "refresh");
                    PhotoPageVideoItem.this.refreshItem();
                    this.mBitmap = null;
                }
            }
        }
    }

    public PhotoPageVideoItem(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    /* access modifiers changed from: private */
    public boolean canPlay() {
        return this.mDataItem != null && !TextUtils.isEmpty(this.mDataItem.getOriginalPath()) && isPagerSelected() && hasWindowFocus();
    }

    private void cancelVideoItemRunnable() {
        if (this.mVideoItemRunnable != null) {
            ThreadManager.getMainHandler().removeCallbacks(this.mVideoItemRunnable);
        }
    }

    /* access modifiers changed from: private */
    public void doSetVideoItemVisible(boolean z) {
        if (!z || !needShowPlayIcon()) {
            this.mVideoIcon.setVisibility(8);
        } else {
            this.mVideoIcon.setVisibility(0);
        }
    }

    /* access modifiers changed from: private */
    public void handNoFileExist() {
        if (this.mDataItem == null || this.mDataItem.getDownloadUri() == null) {
            ToastUtils.makeText(getContext(), (int) R.string.video_not_exist);
        } else {
            downloadOrigin();
        }
    }

    private boolean needShowPlayIcon() {
        return !isAnimExiting() && (this.mDownloadManager == null || !((VideoDownloadManager) this.mDownloadManager).isProgressVisible()) && (this.mPhotoView.getDrawable() != null || (this.mDataItem != null && !TextUtils.isEmpty(this.mDataItem.getOriginalPath())));
    }

    /* access modifiers changed from: private */
    public void playVideo() {
        if (this.mOnPlayVideoListener != null) {
            this.mOnPlayVideoListener.onPlayVideo(this.mDataItem);
        }
    }

    private void setVideoIconVisibleWithAnim(boolean z) {
        this.mVideoIcon.animate().alpha(z ? 1.0f : 0.0f).setDuration(300).setInterpolator(new SineEaseInOutInterpolator()).start();
    }

    /* access modifiers changed from: private */
    public void setVideoItemVisible(boolean z) {
        cancelVideoItemRunnable();
        doSetVideoItemVisible(z);
    }

    /* access modifiers changed from: private */
    public void setVideoItemVisibleDelay(boolean z) {
        cancelVideoItemRunnable();
        this.mVideoItemRunnable = new VideoItemRunnable(z);
        ThreadManager.getMainHandler().postDelayed(this.mVideoItemRunnable, 200);
    }

    public void animEnter(ItemViewInfo itemViewInfo, final TransitionListener transitionListener) {
        AnonymousClass1 r0 = new TransitionListener() {
            public void onTransitEnd() {
                PhotoPageVideoItem.this.setVideoItemVisible(true);
                transitionListener.onTransitEnd();
            }
        };
        setVideoItemVisible(false);
        super.animEnter(itemViewInfo, r0);
    }

    public void animExit(ItemViewInfo itemViewInfo, TransitionListener transitionListener) {
        if (this.mPreviewManager != null) {
            this.mPreviewManager.onExit();
        }
        setVideoItemVisible(false);
        super.animExit(itemViewInfo, transitionListener);
    }

    /* access modifiers changed from: protected */
    public CheckManager createCheckManager() {
        return new VideoCheckManager();
    }

    /* access modifiers changed from: protected */
    public DownloadManager createDownloadManager() {
        return new VideoDownloadManager();
    }

    /* access modifiers changed from: protected */
    public void displayImage(String str, DisplayImageOptions displayImageOptions, ImageSize imageSize, ImageLoadingListener imageLoadingListener, ImageLoadingProgressListener imageLoadingProgressListener) {
        if (this.mPreviewManager == null || !this.mPreviewManager.isShowPreview()) {
            super.displayImage(str, displayImageOptions, imageSize, imageLoadingListener, imageLoadingProgressListener);
        }
    }

    /* access modifiers changed from: protected */
    public void doOnMatrixChanged(RectF rectF) {
        super.doOnMatrixChanged(rectF);
        float[] fArr = {(float) (getWidth() / 2), (float) (getHeight() / 2)};
        this.mPhotoView.getSuppMatrix().mapPoints(fArr);
        this.mVideoIcon.setTranslationX(fArr[0] - ((float) (getWidth() / 2)));
        this.mVideoIcon.setTranslationY(fArr[1] - ((float) (getHeight() / 2)));
        if (this.mPreviewManager != null) {
            this.mPreviewManager.onMatrixChanged();
        }
    }

    /* access modifiers changed from: protected */
    public void doOnSelected(boolean z, boolean z2, boolean z3) {
        super.doOnSelected(z, z2, z3);
    }

    /* access modifiers changed from: protected */
    public void doOnUnSelected(boolean z) {
        super.doOnUnSelected(z);
        if (this.mPreviewManager != null) {
            this.mPreviewManager.onUnSelected(z);
        }
    }

    public Surface getPreviewSurface() {
        if (this.mPreviewManager != null) {
            return this.mPreviewManager.getSurface();
        }
        return null;
    }

    /* access modifiers changed from: protected */
    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        if (this.mPreviewManager != null) {
            this.mPreviewManager.onConfigurationChanged();
        }
    }

    /* access modifiers changed from: protected */
    public void onDetachedFromWindow() {
        cancelVideoItemRunnable();
        super.onDetachedFromWindow();
        if (this.mPreviewManager != null) {
            this.mPreviewManager.release();
        }
        this.mOnSurfacePreparedListener = null;
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mVideoIcon = findViewById(R.id.video_icon);
        this.mVideoIcon.setOnClickListener(this.mAntiDoubleClickListener);
        if (IntentUtil.isSupportNewVideoPlayer()) {
            this.mPreviewManager = new VideoPreviewManager();
        }
    }

    /* access modifiers changed from: protected */
    public void onImageLoadFinish(ErrorCode errorCode) {
        super.onImageLoadFinish(errorCode);
        setVideoItemVisible(this.mPhotoView.getDrawable() != null);
    }

    public void onPreviewStart() {
        setVideoIconVisibleWithAnim(false);
        if (this.mPreviewManager != null) {
            this.mPreviewManager.onPreviewStart();
        }
    }

    public void onPreviewStop() {
        setVideoIconVisibleWithAnim(true);
        if (this.mPreviewManager != null) {
            this.mPreviewManager.onPreviewStop();
        }
    }

    public void onPreviewUpdate(boolean z) {
        if (this.mPreviewManager != null) {
            this.mPreviewManager.onPreviewUpdate(z);
        }
    }

    public void onSlipping(float f) {
        super.onSlipping(f);
        this.mVideoIcon.animate().cancel();
        this.mVideoIcon.setAlpha(1.0f - f);
    }

    public void setOnSurfacePreparedListener(OnSurfacePreparedListener onSurfacePreparedListener) {
        this.mOnSurfacePreparedListener = onSurfacePreparedListener;
    }
}
