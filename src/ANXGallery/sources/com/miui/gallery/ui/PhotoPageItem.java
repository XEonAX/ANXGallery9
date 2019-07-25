package com.miui.gallery.ui;

import android.animation.Animator;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.RectF;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.AsyncTask;
import android.text.TextUtils;
import android.util.ArrayMap;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewStub;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.AnimationSet;
import android.view.animation.Interpolator;
import android.view.animation.ScaleAnimation;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.miui.gallery.Config.BigPhotoConfig;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.R;
import com.miui.gallery.adapter.PhotoPageAdapter;
import com.miui.gallery.adapter.PhotoPageAdapter.ChoiceModeInterface;
import com.miui.gallery.agreement.AgreementsUtils;
import com.miui.gallery.agreement.core.OnAgreementInvokedListener;
import com.miui.gallery.cloud.NetworkUtils;
import com.miui.gallery.compat.view.ViewCompat;
import com.miui.gallery.error.BaseErrorCodeTranslator;
import com.miui.gallery.error.core.ErrorActionCallback;
import com.miui.gallery.error.core.ErrorCode;
import com.miui.gallery.error.core.ErrorTip;
import com.miui.gallery.error.core.ErrorTranslateCallback;
import com.miui.gallery.model.BaseDataItem;
import com.miui.gallery.model.ImageLoadParams;
import com.miui.gallery.preference.GalleryPreferences.CTA;
import com.miui.gallery.provider.ProcessingMedia;
import com.miui.gallery.sdk.SyncStatus;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.sdk.download.assist.DownloadItemStatus;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.ui.PhotoPageFragmentBase.PhotoPageInteractionListener;
import com.miui.gallery.util.BulkDownloadHelper;
import com.miui.gallery.util.BulkDownloadHelper.BulkDownloadItem;
import com.miui.gallery.util.BulkDownloadHelper.BulkDownloadListener;
import com.miui.gallery.util.DialogUtil;
import com.miui.gallery.util.FormatUtil;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.SpecialTypeMediaUtils;
import com.miui.gallery.util.TalkBackUtil;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.util.photoview.ItemViewInfo;
import com.miui.gallery.util.photoview.TrimMemoryCallback;
import com.miui.gallery.util.uil.CloudImageLoader;
import com.miui.gallery.util.uil.CloudImageLoader.GetStatusCallBack;
import com.miui.gallery.util.uil.CloudImageLoadingListener;
import com.miui.gallery.util.uil.CloudImageLoadingProgressListener;
import com.miui.gallery.util.uil.PhotoReusedBitCache;
import com.miui.gallery.view.animation.AnimationListenerAdapter;
import com.miui.gallery.widget.CircleStrokeProgressBar;
import com.miui.gallery.widget.GalleryDialogFragment;
import com.miui.gallery.widget.slip.ISlipAnimView;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.assist.FailReason;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.assist.LoadedFrom;
import com.nostra13.universalimageloader.core.display.BitmapDisplayer;
import com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme;
import com.nostra13.universalimageloader.core.imageaware.ImageAware;
import com.nostra13.universalimageloader.core.imageaware.ImageViewAware;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;
import com.nostra13.universalimageloader.core.listener.ImageLoadingProgressListener;
import java.io.File;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import miui.view.animation.CubicEaseInInterpolator;
import miui.view.animation.CubicEaseOutInterpolator;
import uk.co.senab.photoview.PhotoView;
import uk.co.senab.photoview.PhotoViewAttacher.OnBackgroundAlphaChangedListener;
import uk.co.senab.photoview.PhotoViewAttacher.OnExitListener;
import uk.co.senab.photoview.PhotoViewAttacher.OnMatrixChangedListener;
import uk.co.senab.photoview.PhotoViewAttacher.OnRotateListener;
import uk.co.senab.photoview.PhotoViewAttacher.OnScaleChangeListener;
import uk.co.senab.photoview.PhotoViewAttacher.OnViewTapListener;

public abstract class PhotoPageItem extends RelativeLayout implements TrimMemoryCallback, ISlipAnimView, OnMatrixChangedListener {
    private static Builder sDisplayImageOptionsBuilder = null;
    private static int sMenuBarHeight = -1;
    private static int sStatusBarHeight = -1;
    private static int sStrokeColor = Integer.MIN_VALUE;
    /* access modifiers changed from: private */
    public boolean isActionBarVisible;
    /* access modifiers changed from: private */
    public boolean isAnimEntering;
    private boolean isAnimExiting;
    private boolean isCacheImageLoading;
    private boolean isInitialized;
    private boolean isPaused;
    private boolean isSelected;
    private ImageLoadParams mCacheItem;
    protected CheckManager mCheckManager;
    protected BaseDataItem mDataItem;
    protected DownloadManager mDownloadManager;
    protected EmptyView mEmptyView;
    /* access modifiers changed from: private */
    public OnImageLoadFinishListener mExternalCacheLoadCallback;
    /* access modifiers changed from: private */
    public OnImageLoadFinishListener mExternalImageLoadCallback;
    private AsyncTask mInitTask = null;
    private OnImageLoadFinishListener mInternalCacheLoadCallback;
    private OnImageLoadFinishListener mInternalImageLoadCallback;
    private boolean mIsActionBarFirstInit = true;
    private int mMemoryTrimFlags;
    protected OnPlayVideoListener mOnPlayVideoListener;
    protected PhotoPageInteractionListener mPhotoPageInteractionListener;
    protected PhotoView mPhotoView;
    private SpecialTypeManager mSpecialTypeManager;
    private TrimMemoryCallback mTrimMemoryCallback;

    protected abstract class AbsPhotoRectAwareManager implements OnRotateListener {
        private boolean isDrawableDisplayInside;
        private boolean isRotating;
        protected int mMargin;

        protected AbsPhotoRectAwareManager() {
        }

        public abstract void adjustLocation(boolean z, RectF rectF, boolean z2);

        /* access modifiers changed from: protected */
        public abstract void changeVisibilityForSpecialScene();

        /* access modifiers changed from: protected */
        public Animation generateHideAnimation() {
            AnimationSet animationSet = new AnimationSet(true);
            ScaleAnimation scaleAnimation = new ScaleAnimation(1.0f, 0.8f, 1.0f, 0.8f, 1, 0.5f, 1, 0.5f);
            AlphaAnimation alphaAnimation = new AlphaAnimation(1.0f, 0.0f);
            animationSet.addAnimation(scaleAnimation);
            animationSet.addAnimation(alphaAnimation);
            animationSet.setInterpolator(new CubicEaseOutInterpolator());
            animationSet.setDuration(200);
            return animationSet;
        }

        /* access modifiers changed from: protected */
        public Animation generateShowAnimation() {
            AnimationSet animationSet = new AnimationSet(true);
            ScaleAnimation scaleAnimation = new ScaleAnimation(0.8f, 1.0f, 0.8f, 1.0f, 1, 0.5f, 1, 0.5f);
            AlphaAnimation alphaAnimation = new AlphaAnimation(0.0f, 1.0f);
            animationSet.addAnimation(scaleAnimation);
            animationSet.addAnimation(alphaAnimation);
            animationSet.setInterpolator(new CubicEaseOutInterpolator());
            animationSet.setDuration(300);
            return animationSet;
        }

        /* access modifiers changed from: protected */
        public int getAdjustAnimDuration(boolean z) {
            return z ? 350 : 250;
        }

        /* access modifiers changed from: protected */
        public Interpolator getAdjustAnimInterpolator(boolean z) {
            return z ? new CubicEaseOutInterpolator() : new CubicEaseInInterpolator();
        }

        /* access modifiers changed from: protected */
        public int getHorizontalMargin() {
            return getVerticalMargin() + (PhotoPageItem.this.getContext().getResources().getConfiguration().orientation == 2 ? ViewCompat.getSystemWindowInsetRight(PhotoPageItem.this) : 0);
        }

        /* access modifiers changed from: protected */
        public int getLeftInset() {
            if (PhotoPageItem.this.getContext().getResources().getConfiguration().orientation == 2) {
                return ViewCompat.getSystemWindowInsetLeft(PhotoPageItem.this);
            }
            return 0;
        }

        /* access modifiers changed from: protected */
        public float getMaxTranslationX() {
            return (float) (PhotoPageItem.this.getWidth() / 2);
        }

        /* access modifiers changed from: protected */
        public float getMaxTranslationY() {
            return (float) (PhotoPageItem.this.getHeight() / 2);
        }

        /* access modifiers changed from: protected */
        public int getVerticalMargin() {
            if (this.mMargin == 0) {
                this.mMargin = PhotoPageItem.this.getContext().getResources().getDimensionPixelSize(R.dimen.download_progress_margin);
            }
            return this.mMargin;
        }

        /* access modifiers changed from: protected */
        public boolean isDrawableDisplayInside() {
            return this.isDrawableDisplayInside;
        }

        /* access modifiers changed from: protected */
        public boolean isRotating() {
            return this.isRotating;
        }

        public void onActionModeChanged(boolean z) {
            Log.d("PhotoPageItem", "onActionModeChanged %s", (Object) Boolean.valueOf(z));
            changeVisibilityForSpecialScene();
        }

        /* JADX WARNING: Removed duplicated region for block: B:10:0x0023  */
        public final void onMatrixChanged(RectF rectF) {
            boolean z;
            if (rectF != null) {
                RectF baseDisplayRect = PhotoPageItem.this.mPhotoView.getBaseDisplayRect();
                if (baseDisplayRect != null && rectF.width() + 5.0f < baseDisplayRect.width()) {
                    z = true;
                    if (z != this.isDrawableDisplayInside) {
                        this.isDrawableDisplayInside = z;
                        onScaleInsideChanged(z);
                    }
                    adjustLocation(PhotoPageItem.this.isActionBarVisible(), rectF, false);
                }
            }
            z = false;
            if (z != this.isDrawableDisplayInside) {
            }
            adjustLocation(PhotoPageItem.this.isActionBarVisible(), rectF, false);
        }

        public void onRotate(float f, float f2, float f3, float f4) {
        }

        public final void onRotateBegin(float f) {
            this.isRotating = true;
            onRotateStateChanged(this.isRotating);
        }

        public final void onRotateEnd(float f) {
            this.isRotating = false;
            onRotateStateChanged(this.isRotating);
            ArrayMap arrayMap = new ArrayMap(1);
            arrayMap.put("toDegree", String.valueOf(f));
            GallerySamplingStatHelper.recordCountEvent("photo", "manual_rotate", arrayMap);
        }

        public void onRotateStateChanged(boolean z) {
            Log.d("PhotoPageItem", "onRotateStateChanged %s", (Object) Boolean.valueOf(z));
            changeVisibilityForSpecialScene();
        }

        public void onScaleInsideChanged(boolean z) {
            Log.d("PhotoPageItem", "onScaleInsideChanged %s", (Object) Boolean.valueOf(z));
            changeVisibilityForSpecialScene();
        }

        public void onSelected() {
            PhotoPageItem.this.mPhotoView.setOnRotateListener(this);
        }

