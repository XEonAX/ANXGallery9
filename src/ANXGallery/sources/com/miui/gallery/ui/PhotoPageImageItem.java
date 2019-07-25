package com.miui.gallery.ui;

import android.animation.Animator;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.content.res.Configuration;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.Matrix.ScaleToFit;
import android.graphics.RectF;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnCompletionListener;
import android.media.MediaPlayer.OnErrorListener;
import android.media.MediaPlayer.OnPreparedListener;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Handler;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.ViewStub;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.TranslateAnimation;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.ProgressBar;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.meicam.themehelper.BuildConfig;
import com.miui.extraphoto.sdk.BaseEchoListener;
import com.miui.extraphoto.sdk.ExtraPhotoSDK;
import com.miui.extraphoto.sdk.ExtraPhotoWrapper;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.R;
import com.miui.gallery.adapter.PhotoPageAdapter.ChoiceModeInterface;
import com.miui.gallery.assistant.cache.ImageFeatureCacheManager;
import com.miui.gallery.cloud.DownloadPathHelper;
import com.miui.gallery.editor.photo.sdk.AutoRenderer;
import com.miui.gallery.editor.photo.sdk.AutoRenderer.Callback;
import com.miui.gallery.model.ImageLoadParams;
import com.miui.gallery.photosapi.ProcessingMetadataQuery.ProgressStatus;
import com.miui.gallery.provider.ProcessingMedia;
import com.miui.gallery.provider.ProcessingMedia.ProcessingMetadata;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.ui.PhotoPageItem.TransitionListener;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.ProcessingMediaHelper;
import com.miui.gallery.util.StorageUtils;
import com.miui.gallery.util.photoview.ItemViewInfo;
import com.miui.gallery.view.animation.AnimationListenerAdapter;
import com.miui.gallery.widget.CircleStrokeProgressBar;
import com.miui.gallery.widget.GalleryVideoView;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.assist.FailReason;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.imageaware.ImageViewAware;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;
import com.nostra13.universalimageloader.core.listener.ImageLoadingProgressListener;
import java.util.HashMap;
import miui.view.animation.CubicEaseOutInterpolator;
import miui.view.animation.SineEaseInOutInterpolator;
import uk.co.senab.photoview.PhotoView;
import uk.co.senab.photoview.PhotoViewAttacher.OnScaleStageChangedListener;

public class PhotoPageImageItem extends PhotoPageImageBaseItem {
    /* access modifiers changed from: private */
    public static final boolean DEBUG_ENABLE = Log.isLoggable("PhotoPageImageItem", 3);
    /* access modifiers changed from: private */
    public AutoRenderer mAutoRenderer;
    private ExtraPhotoEchoManager mEchoManager;
    /* access modifiers changed from: private */
    public HigherDefinitionManager mHigherDefinitionManager;
    private ImageProcessingManager mImageProcessingManager;
    private float mMaxScale = 1.0f;
    private MotionPhotoManager mMotionPhotoManager;

    private class ExtraPhotoEchoManager {
        private EchoTask mEchoTask;
        private View mLoadingView;

        private class EchoListener extends BaseEchoListener {
            private EchoListener() {
            }

            public void onEnd(String str, boolean z) {
                if (!PhotoPageImageItem.this.isAttachedToWindow()) {
                    com.miui.gallery.util.Log.w("PhotoPageImageItem", "view has detached from window");
                    return;
                }
                ExtraPhotoEchoManager.this.hideLoading();
                if (z && !TextUtils.isEmpty(str) && PhotoPageImageItem.this.mDataItem != null) {
                    if (str.equalsIgnoreCase(PhotoPageImageItem.this.mDataItem.getOriginalPath())) {
                        PhotoPageImageItem.this.refreshItem();
                    } else if (PhotoPageImageItem.this.mPhotoPageInteractionListener != null) {
                        PhotoPageImageItem.this.mPhotoPageInteractionListener.notifyDataChanged();
                    }
                }
            }

            public void onStart() {
            }
        }

        private class EchoTask extends AsyncTask<Void, Void, Boolean> {
            private EchoListener mEchoListener;
            private String mPath;

            EchoTask(String str) {
                this.mPath = str;
            }

            public void cancel() {
                cancel(false);
                if (this.mEchoListener != null) {
                    ExtraPhotoWrapper.getInstance().unregisterEchoListener(this.mEchoListener);
                    this.mEchoListener = null;
                }
            }

            /* access modifiers changed from: protected */
            public Boolean doInBackground(Void... voidArr) {
                return Boolean.valueOf(ExtraPhotoWrapper.getInstance().needEcho(this.mPath));
            }

            /* access modifiers changed from: protected */
            public void onPostExecute(Boolean bool) {
                if (!isCancelled() && bool.booleanValue()) {
                    com.miui.gallery.util.Log.i("PhotoPageImageItem", "need echo %s", (Object) this.mPath);
                    ExtraPhotoEchoManager.this.showLoading();
                    this.mEchoListener = new EchoListener();
                    ExtraPhotoWrapper.getInstance().echo(this.mPath, this.mEchoListener, true);
                }
            }
        }

        ExtraPhotoEchoManager() {
        }

        /* access modifiers changed from: private */
        public void hideLoading() {
            if (this.mLoadingView != null && this.mLoadingView.getVisibility() == 0) {
                this.mLoadingView.setVisibility(8);
            }
        }

        private boolean isExtraImage() {
            return (PhotoPageImageItem.this.mDataItem == null || PhotoPageImageItem.this.mDataItem.getOriginalPath() == null) ? false : true;
        }

        private boolean needEcho() {
            return PhotoPageImageItem.this.mDataItem != null && !DownloadPathHelper.isShareFolderRelativePath(StorageUtils.getRelativePath(PhotoPageImageItem.this.getContext(), PhotoPageImageItem.this.mDataItem.getOriginalPath()));
        }

        /* access modifiers changed from: private */
        public void showLoading() {
            ensureInflated();
            if (this.mLoadingView.getVisibility() != 0) {
                this.mLoadingView.setVisibility(0);
            }
        }

        private void tryEcho() {
            if (ExtraPhotoWrapper.getInstance().isExtraCamera() && isExtraImage() && needEcho()) {
                if (this.mEchoTask != null) {
                    this.mEchoTask.cancel();
                }
                this.mEchoTask = new EchoTask(PhotoPageImageItem.this.mDataItem.getOriginalPath());
                this.mEchoTask.execute(new Void[0]);
            }
        }

        /* access modifiers changed from: protected */
        public void ensureInflated() {
            if (this.mLoadingView == null) {
                this.mLoadingView = ((ViewStub) PhotoPageImageItem.this.findViewById(R.id.page_item_loading)).inflate();
            }
        }

        public void onSelected() {
            tryEcho();
        }

        public void onUnSelected() {
            release();
        }

