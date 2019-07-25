package com.miui.gallery.ui;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout.LayoutParams;
import com.miui.gallery.R;
import com.miui.gallery.model.BaseDataItem;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.CancelListener;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.ui.PhotoPageItem.TransitionListener;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.gifdecoder.NSGifDecode;
import com.miui.gallery.util.gifdecoder.NSGifDecode.GifFrameUpdateListener;
import com.miui.gallery.util.photoview.ItemViewInfo;
import com.miui.gallery.util.uil.CloudImageLoader;
import com.miui.gallery.view.animation.AnimationListenerAdapter;
import com.miui.gallery.widget.CircleStrokeProgressBar;
import miui.view.animation.CubicEaseOutInterpolator;

public class PhotoPageGifItem extends PhotoPageItem {
    private int mActionBarHeight;
    private Future mGifFuture;
    private GifFrameUpdateListener mGifListener;
    /* access modifiers changed from: private */
    public Handler mHandler = new Handler() {
        public void handleMessage(Message message) {
            switch (message.what) {
                case 1000:
                    Bitmap bitmap = (Bitmap) message.obj;
                    if (bitmap != null && !bitmap.isRecycled()) {
                        Matrix suppMatrix = PhotoPageGifItem.this.mPhotoView.getSuppMatrix();
                        PhotoPageGifItem.this.mPhotoView.setImageBitmap(bitmap);
                        PhotoPageGifItem.this.mPhotoView.setDisplayMatrix(suppMatrix);
                        return;
                    }
                    return;
                case 1001:
                    if (PhotoPageGifItem.this.mDataItem != null) {
                        PhotoPageGifItem.this.mDataItem.setFilePath(null);
                    }
                    PhotoPageGifItem.this.setPlayIconVisible(true);
                    PhotoPageGifItem.this.setIndicatorVisible(true, true);
                    return;
                default:
                    return;
            }
        }
    };
    /* access modifiers changed from: private */
    public View mIndicator;
    private int mIndicatorMargin;
    private View mPlayIcon;

    private class GifDownloadManager extends DownloadManager {
        private ProgressBar mOriginProgressBar;

        private GifDownloadManager() {
            super();
        }

        private ProgressBar initOriginProgressBar() {
            CircleStrokeProgressBar circleStrokeProgressBar = new CircleStrokeProgressBar(PhotoPageGifItem.this.getContext());
            circleStrokeProgressBar.setDrawablesForLevels(new int[]{R.drawable.photo_download_progress_bg_big}, new int[]{R.drawable.photo_download_progress_second_big}, (int[]) null);
            circleStrokeProgressBar.setMiddleStrokeColors(new int[]{PhotoPageGifItem.this.getResources().getColor(R.color.download_progress_shadow_color)}, (float) PhotoPageGifItem.this.getResources().getDimensionPixelSize(R.dimen.download_progress_shadow_radius));
            LayoutParams layoutParams = new LayoutParams(-2, -2);
            layoutParams.addRule(13);
            layoutParams.addRule(13);
            circleStrokeProgressBar.setVisibility(8);
            PhotoPageGifItem.this.addView(circleStrokeProgressBar, layoutParams);
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
            if (PhotoPageGifItem.this.isPagerSelected()) {
                PhotoPageGifItem.this.tryPlayGif();
            }
        }

        /* access modifiers changed from: protected */
        public void doOnProgressVisibilityChanged(boolean z) {
            super.doOnProgressVisibilityChanged(z);
            if (CloudImageLoader.getInstance().isOrigin(getCurDownloadType())) {
                PhotoPageGifItem.this.setPlayIconVisible(!z);
                if (z) {
                    PhotoPageGifItem.this.mEmptyView.setVisible(false);
                }
            }
        }

        /* access modifiers changed from: protected */
        public CharSequence getErrorTip() {
            if (!CloudImageLoader.getInstance().isOrigin(getCurDownloadType())) {
                return super.getErrorTip();
            }
            return PhotoPageGifItem.this.getResources().getString(R.string.download_error_format, new Object[]{PhotoPageGifItem.this.getResources().getString(R.string.origin_gif_name)});
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

        /* access modifiers changed from: protected */
        public boolean needShowDownloadView() {
            return CloudImageLoader.getInstance().isOrigin(getCurDownloadType()) ? !isDrawableDisplayInside() : super.needShowDownloadView();
        }
    }

    private class GifJob implements Job {
        private NSGifDecode mDecoder;
        private Handler mHandler;
        private BaseDataItem mItem;