        public void onUnSelected() {
            PhotoPageItem.this.mPhotoView.setOnRotateListener(null);
        }

        public void release() {
            this.isRotating = false;
            this.isDrawableDisplayInside = false;
        }
    }

    protected class CheckManager implements OnClickListener {
        protected View mCheckOriginLayout;
        protected View mCheckRenderLayout;
        protected View mCheckRoot;
        protected CheckBox mOriginCheckBox;
        protected ChoiceModeInterface mOriginInterface;
        protected TextView mOriginText;
        protected CheckBox mSelectCheckBox;
        protected ChoiceModeInterface mSelectInterface;
        protected View mSelectLayout;
        private boolean mVisiblePending;

        protected CheckManager() {
        }

        private String formatContentDescriptionWithCheckState(CharSequence charSequence, boolean z) {
            if (charSequence == null) {
                return PhotoPageItem.this.getResources().getString(z ? R.string.checked : R.string.unchecked);
            }
            return PhotoPageItem.this.getResources().getString(z ? R.string.checked_something : R.string.unchecked_something, new Object[]{charSequence});
        }

        /* access modifiers changed from: private */
        public void relayout(RectF rectF) {
            int i;
            int i2;
            int i3;
            int i4;
            if (rectF != null && inAction()) {
                int width = PhotoPageItem.this.getWidth();
                int height = PhotoPageItem.this.getHeight();
                if (rectF.width() <= PhotoPageAdapter.getMinSlideWidth() || rectF.height() <= PhotoPageAdapter.getMinSlideHeight()) {
                    i2 = width;
                    i = height;
                    i4 = 0;
                    i3 = 0;
                } else {
                    i4 = (int) Math.max(0.0f, rectF.left);
                    i3 = (int) Math.max(0.0f, rectF.top);
                    i2 = (int) Math.min((float) PhotoPageItem.this.getWidth(), rectF.right);
                    i = (int) Math.min((float) PhotoPageItem.this.getHeight(), rectF.bottom);
                }
                ensureInflated();
                if (this.mCheckRoot.isLaidOut()) {
                    this.mCheckRoot.layout(i4, i3, i2, i);
                }
                Log.i("PhotoPageItem", "relayout l[%d], t[%d], r[%d], b[%d]  isLaidOut %s", Integer.valueOf(i4), Integer.valueOf(i3), Integer.valueOf(i2), Integer.valueOf(i), Boolean.valueOf(this.mCheckRoot.isLaidOut()));
                if (this.mCheckRoot.getVisibility() != 0 && this.mVisiblePending) {
                    this.mVisiblePending = false;
                    setCheckRootVisible(true);
                }
            }
        }

        private void setCheckRootVisible(boolean z) {
            if (z) {
                this.mCheckRoot.setVisibility(0);
            } else {
                this.mCheckRoot.setVisibility(8);
            }
        }

        /* access modifiers changed from: protected */
        public void dispatchInterfaces(ChoiceModeInterface... choiceModeInterfaceArr) {
            ChoiceModeInterface choiceModeInterface = null;
            if (choiceModeInterfaceArr != null) {
                this.mOriginInterface = choiceModeInterfaceArr.length > 0 ? choiceModeInterfaceArr[0] : null;
                if (choiceModeInterfaceArr.length > 1) {
                    choiceModeInterface = choiceModeInterfaceArr[1];
                }
                this.mSelectInterface = choiceModeInterface;
                return;
            }
            this.mOriginInterface = null;
            this.mSelectInterface = null;
        }

        public void endCheck() {
            ensureInflated();
            this.mCheckOriginLayout.setOnClickListener(null);
            this.mSelectLayout.setOnClickListener(null);
            this.mCheckRenderLayout.setOnClickListener(null);
            dispatchInterfaces(new ChoiceModeInterface[0]);
            this.mVisiblePending = false;
            if (this.mCheckRoot.getVisibility() == 0) {
                onAlphaChanged(1.0f);
                setCheckRootVisible(false);
            }
            this.mCheckRoot.setContentDescription(null);
        }

        /* access modifiers changed from: protected */
        public void ensureInflated() {
            if (this.mCheckRoot == null) {
                this.mCheckRoot = ((ViewStub) PhotoPageItem.this.findViewById(R.id.page_item_check)).inflate();
                this.mSelectLayout = this.mCheckRoot.findViewById(R.id.check_select_layout);
                this.mSelectCheckBox = (CheckBox) this.mCheckRoot.findViewById(R.id.check_select);
                this.mCheckOriginLayout = this.mCheckRoot.findViewById(R.id.check_origin_layout);
                this.mOriginText = (TextView) this.mCheckRoot.findViewById(R.id.check_origin_text);
                this.mOriginCheckBox = (CheckBox) this.mCheckRoot.findViewById(R.id.check_origin);
                this.mCheckRenderLayout = PhotoPageItem.this.findViewById(R.id.check_render_layout);
            }
        }

        public String getContentDescription() {
            if (PhotoPageItem.this.mDataItem == null || this.mSelectInterface == null) {
                return null;
            }
            return PhotoPageItem.this.getResources().getString(this.mSelectInterface.isChecked(PhotoPageItem.this.mDataItem.getKey()) ? R.string.checked_something : R.string.unchecked_something, new Object[]{PhotoPageItem.this.mDataItem.getContentDescription(PhotoPageItem.this.getContext())});
        }

        /* access modifiers changed from: protected */
        public boolean inAction() {
            return (this.mCheckRoot != null && this.mCheckRoot.getVisibility() == 0) || this.mVisiblePending;
        }

        public void onAlphaChanged(float f) {
            ensureInflated();
            this.mCheckRoot.setAlpha(f);
        }

        public void onClick(View view) {
            int id = view.getId();
            if (id != R.id.check_layout) {
                if (id == R.id.check_origin_layout) {
                    toggleCheckBox(this.mOriginCheckBox, this.mOriginInterface);
                    return;
                } else if (id != R.id.check_select_layout) {
                    return;
                }
            }
            toggleCheckBox(this.mSelectCheckBox, this.mSelectInterface);
        }

        public final void onMatrixChanged(RectF rectF) {
            relayout(rectF);
        }

        /* access modifiers changed from: protected */
        public boolean originChecked() {
            return PhotoPageItem.this.mDataItem.isVideo() || PhotoPageItem.this.mDataItem.isGif() || !TextUtils.isEmpty(PhotoPageItem.this.mDataItem.getOriginalPath());
        }

        public void refreshCheck(ChoiceModeInterface... choiceModeInterfaceArr) {
            ensureInflated();
            dispatchInterfaces(choiceModeInterfaceArr);
            if (PhotoPageItem.this.mDataItem != null) {
                this.mCheckRoot.setContentDescription(PhotoPageItem.this.getContentDescriptionForTalkBack());
                setCheckBoxState(this.mSelectCheckBox, this.mSelectInterface.isChecked(PhotoPageItem.this.mDataItem.getKey()));
                setCheckBoxState(this.mOriginCheckBox, this.mOriginInterface.isChecked(PhotoPageItem.this.mDataItem.getKey()));
                this.mOriginText.setText(PhotoPageItem.this.getResources().getString(R.string.select_origin_tip, new Object[]{FormatUtil.formatFileSize(PhotoPageItem.this.getContext(), PhotoPageItem.this.mDataItem.getSize())}));
                if (originChecked()) {
                    this.mCheckOriginLayout.setOnClickListener(null);
                    this.mCheckOriginLayout.setVisibility(8);
                    this.mOriginInterface.setChecked(((Integer) PhotoPageItem.this.getTag(R.id.tag_item_position)).intValue(), PhotoPageItem.this.mDataItem.getKey(), true);
                    return;
                }
                this.mCheckOriginLayout.setOnClickListener(this);
                this.mCheckOriginLayout.setVisibility(0);
            }
        }

        /* access modifiers changed from: protected */
        public void setCheckBoxState(CheckBox checkBox, boolean z) {
            checkBox.setChecked(z);
            int id = checkBox.getId();
            if (id == R.id.check_origin) {
                this.mCheckOriginLayout.setContentDescription(formatContentDescriptionWithCheckState(this.mOriginText.getText(), z));
            } else if (id == R.id.check_render) {
                this.mCheckRenderLayout.setContentDescription(formatContentDescriptionWithCheckState(PhotoPageItem.this.getResources().getString(R.string.fast_share_auto_render), z));
            } else if (id == R.id.check_select) {
                String formatContentDescriptionWithCheckState = formatContentDescriptionWithCheckState(PhotoPageItem.this.mDataItem.getContentDescription(PhotoPageItem.this.getContext()), z);
                this.mSelectLayout.setContentDescription(formatContentDescriptionWithCheckState);
                this.mCheckRoot.setContentDescription(formatContentDescriptionWithCheckState);
            }
        }

        public void startCheck(ChoiceModeInterface... choiceModeInterfaceArr) {
            ensureInflated();
            this.mCheckRoot.setOnClickListener(this);
            this.mSelectLayout.setOnClickListener(this);
            this.mCheckOriginLayout.setOnClickListener(this);
            if (this.mCheckRoot.getVisibility() != 0) {
                if (PhotoPageItem.this.mPhotoView.getDisplayRect() == null) {
                    this.mVisiblePending = true;
                } else {
                    setCheckRootVisible(true);
                    relayout(PhotoPageItem.this.mPhotoView.getDisplayRect());
                }
            }
            refreshCheck(choiceModeInterfaceArr);
        }

        /* access modifiers changed from: protected */
        public void toggleCheckBox(CheckBox checkBox, ChoiceModeInterface choiceModeInterface) {
            if (PhotoPageItem.this.mDataItem != null) {
                boolean isChecked = checkBox.isChecked();
                if (choiceModeInterface != null) {
                    choiceModeInterface.onItemCheckedChanged(((Integer) PhotoPageItem.this.getTag(R.id.tag_item_position)).intValue(), PhotoPageItem.this.mDataItem.getKey(), !isChecked);
                }
                setCheckBoxState(checkBox, !isChecked);
                TalkBackUtil.requestAnnouncementEvent(checkBox, PhotoPageItem.this.getResources().getString(!isChecked ? R.string.checked : R.string.unchecked));
            }
        }
    }