        public void release() {
            if (this.mEchoTask != null) {
                this.mEchoTask.cancel();
            }
            hideLoading();
        }
    }

    private class HigherDefinitionManager {
        private int mCurActionBarHeight;
        private int mDefaultMarginTop;
        /* access modifiers changed from: private */
        public TextView mDefinitionStateView;
        private Handler mHandler;
        private boolean mHasHdViewDisplayed;
        private Runnable mHideDefinitionRunnable;
        private boolean mIsEverEnterHd;
        private boolean mIsHdPhoto;
        private OnScaleStageChangedListener mOnScaleStageChangedListener;
        /* access modifiers changed from: private */
        public MarginLayoutParams mParams;

        private HigherDefinitionManager() {
            this.mHandler = ThreadManager.getMainHandler();
            this.mHideDefinitionRunnable = new Runnable() {
                public void run() {
                    HigherDefinitionManager.this.hideDefinitionText();
                }
            };
            this.mOnScaleStageChangedListener = new OnScaleStageChangedListener() {
                public void onMaxScaleStage(boolean z) {
                    if (z) {
                        PhotoPageImageItem.this.mHigherDefinitionManager.changeToHigherDefinition();
                    } else {
                        PhotoPageImageItem.this.mHigherDefinitionManager.exitHigherDefinition();
                    }
                }

                public void onMidScaleStage(boolean z) {
                    if (z) {
                        PhotoPageImageItem.this.mHigherDefinitionManager.changeToMidScale();
                    } else {
                        PhotoPageImageItem.this.mHigherDefinitionManager.exitHigherDefinition();
                    }
                }
            };
        }

        /* access modifiers changed from: private */
        public void changeToHigherDefinition() {
            if (!this.mHasHdViewDisplayed && this.mDefinitionStateView != null) {
                this.mDefinitionStateView.setText(PhotoPageImageItem.this.getResources().getString(R.string.is_higher_definition));
                this.mHasHdViewDisplayed = true;
                this.mIsEverEnterHd = true;
                showDefinitionText();
            }
        }

        /* access modifiers changed from: private */
        public void changeToMidScale() {
            if (this.mDefinitionStateView != null) {
                this.mDefinitionStateView.setText(R.string.double_tap_to_higher_definition);
                showDefinitionText();
            }
        }

        /* access modifiers changed from: private */
        public void exitHigherDefinition() {
            this.mHasHdViewDisplayed = false;
            hideDefinitionText();
        }

        /* access modifiers changed from: private */
        public void hideDefinitionText() {
            if (this.mDefinitionStateView != null) {
                this.mDefinitionStateView.setVisibility(8);
            }
        }

        private void initHdTextView() {
            if (this.mDefinitionStateView == null) {
                LayoutInflater.from(PhotoPageImageItem.this.getContext()).inflate(R.layout.photo_higher_definition_hint_view, PhotoPageImageItem.this, true);
                this.mDefinitionStateView = (TextView) PhotoPageImageItem.this.findViewById(R.id.hd_text_view);
                this.mDefinitionStateView.setVisibility(8);
                this.mParams = (MarginLayoutParams) this.mDefinitionStateView.getLayoutParams();
                this.mDefaultMarginTop = PhotoPageImageItem.this.getResources().getDimensionPixelSize(R.dimen.higher_definition_state_margin_top);
                this.mParams.setMargins(0, this.mDefaultMarginTop + this.mCurActionBarHeight, 0, 0);
                ((LayoutParams) this.mParams).addRule(14, -1);
                this.mDefinitionStateView.requestLayout();
            }
        }

        private void showDefinitionText() {
            if (this.mDefinitionStateView != null) {
                this.mDefinitionStateView.setVisibility(0);
                this.mHandler.removeCallbacks(this.mHideDefinitionRunnable);
                this.mHandler.postDelayed(this.mHideDefinitionRunnable, 5000);
            }
        }

        private void translateByActionBarVisibility(int i) {
            if (this.mDefinitionStateView != null) {
                final int i2 = this.mDefaultMarginTop + this.mCurActionBarHeight;
                if (this.mDefinitionStateView.getVisibility() == 0) {
                    TranslateAnimation translateAnimation = new TranslateAnimation(0.0f, 0.0f, 0.0f, (float) i);
                    translateAnimation.setDuration((long) PhotoPageImageItem.this.getResources().getInteger(17694721));
                    translateAnimation.setInterpolator(new DecelerateInterpolator());
                    translateAnimation.setFillAfter(true);
                    translateAnimation.setAnimationListener(new AnimationListener() {
                        public void onAnimationEnd(Animation animation) {
                            HigherDefinitionManager.this.mDefinitionStateView.clearAnimation();
                            HigherDefinitionManager.this.mParams.setMargins(0, i2, 0, 0);
                            HigherDefinitionManager.this.mDefinitionStateView.requestLayout();
                        }

                        public void onAnimationRepeat(Animation animation) {
                        }

                        public void onAnimationStart(Animation animation) {
                        }
                    });
                    this.mDefinitionStateView.startAnimation(translateAnimation);
                } else {
                    this.mParams.setMargins(0, i2, 0, 0);
                    this.mDefinitionStateView.requestLayout();
                }
            }
        }

        public void onActionBarVisibleChanged(Boolean bool, int i) {
            this.mCurActionBarHeight = bool.booleanValue() ? i : 0;
            if (this.mIsHdPhoto) {
                if (bool.booleanValue()) {
                    translateByActionBarVisibility(i);
                } else {
                    translateByActionBarVisibility(-i);
                }
            }
        }

        public void onSelected() {
            int i;
            boolean z = 0;
            if (PhotoPageImageItem.this.mDataItem == null) {
                this.mIsHdPhoto = false;
                i = 0;
            } else {
                i = PhotoPageImageItem.this.mDataItem.getWidth();
                int height = PhotoPageImageItem.this.mDataItem.getHeight();
                if (!TextUtils.isEmpty(PhotoPageImageItem.this.mDataItem.getOriginalPath()) && Math.max(i, height) >= 6000 && Math.min(i, height) >= 4000) {
                    z = 1;
                }
                this.mIsHdPhoto = z;
                z = height;
            }
            PhotoPageImageItem.this.mPhotoView.setHDState(i, z, this.mIsHdPhoto);
            if (this.mIsHdPhoto) {
                initHdTextView();
                PhotoPageImageItem.this.mPhotoView.setOnScaleStageChangedListener(this.mOnScaleStageChangedListener);
                return;
            }
            PhotoPageImageItem.this.mPhotoView.setOnScaleStageChangedListener(null);
        }

        public void onUnSelected() {
            release();
        }