        GifJob(BaseDataItem baseDataItem, Handler handler) {
            this.mItem = baseDataItem;
            this.mHandler = handler;
        }

        /* access modifiers changed from: private */
        public void cancel() {
            if (this.mDecoder != null) {
                this.mDecoder.setListener(null);
                this.mDecoder.cancel();
                this.mDecoder = null;
            }
        }

        private void start(JobContext jobContext) {
            if (jobContext.isCancelled()) {
                cancel();
            } else if (this.mDecoder != null) {
                this.mDecoder.setListener(PhotoPageGifItem.this.getGifUpdateListener());
                this.mDecoder.run();
            }
        }

        public Object run(JobContext jobContext) {
            if (this.mItem == null || !this.mItem.checkOriginalFileExist()) {
                cancel();
                if (this.mHandler != null) {
                    this.mHandler.obtainMessage(1001).sendToTarget();
                }
                return null;
            }
            jobContext.setCancelListener(new CancelListener() {
                public void onCancel() {
                    GifJob.this.cancel();
                }
            });
            if (this.mItem != null) {
                this.mDecoder = this.mItem.createNSGifDecoder(jobContext);
                start(jobContext);
            }
            return null;
        }
    }

    static {
        try {
            System.loadLibrary("MiuiGalleryNSGIF");
        } catch (Throwable th) {
            Log.e("PhotoPageGifItem", "load jni failed.", (Object) th);
        }
    }