    protected class DownloadManager extends AbsPhotoRectAwareManager {
        private boolean isUserDownload;
        private float mAdjustX;
        private float mAdjustY;
        private Animator mAnimator;
        PhotoItemBulkDownloadListener mBulkDownloadListener = new PhotoItemBulkDownloadListener();
        private View mDownloadError;
        private ProgressBar mDownloadProgress;
        private View mDownloadRoot;
        /* access modifiers changed from: private */
        public DownloadType mDownloadingType;
        /* access modifiers changed from: private */
        public DownloadErrorDisplayer mErrorDisplayer;
        /* access modifiers changed from: private */
        public CloudImageLoadingListener mExternalListener;
        private boolean mHasShowError;
        private boolean mHasShowProgress;
        /* access modifiers changed from: private */
        public CloudImageLoadingListener mLoadingListener = new CloudImageLoadingListener() {
            public void onDownloadComplete(Uri uri, DownloadType downloadType, View view, String str) {
                DownloadManager.this.onDownloaded(downloadType, str);
                if (DownloadManager.this.mExternalListener != null) {
                    DownloadManager.this.mExternalListener.onDownloadComplete(uri, downloadType, view, str);
                }
            }

            public void onLoadingCancelled(Uri uri, DownloadType downloadType, View view) {
                DownloadManager.this.onCancel(downloadType);
                if (DownloadManager.this.mExternalListener != null) {
                    DownloadManager.this.mExternalListener.onLoadingCancelled(uri, downloadType, view);
                }
            }

            public void onLoadingComplete(Uri uri, DownloadType downloadType, View view, Bitmap bitmap) {
                DownloadManager.this.onLoaded(downloadType, bitmap);
                if (DownloadManager.this.mExternalListener != null) {
                    DownloadManager.this.mExternalListener.onLoadingComplete(uri, downloadType, view, bitmap);
                }
            }

            public void onLoadingFailed(Uri uri, DownloadType downloadType, View view, ErrorCode errorCode) {
                DownloadManager.this.onLoadFail(downloadType, errorCode);
                if (DownloadManager.this.mExternalListener != null) {
                    DownloadManager.this.mExternalListener.onLoadingFailed(uri, downloadType, view, errorCode);
                }
            }

            public void onLoadingStarted(Uri uri, DownloadType downloadType, View view) {
                DownloadManager.this.onLoadStart(downloadType);
                if (DownloadManager.this.mExternalListener != null) {
                    DownloadManager.this.mExternalListener.onLoadingStarted(uri, downloadType, view);
                }
            }
        };
        /* access modifiers changed from: private */
        public CloudImageLoadingProgressListener mProgressListener = new CloudImageLoadingProgressListener() {
            public void onProgressUpdate(Uri uri, DownloadType downloadType, View view, int i, int i2) {
                DownloadManager.this.onDownloading(downloadType, (((float) i) * 1.0f) / ((float) i2));
            }
        };

        protected class DownloadErrorDisplayer implements ErrorActionCallback, ErrorTranslateCallback {
            private GalleryDialogFragment mErrorDialog;
            private ErrorTip mErrorTip;
            private BaseErrorCodeTranslator mErrorTranslator = new BaseErrorCodeTranslator();

            public DownloadErrorDisplayer() {
            }

            public boolean display(Context context) {
                return display(context, this.mErrorTip);
            }