        public void release() {
            if (this.mDefinitionStateView != null) {
                this.mDefinitionStateView.clearAnimation();
                this.mDefinitionStateView.setVisibility(8);
            }
            this.mHandler.removeCallbacks(this.mHideDefinitionRunnable);
            if (this.mIsHdPhoto) {
                GallerySamplingStatHelper.recordCountEvent("photo", "photo_hd_satisfy_count");
                if (this.mIsEverEnterHd) {
                    GallerySamplingStatHelper.recordCountEvent("photo", "photo_hd_enter_count");
                }
            }
            this.mIsHdPhoto = false;
            this.mHasHdViewDisplayed = false;
            this.mIsEverEnterHd = false;
            PhotoPageImageItem.this.mPhotoView.setOnScaleStageChangedListener(null);
        }
    }

    protected class ImageCheckManager extends CheckManager {
        private OnCheckedChangeListener mCheckStateListener = new OnCheckedChangeListener() {
            public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
                boolean z2 = false;
                if (z) {
                    compoundButton.setEnabled(false);
                } else {
                    compoundButton.setText(R.string.fast_share_auto_render);
                }
                PhotoView photoView = PhotoPageImageItem.this.mPhotoView;
                if (!z && !PhotoPageImageItem.this.isMediaInProcessing()) {
                    z2 = true;
                }
                photoView.setRegionDecodeEnable(z2);
                PhotoPageImageItem.this.refreshItem();
            }
        };
        ImageLoadingListener mPostLoadListener = new ImageLoadingListener() {
            public void onLoadingCancelled(String str, View view) {
            }

            public void onLoadingComplete(String str, View view, Bitmap bitmap) {
                if (PhotoPageImageItem.this.mAutoRenderer != null) {
                    PhotoPageImageItem.this.mAutoRenderer.render(((BitmapDrawable) PhotoPageImageItem.this.mPhotoView.getDrawable()).getBitmap(), ImageCheckManager.this.mRenderCallback);
                } else {
                    com.miui.gallery.util.Log.w("PhotoPageImageItem", "PGEditCoreAPI released");
                }
            }

            public void onLoadingFailed(String str, View view, FailReason failReason) {
            }

            public void onLoadingStarted(String str, View view) {
            }
        };
        /* access modifiers changed from: private */
        public Callback mRenderCallback = new Callback() {
            public void onDone(Bitmap bitmap) {
                if (PhotoPageImageItem.this.mCheckManager != null) {
                    ImageCheckManager imageCheckManager = (ImageCheckManager) PhotoPageImageItem.this.mCheckManager;
                    if (PhotoPageImageItem.this.isAttachedToWindow()) {
                        PhotoPageImageItem.this.mPhotoView.setImageBitmap(bitmap, true);
                        ImageCheckManager.this.ensureInflated();
                        imageCheckManager.mRenderCheckBox.setText(R.string.fast_share_auto_render_finish);
                    }
                    imageCheckManager.mRenderCheckBox.setEnabled(true);
                }
            }

            public void onError(int i, Object obj) {
                if (PhotoPageImageItem.this.mCheckManager != null) {
                    ((ImageCheckManager) PhotoPageImageItem.this.mCheckManager).mRenderCheckBox.setEnabled(true);
                }
            }
        };
        protected CheckBox mRenderCheckBox;
        protected ChoiceModeInterface mRenderInterface;
        protected View mSimilarBestMark;

        protected ImageCheckManager() {
            super();
        }

        /* access modifiers changed from: private */
        public boolean renderChecked() {
            return (this.mRenderInterface == null || PhotoPageImageItem.this.mDataItem == null || !this.mRenderInterface.isChecked(PhotoPageImageItem.this.mDataItem.getKey())) ? false : true;
        }

        /* access modifiers changed from: protected */
        public void dispatchInterfaces(ChoiceModeInterface... choiceModeInterfaceArr) {
            super.dispatchInterfaces(choiceModeInterfaceArr);
            this.mRenderInterface = (choiceModeInterfaceArr == null || choiceModeInterfaceArr.length <= 2) ? null : choiceModeInterfaceArr[2];
        }

        public void endCheck() {
            super.endCheck();
            this.mRenderCheckBox.setOnCheckedChangeListener(null);
            this.mRenderCheckBox.setChecked(false);
            this.mRenderCheckBox.setText(R.string.fast_share_auto_render);
            PhotoPageImageItem.this.releaseRenderer();
        }

        /* access modifiers changed from: protected */
        public void ensureInflated() {
            super.ensureInflated();
            this.mSimilarBestMark = PhotoPageImageItem.this.findViewById(R.id.similar_best_mark);
            if (PhotoPageImageItem.this.mDataItem == null || !ImageFeatureCacheManager.getInstance().shouldShowSelectionStar(PhotoPageImageItem.this.mDataItem.getKey(), false, false, PhotoPageImageItem.this.mDataItem.getBurstKeys())) {
                this.mSimilarBestMark.setVisibility(8);
            } else {
                this.mSimilarBestMark.setVisibility(0);
            }
            this.mRenderCheckBox = (CheckBox) PhotoPageImageItem.this.findViewById(R.id.check_render);
            this.mRenderCheckBox.setClickable(false);
            this.mRenderCheckBox.setFocusable(false);
        }

        public void onClick(View view) {
            if (view.getId() != R.id.check_render_layout) {
                super.onClick(view);
            } else if (PhotoPageImageItem.this.isRenderable() && this.mRenderCheckBox.isEnabled()) {
                toggleCheckBox(this.mRenderCheckBox, this.mRenderInterface);
            }
        }

        public void refreshCheck(ChoiceModeInterface... choiceModeInterfaceArr) {
            super.refreshCheck(choiceModeInterfaceArr);
            if (PhotoPageImageItem.this.mAutoRenderer != null) {
                this.mCheckRenderLayout.setOnClickListener(this);
                this.mRenderCheckBox.setOnCheckedChangeListener(this.mCheckStateListener);
                this.mRenderCheckBox.setVisibility(0);
                if (this.mRenderInterface == null || PhotoPageImageItem.this.mDataItem == null) {
                    com.miui.gallery.util.Log.d("PhotoPageImageItem", "renderInterface[%s] or data[%s] not prepared", this.mRenderInterface == null ? "NULL" : this.mRenderInterface, PhotoPageImageItem.this.mDataItem == null ? "NULL" : PhotoPageImageItem.this.mDataItem);
                } else {
                    setCheckBoxState(this.mRenderCheckBox, this.mRenderInterface.isChecked(PhotoPageImageItem.this.mDataItem.getKey()));
                }
            } else {
                this.mCheckRenderLayout.setOnClickListener(null);
                this.mRenderCheckBox.setOnCheckedChangeListener(null);
                this.mRenderCheckBox.setVisibility(8);
            }
        }