    public PhotoPageGifItem(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    private void adjustIndicatorLocation() {
        if (this.mIndicator != null && this.mIndicator.getVisibility() == 0) {
            RectF displayRect = this.mPhotoView.getDisplayRect();
            if (displayRect != null) {
                float indicatorMargin = (float) getIndicatorMargin();
                float max = Math.max(displayRect.top, isActionBarVisible() ? (float) this.mActionBarHeight : 0.0f) + ((float) getIndicatorMargin());
                if (this.mIndicator.getTranslationX() != indicatorMargin || this.mIndicator.getTranslationY() != max) {
                    Log.d("PhotoPageGifItem", "setTranslation x %s, y %s", Float.valueOf(indicatorMargin), Float.valueOf(max));
                    this.mIndicator.setTranslationX(indicatorMargin);
                    this.mIndicator.setTranslationY(max);
                }
            }
        }
    }

    private void cancelGifDecoder() {
        if (this.mGifFuture != null) {
            this.mGifFuture.cancel();
            this.mGifFuture = null;
        }
        this.mHandler.removeMessages(1000);
    }

    private int getIndicatorMargin() {
        if (this.mIndicatorMargin == 0) {
            this.mIndicatorMargin = getResources().getDimensionPixelSize(R.dimen.gif_indicator_margin);
        }
        return this.mIndicatorMargin;
    }

    private void initIndicator() {
        ImageView imageView = new ImageView(getContext());
        imageView.setImageDrawable(getResources().getDrawable(R.drawable.gif_indicator));
        LayoutParams layoutParams = new LayoutParams(-2, -2);
        layoutParams.addRule(9);
        layoutParams.addRule(10);
        imageView.setVisibility(8);
        addView(imageView, layoutParams);
        this.mIndicator = imageView;
    }

    private void initPlayIcon() {
        ImageView imageView = new ImageView(getContext());
        imageView.setImageDrawable(getResources().getDrawable(R.drawable.video_play_icon));
        imageView.setContentDescription(getResources().getString(R.string.play_gif_desc));
        LayoutParams layoutParams = new LayoutParams(-2, -2);
        layoutParams.addRule(13);
        addView(imageView, layoutParams);
        this.mPlayIcon = imageView;
        this.mPlayIcon.setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
                PhotoPageGifItem.this.downloadOrigin();
            }
        });
    }

    private boolean isOriginFileExist() {
        return this.mDataItem != null && !TextUtils.isEmpty(this.mDataItem.getOriginalPath());
    }

    private boolean needShowIndicator() {
        return this.mDataItem != null && !isOriginFileExist() && !isAnimExiting() && isActionBarVisible();
    }

    private boolean needShowPlayIcon() {
        return !isOriginFileExist() && !isAnimExiting();
    }

    /* access modifiers changed from: private */
    public void setIndicatorVisible(boolean z, boolean z2) {
        if (z && needShowIndicator()) {
            if (this.mIndicator == null) {
                initIndicator();
            }
            if (this.mIndicator.getVisibility() != 0) {
                this.mIndicator.clearAnimation();
                this.mIndicator.setVisibility(0);
                adjustIndicatorLocation();
                if (z2) {
                    this.mIndicator.startAnimation(generateShowAnimation());
                }
            }
        } else if (this.mIndicator != null && this.mIndicator.getVisibility() != 8) {
            this.mIndicator.clearAnimation();
            if (z2) {
                Animation generateHideAnimation = generateHideAnimation();
                generateHideAnimation.setAnimationListener(new AnimationListenerAdapter() {
                    public void onAnimationEnd(Animation animation) {
                        if (PhotoPageGifItem.this.mIndicator != null) {
                            PhotoPageGifItem.this.mIndicator.setVisibility(8);
                        }
                    }
                });
                this.mIndicator.startAnimation(generateHideAnimation);
                return;
            }
            this.mIndicator.setVisibility(8);
        }
    }

    /* access modifiers changed from: private */
    public void setPlayIconVisible(boolean z) {
        if (z && needShowPlayIcon()) {
            if (this.mPlayIcon == null) {
                initPlayIcon();
            }
            this.mPlayIcon.setVisibility(0);
        } else if (this.mPlayIcon != null) {
            this.mPlayIcon.setVisibility(8);
        }
    }

    /* access modifiers changed from: private */
    public void tryPlayGif() {
        cancelGifDecoder();
        if (isOriginFileExist()) {
            setPlayIconVisible(false);
            setIndicatorVisible(false, false);
            this.mGifFuture = ThreadManager.getMiscPool().submit(new GifJob(this.mDataItem, this.mHandler));
            return;
        }
        setPlayIconVisible(true);
        setIndicatorVisible(true, false);
    }

    public void animEnter(ItemViewInfo itemViewInfo, final TransitionListener transitionListener) {
        AnonymousClass5 r0 = new TransitionListener() {
            public void onTransitEnd() {
                transitionListener.onTransitEnd();
            }
        };
        setPlayIconVisible(false);
        setIndicatorVisible(false, false);
        super.animEnter(itemViewInfo, r0);
    }

    public void animExit(ItemViewInfo itemViewInfo, TransitionListener transitionListener) {
        cancelGifDecoder();
        setPlayIconVisible(false);
        setIndicatorVisible(false, false);
        super.animExit(itemViewInfo, transitionListener);
    }

    /* access modifiers changed from: protected */
    public DownloadManager createDownloadManager() {
        return new GifDownloadManager();
    }

    /* access modifiers changed from: protected */
    public void doOnMatrixChanged(RectF rectF) {
        super.doOnMatrixChanged(rectF);
        adjustIndicatorLocation();
    }

    /* access modifiers changed from: protected */
    public void doOnSelected(boolean z, boolean z2, boolean z3) {
        tryPlayGif();
        super.doOnSelected(z, z2, z3);
    }

    /* access modifiers changed from: protected */
    public void doOnUnSelected(boolean z) {
        super.doOnUnSelected(z);
        cancelGifDecoder();
        setIndicatorVisible(false, false);
        setPlayIconVisible(false);
    }

    /* access modifiers changed from: protected */
    public Animation generateHideAnimation() {
        AlphaAnimation alphaAnimation = new AlphaAnimation(1.0f, 0.0f);
        alphaAnimation.setInterpolator(new CubicEaseOutInterpolator());
        alphaAnimation.setDuration(200);
        return alphaAnimation;
    }

    /* access modifiers changed from: protected */
    public Animation generateShowAnimation() {
        AlphaAnimation alphaAnimation = new AlphaAnimation(0.0f, 1.0f);
        alphaAnimation.setInterpolator(new CubicEaseOutInterpolator());
        alphaAnimation.setDuration(300);
        return alphaAnimation;
    }

    public GifFrameUpdateListener getGifUpdateListener() {
        if (this.mGifListener == null) {
            this.mGifListener = new GifFrameUpdateListener() {
                public void onUpdateGifFrame(Bitmap bitmap) {
                    PhotoPageGifItem.this.mHandler.obtainMessage(1000, bitmap).sendToTarget();
                }
            };
        }
        return this.mGifListener;
    }

    public void onActionBarVisibleChanged(Boolean bool, int i) {
        super.onActionBarVisibleChanged(bool, i);
        this.mActionBarHeight = i;
        setIndicatorVisible(bool.booleanValue(), true);
    }

    /* access modifiers changed from: protected */
    public void onDetachedFromWindow() {
        cancelGifDecoder();
        super.onDetachedFromWindow();
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
    }
}