            public final boolean display(final Context context, final ErrorTip errorTip) {
                if (errorTip == null) {
                    return false;
                }
                if (this.mErrorDialog != null) {
                    this.mErrorDialog.dismissAllowingStateLoss();
                    this.mErrorDialog = null;
                }
                if (errorTip.getCode() == ErrorCode.NO_CTA_PERMISSION) {
                    AgreementsUtils.showNetworkingAgreement((Activity) context, new OnAgreementInvokedListener() {
                        public void onAgreementInvoked(boolean z) {
                            if (z) {
                                DownloadErrorDisplayer.this.onAction(ErrorCode.NO_CTA_PERMISSION, false);
                            }
                        }
                    });
                } else if (!TextUtils.isEmpty(errorTip.getActionStr(context))) {
                    this.mErrorDialog = new AlertDialogFragment.Builder().setTitle(errorTip.getTitle(context)).setMessage(errorTip.getMessage(context)).setNegativeButton(PhotoPageItem.this.getResources().getString(R.string.cancel), new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialogInterface, int i) {
                            dialogInterface.cancel();
                        }
                    }).setPositiveButton(errorTip.getActionStr(context), new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialogInterface, int i) {
                            errorTip.action(context, DownloadErrorDisplayer.this);
                        }
                    }).create();
                } else {
                    ToastUtils.makeText(context, errorTip.getTitle(context));
                }
                if (this.mErrorDialog != null) {
                    this.mErrorDialog.showAllowingStateLoss(((Activity) context).getFragmentManager(), "error");
                }
                DownloadManager.this.statClickError(DownloadManager.this.mDownloadingType, errorTip);
                return true;
            }

            public void handleError(ErrorCode errorCode) {
                this.mErrorTranslator.translate(PhotoPageItem.this.getContext(), errorCode, this);
            }

            public void onAction(ErrorCode errorCode, boolean z) {
                if (!z) {
                    switch (errorCode) {
                        case THUMBNAIL_BUILD_ERROR:
                        case WRITE_EXIF_ERROR:
                            DownloadManager.this.downloadOrigin();
                            break;
                        case NO_WIFI_CONNECTED:
                            DownloadManager.this.downloadOrigin(DownloadType.ORIGIN_FORCE);
                            break;
                        case NO_CTA_PERMISSION:
                            if (CTA.canConnectNetwork()) {
                                DownloadManager.this.processDownload();
                                break;
                            }
                            break;
                    }
                }
                DownloadManager.this.statActionError(DownloadManager.this.mDownloadingType, this.mErrorTip);
            }

            public void onTranslate(ErrorTip errorTip) {
                this.mErrorTip = errorTip;
            }
        }

        class PhotoItemBulkDownloadListener implements BulkDownloadListener {
            public DownloadType mDownloadType = DownloadType.ORIGIN;

            PhotoItemBulkDownloadListener() {
            }

            public void onDownloadEnd(List<BulkDownloadItem> list, List<BulkDownloadItem> list2) {
                boolean z;
                boolean z2;
                if (PhotoPageItem.this.mDataItem != null) {
                    List burstGroup = PhotoPageItem.this.mDataItem.getBurstGroup();
                    if (!MiscUtil.isValid(burstGroup)) {
                        DownloadManager.this.onDownloaded(DownloadManager.this.mDownloadingType);
                        if (DownloadManager.this.mExternalListener != null) {
                            DownloadManager.this.mExternalListener.onDownloadComplete(null, this.mDownloadType, null, null);
                        }
                        return;
                    }
                    if (MiscUtil.isValid(list)) {
                        Iterator it = burstGroup.iterator();
                        loop0:
                        while (true) {
                            z = true;
                            while (true) {
                                if (!it.hasNext()) {
                                    break loop0;
                                }
                                BaseDataItem baseDataItem = (BaseDataItem) it.next();
                                if (TextUtils.isEmpty(baseDataItem.getOriginalPath())) {
                                    Iterator it2 = list.iterator();
                                    while (true) {
                                        if (!it2.hasNext()) {
                                            z2 = false;
                                            break;
                                        }
                                        BulkDownloadItem bulkDownloadItem = (BulkDownloadItem) it2.next();
                                        if (baseDataItem.getDownloadUri().equals(bulkDownloadItem.getDownloadUri())) {
                                            if (CloudImageLoader.getInstance().isOrigin(bulkDownloadItem.getType())) {
                                                baseDataItem.setFilePath(bulkDownloadItem.getDownloadPath());
                                            } else {
                                                baseDataItem.setThumbPath(bulkDownloadItem.getDownloadPath());
                                            }
                                            z2 = true;
                                        }
                                    }
                                    if (!z || !z2) {
                                        z = false;
                                    }
                                }
                            }
                        }
                    } else {
                        z = false;
                    }
                    if (!z && MiscUtil.isValid(list2)) {
                        BulkDownloadItem bulkDownloadItem2 = (BulkDownloadItem) list2.get(0);
                        DownloadManager.this.onLoadFail(this.mDownloadType, bulkDownloadItem2.getErrorCode());
                        if (DownloadManager.this.mExternalListener != null) {
                            DownloadManager.this.mExternalListener.onLoadingFailed(null, this.mDownloadType, null, bulkDownloadItem2.getErrorCode());
                        }
                    } else if (z) {
                        DownloadManager.this.onDownloaded(DownloadManager.this.mDownloadingType);
                        if (DownloadManager.this.mExternalListener != null) {
                            DownloadManager.this.mExternalListener.onDownloadComplete(null, this.mDownloadType, null, null);
                        }
                    }
                }
            }

            public void onDownloadProgress(float f) {
                DownloadManager.this.onDownloading(this.mDownloadType, f);
            }

            public void setDownloadType(DownloadType downloadType) {
                this.mDownloadType = downloadType;
            }
        }

        protected DownloadManager() {
            super();
        }

        private void cancelAnim() {
            if (this.mAnimator != null && this.mAnimator.isRunning()) {
                this.mAnimator.cancel();
                this.mAnimator = null;
                this.mAdjustX = this.mDownloadRoot.getTranslationX();
                this.mAdjustY = this.mDownloadRoot.getTranslationY();
            }
        }

        private void doAdjustLocation(boolean z, RectF rectF, boolean z2) {
            cancelAnim();
            float min = 0.0f - Math.min(getMaxTranslationY(), Math.max(z ? (float) PhotoPageItem.this.getMenuBarHeight() : 0.0f, ((float) PhotoPageItem.this.getHeight()) - (rectF != null ? rectF.bottom : (float) PhotoPageItem.this.getHeight())) + ((float) getVerticalMargin()));
            float leftInset = ((float) getLeftInset()) - Math.min(getMaxTranslationX(), Math.max(((float) PhotoPageItem.this.getWidth()) - (rectF != null ? rectF.right : (float) PhotoPageItem.this.getWidth()), 0.0f) + ((float) getHorizontalMargin()));
            if (this.mAdjustY != min || this.mAdjustX != leftInset) {
                this.mAdjustX = leftInset;
                this.mAdjustY = min;
                if (z2) {
                    AnimatorSet animatorSet = new AnimatorSet();
                    animatorSet.playTogether(new Animator[]{ObjectAnimator.ofFloat(this.mDownloadRoot, "TranslationX", new float[]{this.mDownloadRoot.getTranslationX(), leftInset}), ObjectAnimator.ofFloat(this.mDownloadRoot, "TranslationY", new float[]{this.mDownloadRoot.getTranslationY(), min})});
                    animatorSet.setDuration((long) getAdjustAnimDuration(z));
                    animatorSet.setInterpolator(getAdjustAnimInterpolator(z));
                    this.mAnimator = animatorSet;
                    this.mAnimator.start();
                    return;
                }
                this.mDownloadRoot.setTranslationY(min);
                this.mDownloadRoot.setTranslationX(leftInset);
            }
        }

        /* access modifiers changed from: private */
        public boolean hideErrorView(boolean z) {
            if (this.mHasShowError) {
                View errorView = getErrorView();
                if (!(errorView == null || errorView.getVisibility() == 8)) {
                    errorView.clearAnimation();
                    if (z) {
                        Animation generateHideAnimation = generateHideAnimation();
                        generateHideAnimation.setAnimationListener(new AnimationListenerAdapter() {
                            public void onAnimationEnd(Animation animation) {
                                View errorView = DownloadManager.this.getErrorView();
                                if (errorView != null) {
                                    errorView.setVisibility(8);
                                }
                            }
                        });
                        errorView.startAnimation(generateHideAnimation);
                    } else {
                        errorView.setVisibility(8);
                    }
                    return true;
                }
            }
            return false;
        }

        private boolean hideProgress(boolean z) {
            if (this.mHasShowProgress) {
                ProgressBar progressBar = getProgressBar();
                if (!(progressBar == null || progressBar.getVisibility() == 8)) {
                    progressBar.clearAnimation();
                    if (z) {
                        Animation generateHideAnimation = generateHideAnimation();
                        generateHideAnimation.setAnimationListener(new AnimationListenerAdapter() {
                            public void onAnimationEnd(Animation animation) {
                                ProgressBar progressBar = DownloadManager.this.getProgressBar();
                                if (progressBar != null) {
                                    progressBar.setVisibility(8);
                                    DownloadManager.this.doOnProgressVisibilityChanged(false);
                                }
                            }
                        });
                        progressBar.startAnimation(generateHideAnimation);
                    } else {
                        progressBar.setVisibility(8);
                        doOnProgressVisibilityChanged(false);
                    }
                    return true;
                }
            }
            return false;
        }

        private void initDownloadLayout() {
            this.mDownloadRoot = LayoutInflater.from(PhotoPageItem.this.getContext()).inflate(R.layout.photo_page_download_progress, PhotoPageItem.this, false);
            LayoutParams layoutParams = new LayoutParams(-2, -2);
            layoutParams.addRule(11);
            layoutParams.addRule(12);
            PhotoPageItem.this.addView(this.mDownloadRoot, layoutParams);
        }

        private View initErrorView() {
            if (this.mDownloadRoot == null) {
                initDownloadLayout();
            }
            View findViewById = this.mDownloadRoot.findViewById(R.id.download_error);
            findViewById.setVisibility(8);
            findViewById.setOnClickListener(new OnClickListener() {
                public void onClick(View view) {
                    if (DownloadManager.this.mErrorDisplayer != null) {
                        DownloadManager.this.mErrorDisplayer.display(PhotoPageItem.this.getContext());
                    }
                }
            });
            return findViewById;
        }

        private ProgressBar initProgressBar() {
            if (this.mDownloadRoot == null) {
                initDownloadLayout();
            }
            CircleStrokeProgressBar circleStrokeProgressBar = (CircleStrokeProgressBar) this.mDownloadRoot.findViewById(R.id.download_progress);
            circleStrokeProgressBar.setDrawablesForLevels(new int[]{R.drawable.photo_download_progress_bg}, new int[]{R.drawable.photo_download_progress_second}, (int[]) null);
            circleStrokeProgressBar.setMiddleStrokeColors(new int[]{PhotoPageItem.this.getResources().getColor(R.color.download_progress_shadow_color)}, (float) PhotoPageItem.this.getResources().getDimensionPixelSize(R.dimen.download_progress_shadow_radius_big));
            circleStrokeProgressBar.setVisibility(8);
            return circleStrokeProgressBar;
        }

        private boolean isOriginDownloaded() {
            if (!PhotoPageItem.this.mDataItem.isBurstItem()) {
                return !TextUtils.isEmpty(PhotoPageItem.this.mDataItem.getOriginalPath());
            }
            for (BaseDataItem originalPath : PhotoPageItem.this.mDataItem.getBurstGroup()) {
                if (TextUtils.isEmpty(originalPath.getOriginalPath())) {
                    return false;
                }
            }
            return true;
        }

        private boolean isOriginRequestForce() {
            if (PhotoPageItem.this.mDataItem == null) {
                return false;
            }
            if (CloudImageLoader.getInstance().isRequesting(PhotoPageItem.this.mDataItem.getDownloadUri(), DownloadType.ORIGIN_FORCE)) {
                return true;
            }
            List<BaseDataItem> burstGroup = PhotoPageItem.this.mDataItem.getBurstGroup();
            if (MiscUtil.isValid(burstGroup)) {
                for (BaseDataItem downloadUri : burstGroup) {
                    if (CloudImageLoader.getInstance().isRequesting(downloadUri.getDownloadUri(), DownloadType.ORIGIN_FORCE)) {
                        return true;
                    }
                }
            }
            return false;
        }

        /* access modifiers changed from: private */
        public boolean needRefreshUI(DownloadType downloadType) {
            return PhotoPageItem.this.mDataItem != null && PhotoPageItem.this.isPagerSelected() && downloadType == this.mDownloadingType;
        }

        /* access modifiers changed from: private */
        public void onCancel(DownloadType downloadType) {
            if (needRefreshUI(downloadType)) {
                hideProgress(true);
            }
            this.isUserDownload = false;
            doOnCancel(downloadType);
        }

        /* access modifiers changed from: private */
        public void onDownloaded(DownloadType downloadType) {
            if (needRefreshUI(downloadType)) {
                hideProgress(true);
            }
        }

        /* access modifiers changed from: private */
        public void onDownloaded(DownloadType downloadType, String str) {
            if (PhotoPageItem.this.mDataItem != null) {
                if (CloudImageLoader.getInstance().isOrigin(downloadType)) {
                    PhotoPageItem.this.mDataItem.setFilePath(str);
                } else {
                    PhotoPageItem.this.mDataItem.setThumbPath(str);
                }
            }
            if (needRefreshUI(downloadType)) {
                hideProgress(true);
            }
            doOnDownloaded(downloadType, str);
        }

        /* access modifiers changed from: private */
        public void onDownloading(DownloadType downloadType, float f) {
            if (needRefreshUI(downloadType)) {
                setProgress(f);
            }
            doOnDownloading(downloadType, f);
        }

        /* access modifiers changed from: private */
        public void onLoadFail(DownloadType downloadType, ErrorCode errorCode) {
            if (needRefreshUI(downloadType) && !filterError(errorCode)) {
                if (this.mErrorDisplayer == null) {
                    this.mErrorDisplayer = createErrorDisplayer();
                }
                this.mErrorDisplayer.handleError(errorCode);
                showErrorView(true);
                statShowError(downloadType, errorCode);
            }
            this.isUserDownload = false;
            doOnLoadFail(downloadType, errorCode);
            PhotoPageItem.this.onImageLoadFinish(errorCode);
        }

        /* access modifiers changed from: private */
        public void onLoadStart(DownloadType downloadType) {
            doOnLoadStart(downloadType);
        }

        /* access modifiers changed from: private */
        public void onLoaded(DownloadType downloadType, Bitmap bitmap) {
            this.isUserDownload = false;
            doOnLoaded(downloadType, bitmap);
            PhotoPageItem.this.onImageLoadFinish(ErrorCode.NO_ERROR);
        }

        /* access modifiers changed from: private */
        public void processThumbnail() {
            if (PhotoPageItem.this.mDataItem == null || !TextUtils.isEmpty(PhotoPageItem.this.mDataItem.getThumnailPath()) || !TextUtils.isEmpty(PhotoPageItem.this.mDataItem.getOriginalPath())) {
                hideProgress(false);
                hideErrorView(false);
                this.mDownloadingType = null;
                return;
            }
            CloudImageLoader.getInstance().getStatusAsync(PhotoPageItem.this.mDataItem.getDownloadUri(), DownloadType.THUMBNAIL, new GetStatusCallBack() {
                public void onStatusGotten(DownloadItemStatus downloadItemStatus) {
                    if (!DownloadManager.this.needRefreshUI(DownloadManager.this.mDownloadingType)) {
                        return;
                    }
                    if (downloadItemStatus.getStatus() == SyncStatus.STATUS_SUCCESS) {
                        PhotoPageItem.this.mDataItem.setThumbPath(downloadItemStatus.getDownloadedPath());
                        PhotoPageItem.this.swapItem(PhotoPageItem.this.mDataItem);
                        return;
                    }
                    DownloadManager.this.mDownloadingType = DownloadType.THUMBNAIL;
                    DownloadManager.this.hideErrorView(false);
                    DownloadManager.this.showProgress(true);
                    CloudImageLoader.getInstance().displayImage(PhotoPageItem.this.mDataItem.getDownloadUri(), DownloadManager.this.mDownloadingType, PhotoPageItem.this.mPhotoView, PhotoPageItem.this.getDisplayImageOptions(PhotoPageItem.this.mDataItem, false), PhotoPageItem.this.mDataItem.getBigPhotoImageSize(), DownloadManager.this.mLoadingListener, DownloadManager.this.mProgressListener);
                }
            });
        }

        private void setProgress(float f) {
            ProgressBar progressBar = getProgressBar();
            if (progressBar != null && f >= 0.0f && f <= 1.0f) {
                progressBar.setProgress((int) (f * ((float) progressBar.getMax())));
            }
        }

        private boolean showErrorView(boolean z) {
            if (needShowDownloadView()) {
                this.mHasShowError = true;
                View errorView = getErrorView();
                if (!(errorView == null || errorView.getVisibility() == 0)) {
                    hideProgress(false);
                    errorView.clearAnimation();
                    errorView.setVisibility(0);
                    adjustErrorViewLocation(PhotoPageItem.this.isActionBarVisible(), PhotoPageItem.this.mPhotoView.getDisplayRect(), false);
                    if (z) {
                        errorView.startAnimation(generateShowAnimation());
                    }
                    if (this.isUserDownload) {
                        CharSequence errorTip = getErrorTip();
                        if (!TextUtils.isEmpty(errorTip)) {
                            ToastUtils.makeText(PhotoPageItem.this.getContext(), errorTip);
                        }
                    }
                    return true;
                }
            }
            return false;
        }

        /* access modifiers changed from: private */
        public boolean showProgress(boolean z) {
            if (needShowDownloadView()) {
                this.mHasShowProgress = true;
                ProgressBar progressBar = getProgressBar();
                if (!(progressBar == null || progressBar.getVisibility() == 0)) {
                    setProgress(0.0f);
                    hideErrorView(false);
                    progressBar.clearAnimation();
                    progressBar.setVisibility(0);
                    adjustProgressBarLocation(PhotoPageItem.this.isActionBarVisible(), PhotoPageItem.this.mPhotoView.getDisplayRect(), false);
                    if (z) {
                        progressBar.startAnimation(generateShowAnimation());
                    }
                    doOnProgressVisibilityChanged(true);
                    return true;
                }
            }
            return false;
        }

        /* access modifiers changed from: private */
        public void statActionError(DownloadType downloadType, ErrorTip errorTip) {
            HashMap hashMap = new HashMap();
            hashMap.put("errorTip", errorTip.toString());
            GallerySamplingStatHelper.recordCountEvent("photo", String.format(Locale.US, "photo_download_click_error_action_%s", new Object[]{downloadType}), hashMap);
        }

        /* access modifiers changed from: private */
        public void statClickError(DownloadType downloadType, ErrorTip errorTip) {
            HashMap hashMap = new HashMap();
            hashMap.put("errorTip", errorTip.toString());
            GallerySamplingStatHelper.recordCountEvent("photo", String.format(Locale.US, "photo_download_click_error_%s", new Object[]{downloadType}), hashMap);
        }

        private void statShowError(DownloadType downloadType, ErrorCode errorCode) {
            HashMap hashMap = new HashMap();
            hashMap.put("errorcode", errorCode.toString());
            GallerySamplingStatHelper.recordCountEvent("photo", String.format(Locale.US, "photo_download_show_error_%s", new Object[]{downloadType}), hashMap);
        }

        /* access modifiers changed from: protected */
        public void adjustErrorViewLocation(boolean z, RectF rectF, boolean z2) {
            if (this.mHasShowError) {
                View errorView = getErrorView();
                if (errorView != null && errorView.getVisibility() == 0) {
                    doAdjustLocation(z, rectF, z2);
                }
            }
        }

        public final void adjustLocation(boolean z, RectF rectF, boolean z2) {
            adjustProgressBarLocation(z, rectF, z2);
            adjustErrorViewLocation(z, rectF, z2);
        }

        /* access modifiers changed from: protected */
        public void adjustProgressBarLocation(boolean z, RectF rectF, boolean z2) {
            if (this.mHasShowProgress) {
                ProgressBar progressBar = getProgressBar();
                if (progressBar != null && progressBar.getVisibility() == 0) {
                    doAdjustLocation(z, rectF, z2);
                }
            }
        }

        /* access modifiers changed from: protected */
        public void changeVisibilityForSpecialScene() {
            if (!needShowDownloadView()) {
                hideProgress(true);
                hideErrorView(true);
            } else if (PhotoPageItem.this.isPagerSelected()) {
                processDownload();
            }
        }

        /* access modifiers changed from: protected */
        public DownloadErrorDisplayer createErrorDisplayer() {
            return new DownloadErrorDisplayer();
        }

        /* access modifiers changed from: protected */
        public void doOnCancel(DownloadType downloadType) {
        }

        /* access modifiers changed from: protected */
        public void doOnDownloaded(DownloadType downloadType, String str) {
        }

        /* access modifiers changed from: protected */
        public void doOnDownloading(DownloadType downloadType, float f) {
        }

        /* access modifiers changed from: protected */
        public void doOnLoadFail(DownloadType downloadType, ErrorCode errorCode) {
        }

        /* access modifiers changed from: protected */
        public void doOnLoadStart(DownloadType downloadType) {
        }

        /* access modifiers changed from: protected */
        public void doOnLoaded(DownloadType downloadType, Bitmap bitmap) {
        }

        /* access modifiers changed from: protected */
        public void doOnProgressVisibilityChanged(boolean z) {
        }

        public void downloadOrigin() {
            if (PhotoPageItem.this.mDataItem == null) {
                Log.w("PhotoPageItem", "data is null while downloading original file");
                return;
            }
            this.isUserDownload = true;
            if (NetworkUtils.isActiveNetworkMetered()) {
                DialogUtil.showInfoDialog(PhotoPageItem.this.getContext(), PhotoPageItem.this.getResources().getString(R.string.download_with_metered_network_msg), PhotoPageItem.this.getResources().getString(R.string.download_with_metered_network_title), 17039370, 17039360, (DialogInterface.OnClickListener) new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        DownloadManager.this.downloadOrigin(DownloadType.ORIGIN_FORCE);
                    }
                }, (DialogInterface.OnClickListener) new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        dialogInterface.cancel();
                    }
                });
            } else {
                downloadOrigin(DownloadType.ORIGIN);
            }
        }

        public void downloadOrigin(DownloadType downloadType) {
            if (PhotoPageItem.this.mDataItem != null) {
                hideProgress(false);
                hideErrorView(false);
                CloudImageLoader.getInstance().cancel(PhotoPageItem.this.mDataItem.getDownloadUri(), DownloadType.THUMBNAIL);
                this.mDownloadingType = downloadType;
                showProgress(true);
                if (PhotoPageItem.this.mDataItem.isBurstItem()) {
                    List<BaseDataItem> burstGroup = PhotoPageItem.this.mDataItem.getBurstGroup();
                    ArrayList arrayList = new ArrayList();
                    for (BaseDataItem baseDataItem : burstGroup) {
                        if (TextUtils.isEmpty(baseDataItem.getOriginalPath())) {
                            arrayList.add(new BulkDownloadItem(baseDataItem.getDownloadUri(), this.mDownloadingType, PhotoPageItem.this.mDataItem.getSize()));
                        }
                    }
                    if (MiscUtil.isValid(arrayList)) {
                        if (this.mExternalListener != null) {
                            this.mExternalListener.onLoadingStarted(null, downloadType, null);
                        }
                        this.mBulkDownloadListener.setDownloadType(downloadType);
                        new BulkDownloadHelper().download(arrayList, true, this.mBulkDownloadListener);
                        return;
                    }
                    return;
                }
                CloudImageLoader.getInstance().displayImage(PhotoPageItem.this.mDataItem.getDownloadUri(), this.mDownloadingType, PhotoPageItem.this.mPhotoView, new Builder().cloneFrom(PhotoPageItem.this.getDisplayImageOptions(PhotoPageItem.this.mDataItem, false)).setManual(true).build(), PhotoPageItem.this.mDataItem.getBigPhotoImageSize(), this.mLoadingListener, this.mProgressListener);
            }
        }

        /* access modifiers changed from: protected */
        public boolean filterError(ErrorCode errorCode) {
            return false;
        }

        /* access modifiers changed from: protected */
        public final DownloadType getCurDownloadType() {
            return this.mDownloadingType;
        }

        /* access modifiers changed from: protected */
        public CharSequence getErrorTip() {
            return null;
        }

        /* access modifiers changed from: protected */
        public View getErrorView() {
            if (this.mDownloadError == null) {
                this.mDownloadError = initErrorView();
            }
            return this.mDownloadError;
        }

        /* access modifiers changed from: protected */
        public ProgressBar getProgressBar() {
            if (this.mDownloadProgress == null) {
                this.mDownloadProgress = initProgressBar();
            }
            return this.mDownloadProgress;
        }

        /* access modifiers changed from: protected */
        public boolean needShowDownloadView() {
            return !PhotoPageItem.this.isInActionMode() && !isRotating() && !isDrawableDisplayInside();
        }

        public void onSelected() {
            super.onSelected();
            processDownload();
        }

        public void onUnSelected() {
            hideProgress(false);
            hideErrorView(false);
            super.onUnSelected();
        }

        /* access modifiers changed from: protected */
        public void processDownload() {
            if (!(PhotoPageItem.this.mDataItem == null || PhotoPageItem.this.mDataItem.getDownloadUri() == null || isOriginDownloaded())) {
                final DownloadType downloadType = isOriginRequestForce() ? DownloadType.ORIGIN_FORCE : DownloadType.ORIGIN;
                if (downloadType == DownloadType.ORIGIN_FORCE || CloudImageLoader.getInstance().isRequesting(PhotoPageItem.this.mDataItem.getDownloadUri(), downloadType) || (PhotoPageItem.this.mDataItem.isBurstItem() && this.mDownloadingType == DownloadType.ORIGIN)) {
                    downloadOrigin(downloadType);
                    if (this.mExternalListener != null) {
                        this.mExternalListener.onLoadingStarted(PhotoPageItem.this.mDataItem.getDownloadUri(), downloadType, PhotoPageItem.this.mPhotoView);
                    }
                } else if (TextUtils.isEmpty(PhotoPageItem.this.mDataItem.getOriginalPath())) {
                    CloudImageLoader.getInstance().getStatusAsync(PhotoPageItem.this.mDataItem.getDownloadUri(), downloadType, new GetStatusCallBack() {
                        public void onStatusGotten(DownloadItemStatus downloadItemStatus) {
                            if (!DownloadManager.this.needRefreshUI(DownloadManager.this.mDownloadingType)) {
                                return;
                            }
                            if (downloadItemStatus.isDownloading()) {
                                DownloadManager.this.downloadOrigin(downloadType);
                                if (DownloadManager.this.mExternalListener != null) {
                                    DownloadManager.this.mExternalListener.onLoadingStarted(PhotoPageItem.this.mDataItem.getDownloadUri(), downloadType, PhotoPageItem.this.mPhotoView);
                                }
                            } else if (downloadItemStatus.getStatus() == SyncStatus.STATUS_SUCCESS) {
                                PhotoPageItem.this.mDataItem.setFilePath(downloadItemStatus.getDownloadedPath());
                                PhotoPageItem.this.swapItem(PhotoPageItem.this.mDataItem);
                                if (DownloadManager.this.mExternalListener != null) {
                                    DownloadManager.this.mExternalListener.onDownloadComplete(PhotoPageItem.this.mDataItem.getDownloadUri(), downloadType, PhotoPageItem.this.mPhotoView, downloadItemStatus.getDownloadedPath());
                                }
                            } else {
                                DownloadManager.this.processThumbnail();
                            }
                        }
                    });
                }
            }
        }

        public void release() {
            onUnSelected();
            super.release();
            this.mDownloadingType = null;
            this.mExternalListener = null;
            this.mAdjustX = 0.0f;
            this.mAdjustY = 0.0f;
            this.mHasShowProgress = false;
            this.mHasShowError = false;
            this.mErrorDisplayer = null;
        }

        public void setCloudImageLoadingListener(CloudImageLoadingListener cloudImageLoadingListener) {
            this.mExternalListener = cloudImageLoadingListener;
        }
    }

    protected final class EmptyView {
        private int mEmptyBackground;
        private TextView mEmptyView;

        protected EmptyView() {
        }

        private void initView() {
            if (this.mEmptyView == null) {
                this.mEmptyView = new TextView(PhotoPageItem.this.getContext());
                this.mEmptyView.setTextColor(PhotoPageItem.this.getResources().getColor(R.color.photo_page_empty_text));
                this.mEmptyView.setTextSize(0, (float) PhotoPageItem.this.getResources().getDimensionPixelSize(R.dimen.photo_empty_text));
                this.mEmptyView.setGravity(17);
                this.mEmptyView.setCompoundDrawablePadding(PhotoPageItem.this.getResources().getDimensionPixelSize(R.dimen.photo_empty_drawable_padding));
                LayoutParams layoutParams = new LayoutParams(-2, -2);
                layoutParams.addRule(13);
                PhotoPageItem.this.addView(this.mEmptyView, 0, layoutParams);
                this.mEmptyBackground = PhotoPageItem.this.getResources().getColor(R.color.photo_page_empty_background);
            }
        }

        public void setIcon(Drawable drawable) {
            if (drawable != null || this.mEmptyView != null) {
                initView();
                this.mEmptyView.setCompoundDrawablesWithIntrinsicBounds(null, drawable, null, null);
            }
        }

        public void setTip(CharSequence charSequence) {
            if (!TextUtils.isEmpty(charSequence) || this.mEmptyView != null) {
                initView();
                this.mEmptyView.setText(charSequence);
            }
        }

        public void setVisible(boolean z) {
            if (z) {
                initView();
                this.mEmptyView.setVisibility(0);
                PhotoPageItem.this.setBackgroundColor(this.mEmptyBackground);
            } else if (this.mEmptyView != null) {
                this.mEmptyView.setVisibility(4);
                PhotoPageItem.this.setBackground(null);
            }
        }
    }

    private static class ImageLoadFinishListener implements ImageLoadingListener {
        private WeakReference<OnImageLoadFinishListener> mCallbackRef;

        public ImageLoadFinishListener() {
        }

        public ImageLoadFinishListener(OnImageLoadFinishListener onImageLoadFinishListener) {
            this.mCallbackRef = new WeakReference<>(onImageLoadFinishListener);
        }

        /* access modifiers changed from: protected */
        public void onLoadFinish(boolean z, String str) {
            if (this.mCallbackRef != null) {
                OnImageLoadFinishListener onImageLoadFinishListener = (OnImageLoadFinishListener) this.mCallbackRef.get();
                if (onImageLoadFinishListener != null) {
                    onImageLoadFinishListener.onImageLoadFinish(z, str);
                }
            }
        }

        public void onLoadingCancelled(String str, View view) {
            onLoadFinish(true, str);
        }

        public void onLoadingComplete(String str, View view, Bitmap bitmap) {
            onLoadFinish(false, str);
        }

        public void onLoadingFailed(String str, View view, FailReason failReason) {
            onLoadFinish(false, str);
        }

        public void onLoadingStarted(String str, View view) {
        }
    }

    private class InitTask extends AsyncTask<Void, Void, BaseDataItem> {
        private long mClock;

        private InitTask() {
        }

        /* access modifiers changed from: protected */
        public BaseDataItem doInBackground(Void... voidArr) {
            if (isCancelled()) {
                return null;
            }
            this.mClock = System.currentTimeMillis();
            BaseDataItem baseDataItem = PhotoPageItem.this.mDataItem;
            if (baseDataItem != null) {
                baseDataItem.reloadCache();
                if (isCancelled()) {
                    return null;
                }
            }
            return baseDataItem;
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(BaseDataItem baseDataItem) {
            Log.d("PhotoPageItem", "init costs %d, task is cancelled: %b", Long.valueOf(System.currentTimeMillis() - this.mClock), Boolean.valueOf(isCancelled()));
            if (!isCancelled() && baseDataItem == PhotoPageItem.this.mDataItem) {
                PhotoPageItem.this.displayImage(baseDataItem);
                PhotoPageItem.this.onPostInitialized();
            }
        }
    }

    public interface OnImageLoadFinishListener {
        void onImageLoadFinish(boolean z, String str);
    }

    public interface OnPlayVideoListener {
        void onPlayVideo(BaseDataItem baseDataItem);
    }

    private static class PhotoDisplayer implements BitmapDisplayer {
        private PhotoDisplayer() {
        }

        public void display(Bitmap bitmap, ImageAware imageAware, LoadedFrom loadedFrom) {
            View wrappedView = imageAware.getWrappedView();
            if (wrappedView != null) {
                PhotoView photoView = (PhotoView) wrappedView;
                photoView.setImageBitmap(bitmap, photoView.getDrawable() != null);
                return;
            }
            Log.w("PhotoPageItem", "PhotoDisplayer view is null");
        }
    }

    protected class SpecialTypeManager extends AbsPhotoRectAwareManager {
        private boolean mHasShowIndicator;
        private String mIndicatorText;
        /* access modifiers changed from: private */
        public TextView mTypeIndicator;

        protected SpecialTypeManager() {
            super();
        }

        private void doAdjustLocation(boolean z, RectF rectF) {
            float actionBarHeight = z ? (float) PhotoPageItem.this.getActionBarHeight() : 0.0f;
            float f = rectF != null ? rectF.top : 0.0f;
            float f2 = rectF != null ? rectF.left : 0.0f;
            float min = Math.min(getMaxTranslationY(), Math.max(actionBarHeight, f) + ((float) getVerticalMargin()));
            float min2 = Math.min(getMaxTranslationX(), Math.max(f2, 0.0f) + ((float) getHorizontalMargin()));
            this.mTypeIndicator.setTranslationY(min);
            this.mTypeIndicator.setTranslationX(min2);
        }

        /* access modifiers changed from: private */
        public boolean hideIndicator(boolean z) {
            if (!this.mHasShowIndicator || this.mTypeIndicator == null || this.mTypeIndicator.getVisibility() == 8) {
                return false;
            }
            this.mTypeIndicator.clearAnimation();
            if (z) {
                Animation generateHideAnimation = generateHideAnimation();
                generateHideAnimation.setAnimationListener(new AnimationListenerAdapter() {
                    public void onAnimationEnd(Animation animation) {
                        if (SpecialTypeManager.this.mTypeIndicator != null) {
                            SpecialTypeManager.this.mTypeIndicator.setVisibility(8);
                        }
                    }
                });
                this.mTypeIndicator.startAnimation(generateHideAnimation);
            } else {
                this.mTypeIndicator.setVisibility(8);
            }
            return true;
        }

        private void initLayout() {
            if (this.mTypeIndicator == null) {
                this.mTypeIndicator = (TextView) LayoutInflater.from(PhotoPageItem.this.getContext()).inflate(R.layout.special_type_indicator, PhotoPageItem.this, false);
                this.mTypeIndicator.setText(this.mIndicatorText);
                PhotoPageItem.this.addView(this.mTypeIndicator);
                this.mTypeIndicator.setVisibility(8);
            }
        }

        /* access modifiers changed from: private */
        public boolean showIndicator(boolean z) {
            if (needShowIndicatorView()) {
                this.mHasShowIndicator = true;
                initLayout();
                if (!(this.mTypeIndicator == null || this.mTypeIndicator.getVisibility() == 0)) {
                    this.mTypeIndicator.clearAnimation();
                    this.mTypeIndicator.setVisibility(0);
                    adjustLocation(PhotoPageItem.this.isActionBarVisible(), PhotoPageItem.this.mPhotoView.getDisplayRect(), false);
                    if (z) {
                        this.mTypeIndicator.startAnimation(generateShowAnimation());
                    }
                    return true;
                }
            }
            return false;
        }

        public void adjustLocation(boolean z, RectF rectF, boolean z2) {
            if (this.mHasShowIndicator && this.mTypeIndicator != null && this.mTypeIndicator.getVisibility() == 0) {
                doAdjustLocation(z, rectF);
            }
        }

        /* access modifiers changed from: protected */
        public void changeVisibilityForSpecialScene() {
            if (needShowIndicatorView()) {
                hideIndicator(false);
                showIndicator(true);
                this.mTypeIndicator.clearAnimation();
                this.mTypeIndicator.setVisibility(0);
                return;
            }
            hideIndicator(true);
        }

        /* access modifiers changed from: protected */
        public Animation generateHideAnimation() {
            AnimationSet animationSet = new AnimationSet(true);
            animationSet.addAnimation(new AlphaAnimation(1.0f, 0.0f));
            animationSet.setInterpolator(new CubicEaseOutInterpolator());
            animationSet.setDuration(200);
            return animationSet;
        }

        /* access modifiers changed from: protected */
        public Animation generateShowAnimation() {
            AnimationSet animationSet = new AnimationSet(true);
            animationSet.addAnimation(new AlphaAnimation(0.0f, 1.0f));
            animationSet.setInterpolator(new CubicEaseOutInterpolator());
            animationSet.setDuration(300);
            return animationSet;
        }

        /* access modifiers changed from: protected */
        public int getHorizontalMargin() {
            if (this.mMargin == 0) {
                this.mMargin = PhotoPageItem.this.getContext().getResources().getDimensionPixelSize(R.dimen.special_type_indicator_margin);
            }
            return this.mMargin;
        }

        /* access modifiers changed from: protected */
        public int getVerticalMargin() {
            if (this.mMargin == 0) {
                this.mMargin = PhotoPageItem.this.getContext().getResources().getDimensionPixelSize(R.dimen.special_type_indicator_margin);
            }
            return this.mMargin;
        }

        /* access modifiers changed from: protected */
        public boolean needShowIndicatorView() {
            return !PhotoPageItem.this.isInActionMode() && !isRotating() && !isDrawableDisplayInside() && this.mIndicatorText != null && PhotoPageItem.this.isActionBarVisible;
        }

        public void onActionBarVisibleChanged(boolean z) {
            if (z) {
                showIndicator(true);
            } else {
                hideIndicator(true);
            }
        }

        public void onSelected() {
            super.onSelected();
            if (PhotoPageItem.this.isActionBarVisible) {
                showIndicator(false);
            } else {
                hideIndicator(false);
            }
        }

        public void release() {
            hideIndicator(false);
            super.release();
            this.mHasShowIndicator = false;
            this.mTypeIndicator = null;
        }

        public void setTypeIndicatorText(String str) {
            this.mIndicatorText = str;
            if (this.mTypeIndicator != null) {
                this.mTypeIndicator.setText(str);
            }
        }
    }

    public interface TransitionListener extends uk.co.senab.photoview.PhotoViewAttacher.TransitionListener {
    }

    public PhotoPageItem(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        if (sDisplayImageOptionsBuilder == null) {
            sDisplayImageOptionsBuilder = new Builder().cloneFrom(BigPhotoConfig.BIG_PHOTO_DISPLAY_IMAGE_OPTIONS_DEFAULT).handler(ThreadManager.getMainHandler()).displayer(new PhotoDisplayer());
        }
        if (sStrokeColor == Integer.MIN_VALUE) {
            sStrokeColor = getResources().getColor(R.color.black_20_transparent);
        }
    }

    /* access modifiers changed from: private */
    public boolean canDoSelected() {
        boolean z = isPagerSelected() && !isAnimEntering() && isInitialized();
        if (!z && isPagerSelected()) {
            Log.d("PhotoPageItem", "canDoSelected %s, isAnimEntering %s, isInitialized %s", Boolean.valueOf(z), Boolean.valueOf(isAnimEntering()), Boolean.valueOf(isInitialized()));
        }
        return z;
    }

    private void displayCacheImage(ImageLoadParams imageLoadParams, Builder builder, ImageLoadingListener imageLoadingListener) {
        String path = imageLoadParams.getPath();
        if (Scheme.ofUri(path) == Scheme.UNKNOWN) {
            path = Scheme.FILE.wrap(path);
            imageLoadParams.setPath(path);
        }
        ImageLoader.getInstance().displayImage(path, new ImageViewAware(this.mPhotoView, false), getCacheDisplayImageOptions(imageLoadParams, builder), imageLoadParams.getTargetSize(), imageLoadingListener, null, imageLoadParams.getRegionRectF());
    }

    private void executeInitTask() {
        this.isInitialized = false;
        if (this.mInitTask != null) {
            this.mInitTask.cancel(false);
        }
        this.mInitTask = new InitTask().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
    }

    private ImageLoadingListener getCacheImageLoadingListener() {
        if (this.mInternalCacheLoadCallback == null) {
            this.mInternalCacheLoadCallback = new OnImageLoadFinishListener() {
                public void onImageLoadFinish(final boolean z, final String str) {
                    PhotoPageItem.this.onCacheImageLoadFinish(z);
                    ThreadManager.getMainHandler().post(new Runnable() {
                        public void run() {
                            if (PhotoPageItem.this.mExternalCacheLoadCallback != null) {
                                PhotoPageItem.this.mExternalCacheLoadCallback.onImageLoadFinish(z, str);
                            }
                        }
                    });
                }
            };
        }
        return new ImageLoadFinishListener(this.mInternalCacheLoadCallback);
    }

    private ImageLoadFinishListener getImageLoadingListener() {
        if (this.mInternalImageLoadCallback == null) {
            this.mInternalImageLoadCallback = new OnImageLoadFinishListener() {
                public void onImageLoadFinish(boolean z, String str) {
                    if (!z) {
                        PhotoPageItem.this.onImageLoadFinish(ErrorCode.DECODE_ERROR);
                    }
                    if (PhotoPageItem.this.mExternalImageLoadCallback != null) {
                        PhotoPageItem.this.mExternalImageLoadCallback.onImageLoadFinish(z, str);
                    }
                }
            };
        }
        return new ImageLoadFinishListener(this.mInternalImageLoadCallback);
    }

    private boolean isPathValidate(String str) {
        return !TextUtils.isEmpty(str);
    }

    private void onActionModeChanged(boolean z) {
        if (z) {
            this.mPhotoView.setZoomable(false);
            this.mPhotoView.setStroke(sStrokeColor, 1);
        } else {
            this.mPhotoView.setStroke(0, 0);
            if (this.mPhotoView.getDrawable() != null) {
                displayImage(this.mDataItem);
            }
            updateFeatures();
        }
        this.mDownloadManager.onActionModeChanged(z);
        this.mSpecialTypeManager.onActionModeChanged(z);
    }

    public void addOnMatrixChangeListener(OnMatrixChangedListener onMatrixChangedListener) {
        this.mPhotoView.addOnMatrixChangeListener(onMatrixChangedListener);
    }

    public void animEnter(ItemViewInfo itemViewInfo, final TransitionListener transitionListener) {
        AnonymousClass3 r0 = new TransitionListener() {
            public void onTransitEnd() {
                transitionListener.onTransitEnd();
                PhotoPageItem.this.isAnimEntering = false;
                if (PhotoPageItem.this.canDoSelected()) {
                    PhotoPageItem.this.doOnSelected(false, true, false);
                }
            }
        };
        this.isAnimEntering = true;
        this.mPhotoView.animEnter(itemViewInfo, r0);
    }

    public void animExit(ItemViewInfo itemViewInfo, TransitionListener transitionListener) {
        this.isAnimExiting = true;
        this.mPhotoView.animExit(itemViewInfo, transitionListener);
        this.mDownloadManager.release();
        this.mSpecialTypeManager.release();
    }

    public void clearTrimMemoryFlag() {
        Log.d("PhotoPageItem", "clearTrimMemoryFlag");
        this.mMemoryTrimFlags = 0;
    }

    /* access modifiers changed from: protected */
    public CheckManager createCheckManager() {
        return new CheckManager();
    }

    /* access modifiers changed from: protected */
    public DownloadManager createDownloadManager() {
        return new DownloadManager();
    }

    /* access modifiers changed from: protected */
    public final void displayImage(BaseDataItem baseDataItem) {
        if (this.mMemoryTrimFlags == 0 && (!this.isCacheImageLoading || !isMediaInProcessing())) {
            boolean z = false;
            String originalPath = baseDataItem.getOriginalPath();
            if (!isPathValidate(originalPath)) {
                originalPath = baseDataItem.getThumnailPath();
            }
            if (!isPathValidate(originalPath)) {
                originalPath = baseDataItem.getMicroPath();
                z = true;
            }
            if (!TextUtils.isEmpty(originalPath) && (z || isPathValidate(originalPath))) {
                if (originalPath.startsWith(File.separator)) {
                    originalPath = Scheme.FILE.wrap(originalPath);
                }
                displayImage(originalPath, getDisplayImageOptions(baseDataItem, z), (z || isMediaInProcessing()) ? baseDataItem.getMicroImageSize() : null, getImageLoadingListener(), null);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void displayImage(String str, DisplayImageOptions displayImageOptions, ImageSize imageSize, ImageLoadingListener imageLoadingListener, ImageLoadingProgressListener imageLoadingProgressListener) {
        ImageLoader.getInstance().displayImage(str, new ImageViewAware(this.mPhotoView), displayImageOptions, imageSize, imageLoadingListener, imageLoadingProgressListener);
    }

    /* access modifiers changed from: protected */
    public void doOnMatrixChanged(RectF rectF) {
    }

    /* access modifiers changed from: protected */
    public void doOnSelected(boolean z, boolean z2, boolean z3) {
        Log.d("PhotoPageItem", "doOnSelected pos: %s, resumed: %s", getTag(R.id.tag_item_position), Boolean.valueOf(z));
        if (!z || !this.mCheckManager.inAction()) {
            this.mDownloadManager.onSelected();
            this.mSpecialTypeManager.onSelected();
            return;
        }
        this.mDownloadManager.onUnSelected();
        this.mSpecialTypeManager.onUnSelected();
    }

    /* access modifiers changed from: protected */
    public void doOnUnSelected(boolean z) {
        this.mDownloadManager.onUnSelected();
        this.mSpecialTypeManager.onUnSelected();
    }

    public void downloadOrigin() {
        if (this.mDataItem != null) {
            this.mDownloadManager.downloadOrigin();
        }
    }

    public void finishActionMode() {
        if (this.mCheckManager.inAction()) {
            this.mCheckManager.endCheck();
            onActionModeChanged(false);
        }
    }

    /* access modifiers changed from: protected */
    public int getActionBarHeight() {
        int actionBarHeight = this.mPhotoPageInteractionListener.getActionBarHeight();
        if (actionBarHeight > 0) {
            return actionBarHeight;
        }
        if (sStatusBarHeight == -1) {
            sStatusBarHeight = MiscUtil.getStatusBarHeight(getContext());
        }
        return sStatusBarHeight + getContext().getResources().getDimensionPixelSize(R.dimen.photo_page_actionbar_height);
    }

    /* access modifiers changed from: protected */
    public DisplayImageOptions getCacheDisplayImageOptions(ImageLoadParams imageLoadParams, Builder builder) {
        if (imageLoadParams.isSecret()) {
            builder.secretKey(imageLoadParams.getSecretKey());
        }
        if (imageLoadParams.getFileLength() > 0) {
            builder.considerFileLength(true).fileLength(imageLoadParams.getFileLength());
        } else {
            builder.considerFileLength(false);
        }
        return builder.build();
    }

    public ImageLoadParams getCacheItem() {
        return this.mCacheItem;
    }

    /* access modifiers changed from: protected */
    public String getContentDescriptionForTalkBack() {
        if (this.mDataItem != null) {
            return (!isInActionMode() || this.mCheckManager == null) ? this.mDataItem.getContentDescription(getContext()) : this.mCheckManager.getContentDescription();
        }
        return null;
    }

    public BaseDataItem getDataItem() {
        return this.mDataItem;
    }

    /* access modifiers changed from: protected */
    public DisplayImageOptions getDisplayImageOptions(BaseDataItem baseDataItem, boolean z) {
        if (baseDataItem.isSecret()) {
            sDisplayImageOptionsBuilder.secretKey(baseDataItem.getSecretKey());
        } else {
            sDisplayImageOptionsBuilder.secretKey(null);
        }
        sDisplayImageOptionsBuilder.cacheBigPhoto(!z);
        sDisplayImageOptionsBuilder.loadFromThumbnailCache(z);
        if (!TextUtils.isEmpty(baseDataItem.getOriginalPath())) {
            Scheme ofUri = Scheme.ofUri(baseDataItem.getOriginalPath());
            if (!(ofUri == Scheme.FILE || ofUri == Scheme.UNKNOWN)) {
                sDisplayImageOptionsBuilder.cacheBigPhoto(false);
            }
        }
        if (baseDataItem.getSize() > 0) {
            sDisplayImageOptionsBuilder.fileLength(baseDataItem.getSize());
            sDisplayImageOptionsBuilder.considerFileLength(true);
        } else {
            sDisplayImageOptionsBuilder.considerFileLength(false);
        }
        return sDisplayImageOptionsBuilder.build();
    }

    /* access modifiers changed from: protected */
    public int getMenuBarHeight() {
        if (sMenuBarHeight == -1) {
            sMenuBarHeight = this.mPhotoPageInteractionListener.getMenuBarHeight();
        }
        return sMenuBarHeight + ViewCompat.getSystemWindowInsetBottom(this);
    }

    public ProcessingMedia getProcessingMedia() {
        return null;
    }

    public TrimMemoryCallback getTrimMemoryCallback() {
        return this.mTrimMemoryCallback;
    }

    public boolean hasOverlappingRendering() {
        return false;
    }

    /* access modifiers changed from: protected */
    public final boolean isActionBarVisible() {
        return this.isActionBarVisible;
    }

    /* access modifiers changed from: protected */
    public boolean isAnimEntering() {
        return this.isAnimEntering;
    }

    /* access modifiers changed from: protected */
    public boolean isAnimExiting() {
        return this.isAnimExiting;
    }

    /* access modifiers changed from: protected */
    public boolean isInActionMode() {
        return this.mCheckManager.inAction();
    }

    /* access modifiers changed from: protected */
    public boolean isInitialized() {
        return this.isInitialized;
    }

    /* access modifiers changed from: protected */
    public boolean isMediaInProcessing() {
        return false;
    }

    /* access modifiers changed from: protected */
    public boolean isPagerSelected() {
        return this.isSelected;
    }

    /* access modifiers changed from: protected */
    public boolean isPaused() {
        return this.isPaused;
    }

    public void onActionBarVisibleChanged(Boolean bool, int i) {
        this.isActionBarVisible = bool.booleanValue();
        this.mDownloadManager.adjustLocation(bool.booleanValue(), this.mPhotoView.getDisplayRect(), true);
        this.mSpecialTypeManager.onActionBarVisibleChanged(bool.booleanValue());
        if (this.mIsActionBarFirstInit) {
            this.mIsActionBarFirstInit = false;
        }
    }

    public void onActivityResult(int i, int i2, Intent intent) {
    }

    public void onActivityTransition() {
    }

    /* access modifiers changed from: protected */
    public void onCacheImageLoadFinish(boolean z) {
        this.isCacheImageLoading = false;
        if (!z) {
            swapItem(this.mDataItem);
        }
    }

    /* access modifiers changed from: protected */
    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        this.mDownloadManager.adjustLocation(isActionBarVisible(), this.mPhotoView.getDisplayRect(), false);
        this.mSpecialTypeManager.adjustLocation(isActionBarVisible(), this.mPhotoView.getDisplayRect(), true);
    }

    /* access modifiers changed from: protected */
    public void onDetachedFromWindow() {
        ImageLoader.getInstance().cancelDisplayTask((ImageView) this.mPhotoView);
        recycleBitmap();
        removeOnMatrixChangeListener(this);
        this.mDownloadManager.release();
        this.mSpecialTypeManager.release();
        this.mCheckManager.endCheck();
        if (this.mInitTask != null) {
            this.mInitTask.cancel(false);
            this.mInitTask = null;
        }
        this.mEmptyView.setVisible(false);
        this.mCacheItem = null;
        this.mDataItem = null;
        setContentDescription(null);
        this.mPhotoPageInteractionListener = null;
        this.mInternalCacheLoadCallback = null;
        this.mInternalImageLoadCallback = null;
        this.mExternalCacheLoadCallback = null;
        this.mExternalImageLoadCallback = null;
        this.mOnPlayVideoListener = null;
        this.isSelected = false;
        this.isInitialized = false;
        this.isActionBarVisible = false;
        this.mIsActionBarFirstInit = true;
        this.isAnimEntering = false;
        this.isAnimExiting = false;
        this.isCacheImageLoading = false;
        this.mMemoryTrimFlags = 0;
        this.isPaused = false;
        super.onDetachedFromWindow();
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mPhotoView = (PhotoView) findViewById(R.id.photoview);
        this.mDownloadManager = createDownloadManager();
        this.mSpecialTypeManager = new SpecialTypeManager();
        this.mCheckManager = createCheckManager();
        this.mEmptyView = new EmptyView();
    }

    /* access modifiers changed from: protected */
    public void onImageLoadFinish(ErrorCode errorCode) {
        Drawable drawable;
        if (this.mPhotoView.getDrawable() == null) {
            Resources resources = getResources();
            String str = null;
            if (!(errorCode == null || errorCode == ErrorCode.NO_ERROR)) {
                if (errorCode != ErrorCode.DECODE_ERROR) {
                    str = resources.getString(R.string.error_download_tip);
                    drawable = getResources().getDrawable(R.drawable.icon_empty_photo);
                } else if (this.mDataItem == null || !TextUtils.isEmpty(this.mDataItem.getOriginalPath())) {
                    str = resources.getString(R.string.error_decode_tip);
                    drawable = null;
                }
                this.mEmptyView.setTip(str);
                this.mEmptyView.setIcon(drawable);
                this.mEmptyView.setVisible(true);
                return;
            }
            drawable = null;
            this.mEmptyView.setTip(str);
            this.mEmptyView.setIcon(drawable);
            this.mEmptyView.setVisible(true);
            return;
        }
        this.mEmptyView.setVisible(false);
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        super.onLayout(z, i, i2, i3, i4);
        if (this.mCheckManager.inAction()) {
            this.mCheckManager.relayout(this.mPhotoView.getDisplayRect());
        }
    }

    public final void onMatrixChanged(RectF rectF) {
        if (!isAnimEntering() && !isAnimExiting()) {
            this.mDownloadManager.onMatrixChanged(rectF);
            this.mCheckManager.onMatrixChanged(rectF);
            this.mSpecialTypeManager.onMatrixChanged(rectF);
            doOnMatrixChanged(rectF);
        }
    }

    /* access modifiers changed from: protected */
    public void onPageScrollDragging() {
    }

    /* access modifiers changed from: protected */
    public void onPageScrollIdle() {
    }

    /* access modifiers changed from: protected */
    public void onPause() {
        this.isPaused = true;
    }

    /* access modifiers changed from: protected */
    public void onPostInitialized() {
        this.isInitialized = true;
        if (canDoSelected()) {
            doOnSelected(false, false, true);
        }
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        this.isPaused = false;
    }

    public final void onSelected(boolean z) {
        if (!this.isSelected) {
            this.isSelected = true;
            if (canDoSelected()) {
                doOnSelected(z, false, false);
            }
            addOnMatrixChangeListener(this);
        }
    }

    public void onSlipping(float f) {
        if (isPagerSelected()) {
            this.mCheckManager.onAlphaChanged(f);
        }
    }

    public void onStopTrimMemory(int i) {
        Log.d("PhotoPageItem", "onStopTrimMemory flag: %d, before: %d", Integer.valueOf(i), Integer.valueOf(this.mMemoryTrimFlags));
        if ((this.mMemoryTrimFlags & i) > 0) {
            this.mMemoryTrimFlags = (i ^ -1) & this.mMemoryTrimFlags;
            if (this.mMemoryTrimFlags == 0) {
                Log.d("PhotoPageItem", "reloadData: %s", this.mDataItem != null ? Long.valueOf(this.mDataItem.getKey()) : Integer.toHexString(hashCode()));
                refreshItem();
            }
        }
    }

    public void onTrimMemory(int i) {
        Log.d("PhotoPageItem", "onTrimMemory flag: %d, before: %d", Integer.valueOf(i), Integer.valueOf(this.mMemoryTrimFlags));
        if (this.mMemoryTrimFlags == 0) {
            Log.d("PhotoPageItem", "trimMemory: %s", this.mDataItem != null ? Long.valueOf(this.mDataItem.getKey()) : Integer.toHexString(hashCode()));
            ImageLoader.getInstance().cancelDisplayTask((ImageView) this.mPhotoView);
            recycleBitmap();
        }
        this.mMemoryTrimFlags = i | this.mMemoryTrimFlags;
    }

    public final void onUnSelected(boolean z) {
        if (this.isSelected) {
            this.isSelected = false;
            doOnUnSelected(z);
            removeOnMatrixChangeListener(this);
        }
    }

    /* access modifiers changed from: protected */
    public void recycleBitmap() {
        Drawable drawable = this.mPhotoView.getDrawable();
        if (drawable != null) {
            Bitmap bitmap = null;
            this.mPhotoView.setImageDrawable(null);
            if (drawable instanceof BitmapDrawable) {
                if (this.mCacheItem != null) {
                    bitmap = ImageLoader.getInstance().loadFromMemoryCache(this.mCacheItem.getPath(), this.mCacheItem.getTargetSize(), null, ThumbConfig.THUMBNAIL_DISPLAY_IMAGE_OPTIONS_DEFAULT);
                }
                Bitmap bitmap2 = ((BitmapDrawable) drawable).getBitmap();
                if (bitmap != bitmap2) {
                    PhotoReusedBitCache.getInstance().put(bitmap2);
                }
            }
        }
    }

    public void refreshItem() {
        swapItem(this.mDataItem);
    }

    public void removeOnMatrixChangeListener(OnMatrixChangedListener onMatrixChangedListener) {
        this.mPhotoView.removeOnMatrixChangeListener(onMatrixChangedListener);
    }

    public void setCacheItem(ImageLoadParams imageLoadParams, OnImageLoadFinishListener onImageLoadFinishListener) {
        this.mCacheItem = imageLoadParams;
        if (imageLoadParams != null) {
            this.isCacheImageLoading = true;
            this.mExternalCacheLoadCallback = onImageLoadFinishListener;
            Builder builder = new Builder();
            builder.cloneFrom(ThumbConfig.THUMBNAIL_DISPLAY_IMAGE_OPTIONS_DEFAULT);
            builder.syncLoadFromThumbCache(false);
            builder.cacheInMemory(true);
            displayCacheImage(imageLoadParams, builder, getCacheImageLoadingListener());
        }
    }

    public void setCloudImageLoadingListener(CloudImageLoadingListener cloudImageLoadingListener) {
        this.mDownloadManager.setCloudImageLoadingListener(cloudImageLoadingListener);
    }

    public void setOnBackgroundAlphaChangedListener(OnBackgroundAlphaChangedListener onBackgroundAlphaChangedListener) {
        this.mPhotoView.setOnBackgroundAlphaChangedListener(onBackgroundAlphaChangedListener);
    }

    public void setOnExitListener(OnExitListener onExitListener) {
        this.mPhotoView.setOnExitListener(onExitListener);
    }

    public void setOnImageLoadFinishListener(OnImageLoadFinishListener onImageLoadFinishListener) {
        this.mExternalImageLoadCallback = onImageLoadFinishListener;
    }

    public void setOnPlayVideoListener(OnPlayVideoListener onPlayVideoListener) {
        this.mOnPlayVideoListener = onPlayVideoListener;
    }

    public void setOnScaleChangeListener(OnScaleChangeListener onScaleChangeListener) {
        this.mPhotoView.setOnScaleChangeListener(onScaleChangeListener);
    }

    public void setOnViewTapListener(OnViewTapListener onViewTapListener) {
        this.mPhotoView.setOnViewTapListener(onViewTapListener);
    }

    public void setPhotoPageCallback(PhotoPageInteractionListener photoPageInteractionListener) {
        this.mPhotoPageInteractionListener = photoPageInteractionListener;
    }

    public void setProcessingMedia(ProcessingMedia processingMedia) {
    }

    public void setTrimMemoryCallback(TrimMemoryCallback trimMemoryCallback) {
        this.mTrimMemoryCallback = trimMemoryCallback;
    }

    public void startActionMode(ChoiceModeInterface choiceModeInterface, ChoiceModeInterface choiceModeInterface2, ChoiceModeInterface choiceModeInterface3) {
        if (this.mCheckManager.inAction()) {
            this.mCheckManager.refreshCheck(choiceModeInterface, choiceModeInterface2, choiceModeInterface3);
            return;
        }
        this.mCheckManager.startCheck(choiceModeInterface, choiceModeInterface2, choiceModeInterface3);
        onActionModeChanged(true);
    }

    public void swapItem(BaseDataItem baseDataItem) {
        if (this.mDataItem != null && (baseDataItem == null || !baseDataItem.equals(this.mDataItem))) {
            recycleBitmap();
        }
        this.mDataItem = baseDataItem;
        if (!this.isCacheImageLoading) {
            if (this.mDataItem != null) {
                executeInitTask();
                setContentDescription(getContentDescriptionForTalkBack());
            }
            updateFeatures();
        }
    }

    public void swapItem(BaseDataItem baseDataItem, ImageLoadParams imageLoadParams) {
        if (imageLoadParams != null && this.mCacheItem == null) {
            setCacheItem(imageLoadParams, null);
        }
        swapItem(baseDataItem);
    }

    /* access modifiers changed from: protected */
    public void updateFeatures() {
        if (!(this.mPhotoView == null || this.mDataItem == null)) {
            boolean z = true;
            this.mPhotoView.setZoomable(!this.mDataItem.isVideo());
            if (this.mDataItem.isGif() || this.mDataItem.isVideo()) {
                z = false;
            }
            this.mPhotoView.setRotatable(z);
        }
        updateSpecialTypeIndicator();
    }

    public void updateSpecialTypeIndicator() {
        if (this.mDataItem != null && this.mDataItem.isSpecialTypeRecognized()) {
            int parseMTSpecialAITypeDescriptionRes = SpecialTypeMediaUtils.parseMTSpecialAITypeDescriptionRes(this.mDataItem.getSpecialTypeFlags());
            if (parseMTSpecialAITypeDescriptionRes > 0) {
                this.mSpecialTypeManager.setTypeIndicatorText(getContext().getString(parseMTSpecialAITypeDescriptionRes));
                this.mSpecialTypeManager.showIndicator(false);
                return;
            }
        }
        this.mSpecialTypeManager.setTypeIndicatorText(null);
        this.mSpecialTypeManager.hideIndicator(false);
    }
}