        public void startCheck(ChoiceModeInterface... choiceModeInterfaceArr) {
            PhotoPageImageItem.this.mAutoRenderer = new AutoRenderer(PhotoPageImageItem.this.getContext());
            super.startCheck(choiceModeInterfaceArr);
            this.mCheckRenderLayout.setOnClickListener(this);
        }
    }

    private class ImageProcessingManager extends AbsPhotoRectAwareManager {
        private float mAdjustX;
        private float mAdjustY;
        private Animator mAnimator;
        private CircleStrokeProgressBar mDeterminateProgress;
        private boolean mHasShowProgress;
        private ProgressBar mIndeterminateProgress;
        /* access modifiers changed from: private */
        public View mLoadingView;
        private Runnable mNextQueryRunnable;
        private ProcessingMedia mProcessingMedia;
        private QueryProgressAsyncTask mQueryTask;

        private final class QueryProgressAsyncTask extends AsyncTask<Void, Void, Integer> {
            private final Context mContext;
            private final Uri mUri;

            QueryProgressAsyncTask(Context context, Uri uri) {
                this.mContext = context;
                this.mUri = uri;
            }

            /* access modifiers changed from: protected */
            public Integer doInBackground(Void... voidArr) {
                if (isCancelled()) {
                    return null;
                }
                Cursor query = this.mContext.getContentResolver().query(this.mUri, new String[]{"progress_percentage"}, null, null, null);
                if (isCancelled()) {
                    return null;
                }
                if (query == null) {
                    if (PhotoPageImageItem.DEBUG_ENABLE) {
                        com.miui.gallery.util.Log.d("PhotoPageImageItem", "Failed to obtain cursor for: %s", (Object) this.mUri);
                    }
                    return null;
                }
                try {
                    if (query.moveToFirst()) {
                        return Integer.valueOf(query.getInt(query.getColumnIndexOrThrow("progress_percentage")));
                    }
                    if (PhotoPageImageItem.DEBUG_ENABLE) {
                        com.miui.gallery.util.Log.d("PhotoPageImageItem", "Failed to find item for: %s", (Object) this.mUri);
                    }
                    query.close();
                    return null;
                } finally {
                    query.close();
                }
            }

            /* access modifiers changed from: protected */
            public void onPostExecute(Integer num) {
                if (!isCancelled() && num != null) {
                    ImageProcessingManager.this.onProgressPercentageUpdated(this.mUri, num.intValue());
                }
            }
        }

        private ImageProcessingManager() {
            super();
        }

        private void cancelQueryTask() {
            if (this.mQueryTask != null) {
                this.mQueryTask.cancel(true);
                this.mQueryTask = null;
            }
        }

        private void doAdjustLocation(boolean z, RectF rectF, boolean z2) {
            endAnim();
            float actionBarHeight = z ? (float) PhotoPageImageItem.this.getActionBarHeight() : 0.0f;
            float f = rectF != null ? rectF.top : 0.0f;
            float width = rectF != null ? rectF.right : (float) PhotoPageImageItem.this.getWidth();
            float min = Math.min(getMaxTranslationY(), Math.max(actionBarHeight, f) + ((float) getVerticalMargin()));
            float leftInset = ((float) getLeftInset()) - Math.min(getMaxTranslationX(), Math.max(((float) PhotoPageImageItem.this.getWidth()) - width, 0.0f) + ((float) getHorizontalMargin()));
            if (this.mAdjustY != min || this.mAdjustX != leftInset) {
                this.mAdjustX = leftInset;
                this.mAdjustY = min;
                if (z2) {
                    AnimatorSet animatorSet = new AnimatorSet();
                    animatorSet.playTogether(new Animator[]{ObjectAnimator.ofFloat(this.mLoadingView, "TranslationX", new float[]{this.mLoadingView.getTranslationX(), leftInset}), ObjectAnimator.ofFloat(this.mLoadingView, "TranslationY", new float[]{this.mLoadingView.getTranslationY(), min})});
                    animatorSet.setDuration((long) getAdjustAnimDuration(z));
                    animatorSet.setInterpolator(getAdjustAnimInterpolator(z));
                    this.mAnimator = animatorSet;
                    this.mAnimator.start();
                    return;
                }
                this.mLoadingView.setTranslationY(min);
                this.mLoadingView.setTranslationX(leftInset);
            }
        }

        private void endAnim() {
            if (this.mAnimator != null && this.mAnimator.isRunning()) {
                this.mAnimator.end();
                this.mAnimator = null;
            }
        }

        /* access modifiers changed from: private */
        public void fetchNext() {
            cancelQueryTask();
            this.mQueryTask = new QueryProgressAsyncTask(PhotoPageImageItem.this.getContext(), this.mProcessingMedia.getUri());
            this.mQueryTask.execute(new Void[0]);
        }

        private Runnable getNextQueryRunnable() {
            if (this.mNextQueryRunnable == null) {
                this.mNextQueryRunnable = new Runnable() {
                    public void run() {
                        ImageProcessingManager.this.fetchNext();
                    }
                };
            }
            return this.mNextQueryRunnable;
        }

        private void hideLoading(boolean z) {
            if (this.mLoadingView != null && this.mLoadingView.getVisibility() != 8) {
                this.mLoadingView.setVisibility(8);
                this.mLoadingView.clearAnimation();
                if (z) {
                    Animation generateHideAnimation = generateHideAnimation();
                    generateHideAnimation.setAnimationListener(new AnimationListenerAdapter() {
                        public void onAnimationEnd(Animation animation) {
                            if (ImageProcessingManager.this.mLoadingView != null) {
                                ImageProcessingManager.this.mLoadingView.setVisibility(8);
                            }
                        }
                    });
                    this.mLoadingView.startAnimation(generateHideAnimation);
                    return;
                }
                this.mLoadingView.setVisibility(8);
            }
        }

        /* access modifiers changed from: private */
        public boolean isMediaInProcessing() {
            return this.mProcessingMedia != null;
        }

        /* access modifiers changed from: private */
        public void onProgressPercentageUpdated(Uri uri, int i) {
            if (PhotoPageImageItem.DEBUG_ENABLE) {
                com.miui.gallery.util.Log.d("PhotoPageImageItem", "Updating progress for: %s to: %d", uri, Integer.valueOf(i));
            }
            if (this.mDeterminateProgress != null) {
                this.mDeterminateProgress.setProgress(i);
            }
            if (i < 100) {
                ThreadManager.getMainHandler().postDelayed(getNextQueryRunnable(), 100);
            }
        }

        private void showLoading(boolean z) {
            if (needShowProcessingView()) {
                ensureInflated();
                this.mHasShowProgress = true;
                ProcessingMetadata processingMetadata = this.mProcessingMedia.getProcessingMetadata();
                if (processingMetadata != null) {
                    if (processingMetadata.getProgressStatus() == ProgressStatus.DETERMINATE) {
                        this.mIndeterminateProgress.setVisibility(8);
                        this.mDeterminateProgress.setVisibility(0);
                        this.mDeterminateProgress.setMax(100);
                        this.mDeterminateProgress.setProgress(processingMetadata.getProgressPercentage());
                        fetchNext();
                    } else {
                        this.mDeterminateProgress.setVisibility(8);
                        this.mIndeterminateProgress.setVisibility(0);
                    }
                    this.mLoadingView.clearAnimation();
                    this.mLoadingView.setVisibility(0);
                    doAdjustLocation(PhotoPageImageItem.this.isActionBarVisible(), PhotoPageImageItem.this.mPhotoView.getDisplayRect(), false);
                    if (z) {
                        this.mLoadingView.startAnimation(generateShowAnimation());
                        return;
                    }
                    return;
                }
                this.mLoadingView.setVisibility(8);
            }
        }

        private void updateProgress() {
            if (this.mProcessingMedia != null) {
                showLoading(false);
            } else {
                hideLoading(true);
            }
        }

        public void adjustLocation(boolean z, RectF rectF, boolean z2) {
            if (this.mHasShowProgress && this.mLoadingView != null && this.mLoadingView.getVisibility() == 0) {
                doAdjustLocation(z, rectF, z2);
            }
        }

        /* access modifiers changed from: protected */
        public void changeVisibilityForSpecialScene() {
            if (!needShowProcessingView()) {
                hideLoading(true);
            } else if (PhotoPageImageItem.this.isPagerSelected()) {
                updateProgress();
            }
        }

        /* access modifiers changed from: protected */
        public void ensureInflated() {
            if (this.mLoadingView == null) {
                this.mLoadingView = LayoutInflater.from(PhotoPageImageItem.this.getContext()).inflate(R.layout.photo_page_processing_progress, PhotoPageImageItem.this, false);
                LayoutParams layoutParams = new LayoutParams(-2, -2);
                layoutParams.addRule(10);
                layoutParams.addRule(11);
                this.mDeterminateProgress = (CircleStrokeProgressBar) this.mLoadingView.findViewById(R.id.determinate_progress_bar);
                this.mDeterminateProgress.setDrawablesForLevels(new int[]{R.drawable.photo_download_progress_bg}, new int[]{R.drawable.photo_download_progress_second}, (int[]) null);
                this.mDeterminateProgress.setMiddleStrokeColors(new int[]{PhotoPageImageItem.this.getResources().getColor(R.color.download_progress_shadow_color)}, (float) PhotoPageImageItem.this.getResources().getDimensionPixelSize(R.dimen.download_progress_shadow_radius_big));
                this.mDeterminateProgress.setVisibility(8);
                this.mIndeterminateProgress = (ProgressBar) this.mLoadingView.findViewById(R.id.indeterminate_progress_bar);
                this.mIndeterminateProgress.setVisibility(8);
                PhotoPageImageItem.this.addView(this.mLoadingView, layoutParams);
            }
        }

        /* access modifiers changed from: protected */
        public Animation generateHideAnimation() {
            AlphaAnimation alphaAnimation = new AlphaAnimation(1.0f, 0.0f);
            alphaAnimation.setInterpolator(new CubicEaseOutInterpolator());
            alphaAnimation.setDuration(350);
            alphaAnimation.setStartOffset(50);
            return alphaAnimation;
        }

        public ProcessingMedia getProcessingMedia() {
            return this.mProcessingMedia;
        }

        /* access modifiers changed from: protected */
        public int getVerticalMargin() {
            if (this.mMargin == 0) {
                this.mMargin = PhotoPageImageItem.this.getContext().getResources().getDimensionPixelSize(R.dimen.process_progress_margin);
            }
            return this.mMargin;
        }

        /* access modifiers changed from: protected */
        public boolean needShowProcessingView() {
            return !PhotoPageImageItem.this.isAnimEntering() && !PhotoPageImageItem.this.isAnimExiting() && isMediaInProcessing() && !isRotating() && !isDrawableDisplayInside();
        }

        public void onSelected() {
            super.onSelected();
            updateProgress();
        }

        public void onUnSelected() {
            cancelQueryTask();
            if (this.mNextQueryRunnable != null) {
                ThreadManager.getMainHandler().removeCallbacks(this.mNextQueryRunnable);
            }
            hideLoading(false);
            super.onUnSelected();
        }

        public void setProcessingMedia(ProcessingMedia processingMedia) {
            this.mProcessingMedia = processingMedia;
            if (PhotoPageImageItem.this.isPagerSelected()) {
                updateProgress();
            }
        }
    }

    private class MotionPhotoManager {
        private boolean mAutoPlay;
        private Runnable mAutoStopRunnable;
        /* access modifiers changed from: private */
        public boolean mHasPerformedLongPress;
        private boolean mHasTransition;
        private LayoutParams mLayoutParams;
        /* access modifiers changed from: private */
        public boolean mNeedHapticFeedback;
        private OnCompletionListener mOnCompletionListener;
        private OnErrorListener mOnErrorListener;
        private OnPreparedListener mOnPreparedListener;
        private CheckForLongPress mPendingCheckForLongPress;
        /* access modifiers changed from: private */
        public boolean mPendingStop;
        private boolean mPlayable;
        /* access modifiers changed from: private */
        public boolean mPressed;
        private Runnable mRemoveRunnable;
        /* access modifiers changed from: private */
        public Runnable mStartRunnable;
        /* access modifiers changed from: private */
        public boolean mStarted;
        /* access modifiers changed from: private */
        public GalleryVideoView mVideoView;

        private final class CheckForLongPress implements Runnable {
            private CheckForLongPress() {
            }

            public void run() {
                if (MotionPhotoManager.this.mPressed && PhotoPageImageItem.this.getParent() != null && !PhotoPageImageItem.this.mCheckManager.inAction() && !PhotoPageImageItem.this.mPhotoView.isGestureOperating() && PhotoPageImageItem.this.mPhotoView.getScale() >= 1.0f) {
                    MotionPhotoManager.this.performLongClick();
                    MotionPhotoManager.this.mHasPerformedLongPress = true;
                }
            }
        }

        private MotionPhotoManager() {
            this.mStarted = false;
            this.mPendingStop = false;
            this.mOnErrorListener = new OnErrorListener() {
                public boolean onError(MediaPlayer mediaPlayer, int i, int i2) {
                    com.miui.gallery.util.Log.w("PhotoPageImageItem", "MotionPhoto play error %d %d", Integer.valueOf(i), Integer.valueOf(i2));
                    MotionPhotoManager.this.removeVideoView("error");
                    return true;
                }
            };
            this.mOnCompletionListener = new OnCompletionListener() {
                public void onCompletion(MediaPlayer mediaPlayer) {
                    com.miui.gallery.util.Log.d("PhotoPageImageItem", "MotionPhoto play complete");
                    MotionPhotoManager.this.hideVideoView();
                }
            };
            this.mOnPreparedListener = new OnPreparedListener() {
                public void onPrepared(MediaPlayer mediaPlayer) {
                    com.miui.gallery.util.Log.d("PhotoPageImageItem", "MotionPhoto play prepared");
                    if (MotionPhotoManager.this.mVideoView != null && !MotionPhotoManager.this.mPendingStop) {
                        MotionPhotoManager.this.mVideoView.start();
                        MotionPhotoManager.this.mVideoView.pause();
                        PhotoPageImageItem.this.mPhotoView.setVisibility(8);
                        AlphaAnimation alphaAnimation = new AlphaAnimation(1.0f, 0.0f);
                        alphaAnimation.setStartOffset(150);
                        alphaAnimation.setDuration(500);
                        alphaAnimation.setInterpolator(new SineEaseInOutInterpolator());
                        PhotoPageImageItem.this.mPhotoView.startAnimation(alphaAnimation);
                        MotionPhotoManager.this.mVideoView.postDelayed(MotionPhotoManager.this.mStartRunnable, 150);
                    }
                }
            };
            this.mStartRunnable = new Runnable() {
                public void run() {
                    com.miui.gallery.util.Log.d("PhotoPageImageItem", "MotionPhoto start play");
                    if (MotionPhotoManager.this.mVideoView != null) {
                        MotionPhotoManager.this.mStarted = true;
                        MotionPhotoManager.this.mVideoView.start();
                        if (MotionPhotoManager.this.mNeedHapticFeedback) {
                            PhotoPageImageItem.this.performHapticFeedback(1);
                        }
                    }
                }
            };
            this.mRemoveRunnable = new Runnable() {
                public void run() {
                    com.miui.gallery.util.Log.d("PhotoPageImageItem", "MotionPhoto delayRemove");
                    MotionPhotoManager.this.removeVideoView("delayRemove");
                }
            };
            this.mAutoStopRunnable = new Runnable() {
                public void run() {
                    com.miui.gallery.util.Log.d("PhotoPageImageItem", "MotionPhoto autoStop");
                    MotionPhotoManager.this.stopPlayback();
                }
            };
        }

        private boolean addVideoView(boolean z) {
            if (!isItemValid() || isPlayRequested()) {
                return false;
            }
            com.miui.gallery.util.Log.d("PhotoPageImageItem", "MotionPhoto addVideoView");
            this.mVideoView = new GalleryVideoView(PhotoPageImageItem.this.getContext());
            PhotoPageImageItem.this.mPhotoView.setInterceptTouch(true);
            this.mNeedHapticFeedback = false;
            this.mAutoPlay = z;
            this.mStarted = false;
            if (this.mLayoutParams == null) {
                this.mLayoutParams = new LayoutParams(-1, -1);
                this.mLayoutParams.addRule(13);
            }
            this.mVideoView.setOnCompletionListener(this.mOnCompletionListener);
            this.mVideoView.setOnErrorListener(this.mOnErrorListener);
            this.mVideoView.setOnPreparedListener(this.mOnPreparedListener);
            if (z) {
                this.mVideoView.setVolume(0.0f);
                this.mVideoView.setAudioFocusRequest(0);
            } else {
                this.mVideoView.setVolume(1.0f);
                this.mVideoView.setAudioFocusRequest(2);
            }
            Drawable drawable = PhotoPageImageItem.this.mPhotoView.getDrawable();
            if (drawable != null) {
                RectF rectF = new RectF(0.0f, 0.0f, (float) PhotoPageImageItem.this.mPhotoView.getWidth(), (float) PhotoPageImageItem.this.mPhotoView.getHeight());
                RectF rectF2 = new RectF(0.0f, 0.0f, (float) drawable.getIntrinsicWidth(), (float) drawable.getIntrinsicHeight());
                Matrix displayMatrix = PhotoPageImageItem.this.mPhotoView.getDisplayMatrix();
                RectF rectF3 = new RectF(rectF2);
                displayMatrix.mapRect(rectF3);
                rectF3.setIntersect(rectF3, rectF);
                rectF3.offset(-rectF3.left, -rectF3.top);
                Matrix matrix = new Matrix();
                matrix.setRectToRect(rectF3, rectF2, ScaleToFit.FILL);
                matrix.postConcat(displayMatrix);
                matrix.postTranslate(rectF3.centerX() - rectF.centerX(), rectF3.centerY() - rectF.centerY());
                this.mVideoView.setTransform(matrix);
                this.mLayoutParams.width = (int) rectF3.width();
                this.mLayoutParams.height = (int) rectF3.height();
            } else {
                this.mVideoView.setTransform(null);
                this.mLayoutParams.width = -1;
                this.mLayoutParams.height = -1;
            }
            this.mVideoView.setVideoFilePath(PhotoPageImageItem.this.mDataItem.getOriginalPath(), PhotoPageImageItem.this.mDataItem.getMotionOffset());
            PhotoPageImageItem.this.addView(this.mVideoView, 0, this.mLayoutParams);
            if (z) {
                PhotoPageImageItem.this.mPhotoView.postDelayed(this.mAutoStopRunnable, 750);
            }
            return true;
        }

        private void checkForLongClick() {
            if (this.mPendingCheckForLongPress == null) {
                this.mPendingCheckForLongPress = new CheckForLongPress();
            }
            PhotoPageImageItem.this.postDelayed(this.mPendingCheckForLongPress, 300);
        }

        /* access modifiers changed from: private */
        public void hideVideoView() {
            com.miui.gallery.util.Log.d("PhotoPageImageItem", "MotionPhoto hideVideoView");
            AlphaAnimation alphaAnimation = new AlphaAnimation(0.0f, 1.0f);
            alphaAnimation.setDuration(500);
            alphaAnimation.setFillAfter(true);
            alphaAnimation.setInterpolator(new SineEaseInOutInterpolator());
            PhotoPageImageItem.this.mPhotoView.startAnimation(alphaAnimation);
            PhotoPageImageItem.this.mPhotoView.removeCallbacks(this.mAutoStopRunnable);
            if (this.mVideoView != null) {
                this.mVideoView.removeCallbacks(this.mRemoveRunnable);
                this.mVideoView.postDelayed(this.mRemoveRunnable, 500);
            }
        }

        private boolean isItemValid() {
            return ExtraPhotoSDK.isDeviceSupportMotionPhoto(PhotoPageImageItem.this.getContext()) && PhotoPageImageItem.this.mDataItem != null && !TextUtils.isEmpty(PhotoPageImageItem.this.mDataItem.getOriginalPath()) && PhotoPageImageItem.this.mDataItem.isMotionPhoto() && PhotoPageImageItem.this.mDataItem.getMotionOffset() > 0;
        }

        private boolean isPlayRequested() {
            return this.mVideoView != null;
        }

        /* access modifiers changed from: private */
        public void performLongClick() {
            com.miui.gallery.util.Log.d("PhotoPageImageItem", "MotionPhoto performLongClick");
            if (startPlay(false, true)) {
                GallerySamplingStatHelper.recordCountEvent("motion_photo", "motion_photo_play_press");
            }
        }

        private void removeLongPressCallback() {
            if (this.mPendingCheckForLongPress != null) {
                PhotoPageImageItem.this.removeCallbacks(this.mPendingCheckForLongPress);
            }
        }

        /* access modifiers changed from: private */
        public void removeVideoView(String str) {
            if (this.mVideoView != null) {
                com.miui.gallery.util.Log.d("PhotoPageImageItem", "MotionPhoto removeVideoView %s", (Object) str);
                this.mPendingStop = false;
                if (this.mVideoView.isPlaying()) {
                    this.mVideoView.stopPlayback();
                }
                this.mVideoView.setOnCompletionListener(null);
                this.mVideoView.setOnErrorListener(null);
                this.mVideoView.setOnPreparedListener(null);
                this.mVideoView.removeCallbacks(this.mRemoveRunnable);
                this.mVideoView.removeCallbacks(this.mStartRunnable);
                PhotoPageImageItem.this.removeView(this.mVideoView);
                this.mVideoView = null;
                PhotoPageImageItem.this.mPhotoView.clearAnimation();
                PhotoPageImageItem.this.mPhotoView.setVisibility(0);
                PhotoPageImageItem.this.mPhotoView.setInterceptTouch(false);
                PhotoPageImageItem.this.mPhotoView.removeCallbacks(this.mAutoStopRunnable);
            }
        }

        private boolean startPlay(boolean z, boolean z2) {
            boolean z3 = false;
            if (PhotoPageImageItem.this.isPaused() || this.mHasTransition || PhotoPageImageItem.this.mCheckManager.inAction() || !isItemValid()) {
                return false;
            }
            boolean z4 = true;
            if (z) {
                if (!isPlayRequested()) {
                    z3 = addVideoView(true);
                }
            } else if (this.mVideoView == null || !this.mVideoView.isPlaying()) {
                removeVideoView("MotionPhoto start play");
                boolean addVideoView = addVideoView(false);
                if (!z2 || !addVideoView) {
                    z4 = false;
                }
                this.mNeedHapticFeedback = z4;
                z3 = addVideoView;
            } else {
                com.miui.gallery.util.Log.d("PhotoPageImageItem", "MotionPhoto cancel auto stop");
                this.mVideoView.removeCallbacks(this.mAutoStopRunnable);
                this.mVideoView.setVolume(1.0f);
                this.mVideoView.requestAudioFocus(2);
                if (z2) {
                    PhotoPageImageItem.this.performHapticFeedback(1);
                }
                this.mAutoPlay = false;
                z3 = true;
            }
            return z3;
        }

        /* access modifiers changed from: private */
        public void stopPlayback() {
            com.miui.gallery.util.Log.d("PhotoPageImageItem", "MotionPhoto stopPlayback");
            if (this.mVideoView == null || !this.mVideoView.isPlaying()) {
                removeVideoView("stopPlayback");
                return;
            }
            this.mVideoView.stopPlayback();
            hideVideoView();
        }

        public void onActionBarOperationClick() {
            com.miui.gallery.util.Log.d("PhotoPageImageItem", "MotionPhoto onActionBarClick");
            if (isPlayRequested() && !this.mAutoPlay) {
                stopPlayback();
            } else if (startPlay(false, false)) {
                GallerySamplingStatHelper.recordCountEvent("motion_photo", "motion_photo_play_action_bar");
            }
        }

        public void onActivityTransition() {
            this.mHasTransition = true;
            removeVideoView("onTransition");
        }

        public void onConfigurationChanged() {
            removeVideoView("configChanged");
        }

        public void onMatrixChanged() {
            removeVideoView("matrixChanged");
        }

        public void onPageScrollDragging() {
            if (this.mVideoView != null) {
                com.miui.gallery.util.Log.d("PhotoPageImageItem", "MotionPhoto pause onDragging");
                this.mPendingStop = true;
                if (this.mVideoView.isPlaying()) {
                    this.mVideoView.pause();
                }
                PhotoPageImageItem.this.mPhotoView.removeCallbacks(this.mAutoStopRunnable);
                this.mVideoView.removeCallbacks(this.mStartRunnable);
                this.mVideoView.removeCallbacks(this.mRemoveRunnable);
            }
        }

        public void onPageScrollIdle() {
            if (this.mPendingStop && this.mVideoView != null) {
                com.miui.gallery.util.Log.d("PhotoPageImageItem", "MotionPhoto hide onIdle");
                if (this.mStarted) {
                    hideVideoView();
                } else {
                    removeVideoView("onIdle");
                }
            }
            this.mPendingStop = false;
        }

        public void onPause() {
            removeVideoView("onPause");
        }

        public void onResume() {
            this.mHasTransition = false;
        }

        public void onSelected(boolean z, boolean z2, boolean z3) {
        }

        public boolean onTouch(MotionEvent motionEvent) {
            if (motionEvent.getAction() == 0) {
                this.mPlayable = isItemValid();
            }
            if (!this.mPlayable) {
                return false;
            }
            switch (motionEvent.getAction()) {
                case 0:
                    this.mHasPerformedLongPress = false;
                    this.mPressed = true;
                    checkForLongClick();
                    return true;
                case 1:
                case 3:
                    this.mPressed = false;
                    if (this.mHasPerformedLongPress) {
                        com.miui.gallery.util.Log.d("PhotoPageImageItem", "MotionPhoto long press cancel");
                        stopPlayback();
                    }
                    this.mHasPerformedLongPress = false;
                    removeLongPressCallback();
                    break;
            }
            return true;
        }

        public void onUnSelected() {
            removeVideoView("unSelected");
        }

        public void release() {
            this.mHasTransition = false;
            removeVideoView(BuildConfig.BUILD_TYPE);
        }
    }

    public PhotoPageImageItem(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    /* access modifiers changed from: private */
    public boolean isRenderable() {
        return this.mAutoRenderer != null && (this.mPhotoView.getDrawable() instanceof BitmapDrawable);
    }

    /* access modifiers changed from: private */
    public void releaseRenderer() {
        com.miui.gallery.util.Log.d("PhotoPageImageItem", "releasing renderer");
        if (this.mAutoRenderer != null) {
            AutoRenderer autoRenderer = this.mAutoRenderer;
            this.mAutoRenderer = null;
            autoRenderer.release();
        }
    }

    private void statMaxScale() {
        GallerySamplingStatHelper.recordCountEvent("photo", "photo_item_select_count");
        if (this.mMaxScale > 1.0f) {
            HashMap hashMap = new HashMap();
            hashMap.put("maxScale", String.valueOf(this.mMaxScale));
            if (!(this.mDataItem == null || this.mDataItem.getWidth() == 0)) {
                RectF baseDisplayRect = this.mPhotoView.getBaseDisplayRect();
                if (baseDisplayRect != null) {
                    hashMap.put("maxScaleToOrigin", String.valueOf((this.mMaxScale * baseDisplayRect.width()) / ((float) this.mDataItem.getWidth())));
                }
            }
            GallerySamplingStatHelper.recordCountEvent("photo", "photo_max_scale", hashMap);
        }
    }

    public void animExit(ItemViewInfo itemViewInfo, TransitionListener transitionListener) {
        this.mMotionPhotoManager.onUnSelected();
        super.animExit(itemViewInfo, transitionListener);
        this.mImageProcessingManager.onUnSelected();
        statMaxScale();
    }

    /* access modifiers changed from: protected */
    public CheckManager createCheckManager() {
        return new ImageCheckManager();
    }

    public boolean dispatchTouchEvent(MotionEvent motionEvent) {
        return (this.mMotionPhotoManager != null && this.mMotionPhotoManager.onTouch(motionEvent)) | super.dispatchTouchEvent(motionEvent);
    }

    /* access modifiers changed from: protected */
    public void displayImage(String str, DisplayImageOptions displayImageOptions, ImageSize imageSize, ImageLoadingListener imageLoadingListener, ImageLoadingProgressListener imageLoadingProgressListener) {
        this.mPhotoView.setRegionDecodeEnable(false);
        ImageCheckManager imageCheckManager = (ImageCheckManager) this.mCheckManager;
        if (imageCheckManager == null || !imageCheckManager.renderChecked()) {
            ImageLoader.getInstance().displayImage(str, new ImageViewAware(this.mPhotoView), displayImageOptions, imageSize, imageLoadingListener, imageLoadingProgressListener);
        } else {
            ImageLoader.getInstance().displayImage(str, new ImageViewAware(this.mPhotoView), displayImageOptions, imageSize, imageCheckManager.mPostLoadListener, imageLoadingProgressListener);
        }
        if (isPagerSelected() && !this.mIsImageFirstDisplay) {
            this.mRegionManager.resetRegionDecoderIfNeeded();
        }
        this.mIsImageFirstDisplay = false;
    }

    /* access modifiers changed from: protected */
    public void doOnMatrixChanged(RectF rectF) {
        super.doOnMatrixChanged(rectF);
        this.mImageProcessingManager.onMatrixChanged(rectF);
        this.mMotionPhotoManager.onMatrixChanged();
        RectF baseDisplayRect = this.mPhotoView.getBaseDisplayRect();
        if (rectF != null && baseDisplayRect != null) {
            float width = rectF.width() / baseDisplayRect.width();
            if (width > this.mMaxScale) {
                this.mMaxScale = width;
            }
        }
    }

    /* access modifiers changed from: protected */
    public void doOnSelected(boolean z, boolean z2, boolean z3) {
        super.doOnSelected(z, z2, z3);
        this.mEchoManager.onSelected();
        this.mHigherDefinitionManager.onSelected();
        this.mImageProcessingManager.onSelected();
        this.mMotionPhotoManager.onSelected(z, z2, z3);
    }

    /* access modifiers changed from: protected */
    public void doOnUnSelected(boolean z) {
        super.doOnUnSelected(z);
        this.mEchoManager.onUnSelected();
        this.mHigherDefinitionManager.onUnSelected();
        this.mImageProcessingManager.onUnSelected();
        this.mMotionPhotoManager.onUnSelected();
        if (!z) {
            statMaxScale();
            this.mMaxScale = 1.0f;
        }
    }

    /* access modifiers changed from: protected */
    public DisplayImageOptions getCacheDisplayImageOptions(ImageLoadParams imageLoadParams, Builder builder) {
        DisplayImageOptions cacheDisplayImageOptions = super.getCacheDisplayImageOptions(imageLoadParams, builder);
        return ProcessingMediaHelper.getInstance().isMediaInProcessing(imageLoadParams.getPath()) ? ThumbConfig.appendBlurOptions(cacheDisplayImageOptions) : cacheDisplayImageOptions;
    }

    public ProcessingMedia getProcessingMedia() {
        if (this.mImageProcessingManager != null) {
            return this.mImageProcessingManager.getProcessingMedia();
        }
        return null;
    }

    /* access modifiers changed from: protected */
    public boolean isMediaInProcessing() {
        return this.mImageProcessingManager != null && this.mImageProcessingManager.isMediaInProcessing();
    }

    public void onActionBarOperationClick() {
        this.mMotionPhotoManager.onActionBarOperationClick();
    }

    public void onActionBarVisibleChanged(Boolean bool, int i) {
        super.onActionBarVisibleChanged(bool, i);
        this.mHigherDefinitionManager.onActionBarVisibleChanged(bool, i);
        this.mImageProcessingManager.adjustLocation(bool.booleanValue(), this.mPhotoView.getDisplayRect(), true);
    }

    public void onActivityTransition() {
        super.onActivityTransition();
        this.mMotionPhotoManager.onActivityTransition();
    }

    /* access modifiers changed from: protected */
    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        this.mImageProcessingManager.adjustLocation(isActionBarVisible(), this.mPhotoView.getDisplayRect(), false);
        this.mMotionPhotoManager.onConfigurationChanged();
    }

    /* access modifiers changed from: protected */
    public void onDetachedFromWindow() {
        this.mEchoManager.release();
        this.mHigherDefinitionManager.release();
        this.mMotionPhotoManager.release();
        super.onDetachedFromWindow();
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mEchoManager = new ExtraPhotoEchoManager();
        this.mHigherDefinitionManager = new HigherDefinitionManager();
        this.mImageProcessingManager = new ImageProcessingManager();
        this.mMotionPhotoManager = new MotionPhotoManager();
    }

    /* access modifiers changed from: protected */
    public void onPageScrollDragging() {
        super.onPageScrollDragging();
        this.mMotionPhotoManager.onPageScrollDragging();
    }

    /* access modifiers changed from: protected */
    public void onPageScrollIdle() {
        super.onPageScrollIdle();
        this.mMotionPhotoManager.onPageScrollIdle();
    }

    /* access modifiers changed from: protected */
    public void onPause() {
        super.onPause();
        this.mMotionPhotoManager.onPause();
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        super.onResume();
        this.mMotionPhotoManager.onResume();
    }

    public void setProcessingMedia(ProcessingMedia processingMedia) {
        super.setProcessingMedia(processingMedia);
        if (this.mImageProcessingManager != null) {
            this.mImageProcessingManager.setProcessingMedia(processingMedia);
        }
    }
}
