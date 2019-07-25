package com.miui.gallery.ui;

import android.app.ActionBar.LayoutParams;
import android.app.Activity;
import android.app.Fragment;
import android.app.KeyguardManager;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.IntentFilter.MalformedMimeTypeException;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.database.ContentObserver;
import android.graphics.RectF;
import android.net.Uri;
import android.nfc.NfcAdapter;
import android.os.AsyncTask;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import android.provider.Settings.System;
import android.support.v4.content.LocalBroadcastManager;
import android.support.v4.view.OnApplyWindowInsetsListener;
import android.support.v4.view.WindowInsetsCompat;
import android.text.Html;
import android.text.TextUtils;
import android.util.ArrayMap;
import android.util.LongSparseArray;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.Surface;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLayoutChangeListener;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.ViewStub;
import android.view.WindowManager;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.webkit.URLUtil;
import android.widget.ImageView;
import android.widget.TextView;
import com.miui.extraphoto.sdk.ExtraPhotoSDK;
import com.miui.extraphoto.sdk.ExtraPhotoWrapper;
import com.miui.extraphoto.sdk.ExtraPhotoWrapper.StartCallback;
import com.miui.gallery.BaseConfig.ScreenConfig;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.assistant.cache.ImageFeatureCacheManager;
import com.miui.gallery.cloud.NetworkUtils;
import com.miui.gallery.compat.app.ActionBarCompat;
import com.miui.gallery.compat.app.ActivityCompat;
import com.miui.gallery.compat.view.ViewCompat;
import com.miui.gallery.compat.view.WindowCompat;
import com.miui.gallery.data.CacheOfAllFacesInOnePhoto;
import com.miui.gallery.error.core.ErrorCode;
import com.miui.gallery.model.BaseDataItem;
import com.miui.gallery.model.BaseDataSet;
import com.miui.gallery.model.CloudItem;
import com.miui.gallery.model.FavoriteInfo;
import com.miui.gallery.model.ImageLoadParams;
import com.miui.gallery.preference.GalleryPreferences.CTA;
import com.miui.gallery.preference.GalleryPreferences.Favorites;
import com.miui.gallery.projection.ConnectController;
import com.miui.gallery.projection.ConnectController.ConnectListener;
import com.miui.gallery.projection.DeviceListController;
import com.miui.gallery.projection.DeviceListController.OnItemClickListener;
import com.miui.gallery.projection.RemoteControlReceiver.RemoteControlListener;
import com.miui.gallery.projection.RemoteController;
import com.miui.gallery.scanner.MediaScanner;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.FutureHandler;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.ui.DeletionTask.OnDeletionCompleteListener;
import com.miui.gallery.ui.DownloadFragment.OnDownloadListener;
import com.miui.gallery.ui.PhotoPageFragmentBase.PhotoPageInteractionListener;
import com.miui.gallery.ui.PhotoPageVideoItem.OnSurfacePreparedListener;
import com.miui.gallery.ui.PhotoPagerHelper.OnAlphaChangedListener;
import com.miui.gallery.ui.PhotoPagerHelper.OnDisplayRectChangedListener;
import com.miui.gallery.ui.PhotoPagerHelper.OnExitListener;
import com.miui.gallery.ui.PhotoPagerHelper.OnPlayVideoListener;
import com.miui.gallery.ui.PhotoPagerHelper.OnScaleChangedListener;
import com.miui.gallery.ui.PhotoPagerHelper.OnSingleTapListener;
import com.miui.gallery.ui.ProcessTask.ProcessCallback;
import com.miui.gallery.util.BulkDownloadHelper.BulkDownloadItem;
import com.miui.gallery.util.DialogUtil;
import com.miui.gallery.util.DocumentProviderUtils;
import com.miui.gallery.util.FileMimeUtil;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.FormatUtil;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.GalleryStatHelper;
import com.miui.gallery.util.GalleryUtils;
import com.miui.gallery.util.IntentUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MediaAndAlbumOperations.OnAddAlbumListener;
import com.miui.gallery.util.MediaAndAlbumOperations.OnCompleteListener;
import com.miui.gallery.util.MediaStoreUtils;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.OrientationSensor;
import com.miui.gallery.util.OrientationSensor.OnOrientationChangedListener;
import com.miui.gallery.util.PhotoOperationsUtil;
import com.miui.gallery.util.ReceiverUtils;
import com.miui.gallery.util.SecretAlbumCryptoUtils;
import com.miui.gallery.util.SlideWallpaperUtils;
import com.miui.gallery.util.SoundUtils;
import com.miui.gallery.util.SpecialTypeMediaUtils;
import com.miui.gallery.util.StorageUtils;
import com.miui.gallery.util.SystemUiUtil;
import com.miui.gallery.util.TalkBackUtil;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.util.UriUtil;
import com.miui.gallery.util.Utils;
import com.miui.gallery.util.VideoWallpaperUtils;
import com.miui.gallery.util.WallpaperUtils;
import com.miui.gallery.util.XmpHelper;
import com.miui.gallery.util.photoview.ItemViewInfo;
import com.miui.gallery.util.photoview.PhotoPageDataCache;
import com.miui.gallery.util.photoview.TileReusedBitCache;
import com.miui.gallery.util.uil.CloudImageLoader;
import com.miui.gallery.util.uil.CloudImageLoadingListener;
import com.miui.gallery.util.uil.CloudImageLoadingListenerAdapter;
import com.miui.gallery.util.uil.PhotoReusedBitCache;
import com.miui.gallery.video.VideoFrameProvider;
import com.miui.gallery.video.VideoFrameProvider.Listener;
import com.miui.gallery.video.VideoFrameProvider.ThumbListInfo;
import com.miui.gallery.video.VideoFrameSeekBar;
import com.miui.gallery.video.VideoFrameSeekBar.OnSeekBarChangeListener;
import com.miui.gallery.video.editor.manager.SmartVideoGuideHelper;
import com.miui.gallery.video.editor.manager.SmartVideoGuideHelper.SmartVideoGuideListener;
import com.miui.gallery.video.editor.manager.SmartVideoJudgeManager;
import com.miui.gallery.video.editor.sdk.Build;
import com.miui.gallery.widget.IMultiThemeView;
import com.miui.gallery.widget.IMultiThemeView.Theme;
import com.miui.gallery.widget.IMultiThemeView.ThemeTransition;
import com.miui.gallery.widget.slip.VerticalSlipLayout;
import com.miui.gallery.widget.slip.VerticalSlipLayout.OnSlipListener;
import com.miui.privacy.LockSettingsHelper;
import com.nexstreaming.nexeditorsdk.nexEngine;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import java.io.File;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import miui.view.animation.CubicEaseOutInterpolator;
import miui.view.animation.SineEaseInInterpolator;
import miui.view.animation.SineEaseInOutInterpolator;
import miui.widget.GuidePopupWindow;

public class PhotoPageFragment extends PhotoPageFragmentBase {
    /* access modifiers changed from: private */
    public boolean isFromCamera;
    private OnAlphaChangedListener mAlphaChangedListener = new OnAlphaChangedListener() {
        public void onAlphaChanged(float f) {
            if (PhotoPageFragment.this.isTransparentTheme() && PhotoPageFragment.this.mThemeManager != null) {
                PhotoPageFragment.this.mThemeManager.setBackgroundAlpha(f);
            }
        }
    };
    private boolean mAlwaysShowMenubar;
    private BurstPhotoManager mBurstPhotoManager;
    /* access modifiers changed from: private */
    public ChoiceManager mChoiceManager;
    private boolean mDataLoaded;
    /* access modifiers changed from: private */
    public CloudImageLoadingListener mDownloadListener = new CloudImageLoadingListenerAdapter() {
        public void onDownloadComplete(Uri uri, DownloadType downloadType, View view, String str) {
            if (PhotoPageFragment.this.mActivity != null && CloudImageLoader.getInstance().isOrigin(downloadType)) {
                if (PhotoPageFragment.this.mMenuManager != null) {
                    PhotoPageFragment.this.mMenuManager.refreshDownloadItem(false, false);
                }
                BaseDataItem dataItem = PhotoPageFragment.this.mAdapter.getDataItem(PhotoPageFragment.this.mPager.getCurrentItem());
                if (PhotoPageFragment.this.mDualCameraManager != null) {
                    PhotoPageFragment.this.mDualCameraManager.settleItem(dataItem);
                }
                if (PhotoPageFragment.this.mSpecialTypeManager != null) {
                    PhotoPageFragment.this.mSpecialTypeManager.updateItem(dataItem);
                }
                if (PhotoPageFragment.this.mNFCManager != null) {
                    PhotoPageFragment.this.mNFCManager.settleItem(dataItem);
                }
                if (PhotoPageFragment.this.mVideoPreviewManager != null) {
                    PhotoPageFragment.this.mVideoPreviewManager.updateItem(dataItem);
                }
            }
        }

        public void onLoadingCancelled(Uri uri, DownloadType downloadType, View view) {
            if (!(PhotoPageFragment.this.mActivity == null || !CloudImageLoader.getInstance().isOrigin(downloadType) || PhotoPageFragment.this.mMenuManager == null)) {
                PhotoPageFragment.this.mMenuManager.refreshDownloadItem(true, true);
            }
        }

        public void onLoadingFailed(Uri uri, DownloadType downloadType, View view, ErrorCode errorCode) {
            if (!(PhotoPageFragment.this.mActivity == null || !CloudImageLoader.getInstance().isOrigin(downloadType) || PhotoPageFragment.this.mMenuManager == null)) {
                PhotoPageFragment.this.mMenuManager.refreshDownloadItem(true, true);
            }
        }

        public void onLoadingStarted(Uri uri, DownloadType downloadType, View view) {
            if (CloudImageLoader.getInstance().isOrigin(downloadType) && PhotoPageFragment.this.mMenuManager != null) {
                PhotoPageFragment.this.mMenuManager.refreshDownloadItem(true, false);
            }
        }
    };
    /* access modifiers changed from: private */
    public DualCameraManager mDualCameraManager;
    /* access modifiers changed from: private */
    public PhotoEditorManager mEditorManager;
    /* access modifiers changed from: private */
    public FavoritesManager mFavoritesManager;
    private boolean mFromRecommendFacePage;
    private boolean mHasSendDismissCast;
    private boolean mIsNightMode;
    private boolean mIsSupportFordBurst;
    /* access modifiers changed from: private */
    public PhotoMaskManager mMaskManager;
    /* access modifiers changed from: private */
    public MeituEditorManager mMeituEditorManager;
    /* access modifiers changed from: private */
    public MenuManager mMenuManager;
    private MotionPhotoManager mMotionPhotoManager;
    /* access modifiers changed from: private */
    public NFCManager mNFCManager;
    private OnExitListener mOnExitListener = new OnExitListener() {
        public void onExit() {
            PhotoPageFragment.this.doExit();
        }
    };
    private OnDisplayRectChangedListener mOnPhotoMatrixChangeListener = new OnDisplayRectChangedListener() {
        public void onDisplayRectChanged(RectF rectF) {
            if (!PhotoPageFragment.this.isEntering() && !PhotoPageFragment.this.isExiting()) {
                BaseDataItem dataItem = PhotoPageFragment.this.mAdapter.getDataItem(PhotoPageFragment.this.mPager.getCurrentItem());
                if (!(dataItem == null || PhotoPageFragment.this.mProjectManager == null || !PhotoPageFragment.this.mProjectManager.isConnected())) {
                    PhotoPageFragment.this.mProjectManager.updateRemoteView(dataItem, rectF);
                }
                if (PhotoPageFragment.this.mMaskManager != null) {
                    PhotoPageFragment.this.mMaskManager.refreshMask(false);
                }
            }
        }
    };
    private OnScaleChangedListener mOnPhotoScaleChangeListener = new OnScaleChangedListener() {
        public void onScaleChanged(float f, float f2, float f3) {
            if (!PhotoPageFragment.this.isEntering() && !PhotoPageFragment.this.isExiting()) {
                if (PhotoPageFragment.this.mChoiceManager != null) {
                    PhotoPageFragment.this.mChoiceManager.onPhotoScale(f3);
                }
                if (PhotoPageFragment.this.isActionBarVisible() && f2 > 1.0f && f3 > 1.0f) {
                    PhotoPageFragment.this.setActionBarVisible(false);
                }
                if (PhotoPageFragment.this.isTransparentTheme() && f3 < 1.0f && f2 < 1.0f && !PhotoPageDataCache.getInstance().isItemVisible(PhotoPageFragment.this.mPager.getCurrentItem())) {
                    PhotoPageDataCache.getInstance().viewToPosition(PhotoPageFragment.this.mPager.getCurrentItem());
                }
            }
        }
    };
    private OnSingleTapListener mOnSingleTapListener = new OnSingleTapListener() {
        public void onTap(float f, float f2) {
            if (PhotoPageFragment.this.isPreviewMode()) {
                PhotoPageFragment.this.doExit();
                return;
            }
            if (PhotoPageFragment.this.isActionBarVisible()) {
                PhotoPageFragment.this.setActionBarVisible(false);
            } else {
                PhotoPageFragment.this.setActionBarVisible(true);
                if (PhotoPageFragment.this.mUserShowBarIndex < 0) {
                    PhotoPageFragment.this.mUserShowBarIndex = PhotoPageFragment.this.mPager.getCurrentItem();
                }
            }
        }
    };
    /* access modifiers changed from: private */
    public OrientationManager mOrientationManager;
    private PhotoRefreshReceiver mPhotoRefreshReceiver;
    private boolean mPreviewMode;
    /* access modifiers changed from: private */
    public ProjectionManager mProjectManager;
    private RefocusManager mRefocusManager;
    private ScreenBroadcastReceiver mScreenReceiver;
    /* access modifiers changed from: private */
    public boolean mShowSecretInAddDialog;
    private SmartVideoGuideManager mSmartVideoGuideManager;
    /* access modifiers changed from: private */
    public SpecialTypeManager mSpecialTypeManager;
    /* access modifiers changed from: private */
    public boolean mStartWhenLocked;
    /* access modifiers changed from: private */
    public boolean mStartWhenLockedAndSecret;
    private int mTheme = 0;
    /* access modifiers changed from: private */
    public ThemeManager mThemeManager;
    /* access modifiers changed from: private */
    public PhotoPageTopBar mTopBar;
    /* access modifiers changed from: private */
    public int mUserShowBarIndex = -1;
    /* access modifiers changed from: private */
    public VideoPlayerManager mVideoPlayerManager;
    /* access modifiers changed from: private */
    public VideoPreviewManager mVideoPreviewManager;
    private VoiceAssistantReceiver mVoiceAssistantReceiver;

    private static final class AccelerometerRotationChangedListener extends ContentObserver {
        private final WeakReference<OrientationManager> mManagerRef;

        public AccelerometerRotationChangedListener(Handler handler, OrientationManager orientationManager) {
            super(handler);
            this.mManagerRef = new WeakReference<>(orientationManager);
        }

        public void onChange(boolean z) {
            OrientationManager orientationManager = this.mManagerRef != null ? (OrientationManager) this.mManagerRef.get() : null;
            if (orientationManager != null) {
                orientationManager.onAccelerometerRotationChanged();
            }
        }
    }

    private class BaseEditorManager {
        boolean mResultHandled;
        String mTargetFilePath;
        long mTargetId;
        private MediaUpdateTask mUpdateTask;

        private BaseEditorManager() {
            this.mTargetFilePath = null;
        }

        /* access modifiers changed from: 0000 */
        public void insertAndNotifyDataSet(String str) {
            insertAndNotifyDataSet(str, true);
        }

        /* access modifiers changed from: 0000 */
        public void insertAndNotifyDataSet(String str, boolean z) {
            insertAndNotifyDataSet(str, z, false);
        }

        /* access modifiers changed from: 0000 */
        public void insertAndNotifyDataSet(String str, boolean z, final boolean z2) {
            if (this.mUpdateTask == null) {
                this.mUpdateTask = new MediaUpdateTask();
            }
            this.mUpdateTask.execute(str, z, new Callback() {
                public void onInsertDone(String str) {
                    BaseEditorManager.this.notifyDataSetChange(str, z2);
                }
            });
        }

        /* access modifiers changed from: 0000 */
        public void notifyDataSetChange(long j) {
            PhotoPageFragment.this.getArguments().putLong("photo_focused_id", j);
            PhotoPageFragment.this.onContentChanged();
        }

        /* access modifiers changed from: 0000 */
        public void notifyDataSetChange(String str) {
            notifyDataSetChange(str, false);
        }

        /* access modifiers changed from: 0000 */
        public void notifyDataSetChange(String str, boolean z) {
            if (!TextUtils.isEmpty(str)) {
                BaseDataSet dataSet = PhotoPageFragment.this.mAdapter.getDataSet();
                if (dataSet != null) {
                    dataSet.addNewFile(str, PhotoPageFragment.this.mPager.getCurrentItem() + 1);
                }
                PhotoPageFragment.this.getArguments().putString("photo_focused_path", str);
                if (z) {
                    PhotoPageFragment.this.loadInBackground();
                } else {
                    PhotoPageFragment.this.onContentChanged();
                }
            }
        }

        public void onActivityResult(int i, Intent intent) {
            Log.d("BaseEditorManager", "EditorManager.onActivityResult");
        }

        public void onImageLoadFinish(String str) {
        }

        public void onStartEditor() {
            Log.d("BaseEditorManager", "EditorManager.onStartEditor");
        }

        public void release() {
            if (this.mUpdateTask != null) {
                this.mUpdateTask.cancel();
                this.mUpdateTask = null;
            }
        }

        /* access modifiers changed from: 0000 */
        public void setTargetId(long j) {
            this.mTargetId = j;
        }

        /* access modifiers changed from: 0000 */
        public void setTargetPath(String str) {
            this.mTargetFilePath = str;
        }
    }

    private class BurstPhotoManager implements Callback {
        BurstPhotoManager(SpecialTypeManager specialTypeManager) {
            specialTypeManager.addTypeCallback(64, this, 4);
        }

        private void notifyDataSetChange() {
            PhotoPageFragment.this.onContentChanged();
        }

        public int getEnterDrawableId() {
            return R.drawable.burst_photo_btn_large;
        }

        public int getEnterTextId() {
            return R.string.burst_photo_enter;
        }

        public void onActivityResult(Intent intent) {
            if (PhotoPageFragment.this.mSpecialTypeManager != null) {
                notifyDataSetChange();
                PhotoPageFragment.this.mSpecialTypeManager.updateItem(PhotoPageFragment.this.mAdapter.getDataItem(PhotoPageFragment.this.mPager.getCurrentItem()));
                PhotoPageFragment.this.mSpecialTypeManager.onActivityResult();
            }
        }

        public void onEnterClick(BaseDataItem baseDataItem) {
            if (baseDataItem != null) {
                if (PhotoPageFragment.this.getArguments().getBoolean("from_gallery", false)) {
                    BaseDataItem baseDataItem2 = baseDataItem;
                    IntentUtil.gotoBurstPhotoActivity(PhotoPageFragment.this.getActivity(), PhotoPageFragment.this, baseDataItem2, PhotoPageFragment.this.getArguments().getLong("album_id", -1), String.format("%s IN (%s)", new Object[]{"_id", TextUtils.join(",", baseDataItem.getBurstKeys())}));
                } else {
                    List<BaseDataItem> burstGroup = baseDataItem.getBurstGroup();
                    ArrayList arrayList = new ArrayList();
                    for (BaseDataItem baseDataItem3 : burstGroup) {
                        if (!TextUtils.isEmpty(baseDataItem3.getOriginalPath())) {
                            arrayList.add(baseDataItem3.getOriginalPath());
                        }
                    }
                    if (MiscUtil.isValid(arrayList)) {
                        BaseDataItem baseDataItem4 = baseDataItem;
                        IntentUtil.gotoBurstPhotoActivity(PhotoPageFragment.this.getActivity(), PhotoPageFragment.this, baseDataItem4, PhotoPageFragment.this.getArguments().getLong("album_id", -1), String.format("%s IN ('%s')", new Object[]{"alias_clear_thumbnail", TextUtils.join("','", arrayList)}));
                    }
                }
            }
        }

        public void onRecognized(BaseDataItem baseDataItem, boolean z) {
        }
    }

    private class ChoiceManager extends ChoiceManagerBase implements OnSlipListener {
        private boolean mBarsVisibleBeforeSlip;
        private boolean mIsInMultiWindow;
        private int mLastOrientation = 0;
        private PhotoChoiceTitle mPhotoChoiceTitle;
        private Intent mShareTargetIntent = null;
        private VerticalSlipLayout mSlipLayout;
        private boolean mSlipPending;
        private Runnable mSlipRunnable;
        private int mSlipState;
        private boolean mSlipped;
        private boolean mSupportSend;

        /* JADX WARNING: type inference failed for: r1v8, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v8, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 37
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        ChoiceManager() {
            super();
            this.mSlipLayout = (VerticalSlipLayout) PhotoPageFragment.this.getView().findViewById(R.id.slip_layout);
            this.mSlipLayout.setOnSlipListener(this);
            this.mPhotoChoiceTitle = (PhotoChoiceTitle) PhotoPageFragment.this.getView().findViewById(R.id.photo_choice_title);
            this.mIsInMultiWindow = ActivityCompat.isInMultiWindowMode(PhotoPageFragment.this.mActivity);
            onUiOrientationChanged(PhotoPageFragment.this.getResources().getConfiguration());
            boolean z = PhotoPageFragment.this.getArguments().getBoolean("com.miui.gallery.extra.photo_enter_choice_mode", false);
            if (z) {
                this.mSlipLayout.setDraggable(true);
                this.mSlipLayout.setSlippedWhenEnter(true);
                PhotoPageFragment.this.getArguments().remove("com.miui.gallery.extra.photo_enter_choice_mode");
            }
            setUpChooserFragment(0, z);
            this.mPhotoChoiceTitle.getExitButton().setOnClickListener(getChoiceModeExitButtonClickListener());
        }

        private void setPhotoChoiceTitleVisible(boolean z) {
            int i = z ? 0 : 4;
            if (i != this.mPhotoChoiceTitle.getVisibility()) {
                this.mPhotoChoiceTitle.setVisibility(i);
            }
        }

        private void setSlipLayoutDraggable(boolean z) {
            boolean z2 = true;
            if (!this.mSupportSend || (!this.mIsInMultiWindow && PhotoPageFragment.this.getResources().getConfiguration().orientation != 1)) {
                z2 = false;
            }
            this.mSlipLayout.setDraggable(z & z2);
        }

        public OnClickListener getChoiceModeExitButtonClickListener() {
            return new OnClickListener() {
                public void onClick(View view) {
                    ChoiceManager.this.onBackPressed();
                }
            };
        }

        /* access modifiers changed from: protected */
        public TextView getChoiceTitle() {
            return this.mPhotoChoiceTitle.getTitle();
        }

        /* access modifiers changed from: protected */
        public int getContainerId() {
            return R.id.child_container;
        }

        public void initSelected(BaseDataSet baseDataSet) {
            if (baseDataSet != null && this.mSlipLayout.isSlipped()) {
                BaseDataItem item = baseDataSet.getItem(null, baseDataSet.getInitPosition());
                if (item != null) {
                    this.mChoiceMode.setChecked(baseDataSet.getInitPosition(), item.getKey(), true);
                }
            }
        }

        public boolean isPendingSlipped() {
            return (this.mSlipState == 0 && isSlipped()) || this.mSlipPending || this.mBarsVisibleBeforeSlip || this.mSlipLayout.isFlingToSlipped();
        }

        public boolean isSlipped() {
            return this.mSlipLayout.isSlipped();
        }

        public boolean onBackPressed() {
            if (!this.mSlipLayout.isSlipped()) {
                return false;
            }
            this.mSlipLayout.setUnSlipped(true);
            return true;
        }

        public void onMultiWindowModeChanged(boolean z) {
            this.mIsInMultiWindow = z;
            if (z) {
                setSlipLayoutDraggable(true);
            }
        }

        public void onPhotoScale(float f) {
            setSlipLayoutDraggable(f <= 1.0f && this.mSupportSend);
        }

        /* access modifiers changed from: protected */
        public void onShared() {
            super.onShared();
            setUnSlipped(true);
        }

        public void onSlipEnd(boolean z) {
            this.mSlipped = z;
            if (!z) {
                onVisibilityChanged(false);
                setPhotoChoiceTitleVisible(false);
                this.mChoiceMode.unChooseAll();
                this.mChoiceMode.finish();
                if (PhotoPageFragment.this.mOrientationManager != null) {
                    PhotoPageFragment.this.mOrientationManager.setSensorEnable(true);
                    PhotoPageFragment.this.mOrientationManager.tryRestoreOrientation(false);
                }
                if (PhotoPageFragment.this.getArguments().getBoolean("com.miui.gallery.extra.show_menu_after_choice_mode", false)) {
                    PhotoPageFragment.this.setActionBarVisible(true);
                }
                if (PhotoPageFragment.this.mDualCameraManager != null) {
                    PhotoPageFragment.this.mDualCameraManager.tryChangeStereoBtnVisible(true);
                }
                PhotoPageFragment.this.setActionBarVisible(this.mBarsVisibleBeforeSlip);
                this.mBarsVisibleBeforeSlip = false;
                TalkBackUtil.requestAnnouncementEvent(this.mSlipLayout, PhotoPageFragment.this.getString(R.string.exit_choice_mode));
                GallerySamplingStatHelper.recordCountEvent("photo", "fast_share_mode_exit");
                return;
            }
            if (PhotoPageFragment.this.mOrientationManager != null) {
                PhotoPageFragment.this.mOrientationManager.setSensorEnable(false);
            }
            PhotoPageFragment.this.mActivity.setRequestedOrientation(1);
            BaseDataItem dataItem = PhotoPageFragment.this.mAdapter.getDataItem(PhotoPageFragment.this.mPager.getCurrentItem());
            if (dataItem != null) {
                this.mChoiceMode.setChecked(PhotoPageFragment.this.mPager.getCurrentItem(), dataItem.getKey(), true);
            }
            if (PhotoPageFragment.this.mDualCameraManager != null) {
                PhotoPageFragment.this.mDualCameraManager.tryChangeStereoBtnVisible(false);
            }
            TalkBackUtil.requestAnnouncementEvent(this.mSlipLayout, PhotoPageFragment.this.getString(R.string.enter_choice_mode));
            GallerySamplingStatHelper.recordCountEvent("photo", "fast_share_mode_enter");
            if (!(this.mShareTargetIntent == null || dataItem == null)) {
                if (this.mShareTargetIntent.getBooleanExtra("assistant_need_beauty", false) && (PhotoPageFragment.this.mPagerHelper.getCurrentItem() instanceof PhotoPageImageItem)) {
                    this.mChoiceMode.setRenderChecked(PhotoPageFragment.this.mPager.getCurrentItem(), dataItem.getKey(), true);
                }
                PhotoPageFragment.this.mChoiceManager.onIntentSelected(this.mShareTargetIntent);
                this.mShareTargetIntent = null;
            }
            if (dataItem != null && ImageFeatureCacheManager.getInstance().shouldShowSelectionStar(dataItem.getKey(), false, false, dataItem.getBurstKeys())) {
                ImageSelectionTipFragment.showImageSelectionTipDialogIfNecessary(PhotoPageFragment.this.getActivity());
            }
        }

        public void onSlipStart() {
            if (!this.mSlipped) {
                onVisibilityChanged(true);
                this.mBarsVisibleBeforeSlip = PhotoPageFragment.this.isActionBarVisible();
                PhotoPageFragment.this.setActionBarVisible(false);
                this.mChoiceMode = PhotoPageFragment.this.mAdapter.startActionMode(this);
                setPhotoChoiceTitleVisible(true);
                if (PhotoPageFragment.this.mDualCameraManager != null) {
                    PhotoPageFragment.this.mDualCameraManager.tryChangeStereoBtnVisible(false);
                }
                TalkBackUtil.requestAnnouncementEvent(this.mSlipLayout, PhotoPageFragment.this.getString(R.string.enter_choice_mode));
                GallerySamplingStatHelper.recordNumericPropertyEvent("best_image", "best_image_count", (long) ImageFeatureCacheManager.getInstance().getBestImageCount(false));
            }
        }

        public void onSlipStateChanged(int i) {
            this.mSlipState = i;
            if (i != 1) {
                PhotoPageFragment.this.refreshTheme(true);
            }
        }

        public void onSlipping(float f) {
        }

        public void onUiOrientationChanged(Configuration configuration) {
            if (configuration.orientation != this.mLastOrientation) {
                if (!this.mIsInMultiWindow) {
                    setUnSlipped(false);
                    if (configuration.orientation == 1) {
                        setSlipLayoutDraggable(true);
                        if (this.mSlipPending) {
                            this.mSlipPending = false;
                            if (this.mSlipRunnable == null) {
                                this.mSlipRunnable = new Runnable() {
                                    public void run() {
                                        if (PhotoPageFragment.this.isAdded()) {
                                            ChoiceManager.this.setSlipped(true);
                                        }
                                    }
                                };
                            }
                            ThreadManager.getMainHandler().removeCallbacks(this.mSlipRunnable);
                            ThreadManager.getMainHandler().postDelayed(this.mSlipRunnable, 200);
                        }
                    } else {
                        setSlipLayoutDraggable(false);
                    }
                }
                this.mLastOrientation = configuration.orientation;
            }
        }

        public void release() {
            if (this.mSlipRunnable != null) {
                ThreadManager.getMainHandler().removeCallbacks(this.mSlipRunnable);
            }
        }

        /* access modifiers changed from: 0000 */
        public void sendCurrentToShare(Intent intent) {
            this.mShareTargetIntent = intent;
            this.mSlipLayout.setSlipped(true);
        }

        public void setSlipped(boolean z) {
            if (this.mIsInMultiWindow || PhotoPageFragment.this.getResources().getConfiguration().orientation == 1) {
                if (this.mSupportSend) {
                    setSlipLayoutDraggable(true);
                }
                this.mSlipLayout.setSlipped(z);
                return;
            }
            PhotoPageFragment.this.mActivity.setRequestedOrientation(1);
            this.mSlipPending = true;
            if (PhotoPageFragment.this.mOrientationManager != null) {
                PhotoPageFragment.this.mOrientationManager.setSensorEnable(false);
            }
        }

        public void setUnSlipped(boolean z) {
            this.mSlipLayout.setUnSlipped(z);
        }

        public void settleItem(BaseDataItem baseDataItem) {
            if (baseDataItem != null) {
                this.mSupportSend = !PhotoPageFragment.this.mStartWhenLockedAndSecret && !PhotoPageFragment.this.isPreviewMode() && PhotoOperationsUtil.isSupportedOptions(baseDataItem.getSupportOperations(), 4);
                setSlipLayoutDraggable(this.mSupportSend);
            }
        }
    }

    protected interface DownloadCallback {
        void downloadSuccess(String str, BaseDataItem baseDataItem);
    }

    private class DualCameraManager implements OnClickListener {
        private Animation mAppearAnim;
        private Animation mDisapperAnim;
        private ViewGroup mDualCameraEnter;
        /* access modifiers changed from: private */
        public ExtraPhotoWrapper mDualWrapper;
        /* access modifiers changed from: private */
        public int mParseState = -1;
        private AsyncTask mParseTask;
        private AsyncTask mSaveTask;

        class ParsePhotoTask extends AsyncTask<String, Void, Boolean> {
            ParsePhotoTask() {
            }

            /* access modifiers changed from: protected */
            public Boolean doInBackground(String... strArr) {
                String str = strArr[0];
                if (!FileUtils.isFileExist(str)) {
                    return Boolean.valueOf(false);
                }
                return isCancelled() ? Boolean.valueOf(false) : Boolean.valueOf(DualCameraManager.this.mDualWrapper.isExtraPhoto(str));
            }

            /* access modifiers changed from: protected */
            public void onPostExecute(Boolean bool) {
                if (!isCancelled()) {
                    DualCameraManager.this.mParseState = bool.booleanValue() ? 1 : 0;
                    DualCameraManager.this.setStereoBtnVisible(bool.booleanValue());
                }
            }
        }

        class SaveDualPhotoTask extends AsyncTask<String, Void, String> {
            SaveDualPhotoTask() {
            }

            /* access modifiers changed from: protected */
            public String doInBackground(String... strArr) {
                MediaScanner.scanSingleFile(PhotoPageFragment.this.mActivity.getApplicationContext(), strArr[0]);
                return strArr[0];
            }

            /* access modifiers changed from: protected */
            public void onPostExecute(String str) {
                if (!isCancelled()) {
                    BaseDataSet dataSet = PhotoPageFragment.this.mAdapter.getDataSet();
                    if (dataSet != null) {
                        dataSet.addNewFile(str, PhotoPageFragment.this.mPager.getCurrentItem() + 1);
                    }
                    PhotoPageFragment.this.getArguments().putString("photo_focused_path", str);
                    PhotoPageFragment.this.onContentChanged();
                }
            }

            /* access modifiers changed from: protected */
            public void onPreExecute() {
            }
        }

        public DualCameraManager() {
            this.mDualCameraEnter = (ViewGroup) ((ViewStub) PhotoPageFragment.this.getView().findViewById(R.id.dualcamera_stub)).inflate().findViewById(R.id.dualcamera_enter);
            this.mDualWrapper = ExtraPhotoWrapper.getInstance();
        }

        private void appearView(View view, boolean z) {
            view.setVisibility(0);
            view.setOnClickListener(this);
            if (z) {
                view.clearAnimation();
                view.startAnimation(getAppearAnim());
            }
        }

        private void cancelParseTask() {
            if (this.mParseTask != null) {
                this.mParseTask.cancel(true);
                this.mParseTask = null;
                Log.d("PhotoPageFragment", "cancelParseTask");
            }
        }

        private void disappearView(View view, boolean z) {
            view.setVisibility(8);
            view.setOnClickListener(null);
            if (z) {
                view.clearAnimation();
                view.startAnimation(getDisappearAnim());
            }
        }

        private Animation getAppearAnim() {
            if (this.mAppearAnim == null) {
                this.mAppearAnim = new AlphaAnimation(0.0f, 1.0f);
                this.mAppearAnim.setDuration(400);
                this.mAppearAnim.setInterpolator(new AccelerateInterpolator());
            }
            this.mAppearAnim.reset();
            return this.mAppearAnim;
        }

        private Animation getDisappearAnim() {
            if (this.mDisapperAnim == null) {
                this.mDisapperAnim = new AlphaAnimation(1.0f, 0.0f);
                this.mDisapperAnim.setDuration(300);
                this.mDisapperAnim.setInterpolator(new AccelerateInterpolator());
            }
            this.mDisapperAnim.reset();
            return this.mDisapperAnim;
        }

        private boolean isExternalEnvOK(BaseDataItem baseDataItem) {
            if (!isDualCamera() || baseDataItem == null) {
                return false;
            }
            return PhotoOperationsUtil.isSupportedOptions(baseDataItem.getSupportOperations() & PhotoPageFragment.this.getArguments().getInt("support_operation_mask", -1), 512);
        }

        private boolean isLightStereoPhoto(BaseDataItem baseDataItem) {
            return baseDataItem != null && !TextUtils.isEmpty(baseDataItem.getOriginalPath());
        }

        /* access modifiers changed from: private */
        public void resolveSupportFunc() {
            int childCount = this.mDualCameraEnter.getChildCount();
            List resolveExtraFuncs = this.mDualWrapper.resolveExtraFuncs();
            ArrayList<View> arrayList = new ArrayList<>();
            for (int i = 0; i < childCount; i++) {
                View childAt = this.mDualCameraEnter.getChildAt(i);
                if (resolveExtraFuncs.contains(Integer.valueOf(childAt.getId()))) {
                    childAt.setOnClickListener(this);
                } else {
                    arrayList.add(childAt);
                }
            }
            for (View removeView : arrayList) {
                this.mDualCameraEnter.removeView(removeView);
            }
        }

        private void sendParseTask(String str) {
            cancelParseTask();
            Log.d("PhotoPageFragment", "excute parse task %s", (Object) str);
            this.mParseTask = new ParsePhotoTask().execute(new String[]{str});
        }

        /* access modifiers changed from: private */
        public void setStereoBtnVisible(boolean z) {
            clearAnim();
            if (z) {
                if (this.mDualCameraEnter.getVisibility() != 0) {
                    this.mDualCameraEnter.setVisibility(0);
                }
                if (PhotoPageFragment.this.isActionBarVisible()) {
                    showMoreFuncExceptRefocus(false);
                }
            } else if (this.mDualCameraEnter.getVisibility() != 8) {
                this.mDualCameraEnter.setVisibility(8);
            }
        }

        public void clearAnim() {
            if (isDualCamera()) {
                for (Integer intValue : this.mDualWrapper.resolveExtraFuncs()) {
                    int intValue2 = intValue.intValue();
                    if (intValue2 != R.id.refocus_enter) {
                        View findViewById = this.mDualCameraEnter.findViewById(intValue2);
                        if (findViewById != null) {
                            findViewById.clearAnimation();
                        }
                    }
                }
            }
        }

        public void hideMoreFuncExceptRefocus(boolean z) {
            if (isDualCamera() && this.mDualCameraEnter.getVisibility() == 0) {
                for (Integer intValue : this.mDualWrapper.resolveExtraFuncs()) {
                    int intValue2 = intValue.intValue();
                    if (intValue2 != R.id.refocus_enter) {
                        View findViewById = this.mDualCameraEnter.findViewById(intValue2);
                        if (findViewById != null) {
                            disappearView(findViewById, z);
                        }
                    }
                }
            }
        }

        public boolean isDualCamera() {
            return this.mDualWrapper.isExtraCamera();
        }

        /* JADX WARNING: type inference failed for: r3v2, types: [android.app.Fragment, com.miui.gallery.ui.PhotoPageFragment] */
        /* JADX WARNING: type inference failed for: r3v4, types: [android.app.Fragment, com.miui.gallery.ui.PhotoPageFragment] */
        /* JADX WARNING: type inference failed for: r3v6, types: [android.app.Fragment, com.miui.gallery.ui.PhotoPageFragment] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r3v2, types: [android.app.Fragment, com.miui.gallery.ui.PhotoPageFragment]
  assigns: [com.miui.gallery.ui.PhotoPageFragment]
  uses: [android.app.Fragment]
  mth insns count: 48
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 3 */
        public void onClick(View view) {
            if (isDualCamera() && this.mParseState == 1) {
                BaseDataItem dataItem = PhotoPageFragment.this.mAdapter.getDataItem(PhotoPageFragment.this.mPager.getCurrentItem());
                if (dataItem != null) {
                    if (PhotoPageFragment.this.needDismissKeyGuard()) {
                        PhotoPageFragment.this.dismissKeyGuard();
                    }
                    int id = view.getId();
                    if (id == R.id.fancycolor_enter) {
                        IntentUtil.startFancyColorAction(dataItem, PhotoPageFragment.this, PhotoPageFragment.this.mStartWhenLocked);
                        GallerySamplingStatHelper.recordCountEvent("photo", "view_fancy_color");
                    } else if (id == R.id.freeview_enter) {
                        IntentUtil.startFreeViewAction(dataItem, PhotoPageFragment.this, PhotoPageFragment.this.mStartWhenLocked);
                        GallerySamplingStatHelper.recordCountEvent("photo", "view_free_view");
                    } else if (id == R.id.refocus_enter) {
                        IntentUtil.startRefocusAction(dataItem, PhotoPageFragment.this, PhotoPageFragment.this.mStartWhenLocked);
                        GallerySamplingStatHelper.recordCountEvent("photo", "view_refocus");
                    }
                }
            }
        }

        public void onDestory() {
            cancelParseTask();
            if (this.mSaveTask != null) {
                this.mSaveTask.cancel(true);
                this.mSaveTask = null;
            }
        }

        public void onDualPhotoEdited(Intent intent) {
            if (intent != null) {
                Uri data = intent.getData();
                if (data != null) {
                    String path = "file".equals(data.getScheme()) ? data.getPath() : data.getLastPathSegment();
                    if (!TextUtils.isEmpty(path)) {
                        if (this.mSaveTask != null) {
                            this.mSaveTask.cancel(true);
                        }
                        this.mSaveTask = new SaveDualPhotoTask().execute(new String[]{path});
                    }
                }
            }
        }

        /* JADX WARNING: type inference failed for: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 6
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public void pause() {
            clearAnim();
            this.mDualWrapper.stop(PhotoPageFragment.this.mActivity);
        }

        /* JADX WARNING: type inference failed for: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 6
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public void resume() {
            this.mDualWrapper.start(PhotoPageFragment.this.mActivity, new StartCallback() {
                public void onStarted(boolean z) {
                    if (DualCameraManager.this.isDualCamera()) {
                        DualCameraManager.this.resolveSupportFunc();
                        DualCameraManager.this.tryChangeStereoBtnVisible(z);
                        BaseDataItem dataItem = PhotoPageFragment.this.mAdapter.getDataItem(PhotoPageFragment.this.mPager.getCurrentItem());
                        if (z && dataItem != null && FileMimeUtil.isImageFromMimeType(FileMimeUtil.getMimeType(dataItem.getOriginalPath()))) {
                            PhotoPageFragment.this.mPagerHelper.onStart();
                        }
                    }
                }
            });
        }

        public void settleItem(BaseDataItem baseDataItem) {
            this.mParseState = -1;
            if (isDualCamera()) {
                cancelParseTask();
                if (PhotoPageFragment.this.mChoiceManager != null && !PhotoPageFragment.this.mChoiceManager.isSlipped()) {
                    if (!isExternalEnvOK(baseDataItem) || !isLightStereoPhoto(baseDataItem)) {
                        this.mParseState = 0;
                        setStereoBtnVisible(false);
                        return;
                    }
                    sendParseTask(baseDataItem.getOriginalPath());
                    return;
                }
                return;
            }
            setStereoBtnVisible(false);
        }

        public void showMoreFuncExceptRefocus(boolean z) {
            if (isDualCamera() && this.mDualCameraEnter.getVisibility() == 0) {
                for (Integer intValue : this.mDualWrapper.resolveExtraFuncs()) {
                    int intValue2 = intValue.intValue();
                    if (intValue2 != R.id.refocus_enter) {
                        View findViewById = this.mDualCameraEnter.findViewById(intValue2);
                        if (findViewById != null) {
                            appearView(findViewById, z);
                        }
                    }
                }
            }
        }

        public void tryChangeStereoBtnVisible(boolean z) {
            if (isDualCamera()) {
                switch (this.mParseState) {
                    case -1:
                        if (z) {
                            settleItem(PhotoPageFragment.this.mAdapter.getDataItem(PhotoPageFragment.this.mPager.getCurrentItem()));
                            return;
                        } else {
                            setStereoBtnVisible(z);
                            return;
                        }
                    case 0:
                        if (!z) {
                            setStereoBtnVisible(z);
                            return;
                        }
                        return;
                    case 1:
                        setStereoBtnVisible(z);
                        return;
                    default:
                        return;
                }
            }
        }

        public void updateItem(BaseDataItem baseDataItem) {
            this.mParseState = -1;
        }
    }

    private class FavoritesManager {
        private OnCompleteListener mAddCompleteListener = new OnCompleteListener() {
            /* JADX WARNING: type inference failed for: r6v5, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
            /* JADX WARNING: type inference failed for: r6v14, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
            /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r6v5, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 43
            	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
            	at java.util.ArrayList.forEach(Unknown Source)
            	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
            	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
            	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
            	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
            	at java.util.ArrayList.forEach(Unknown Source)
            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
            	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
            	at java.util.ArrayList.forEach(Unknown Source)
            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
            	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
            	at java.util.ArrayList.forEach(Unknown Source)
            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
            	at jadx.core.ProcessClass.process(ProcessClass.java:30)
            	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
            	at java.util.ArrayList.forEach(Unknown Source)
            	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
            	at jadx.core.ProcessClass.process(ProcessClass.java:35)
            	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
            	at jadx.api.JavaClass.decompile(JavaClass.java:62)
            	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
             */
            /* JADX WARNING: Unknown variable types count: 2 */
            public void onComplete(long[] jArr) {
                if (PhotoPageFragment.this.activityAlive()) {
                    if (jArr == null || jArr[0] <= 0) {
                        FavoritesManager.this.refreshStatus();
                        ToastUtils.makeText((Context) PhotoPageFragment.this.mActivity, (int) R.string.add_to_favorites_failed);
                    } else {
                        FavoritesManager.this.sendQueryTask(PhotoPageFragment.this.mAdapter.getDataItem(PhotoPageFragment.this.mPager.getCurrentItem()));
                        if (Favorites.isFirstTimeAddToFavorites()) {
                            ToastUtils.makeText((Context) PhotoPageFragment.this.mActivity, (int) R.string.added_to_favorites_tip);
                        } else {
                            TalkBackUtil.requestAnnouncementEvent(PhotoPageFragment.this.mPager, PhotoPageFragment.this.mActivity.getResources().getString(R.string.added_to_favorites_desc));
                        }
                    }
                    FavoritesManager.this.mIsToggling = false;
                }
            }
        };
        /* access modifiers changed from: private */
        public FavoriteInfo mFavoriteInfo;
        /* access modifiers changed from: private */
        public boolean mIsToggling;
        private Menu mMenu;
        private AsyncTask mQueryTask;
        private OnCompleteListener mRemoveCompleteListener = new OnCompleteListener() {
            /* JADX WARNING: type inference failed for: r6v5, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
            /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r6v5, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 37
            	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
            	at java.util.ArrayList.forEach(Unknown Source)
            	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
            	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
            	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
            	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
            	at java.util.ArrayList.forEach(Unknown Source)
            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
            	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
            	at java.util.ArrayList.forEach(Unknown Source)
            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
            	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
            	at java.util.ArrayList.forEach(Unknown Source)
            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
            	at jadx.core.ProcessClass.process(ProcessClass.java:30)
            	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
            	at java.util.ArrayList.forEach(Unknown Source)
            	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
            	at jadx.core.ProcessClass.process(ProcessClass.java:35)
            	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
            	at jadx.api.JavaClass.decompile(JavaClass.java:62)
            	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
             */
            /* JADX WARNING: Unknown variable types count: 1 */
            public void onComplete(long[] jArr) {
                if (PhotoPageFragment.this.activityAlive()) {
                    if (jArr == null || jArr[0] <= 0) {
                        FavoritesManager.this.refreshStatus();
                        ToastUtils.makeText((Context) PhotoPageFragment.this.mActivity, (int) R.string.remove_from_favorites_failed);
                    } else {
                        FavoritesManager.this.sendQueryTask(PhotoPageFragment.this.mAdapter.getDataItem(PhotoPageFragment.this.mPager.getCurrentItem()));
                        TalkBackUtil.requestAnnouncementEvent(PhotoPageFragment.this.mPager, PhotoPageFragment.this.mActivity.getResources().getString(R.string.removed_from_favorites_desc));
                    }
                    FavoritesManager.this.mIsToggling = false;
                }
            }
        };

        class QueryTask extends AsyncTask<Void, Void, FavoriteInfo> {
            /* access modifiers changed from: private */
            public BaseDataItem item;

            public QueryTask(BaseDataItem baseDataItem) {
                this.item = baseDataItem;
            }

            /* access modifiers changed from: protected */
            public FavoriteInfo doInBackground(Void... voidArr) {
                if (isCancelled() || this.item == null) {
                    return null;
                }
                return this.item.getFavoriteInfo(FavoritesManager.this.usingStrictMode());
            }

            /* access modifiers changed from: protected */
            public void onPostExecute(FavoriteInfo favoriteInfo) {
                if (!isCancelled()) {
                    this.item = null;
                    FavoritesManager.this.mFavoriteInfo = favoriteInfo;
                    FavoritesManager.this.refreshStatus();
                }
            }
        }

        public FavoritesManager(Menu menu) {
            this.mMenu = menu;
            if (PhotoPageFragment.this.mAdapter != null) {
                sendQueryTask(PhotoPageFragment.this.mAdapter.getDataItem(PhotoPageFragment.this.mPager.getCurrentItem()));
            }
        }

        private void cancelQueryTask() {
            if (this.mQueryTask != null) {
                this.mQueryTask.cancel(true);
                this.mQueryTask = null;
            }
        }

        /* access modifiers changed from: private */
        public void sendQueryTask(BaseDataItem baseDataItem) {
            if (this.mQueryTask == null || baseDataItem != ((QueryTask) this.mQueryTask).item) {
                cancelQueryTask();
                this.mQueryTask = new QueryTask(baseDataItem).execute(new Void[0]);
            }
        }

        private void setFavoriteChecked(boolean z) {
            MenuItem findItem = this.mMenu.findItem(R.id.action_favorite);
            if (findItem != null && findItem.isChecked() != z) {
                findItem.setChecked(z);
            }
        }

        private void setFavoriteVisible(boolean z) {
            MenuItem findItem = this.mMenu.findItem(R.id.action_favorite);
            if (findItem != null && findItem.isVisible() != z) {
                findItem.setVisible(z);
            }
        }

        /* access modifiers changed from: private */
        public boolean usingStrictMode() {
            return !PhotoPageFragment.this.isFromCamera;
        }

        public void hide() {
        }

        public void onDestroy() {
            cancelQueryTask();
            this.mAddCompleteListener = null;
            this.mRemoveCompleteListener = null;
        }

        public void refreshStatus() {
            if (this.mFavoriteInfo == null || !this.mFavoriteInfo.isFavoriteUsable()) {
                setFavoriteVisible(false);
                return;
            }
            setFavoriteVisible(true);
            setFavoriteChecked(this.mFavoriteInfo.isFavorite());
        }

        public void show() {
        }

        /* JADX WARNING: type inference failed for: r0v7, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* JADX WARNING: type inference failed for: r0v10, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* JADX WARNING: type inference failed for: r0v13, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v7, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 53
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 3 */
        public void toggle() {
            if (this.mIsToggling) {
                Log.d("PhotoPageFragment", "skip frequent toggle");
            } else if (PhotoPageFragment.this.isProcessingMedia(PhotoPageFragment.this.mAdapter.getDataItem(PhotoPageFragment.this.mPager.getCurrentItem()))) {
                ToastUtils.makeText((Context) PhotoPageFragment.this.mActivity, (int) R.string.operate_processing_file_error);
            } else {
                MenuItem findItem = this.mMenu.findItem(R.id.action_favorite);
                if (findItem != null) {
                    this.mIsToggling = true;
                    boolean isChecked = findItem.isChecked();
                    setFavoriteChecked(!isChecked);
                    BaseDataSet dataSet = PhotoPageFragment.this.mAdapter.getDataSet();
                    if (dataSet != null) {
                        if (!isChecked) {
                            dataSet.addToFavorites(PhotoPageFragment.this.mActivity, PhotoPageFragment.this.mPager.getCurrentItem(), this.mAddCompleteListener);
                            GallerySamplingStatHelper.recordCountEvent("favorites", "add_to_favorites");
                        } else {
                            dataSet.removeFromFavorites(PhotoPageFragment.this.mActivity, PhotoPageFragment.this.mPager.getCurrentItem(), this.mRemoveCompleteListener);
                            GallerySamplingStatHelper.recordCountEvent("favorites", "remove_from_favorites");
                        }
                    }
                }
            }
        }

        public void updateItem(BaseDataItem baseDataItem) {
            this.mFavoriteInfo = null;
            sendQueryTask(baseDataItem);
        }
    }

    private static class MediaUpdateTask {
        /* access modifiers changed from: private */
        public Callback mCallback;
        private Future<Void> mFuture;

        public interface Callback {
            void onInsertDone(String str);
        }

        private MediaUpdateTask() {
        }

        public void cancel() {
            if (this.mFuture != null) {
                this.mFuture.cancel();
                this.mFuture = null;
            }
            this.mCallback = null;
        }

        public void execute(final String str, final boolean z, Callback callback) {
            if (!TextUtils.isEmpty(str)) {
                if (this.mFuture != null) {
                    this.mFuture.cancel();
                }
                this.mCallback = callback;
                this.mFuture = ThreadManager.getMiscPool().submit(new Job<Void>() {
                    public Void run(JobContext jobContext) {
                        Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
                        MediaScanner.scanSingleFile(sGetAndroidContext, str);
                        if (z) {
                            int i = str.endsWith(".mp4") ? 2 : 1;
                            MediaStoreUtils.insert(sGetAndroidContext, str, i);
                            if (i == 2) {
                                MediaStoreUtils.sendScannerBroadcast(sGetAndroidContext, str);
                            }
                        }
                        return null;
                    }
                }, new FutureHandler<Void>() {
                    public void onPostExecute(Future<Void> future) {
                        if (!future.isCancelled() && MediaUpdateTask.this.mCallback != null) {
                            MediaUpdateTask.this.mCallback.onInsertDone(str);
                        }
                    }
                });
            }
        }
    }

    private class MeituEditorManager extends UpdatableEditorManager {
        private MeituEditorManager() {
            super();
        }

        /* access modifiers changed from: protected */
        public String getTargetPackageName() {
            return "com.mt.mtxx.mtxx";
        }

        /* access modifiers changed from: protected */
        public boolean shouldInsertMediaStore() {
            return false;
        }
    }

    private class MenuManager {
        private final int ORDER_IMAGE = 0;
        private final int ORDER_UNKNOWN = -1;
        private final int ORDER_VIDEO = 1;
        private Menu mMenu;
        private int mOperationMask;
        private int mOrder = -1;

        MenuManager(Menu menu, int i) {
            this.mMenu = menu;
            this.mOperationMask = i;
        }

        private void configMenu(BaseDataItem baseDataItem) {
            if (baseDataItem != null) {
                boolean z = true;
                if (!PhotoPageFragment.this.isPreviewMode()) {
                    if (baseDataItem.isVideo()) {
                        if (this.mOrder != 1) {
                            makeVideoOrder();
                            this.mOrder = 1;
                        }
                    } else if (this.mOrder != 0) {
                        makeImageOrder();
                        this.mOrder = 0;
                    }
                }
                int supportOperations = baseDataItem.getSupportOperations() & this.mOperationMask;
                setMenuItemVisibility(R.id.action_delete, PhotoOperationsUtil.isSupportedOptions(supportOperations, 1));
                setMenuItemVisibility(R.id.action_save, PhotoOperationsUtil.isSupportedOptions(supportOperations, nexEngine.ExportHEVCHighTierLevel52));
                setMenuItemVisibility(R.id.action_edit, !PhotoPageFragment.this.mStartWhenLockedAndSecret && PhotoOperationsUtil.isSupportedOptions(supportOperations, 512));
                setMenuItemVisibility(R.id.action_send, !PhotoPageFragment.this.mStartWhenLockedAndSecret && PhotoOperationsUtil.isSupportedOptions(supportOperations, 4));
                setMenuItemVisibility(R.id.action_set_wallpaper, !PhotoPageFragment.this.mStartWhenLockedAndSecret && PhotoOperationsUtil.isSupportedOptions(supportOperations, 32));
                setMenuItemVisibility(R.id.action_set_slide_wallpaper, !PhotoPageFragment.this.mStartWhenLockedAndSecret && PhotoOperationsUtil.isSupportedOptions(supportOperations, 2048));
                setMenuItemVisibility(R.id.action_add_cloud, !PhotoPageFragment.this.mStartWhenLockedAndSecret && PhotoOperationsUtil.isSupportedOptions(supportOperations, nexEngine.ExportHEVCMainTierLevel6));
                setMenuItemVisibility(R.id.action_play_slideshow, !PhotoPageFragment.this.mStartWhenLockedAndSecret && PhotoOperationsUtil.isSupportedOptions(supportOperations, nexEngine.ExportHEVCMainTierLevel52));
                setMenuItemVisibility(R.id.action_remove_secret, !PhotoPageFragment.this.mStartWhenLockedAndSecret && PhotoOperationsUtil.isSupportedOptions(supportOperations, nexEngine.ExportHEVCMainTierLevel62));
                setMenuItemVisibility(R.id.action_set_video_wallpaper, PhotoOperationsUtil.isSupportedOptions(supportOperations, 4096));
                refreshDownloadItem(getDownloadOriginTitle(baseDataItem), PhotoOperationsUtil.isSupportedOptions(supportOperations, 256), true);
                PhotoPageFragment photoPageFragment = PhotoPageFragment.this;
                if (PhotoPageFragment.this.mStartWhenLockedAndSecret || !PhotoOperationsUtil.isSupportedOptions(supportOperations, nexEngine.ExportHEVCHighTierLevel61)) {
                    z = false;
                }
                photoPageFragment.mShowSecretInAddDialog = z;
                if (PhotoPageFragment.this.mProjectManager == null) {
                    refreshCastItem(null, false, false);
                } else if (baseDataItem.getOriginalPath() == null || !URLUtil.isContentUrl(baseDataItem.getOriginalPath())) {
                    PhotoPageFragment.this.mProjectManager.refreshProjectState();
                } else {
                    refreshCastItem(null, false, false);
                }
            }
        }

        /* JADX WARNING: type inference failed for: r2v4, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v4, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 18
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        private void doDelete(int i) {
            BaseDataSet dataSet = PhotoPageFragment.this.mAdapter.getDataSet();
            final BaseDataItem dataItem = PhotoPageFragment.this.mAdapter.getDataItem(PhotoPageFragment.this.mPager.getCurrentItem());
            if (dataSet != null && dataItem != null) {
                dataSet.delete(PhotoPageFragment.this.mActivity, i, new OnDeletionCompleteListener() {
                    /* JADX WARNING: type inference failed for: r3v6, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
                    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r3v6, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 22
                    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
                    	at java.util.ArrayList.forEach(Unknown Source)
                    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
                    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
                    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
                    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
                    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
                    	at java.util.ArrayList.forEach(Unknown Source)
                    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
                    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
                    	at java.util.ArrayList.forEach(Unknown Source)
                    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
                    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
                    	at java.util.ArrayList.forEach(Unknown Source)
                    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
                    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
                    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
                    	at java.util.ArrayList.forEach(Unknown Source)
                    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
                    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
                    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
                    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
                    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
                     */
                    /* JADX WARNING: Unknown variable types count: 1 */
                    public void onDeleted(int i, long[] jArr) {
                        if (PhotoPageFragment.this.mActivity != null) {
                            PhotoPageFragment.this.onContentChanged();
                            ExtraPhotoSDK.sendDeletePhotoStatic(dataItem.getSpecialTypeFlags());
                            if (i > 0) {
                                SoundUtils.playSoundForOperation(PhotoPageFragment.this.mActivity, 0);
                            } else if (i == -112) {
                                DocumentProviderUtils.startExtSDCardPermissionActivityForResult(PhotoPageFragment.this.getActivity());
                            }
                        }
                    }
                });
            }
        }

        /* JADX WARNING: type inference failed for: r4v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: type inference failed for: r9v8, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r4v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 41
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 2 */
        private String getDownloadOriginTitle(BaseDataItem baseDataItem) {
            if (baseDataItem == null) {
                return null;
            }
            if (baseDataItem.isBurstItem()) {
                long j = 0;
                List<BaseDataItem> burstGroup = baseDataItem.getBurstGroup();
                for (BaseDataItem size : burstGroup) {
                    j += size.getSize();
                }
                String quantityString = PhotoPageFragment.this.getResources().getQuantityString(R.plurals.burst_image_download_item_title_count, burstGroup.size(), new Object[]{Integer.valueOf(burstGroup.size())});
                return PhotoPageFragment.this.getResources().getString(R.string.burst_image_download_item_title, new Object[]{quantityString, FormatUtil.formatFileSize(PhotoPageFragment.this.mActivity, j)});
            }
            return PhotoPageFragment.this.getResources().getString(R.string.image_download_item_title, new Object[]{FormatUtil.formatFileSize(PhotoPageFragment.this.mActivity, baseDataItem.getSize())});
        }

        private boolean isOperationWithoutKeyGuard(int i) {
            return i == R.id.action_send || i == R.id.action_edit || i == R.id.action_set_wallpaper || i == R.id.action_add_cloud;
        }

        private void makeImageOrder() {
            this.mMenu.removeItem(R.id.action_edit);
            this.mMenu.add(0, R.id.action_edit, 2, R.string.operation_edit).setIcon(R.drawable.button_beautify_light);
            this.mMenu.findItem(R.id.action_edit).setShowAsAction(2);
            this.mMenu.removeItem(R.id.action_add_cloud);
            this.mMenu.add(0, R.id.action_add_cloud, 5, R.string.operation_add_album).setIcon(R.drawable.button_new_light).setShowAsAction(2);
        }

        private void makeVideoOrder() {
            this.mMenu.removeItem(R.id.action_edit);
            if (Build.supportVideoEditor()) {
                this.mMenu.add(0, R.id.action_edit, 2, R.string.operation_edit_video).setIcon(R.drawable.button_beautify_light);
                this.mMenu.findItem(R.id.action_edit).setShowAsAction(2);
            }
            this.mMenu.removeItem(R.id.action_add_cloud);
            this.mMenu.add(0, R.id.action_add_cloud, 4, R.string.operation_add_album).setIcon(R.drawable.button_new_light).setShowAsAction(2);
        }

        /* JADX WARNING: type inference failed for: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* access modifiers changed from: private */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 7
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public void onGetVideoWallpaperFileFailed() {
            ToastUtils.makeText((Context) PhotoPageFragment.this.mActivity, (int) R.string.set_video_wallpaper_failed);
            GallerySamplingStatHelper.recordCountEvent("video", "set_slide_wallpaper_fail");
        }

        /* JADX WARNING: type inference failed for: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 4
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        private void onGetWallpaperFileFailed() {
            ToastUtils.makeText((Context) PhotoPageFragment.this.mActivity, (int) R.string.set_wallpaper_get_image_failed);
        }

        /* access modifiers changed from: private */
        public void refreshDownloadItem(String str, boolean z, boolean z2) {
            MenuItem findItem = this.mMenu.findItem(R.id.action_download_original);
            if (findItem != null) {
                if (!TextUtils.isEmpty(str) && !str.equals(findItem.getTitle())) {
                    findItem.setTitle(str);
                }
                if (findItem.isVisible() != z) {
                    findItem.setVisible(z);
                }
                if (findItem.isEnabled() != z2) {
                    findItem.setEnabled(z2);
                }
            }
        }

        /* access modifiers changed from: private */
        public void setMenuItemVisibility(int i, boolean z) {
            MenuItem findItem = this.mMenu.findItem(i);
            if (!(findItem == null || findItem.isVisible() == z)) {
                findItem.setVisible(z);
            }
        }

        /* JADX WARNING: type inference failed for: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* access modifiers changed from: private */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 7
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public void setSlideWallpaper(Uri uri, String str) {
            if (uri == null) {
                onGetWallpaperFileFailed();
            } else {
                SlideWallpaperUtils.setSlideWallpaper(PhotoPageFragment.this.mActivity, uri, str);
            }
        }

        /* JADX WARNING: type inference failed for: r0v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* access modifiers changed from: private */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 8
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public void setVideoWallpaper(String str) {
            if (TextUtils.isEmpty(str)) {
                onGetVideoWallpaperFileFailed();
            } else {
                VideoWallpaperUtils.setVideoWallpaper(PhotoPageFragment.this.mActivity, str);
            }
        }

        /* JADX WARNING: type inference failed for: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* access modifiers changed from: private */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 10
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public void setWallpaper(Uri uri, String str) {
            if (uri == null) {
                onGetWallpaperFileFailed();
                return;
            }
            WallpaperUtils.setWallPapers(PhotoPageFragment.this.mActivity, uri, str);
            GallerySamplingStatHelper.recordCountEvent("photo", "set_as_wallpaper");
        }

        /* access modifiers changed from: private */
        public void setWallpaper(String str) {
            if (FileUtils.isFileExist(str)) {
                setWallpaper(Uri.fromFile(new File(str)), FileMimeUtil.getMimeType(str));
                return;
            }
            onGetWallpaperFileFailed();
        }

        /* JADX WARNING: type inference failed for: r3v0, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* JADX WARNING: type inference failed for: r14v21, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* JADX WARNING: type inference failed for: r14v33, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* JADX WARNING: type inference failed for: r14v42, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* JADX WARNING: type inference failed for: r0v22, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* JADX WARNING: type inference failed for: r14v74, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* JADX WARNING: type inference failed for: r1v8, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: type inference failed for: r1v10, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: type inference failed for: r2v22, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r3v0, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 257
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 9 */
        public void onMenuItemClick(MenuItem menuItem) {
            int itemId = menuItem.getItemId();
            final BaseDataItem dataItem = PhotoPageFragment.this.mAdapter.getDataItem(PhotoPageFragment.this.mPager.getCurrentItem());
            if (dataItem != null) {
                if (PhotoPageFragment.this.needDismissKeyGuard() && isOperationWithoutKeyGuard(itemId)) {
                    PhotoPageFragment.this.dismissKeyGuard();
                }
                String access$3100 = PhotoPageFragment.this.getItemClickEventCategory(dataItem);
                switch (itemId) {
                    case R.id.action_add_cloud /*2131296258*/:
                        if (!PhotoPageFragment.this.prohibitOperateProcessingItem(dataItem)) {
                            BaseDataSet dataSet = PhotoPageFragment.this.mAdapter.getDataSet();
                            if (dataSet != null) {
                                dataSet.addToAlbum(PhotoPageFragment.this.mActivity, PhotoPageFragment.this.mPager.getCurrentItem(), true, PhotoPageFragment.this.mShowSecretInAddDialog, new OnAddAlbumListener() {
                                    public void onComplete(long[] jArr, boolean z) {
                                        if (z && jArr != null && jArr[0] > 0) {
                                            PhotoPageFragment.this.onContentChanged();
                                        }
                                    }
                                });
                            }
                            GallerySamplingStatHelper.recordCountEvent(access$3100, "add_to_album");
                            break;
                        } else {
                            return;
                        }
                    case R.id.action_cast /*2131296261*/:
                        if (PhotoPageFragment.this.mProjectManager != null) {
                            PhotoPageFragment.this.mProjectManager.projectClicked();
                            GallerySamplingStatHelper.recordCountEvent(access$3100, "project_photo");
                            break;
                        }
                        break;
                    case R.id.action_delete /*2131296265*/:
                        doDelete(PhotoPageFragment.this.mPager.getCurrentItem());
                        GallerySamplingStatHelper.recordCountEvent(access$3100, "delete_photo");
                        break;
                    case R.id.action_details /*2131296266*/:
                        IntentUtil.gotoPhotoDetailPage(PhotoPageFragment.this.mActivity, PhotoPageFragment.this.mAdapter.getDataItem(PhotoPageFragment.this.mPager.getCurrentItem()), PhotoPageFragment.this.mStartWhenLocked);
                        GallerySamplingStatHelper.recordCountEvent(access$3100, "view_detail");
                        break;
                    case R.id.action_download_original /*2131296268*/:
                        PhotoPageFragment.this.downloadOrigin();
                        GallerySamplingStatHelper.recordCountEvent(access$3100, "download_origin");
                        break;
                    case R.id.action_edit /*2131296269*/:
                        if (!PhotoPageFragment.this.prohibitOperateProcessingItem(dataItem)) {
                            if (!IntentUtil.isSupportMeituEditor() || dataItem.isVideo() || dataItem.isSecret() || !IntentUtil.startMeituEditAction(dataItem, PhotoPageFragment.this.mActivity, PhotoPageFragment.this)) {
                                if (IntentUtil.startEditAction(dataItem, PhotoPageFragment.this.mActivity, PhotoPageFragment.this) && PhotoPageFragment.this.mEditorManager != null) {
                                    PhotoPageFragment.this.mEditorManager.onStartEditor();
                                }
                            } else if (PhotoPageFragment.this.mMeituEditorManager != null) {
                                PhotoPageFragment.this.mMeituEditorManager.onStartEditor();
                            }
                            GallerySamplingStatHelper.recordCountEvent(access$3100, dataItem.isVideo() ? "edit_video" : "edit_photo");
                            break;
                        } else {
                            return;
                        }
                    case R.id.action_favorite /*2131296270*/:
                        if (PhotoPageFragment.this.mFavoritesManager != null) {
                            PhotoPageFragment.this.mFavoritesManager.toggle();
                            break;
                        }
                        break;
                    case R.id.action_play_slideshow /*2131296278*/:
                        if (PhotoPageFragment.this.mProjectManager == null || !PhotoPageFragment.this.mProjectManager.isConnected()) {
                            PhotoPageFragment.this.getArguments().putInt("photo_init_position", PhotoPageFragment.this.mPager.getCurrentItem());
                            BaseDataItem dataItem2 = PhotoPageFragment.this.mAdapter.getDataItem(PhotoPageFragment.this.mPager.getCurrentItem());
                            if (dataItem2 != null) {
                                ImageLoadParams imageLoadParams = new ImageLoadParams(dataItem2.getKey(), TextUtils.isEmpty(dataItem2.getOriginalPath()) ? dataItem2.getThumnailPath() : dataItem2.getOriginalPath(), (ImageSize) null, (RectF) null, PhotoPageFragment.this.mPager.getCurrentItem(), dataItem2.getMimeType(), dataItem2.getSecretKey(), dataItem2.getSize());
                                PhotoPageFragment.this.getArguments().putParcelable("photo_transition_data", imageLoadParams);
                            }
                            SlideShowFragment.showSlideShowFragment(PhotoPageFragment.this.mActivity, PhotoPageFragment.this.getArguments());
                        } else {
                            PhotoPageFragment.this.mProjectManager.enterSlideShow(PhotoPageFragment.this.mPager.getCurrentItem());
                        }
                        GallerySamplingStatHelper.recordCountEvent(access$3100, "play_slide_show");
                        break;
                    case R.id.action_remove_secret /*2131296282*/:
                        BaseDataSet dataSet2 = PhotoPageFragment.this.mAdapter.getDataSet();
                        if (dataSet2 != null) {
                            dataSet2.removeFromSecret(PhotoPageFragment.this.mActivity, PhotoPageFragment.this.mPager.getCurrentItem(), new OnCompleteListener() {
                                public void onComplete(long[] jArr) {
                                    if (jArr != null && jArr[0] > 0) {
                                        PhotoPageFragment.this.onContentChanged();
                                    }
                                }
                            });
                        }
                        GallerySamplingStatHelper.recordCountEvent(access$3100, "remove_from_secret");
                        break;
                    case R.id.action_save /*2131296283*/:
                        dataItem.save(PhotoPageFragment.this.mActivity, new SaveUriDialogFragment.OnCompleteListener() {
                            /* JADX WARNING: type inference failed for: r0v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
                            /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 16
                            	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
                            	at java.util.ArrayList.forEach(Unknown Source)
                            	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
                            	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
                            	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
                            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
                            	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
                            	at java.util.ArrayList.forEach(Unknown Source)
                            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
                            	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
                            	at java.util.ArrayList.forEach(Unknown Source)
                            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
                            	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
                            	at java.util.ArrayList.forEach(Unknown Source)
                            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
                            	at jadx.core.ProcessClass.process(ProcessClass.java:30)
                            	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
                            	at java.util.ArrayList.forEach(Unknown Source)
                            	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
                            	at jadx.core.ProcessClass.process(ProcessClass.java:35)
                            	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
                            	at jadx.api.JavaClass.decompile(JavaClass.java:62)
                            	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
                             */
                            /* JADX WARNING: Unknown variable types count: 1 */
                            public void onComplete(String str) {
                                int i;
                                if (TextUtils.isEmpty(str)) {
                                    i = R.string.photo_page_save_uri_image_fail;
                                } else {
                                    MenuManager.this.setMenuItemVisibility(R.id.action_save, false);
                                    i = R.string.photo_page_save_uri_image_ok;
                                }
                                DialogUtil.showInfoDialog(PhotoPageFragment.this.mActivity, PhotoPageFragment.this.mActivity.getResources().getString(i), null);
                            }
                        });
                        GallerySamplingStatHelper.recordCountEvent(access$3100, "save_photo");
                        break;
                    case R.id.action_send /*2131296285*/:
                        if (!PhotoPageFragment.this.prohibitOperateProcessingItem(dataItem)) {
                            if (PhotoPageFragment.this.mChoiceManager != null) {
                                PhotoPageFragment.this.mChoiceManager.setSlipped(true);
                            }
                            GallerySamplingStatHelper.recordCountEvent(access$3100, "send");
                            break;
                        } else {
                            return;
                        }
                    case R.id.action_set_slide_wallpaper /*2131296287*/:
                        GallerySamplingStatHelper.recordCountEvent(access$3100, "set_slide_wallpaper_click");
                        if (!PhotoPageFragment.this.prohibitOperateProcessingItem(dataItem)) {
                            MenuItem findItem = this.mMenu.findItem(R.id.action_download_original);
                            if (findItem != null && findItem.isVisible()) {
                                DialogUtil.showInfoDialog((Context) PhotoPageFragment.this.mActivity, (int) R.string.set_as_slide_wallpaper_description, (int) R.string.set_as_slide_wallpaper_title, (int) R.string.yes, (int) R.string.no, (DialogInterface.OnClickListener) new DialogInterface.OnClickListener() {
                                    public void onClick(DialogInterface dialogInterface, int i) {
                                        PhotoPageFragment.this.downloadOrigin(dataItem, new DownloadCallback() {
                                            public void downloadSuccess(String str, BaseDataItem baseDataItem) {
                                                MenuManager.this.setSlideWallpaper(baseDataItem.getContentUriForExternal(), baseDataItem instanceof CloudItem ? ((CloudItem) baseDataItem).getSha1() : null);
                                            }
                                        });
                                    }
                                }, (DialogInterface.OnClickListener) new DialogInterface.OnClickListener() {
                                    public void onClick(DialogInterface dialogInterface, int i) {
                                        MenuManager.this.setSlideWallpaper(dataItem.getContentUriForExternal(), dataItem instanceof CloudItem ? ((CloudItem) dataItem).getSha1() : null);
                                    }
                                });
                                break;
                            } else {
                                setSlideWallpaper(dataItem.getContentUriForExternal(), dataItem instanceof CloudItem ? ((CloudItem) dataItem).getSha1() : null);
                                break;
                            }
                        } else {
                            return;
                        }
                    case R.id.action_set_video_wallpaper /*2131296288*/:
                        GallerySamplingStatHelper.recordCountEvent("video", "set_slide_wallpaper_click");
                        if (!PhotoPageFragment.this.prohibitOperateProcessingItem(dataItem)) {
                            MenuItem findItem2 = this.mMenu.findItem(R.id.action_download_original);
                            if (findItem2 != null && findItem2.isVisible()) {
                                DialogUtil.showInfoDialog((Context) PhotoPageFragment.this.mActivity, (int) R.string.set_as_video_wallpaper_description, (int) R.string.set_as_video_wallpaper_title, (int) R.string.yes, (int) R.string.no, (DialogInterface.OnClickListener) new DialogInterface.OnClickListener() {
                                    public void onClick(DialogInterface dialogInterface, int i) {
                                        PhotoPageFragment.this.downloadOrigin(dataItem, new DownloadCallback() {
                                            public void downloadSuccess(String str, BaseDataItem baseDataItem) {
                                                MenuManager.this.setVideoWallpaper(baseDataItem.getOriginalPath());
                                            }
                                        });
                                    }
                                }, (DialogInterface.OnClickListener) new DialogInterface.OnClickListener() {
                                    public void onClick(DialogInterface dialogInterface, int i) {
                                        MenuManager.this.onGetVideoWallpaperFileFailed();
                                    }
                                });
                                break;
                            } else {
                                setVideoWallpaper(dataItem.getOriginalPath());
                                break;
                            }
                        } else {
                            return;
                        }
                        break;
                    case R.id.action_set_wallpaper /*2131296289*/:
                        if (!PhotoPageFragment.this.prohibitOperateProcessingItem(dataItem)) {
                            MenuItem findItem3 = this.mMenu.findItem(R.id.action_download_original);
                            if (findItem3 == null || !findItem3.isVisible()) {
                                setWallpaper(dataItem.getContentUriForExternal(), dataItem.getMimeType());
                            } else {
                                DialogUtil.showInfoDialog((Context) PhotoPageFragment.this.mActivity, (int) R.string.set_as_wallpaper_description, (int) R.string.set_as_wallpaper_title, (int) R.string.yes, (int) R.string.no, (DialogInterface.OnClickListener) new DialogInterface.OnClickListener() {
                                    public void onClick(DialogInterface dialogInterface, int i) {
                                        PhotoPageFragment.this.downloadOrigin(dataItem, new DownloadCallback() {
                                            public void downloadSuccess(String str, BaseDataItem baseDataItem) {
                                                MenuManager.this.setWallpaper(str);
                                            }
                                        });
                                    }
                                }, (DialogInterface.OnClickListener) new DialogInterface.OnClickListener() {
                                    public void onClick(DialogInterface dialogInterface, int i) {
                                        MenuManager.this.setWallpaper(dataItem.getContentUriForExternal(), dataItem.getMimeType());
                                    }
                                });
                            }
                            GallerySamplingStatHelper.recordCountEvent(access$3100, "set_wallpaper_click");
                            break;
                        } else {
                            return;
                        }
                        break;
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public void refreshCastItem(String str, boolean z, boolean z2) {
            MenuItem findItem = this.mMenu.findItem(R.id.action_cast);
            if (findItem != null) {
                if (!TextUtils.isEmpty(str) && !TextUtils.equals(str, findItem.getTitle())) {
                    findItem.setTitle(Html.fromHtml(str));
                }
                if (findItem.isVisible() != z) {
                    findItem.setVisible(z);
                }
                if (findItem.isEnabled() != z2) {
                    findItem.setEnabled(z2);
                }
            }
        }

        public void refreshDownloadItem(boolean z, boolean z2) {
            BaseDataItem dataItem = PhotoPageFragment.this.mAdapter.getDataItem(PhotoPageFragment.this.mPager.getCurrentItem());
            if (dataItem != null) {
                refreshDownloadItem(getDownloadOriginTitle(dataItem), z, z2);
            }
        }

        public void settleItem(BaseDataItem baseDataItem) {
            configMenu(baseDataItem);
        }
    }

    private class MotionPhotoManager extends TransitionEditorManager implements OnClickListener, Callback {
        private View mOperationView;
        private boolean mSupported;

        public MotionPhotoManager(SpecialTypeManager specialTypeManager, PhotoPageTopBar photoPageTopBar) {
            super();
            this.mSupported = ExtraPhotoSDK.isDeviceSupportMotionPhoto(PhotoPageFragment.this.getActivity());
            if (this.mSupported) {
                specialTypeManager.addTypeCallback(32, this, 1);
                this.mOperationView = photoPageTopBar.getOperationView();
                this.mOperationView.setOnClickListener(this);
            }
        }

        public int getEnterDrawableId() {
            return R.drawable.motion_photo_btn;
        }

        public int getEnterTextId() {
            return R.string.motion_photo_enter;
        }

        /* access modifiers changed from: protected */
        public boolean handleEditorResult(Intent intent) {
            if (intent == null) {
                return false;
            }
            Uri data = intent.getData();
            if (data == null) {
                return false;
            }
            String path = data.getPath();
            if (TextUtils.isEmpty(path)) {
                return false;
            }
            setTargetPath(path);
            insertAndNotifyDataSet(path);
            GallerySamplingStatHelper.recordCountEvent("motion_photo", "motion_photo_save");
            return true;
        }

        /* access modifiers changed from: protected */
        public void onCanceled() {
            super.onCanceled();
            GallerySamplingStatHelper.recordCountEvent("motion_photo", "motion_photo_cancel");
        }

        public void onClick(View view) {
            if (this.mSupported && PhotoPageFragment.this.mPagerHelper != null) {
                PhotoPageItem currentItem = PhotoPageFragment.this.mPagerHelper.getCurrentItem();
                if (currentItem instanceof PhotoPageImageItem) {
                    ((PhotoPageImageItem) currentItem).onActionBarOperationClick();
                }
            }
        }

        public void onDestroy() {
            release();
        }

        /* JADX WARNING: type inference failed for: r0v4, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v4, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 16
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public void onEnterClick(BaseDataItem baseDataItem) {
            if (this.mSupported && baseDataItem != null && !TextUtils.isEmpty(baseDataItem.getOriginalPath())) {
                IntentUtil.startMotionPhotoAction(baseDataItem, PhotoPageFragment.this.mActivity, PhotoPageFragment.this);
                onStartEditor();
                GallerySamplingStatHelper.recordCountEvent("motion_photo", "motion_photo_enter");
            }
        }

        public void onRecognized(BaseDataItem baseDataItem, boolean z) {
            if (this.mSupported) {
                this.mOperationView.setVisibility(z ? 0 : 8);
            }
        }
    }

    private static class NFCManager {
        private NfcUpdateTask mUpdateTask;

        private static class NfcUpdateTask implements Runnable {
            private WeakReference<Activity> mActivityRef;
            private NfcAdapter mNfcAdapter;
            private BaseDataItem mUpdateItem;

            public NfcUpdateTask(Activity activity) {
                this.mActivityRef = new WeakReference<>(activity);
            }

            private NfcAdapter getNfcAdapter() {
                Activity activity = (Activity) this.mActivityRef.get();
                if (activity != null && this.mNfcAdapter == null) {
                    try {
                        this.mNfcAdapter = NfcAdapter.getDefaultAdapter(activity.getApplicationContext());
                    } catch (Exception e) {
                        Log.e("PhotoPageFragment", (Throwable) e);
                    }
                }
                return this.mNfcAdapter;
            }

            public void release() {
                ThreadManager.getWorkHandler().removeCallbacks(this);
                this.mActivityRef.clear();
                this.mNfcAdapter = null;
            }

            public final void run() {
                Activity activity = (Activity) this.mActivityRef.get();
                NfcAdapter nfcAdapter = getNfcAdapter();
                if (activity != null && nfcAdapter != null) {
                    String pathDisplayBetter = this.mUpdateItem.getPathDisplayBetter();
                    if (!TextUtils.isEmpty(pathDisplayBetter)) {
                        try {
                            nfcAdapter.setBeamPushUris(new Uri[]{Uri.fromFile(new File(pathDisplayBetter))}, activity);
                        } catch (Exception e) {
                            Log.w("PhotoPageFragment", (Throwable) e);
                        }
                    }
                }
            }

            /* access modifiers changed from: 0000 */
            public void updateItem(BaseDataItem baseDataItem) {
                if (baseDataItem != null) {
                    this.mUpdateItem = baseDataItem;
                    ThreadManager.getWorkHandler().removeCallbacks(this);
                    ThreadManager.getWorkHandler().post(this);
                }
            }
        }

        NFCManager(Activity activity) {
            this.mUpdateTask = new NfcUpdateTask(activity);
        }

        public void release() {
            if (this.mUpdateTask != null) {
                this.mUpdateTask.release();
                this.mUpdateTask = null;
            }
        }

        public void settleItem(BaseDataItem baseDataItem) {
            if (this.mUpdateTask != null) {
                this.mUpdateTask.updateItem(baseDataItem);
            }
        }
    }

    private static final class OrientationChangedListener implements OnOrientationChangedListener {
        private final WeakReference<OrientationManager> mManagerRef;

        public OrientationChangedListener(OrientationManager orientationManager) {
            this.mManagerRef = new WeakReference<>(orientationManager);
        }

        public void onOrientationChanged(int i, int i2) {
            OrientationManager orientationManager = this.mManagerRef != null ? (OrientationManager) this.mManagerRef.get() : null;
            if (orientationManager != null) {
                orientationManager.onSensorOrientationChanged(i, i2);
            }
        }
    }

    private class OrientationManager {
        private boolean isOrientationLocked = false;
        private ContentObserver mAccelerometerRotationObserver;
        private int mCurUiOrientation = 0;
        private OrientationSensor mOrientationSensor;
        private boolean mSensorEnable = true;
        private int mSensorRotation = -1;

        /* JADX WARNING: type inference failed for: r3v1, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r3v1, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 13
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        OrientationManager() {
            this.mCurUiOrientation = PhotoPageFragment.this.getResources().getConfiguration().orientation;
            this.mOrientationSensor = new OrientationSensor(PhotoPageFragment.this.mActivity);
        }

        private void disableAccelerometerRotationObserver() {
            if (this.mAccelerometerRotationObserver != null) {
                Log.d("PhotoPageFragment", "disableAccelerometerRotationObserver");
                PhotoPageFragment.this.mActivity.getContentResolver().unregisterContentObserver(this.mAccelerometerRotationObserver);
                this.mAccelerometerRotationObserver = null;
            }
        }

        private void disableOrientationSensor() {
            if (this.mOrientationSensor != null && this.mOrientationSensor.isEnabled()) {
                Log.d("PhotoPageFragment", "disableOrientationSensor");
                this.mOrientationSensor.setOrientationChangedListener(null);
                this.mOrientationSensor.disable();
            }
        }

        private void enableAccelerometerRotationObserver() {
            if (PhotoPageFragment.this.isResumed() && this.mAccelerometerRotationObserver == null) {
                Log.d("PhotoPageFragment", "enableAccelerometerRotationObserver");
                this.mAccelerometerRotationObserver = new AccelerometerRotationChangedListener(ThreadManager.getMainHandler(), this);
                PhotoPageFragment.this.mActivity.getContentResolver().registerContentObserver(System.getUriFor("accelerometer_rotation"), true, this.mAccelerometerRotationObserver);
            }
        }

        private void enableOrientationSensor() {
            if (this.mSensorEnable && PhotoPageFragment.this.isResumed() && this.mOrientationSensor != null && !this.mOrientationSensor.isEnabled()) {
                Log.d("PhotoPageFragment", "enableOrientationSensor");
                this.mOrientationSensor.setOrientationChangedListener(new OrientationChangedListener(this));
                this.mOrientationSensor.enable();
            }
        }

        private int getScreenOrientation(int i) {
            switch (i) {
                case 0:
                    return 1;
                case 1:
                    return 0;
                case 2:
                    return 9;
                case 3:
                    return 8;
                default:
                    return 2;
            }
        }

        private void lock() {
            int rotation = ((WindowManager) PhotoPageFragment.this.mActivity.getSystemService("window")).getDefaultDisplay().getRotation();
            PhotoPageFragment.this.mActivity.setRequestedOrientation(getScreenOrientation(rotation));
            this.isOrientationLocked = true;
            HashMap hashMap = new HashMap();
            hashMap.put("lock", Integer.valueOf(rotation));
            GallerySamplingStatHelper.recordCountEvent("photo", "orientation_lock_by_accelerometer", hashMap);
        }

        private void unlock() {
            PhotoPageFragment.this.mActivity.setRequestedOrientation(4);
            this.isOrientationLocked = false;
            HashMap hashMap = new HashMap();
            hashMap.put("unlock", Integer.valueOf(this.mSensorRotation));
            GallerySamplingStatHelper.recordCountEvent("photo", "orientation_lock_by_accelerometer", hashMap);
        }

        /* access modifiers changed from: 0000 */
        public void onAccelerometerRotationChanged() {
            if (PhotoPageFragment.this.mActivity == null) {
                Log.e("PhotoPageFragment", "activity has detached AccelerometerRotationChanged");
                return;
            }
            int i = System.getInt(PhotoPageFragment.this.mActivity.getContentResolver(), "accelerometer_rotation", 0);
            Log.d("PhotoPageFragment", "onAccelerometerRotationChanged %d", (Object) Integer.valueOf(i));
            if (i == 0) {
                lock();
            } else {
                unlock();
            }
        }

        /* access modifiers changed from: 0000 */
        public void onSensorOrientationChanged(int i, int i2) {
            if (PhotoPageFragment.this.mActivity == null) {
                Log.e("PhotoPageFragment", "activity has detached onOrientationChanged oldOrientation %d, newOrientation %d", Integer.valueOf(i), Integer.valueOf(i2));
                return;
            }
            this.mSensorRotation = OrientationSensor.transfer2SurfaceRotation(i2);
            Log.d("PhotoPageFragment", "onSensorOrientationChanged old %s, new %s", Integer.valueOf(i), Integer.valueOf(i2));
        }

        /* access modifiers changed from: 0000 */
        public void onUiOrientationChanged(Configuration configuration) {
            if (this.mCurUiOrientation != configuration.orientation) {
                this.mCurUiOrientation = configuration.orientation;
            }
        }

        /* access modifiers changed from: 0000 */
        public void pause() {
            disableOrientationSensor();
            disableAccelerometerRotationObserver();
        }

        /* access modifiers changed from: 0000 */
        public void release() {
            disableOrientationSensor();
            disableAccelerometerRotationObserver();
        }

        /* access modifiers changed from: 0000 */
        public void resume() {
            enableOrientationSensor();
            enableAccelerometerRotationObserver();
            tryRestoreOrientation(true);
        }

        /* access modifiers changed from: 0000 */
        public void setSensorEnable(boolean z) {
            this.mSensorEnable = z;
            if (!PhotoPageFragment.this.isResumed()) {
                return;
            }
            if (this.mSensorEnable) {
                enableOrientationSensor();
            } else {
                disableOrientationSensor();
            }
        }

        public void settleItem(BaseDataItem baseDataItem) {
            setSensorEnable(baseDataItem == null || !baseDataItem.isVideo());
        }

        /* access modifiers changed from: 0000 */
        public void tryRestoreOrientation(boolean z) {
            if (z) {
                boolean z2 = false;
                if (!PhotoPageFragment.this.isFromCamera() && System.getInt(PhotoPageFragment.this.mActivity.getContentResolver(), "accelerometer_rotation", 0) == 0) {
                    z2 = true;
                }
                this.isOrientationLocked = z2;
            }
            PhotoPageFragment.this.mActivity.setRequestedOrientation(this.isOrientationLocked ? 2 : 4);
        }
    }

    private class PhotoEditorManager extends TransitionEditorManager {
        private PhotoEditorManager() {
            super();
        }

        /* access modifiers changed from: protected */
        public boolean handleEditorResult(Intent intent) {
            if (intent != null) {
                long longExtra = intent.getLongExtra("photo_secret_id", 0);
                if (longExtra > 0) {
                    setTargetId(longExtra);
                    notifyDataSetChange(longExtra);
                    return true;
                }
                Uri data = intent.getData();
                if (data != null) {
                    String lastPathSegment = data.getLastPathSegment();
                    StringBuilder sb = new StringBuilder();
                    sb.append("file://");
                    sb.append(lastPathSegment);
                    PhotoPagerSamplingStatHelper.onEditorSaved(Uri.parse(sb.toString()));
                    notifyDataSetChange(lastPathSegment);
                    setTargetPath(lastPathSegment);
                    return true;
                }
            }
            return false;
        }

        public void onDestroy() {
            release();
        }
    }

    private class PhotoMaskManager {
        private final int OUT_OF_VIEWPORT_SLOP = 0;
        private int mActionBarHeight = -1;
        private ActionBarDividerRunnable mBarDividerRunnable;
        private ActionBarMaskRunnable mBarMaskRunnable;
        /* access modifiers changed from: private */
        public PhotoPageMaskView mMaskView;
        private int mSplitBarHeight = -1;

        private class ActionBarDividerRunnable implements Runnable {
            final boolean isShowBottomDivider;
            final boolean isShowTopDivider;

            public ActionBarDividerRunnable(boolean z, boolean z2) {
                this.isShowTopDivider = z;
                this.isShowBottomDivider = z2;
            }

            public void run() {
                PhotoMaskManager.this.mMaskView.setActionBarDividerVisible(this.isShowTopDivider);
                PhotoMaskManager.this.mMaskView.setSplitBarDividerVisible(this.isShowBottomDivider);
            }
        }

        private class ActionBarMaskRunnable implements Runnable {
            final boolean isAnim;
            final boolean isShowMask;

            public ActionBarMaskRunnable(boolean z, boolean z2) {
                this.isShowMask = z;
                this.isAnim = z2;
            }

            public void run() {
                PhotoMaskManager.this.mMaskView.setActionBarMaskVisible(this.isShowMask, this.isAnim);
            }
        }

        public PhotoMaskManager() {
            if (this.mMaskView != null) {
                this.mMaskView.setHost(PhotoPageFragment.this);
            }
        }

        private void removeRefreshDividerRunnable() {
            if (this.mBarDividerRunnable != null) {
                ThreadManager.getMainHandler().removeCallbacks(this.mBarDividerRunnable);
                this.mBarDividerRunnable = null;
            }
        }

        private void removeRefreshMaskRunnable() {
            if (this.mBarMaskRunnable != null) {
                ThreadManager.getMainHandler().removeCallbacks(this.mBarMaskRunnable);
                this.mBarMaskRunnable = null;
            }
        }

        /* JADX WARNING: type inference failed for: r0v6, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v6, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 18
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public int getSplitBarHeight() {
            if (this.mSplitBarHeight == -1) {
                this.mSplitBarHeight = PhotoPageFragment.this.getMenuCollapsedHeight();
            }
            return (this.mSplitBarHeight <= 0 ? MiscUtil.getDefaultSplitActionBarHeight(PhotoPageFragment.this.mActivity) : this.mSplitBarHeight) + ViewCompat.getSystemWindowInsetBottom(PhotoPageFragment.this.mActivity.getWindow().getDecorView());
        }

        public int getTopBarHeight() {
            if (this.mActionBarHeight == -1) {
                this.mActionBarHeight = PhotoPageFragment.this.getActionBarHeight();
            }
            return this.mActionBarHeight;
        }

        public void hideMaskImmediately() {
            if (this.mMaskView != null) {
                this.mMaskView.setActionBarDividerVisible(false);
                this.mMaskView.setSplitBarDividerVisible(false);
                this.mMaskView.setActionBarMaskVisible(false, false);
            }
        }

        public void refreshMask(boolean z) {
            if (this.mMaskView != null) {
                RectF curItemDisplayRect = PhotoPageFragment.this.mPagerHelper.getCurItemDisplayRect();
                boolean z2 = true;
                boolean z3 = curItemDisplayRect != null && curItemDisplayRect.top + 0.0f < ((float) getTopBarHeight());
                boolean z4 = curItemDisplayRect != null && curItemDisplayRect.bottom - 0.0f > ((float) (PhotoPageFragment.this.mPager.getHeight() - getSplitBarHeight()));
                boolean access$1200 = PhotoPageFragment.this.isActionBarVisible();
                boolean z5 = access$1200 && z3;
                boolean z6 = access$1200 && z4;
                if (!(access$1200 && (z5 || z6) && this.mBarDividerRunnable != null && ((this.mBarDividerRunnable.isShowTopDivider || this.mBarDividerRunnable.isShowBottomDivider) && ThreadManager.getMainHandler().hasCallbacksCompat(this.mBarDividerRunnable)))) {
                    removeRefreshDividerRunnable();
                    this.mBarDividerRunnable = new ActionBarDividerRunnable(z5, z6);
                    if (!access$1200 || !z) {
                        this.mBarDividerRunnable.run();
                    } else {
                        ThreadManager.getMainHandler().postDelayed(this.mBarDividerRunnable, (long) PhotoPageFragment.this.getResources().getInteger(R.integer.photo_bar_divider_refresh_delay));
                    }
                }
                boolean z7 = curItemDisplayRect == null || z3 || z4;
                boolean z8 = z && (z7 || PhotoPageFragment.this.isExiting());
                if (access$1200 && !z7) {
                    if (this.mBarMaskRunnable == null || !this.mBarMaskRunnable.isShowMask || !ThreadManager.getMainHandler().hasCallbacksCompat(this.mBarMaskRunnable)) {
                        z2 = false;
                    }
                    if (z2) {
                        return;
                    }
                }
                removeRefreshMaskRunnable();
                this.mBarMaskRunnable = new ActionBarMaskRunnable(access$1200, z8);
                if (!access$1200 || z7 || !z) {
                    this.mBarMaskRunnable.run();
                } else {
                    ThreadManager.getMainHandler().postDelayed(this.mBarMaskRunnable, (long) PhotoPageFragment.this.getResources().getInteger(R.integer.photo_bar_divider_refresh_delay));
                }
            }
        }

        public void release() {
            removeRefreshDividerRunnable();
            removeRefreshMaskRunnable();
        }

        public void showMaskImmediately() {
            if (this.mMaskView != null) {
                this.mMaskView.setActionBarDividerVisible(true);
                this.mMaskView.setSplitBarDividerVisible(true);
                this.mMaskView.setActionBarMaskVisible(true, false);
            }
        }
    }

    private class PhotoRefreshReceiver extends BroadcastReceiver {
        private PhotoRefreshReceiver() {
        }

        public void onReceive(Context context, Intent intent) {
            PhotoPageItem photoPageItem;
            if ("com.miui.gallery.SAVE_TO_CLOUD".equals(intent.getAction())) {
                String stringExtra = intent.getStringExtra("extra_file_path");
                if (!TextUtils.isEmpty(stringExtra) && PhotoPageFragment.this.mPager != null) {
                    int activeItemCount = PhotoPageFragment.this.mPagerHelper.getActiveItemCount();
                    int i = 0;
                    while (true) {
                        if (i >= activeItemCount) {
                            break;
                        }
                        photoPageItem = PhotoPageFragment.this.mPagerHelper.getItemByNativeIndex(i);
                        if (photoPageItem != null) {
                            BaseDataItem dataItem = photoPageItem.getDataItem();
                            if (dataItem != null && stringExtra.equals(dataItem.getOriginalPath())) {
                                break;
                            }
                        }
                        i++;
                    }
                } else {
                    return;
                }
            }
            photoPageItem = null;
            if (photoPageItem != null) {
                BaseDataItem dataItem2 = photoPageItem.getDataItem();
                if (dataItem2 != null) {
                    dataItem2.resetSpecialTypeFlags();
                    if (PhotoPageFragment.this.mSpecialTypeManager != null) {
                        PhotoPageFragment.this.mSpecialTypeManager.updateItem(dataItem2);
                    }
                }
                if (!intent.hasExtra("extra_is_temp_file")) {
                    photoPageItem.refreshItem();
                }
            }
        }
    }

    private class ProjectionManager implements Callback, ConnectListener, OnItemClickListener, RemoteControlListener {
        private int mConnectState = 1;
        private String mConnectedDeviceName = "";
        private BaseDataItem mCurItem;
        private Handler mHandler;
        private RemoteController mRemoteController;
        private DeviceListController mWidget = null;

        /* JADX WARNING: type inference failed for: r2v1, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v1, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 18
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        ProjectionManager() {
            this.mWidget = new DeviceListController(PhotoPageFragment.this.mActivity);
            this.mWidget.setOnItemClickListener(this);
            this.mHandler = new Handler(Looper.getMainLooper(), this);
            ConnectController.getInstance().registConnectListener(this);
            this.mRemoteController = new RemoteController(this);
        }

        private boolean isBigScreenSupported(BaseDataItem baseDataItem) {
            if (baseDataItem == null || baseDataItem.isSecret()) {
                return false;
            }
            return !TextUtils.isEmpty(baseDataItem.getPathDisplayBetter());
        }

        /* access modifiers changed from: private */
        public void projectClicked() {
            this.mWidget.show();
            if (this.mConnectState == 2) {
                switch2Local(1);
            }
        }

        /* JADX WARNING: type inference failed for: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 11
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        private void setConnectState(int i) {
            this.mConnectState = i;
            this.mRemoteController.onConnectStateChange(PhotoPageFragment.this.mActivity, this.mConnectState == 3);
            refreshProjectState();
        }

        /* JADX WARNING: type inference failed for: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 5
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public void disableRemoteControl() {
            this.mRemoteController.disableDelay(PhotoPageFragment.this.mActivity);
        }

        /* JADX WARNING: type inference failed for: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 5
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public void enableRemoteControl() {
            this.mRemoteController.enable(PhotoPageFragment.this.mActivity);
        }

        /* JADX WARNING: type inference failed for: r0v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: type inference failed for: r3v6, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 21
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 2 */
        public void enterSlideShow(int i) {
            if (ConnectController.getInstance().showType(true, i) != 0) {
                ToastUtils.makeText((Context) PhotoPageFragment.this.mActivity, PhotoPageFragment.this.mActivity.getText(R.string.projection_slide_fail_cause_loading));
                return;
            }
            this.mRemoteController.disable(PhotoPageFragment.this.mActivity);
            ProjectSlideFragment.showProjectSlideFragment(PhotoPageFragment.this.mActivity, PhotoPageFragment.this, ConnectController.getInstance().getCurConnectedDevice());
        }

        /* JADX WARNING: type inference failed for: r1v4, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: type inference failed for: r1v6, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v4, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 18
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 2 */
        public void exitSlideShow() {
            settleItem(this.mCurItem, PhotoPageFragment.this.mPager.getCurrentItem());
            this.mRemoteController.enable(PhotoPageFragment.this.mActivity);
            if (!PhotoPageFragment.this.isVisible()) {
                this.mRemoteController.disableDelay(PhotoPageFragment.this.mActivity);
            }
        }

        /* JADX WARNING: type inference failed for: r4v5, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r4v5, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 20
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public boolean handleMessage(Message message) {
            switch (message.what) {
                case 3:
                    switch2Local(2);
                    break;
                case 4:
                    this.mHandler.sendEmptyMessage(2);
                    if (ConnectController.getInstance().connectPhotoServer((String) message.obj) != 0) {
                        ToastUtils.makeText((Context) PhotoPageFragment.this.mActivity, (int) R.string.projection_device_connection_failed);
                        setConnectState(1);
                        this.mWidget.removeActive();
                        break;
                    } else {
                        ConnectController.getInstance().showType(false, 0);
                        break;
                    }
                case 5:
                    switch2Local(2);
                    break;
            }
            return false;
        }

        public boolean isConnected() {
            return this.mConnectState == 3;
        }

        public void onDeviceRefresh(ArrayList<String> arrayList, String str) {
            Log.i("ProjectionManager", "onDeviceRefresh %s", (Object) str);
            if (this.mWidget.refreshDevices(arrayList, str)) {
                refreshProjectState();
            }
            if (str != null && this.mConnectState != 3) {
                setConnectState(3);
            }
        }

        public void onDeviceRemoved(String str) {
            Log.i("ProjectionManager", "onDeviceRemoved %s", (Object) str);
            if (this.mWidget.removeDevice(str)) {
                refreshProjectState();
            }
        }

        public void onDevicesAdded(String str) {
            Log.i("ProjectionManager", "onDevicesAdded %s", (Object) str);
            this.mWidget.addNewDevice(str, TextUtils.equals(str, ConnectController.getInstance().getCurConnectedDevice()));
        }

        public void onDevicesAvailable(ArrayList<String> arrayList) {
            Log.i("ProjectionManager", "onDevicesAvailable");
            if (arrayList != null) {
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    this.mWidget.addNewDevice((String) it.next(), false);
                }
            }
        }

        public void onItemClicked(String str) {
            if (TextUtils.equals(str, ConnectController.getInstance().getCurConnectedDevice())) {
                this.mHandler.removeMessages(2);
                switch2Local(1);
            } else if (str.equals(DeviceListController.MOBILE_NAME)) {
                switch2Local(1);
            } else {
                ConnectController.getInstance().release();
                switch2TV(str);
            }
            this.mWidget.dismiss();
        }

        public void onPhotoConnectReleased() {
            Log.i("ProjectionManager", "onPhotoConnectReleased");
            this.mHandler.sendEmptyMessage(5);
        }

        /* JADX WARNING: type inference failed for: r4v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r4v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 25
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public void onPhotoConnectResponse(int i) {
            Log.i("ProjectionManager", "onPhotoConnectResponse %d", (Object) Integer.valueOf(i));
            this.mHandler.removeMessages(2);
            switch (i) {
                case -1:
                    setConnectState(1);
                    this.mHandler.sendEmptyMessage(3);
                    ToastUtils.makeText((Context) PhotoPageFragment.this.mActivity, (int) R.string.projection_device_connection_failed);
                    GallerySamplingStatHelper.recordCountEvent("photo", "project_photo_fail");
                    return;
                case 0:
                    setConnectState(3);
                    this.mHandler.sendEmptyMessage(1);
                    GallerySamplingStatHelper.recordCountEvent("photo", "project_photo_success");
                    return;
                default:
                    return;
            }
        }

        /* JADX WARNING: type inference failed for: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: type inference failed for: r1v5, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 34
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 2 */
        public void onRemoteControl(boolean z) {
            if (PhotoPageFragment.this.mAdapter.getCount() > 0) {
                if (z) {
                    int currentItem = PhotoPageFragment.this.mPager.getCurrentItem() - 1;
                    if (currentItem >= 0) {
                        PhotoPageFragment.this.mPager.setCurrentItem(currentItem, !MiscUtil.isKeyGuardLocked(PhotoPageFragment.this.mActivity));
                    }
                } else {
                    int currentItem2 = PhotoPageFragment.this.mPager.getCurrentItem() + 1;
                    if (currentItem2 < PhotoPageFragment.this.mAdapter.getCount()) {
                        PhotoPageFragment.this.mPager.setCurrentItem(currentItem2, !MiscUtil.isKeyGuardLocked(PhotoPageFragment.this.mActivity));
                    }
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public void refreshProjectState() {
            String str;
            if (PhotoPageFragment.this.mMenuManager != null && PhotoPageFragment.this.isAdded()) {
                boolean z = false;
                switch (this.mConnectState) {
                    case 2:
                        str = PhotoPageFragment.this.getResources().getString(R.string.operation_cast_connecting_format, new Object[]{this.mConnectedDeviceName});
                        break;
                    case 3:
                        str = PhotoPageFragment.this.getResources().getString(R.string.operation_cast_connected_format, new Object[]{this.mConnectedDeviceName});
                        break;
                    default:
                        str = PhotoPageFragment.this.getResources().getString(R.string.operation_projection);
                        break;
                }
                String str2 = this.mConnectState == 1 ? "init" : this.mConnectState == 2 ? "connecting" : "connected";
                if (isBigScreenSupported(this.mCurItem)) {
                    Log.i("ProjectionManager", "refreshProjectState: [%s] [visible]", (Object) str2);
                    MenuManager access$2100 = PhotoPageFragment.this.mMenuManager;
                    if (this.mConnectState != 2) {
                        z = true;
                    }
                    access$2100.refreshCastItem(str, true, z);
                    return;
                }
                Log.i("ProjectionManager", "refreshProjectState: [%s] [gone]", (Object) str2);
                PhotoPageFragment.this.mMenuManager.refreshCastItem(str, false, true);
                this.mHandler.removeMessages(2);
            }
        }

        /* JADX WARNING: type inference failed for: r1v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 13
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public void release() {
            this.mWidget.dismiss();
            ConnectController.getInstance().unregistConnectListener(this);
            this.mHandler.removeCallbacksAndMessages(null);
            ConnectController.getInstance().disconnect(this, true);
            this.mRemoteController.release(PhotoPageFragment.this.mActivity);
        }

        public void settleItem(BaseDataItem baseDataItem, int i) {
            if (baseDataItem != null) {
                Log.i("ProjectionManager", "updateItem %s  %d", baseDataItem, Integer.valueOf(i));
                this.mCurItem = baseDataItem;
                refreshProjectState();
                ConnectController.getInstance().updateCurrentPhoto(baseDataItem.getPathDisplayBetter(), i);
            }
        }

        public void switch2Local(int i) {
            setConnectState(1);
            if (i == 1) {
                ConnectController.getInstance().release();
            }
            this.mWidget.removeActive();
            this.mHandler.removeMessages(2);
        }

        public void switch2TV(String str) {
            this.mConnectedDeviceName = str;
            setConnectState(2);
            Message obtainMessage = this.mHandler.obtainMessage();
            obtainMessage.what = 4;
            obtainMessage.obj = str;
            this.mHandler.sendMessage(obtainMessage);
        }

        public void updateRemoteView(BaseDataItem baseDataItem, RectF rectF) {
            float f;
            float f2;
            float f3;
            if (baseDataItem != null && baseDataItem.getWidth() > 0 && rectF.width() > 0.0f) {
                float width = rectF.width() / ((float) baseDataItem.getWidth());
                float min = Math.min(((float) PhotoPageFragment.this.mPager.getWidth()) / ((float) baseDataItem.getWidth()), ((float) PhotoPageFragment.this.mPager.getHeight()) / ((float) baseDataItem.getHeight()));
                if (Utils.floatNear(width, min, 1.0E-6f) || width < min) {
                    f3 = ((float) baseDataItem.getWidth()) / 2.0f;
                    f2 = ((float) baseDataItem.getHeight()) / 2.0f;
                    f = min;
                } else {
                    f3 = (((float) (PhotoPageFragment.this.mPager.getWidth() / 2)) - rectF.left) / width;
                    f2 = (((float) (PhotoPageFragment.this.mPager.getHeight() / 2)) - rectF.top) / width;
                    f = width;
                }
                ConnectController.getInstance().syncRemoteView(f3, f2, (float) Math.round(((float) baseDataItem.getWidth()) * min), (float) Math.round(((float) baseDataItem.getHeight()) * min), (float) baseDataItem.getWidth(), (float) baseDataItem.getHeight(), f);
            }
        }

        public void updateSet(BaseDataSet baseDataSet) {
            ConnectController.getInstance().updateCurrentFolder(baseDataSet);
        }
    }

    private static class RecognitionTask {
        /* access modifiers changed from: private */
        public Callback mCallback;
        private Future mFuture;

        public interface Callback {
            void onDataItemRecognized(BaseDataItem baseDataItem);
        }

        public RecognitionTask(Callback callback) {
            this.mCallback = callback;
        }

        public void execute(final BaseDataItem baseDataItem) {
            if (this.mFuture != null) {
                this.mFuture.cancel();
            }
            this.mFuture = ThreadManager.getMiscPool().submit(new Job<Void>() {
                /* JADX WARNING: Code restructure failed: missing block: B:22:0x0055, code lost:
                    if (com.miui.gallery.util.SpecialTypeMediaUtils.is960VideoEditable(r9) == false) goto L_0x0057;
                 */
                public Void run(JobContext jobContext) {
                    long parseFlagsForVideo;
                    if (jobContext.isCancelled() || baseDataItem == null) {
                        return null;
                    }
                    String originalPath = baseDataItem.getOriginalPath();
                    if (TextUtils.isEmpty(originalPath)) {
                        return null;
                    }
                    long j = 0;
                    if (baseDataItem.isImage()) {
                        parseFlagsForVideo = SpecialTypeMediaUtils.parseFlagsForImage(originalPath);
                        if ((32 & parseFlagsForVideo) != 0) {
                            long readMicroVideoOffset = XmpHelper.readMicroVideoOffset(originalPath);
                            if (readMicroVideoOffset > 0) {
                                baseDataItem.setMotionOffset(readMicroVideoOffset);
                            }
                            baseDataItem.setSpecialTypeFlags(j);
                            return null;
                        }
                    } else {
                        if (baseDataItem.isVideo()) {
                            parseFlagsForVideo = SpecialTypeMediaUtils.parseFlagsForVideo(originalPath);
                            if ((16 & parseFlagsForVideo) != 0) {
                            }
                        }
                        baseDataItem.setSpecialTypeFlags(j);
                        return null;
                    }
                    j = parseFlagsForVideo;
                    baseDataItem.setSpecialTypeFlags(j);
                    return null;
                }
            }, new FutureHandler<Void>() {
                public void onPostExecute(Future<Void> future) {
                    if (RecognitionTask.this.mCallback != null) {
                        RecognitionTask.this.mCallback.onDataItemRecognized(baseDataItem);
                    }
                }
            });
        }

        public void release() {
            this.mCallback = null;
            if (this.mFuture != null) {
                this.mFuture.cancel();
                this.mFuture = null;
            }
        }
    }

    private class RefocusManager extends TransitionEditorManager implements Callback {
        private boolean mRefocusSupport;

        public RefocusManager(SpecialTypeManager specialTypeManager) {
            super();
            this.mRefocusSupport = ExtraPhotoSDK.isDeviceSupportRefocus(PhotoPageFragment.this.getActivity());
            if (this.mRefocusSupport) {
                specialTypeManager.addTypeCallback(1, this, 1);
            }
        }

        public int getEnterDrawableId() {
            return R.drawable.blur_refocus_btn;
        }

        public int getEnterTextId() {
            return R.string.blur_refocus_enter;
        }

        /* access modifiers changed from: protected */
        public boolean handleEditorResult(Intent intent) {
            if (intent == null) {
                return false;
            }
            Uri data = intent.getData();
            if (data == null) {
                return false;
            }
            String path = data.getPath();
            if (TextUtils.isEmpty(path)) {
                return false;
            }
            ExtraPhotoSDK.sendResultStatic(intent);
            setTargetPath(path);
            insertAndNotifyDataSet(path);
            return true;
        }

        /* JADX WARNING: type inference failed for: r0v4, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v4, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 14
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public void onEnterClick(BaseDataItem baseDataItem) {
            if (this.mRefocusSupport && baseDataItem != null && !TextUtils.isEmpty(baseDataItem.getOriginalPath())) {
                IntentUtil.startAdvancedRefocusAction(baseDataItem, PhotoPageFragment.this.mActivity, PhotoPageFragment.this);
                ExtraPhotoSDK.sendEnterStatic();
                onStartEditor();
            }
        }

        public void onRecognized(BaseDataItem baseDataItem, boolean z) {
            if (this.mRefocusSupport && z) {
                ExtraPhotoSDK.sendExposureStatic();
            }
        }

        public void release() {
            super.release();
        }
    }

    private class ScreenBroadcastReceiver extends BroadcastReceiver {
        private ScreenBroadcastReceiver() {
        }

        public void onReceive(Context context, Intent intent) {
            if ("android.intent.action.SCREEN_OFF".equals(intent.getAction())) {
                PhotoPageFragment.this.finishActivity(-1);
            }
        }
    }

    private class SmartVideoGuideManager implements SmartVideoGuideListener {
        /* access modifiers changed from: private */
        public GuidePopupWindow mGuideView;
        /* access modifiers changed from: private */
        public String mLastHFRVideoPath;
        private Runnable mShowGuidanceRunnable;
        private SmartVideoGuideHelper mSmartVideoGuideHelper = new SmartVideoGuideHelper();
        /* access modifiers changed from: private */
        public String mVideoPath;

        public SmartVideoGuideManager() {
            this.mSmartVideoGuideHelper.setSmartVideoGuideListener(this);
        }

        private void dismissGuidance() {
            if (this.mShowGuidanceRunnable != null) {
                ThreadManager.getMainHandler().removeCallbacks(this.mShowGuidanceRunnable);
            }
            if (this.mGuideView != null && this.mGuideView.isShowing()) {
                this.mGuideView.dismiss(false);
            }
        }

        /* JADX WARNING: type inference failed for: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* access modifiers changed from: private */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 20
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public void doShowGuidance() {
            this.mGuideView = new GuidePopupWindow(PhotoPageFragment.this.mActivity);
            this.mGuideView.setArrowMode(0);
            this.mGuideView.setGuideText(R.string.feature_guidance_video_editor_smart_effects);
            View view = PhotoPageFragment.this.getView();
            if (view != null) {
                View findViewWithTag = view.findViewWithTag(Integer.valueOf(R.id.action_edit));
                if (findViewWithTag != null) {
                    this.mGuideView.show(findViewWithTag, false);
                    SmartVideoGuideHelper.setHasGuided(true);
                }
            }
        }

        private Runnable getShowGuidanceRunnable() {
            if (this.mShowGuidanceRunnable == null) {
                this.mShowGuidanceRunnable = new Runnable() {
                    public void run() {
                        if (SmartVideoGuideManager.this.mGuideView == null && PhotoPageFragment.this.isActionBarVisible() && !TextUtils.isEmpty(SmartVideoGuideManager.this.mLastHFRVideoPath) && SmartVideoGuideManager.this.mLastHFRVideoPath.equals(SmartVideoGuideManager.this.mVideoPath) && !PhotoPageFragment.this.isExiting()) {
                            SmartVideoGuideManager.this.doShowGuidance();
                        }
                    }
                };
            }
            return this.mShowGuidanceRunnable;
        }

        private boolean preventGuide(BaseDataItem baseDataItem) {
            return PhotoPageFragment.this.isPreviewMode() || !PhotoPageFragment.this.isActionBarVisible() || baseDataItem == null || !baseDataItem.isVideo() || TextUtils.isEmpty(baseDataItem.getOriginalPath());
        }

        public void onActionBarVisibilityChanged(boolean z) {
            if (z) {
                updateItem(PhotoPageFragment.this.mAdapter.getDataItem(PhotoPageFragment.this.mPager.getCurrentItem()));
            } else {
                dismissGuidance();
            }
        }

        public void release() {
            if (this.mSmartVideoGuideHelper != null) {
                this.mSmartVideoGuideHelper.release();
            }
            dismissGuidance();
        }

        public void showGuideView(String str) {
            if (this.mGuideView == null && PhotoPageFragment.this.isActionBarVisible() && !TextUtils.isEmpty(str) && str.equals(this.mVideoPath)) {
                this.mLastHFRVideoPath = str;
                if (this.mShowGuidanceRunnable != null) {
                    ThreadManager.getMainHandler().removeCallbacks(this.mShowGuidanceRunnable);
                }
                ThreadManager.getMainHandler().postDelayed(getShowGuidanceRunnable(), 380);
            }
        }

        public void updateItem(BaseDataItem baseDataItem) {
            if (!SmartVideoGuideHelper.hasGuided()) {
                if (baseDataItem != null) {
                    this.mVideoPath = baseDataItem.getOriginalPath();
                }
                if (this.mSmartVideoGuideHelper != null && !preventGuide(baseDataItem)) {
                    this.mSmartVideoGuideHelper.handleHighFrameRate(this.mVideoPath);
                }
            } else if (preventGuide(baseDataItem) || !TextUtils.equals(this.mLastHFRVideoPath, baseDataItem.getOriginalPath())) {
                dismissGuidance();
            }
        }
    }

    private static class SpecialTypeEnterView {
        private View mCommonEnterView;
        private Animation mEnterHideAnim;
        private Animation mEnterShowAnim;
        private int mSystemWindowInsetBottom;
        private View mVideoEnterView;

        SpecialTypeEnterView(ViewGroup viewGroup, OnClickListener onClickListener) {
            LayoutInflater from = LayoutInflater.from(viewGroup.getContext());
            this.mCommonEnterView = from.inflate(R.layout.special_type_enter_layout, viewGroup, false);
            viewGroup.addView(this.mCommonEnterView);
            this.mCommonEnterView.setOnClickListener(onClickListener);
            if (IntentUtil.isSupportNewVideoPlayer()) {
                this.mVideoEnterView = from.inflate(R.layout.special_type_enter_layout, viewGroup, false);
                viewGroup.addView(this.mVideoEnterView);
                this.mVideoEnterView.setOnClickListener(onClickListener);
            }
            updatePosition();
            android.support.v4.view.ViewCompat.setOnApplyWindowInsetsListener(this.mCommonEnterView, new OnApplyWindowInsetsListener() {
                public final WindowInsetsCompat onApplyWindowInsets(View view, WindowInsetsCompat windowInsetsCompat) {
                    return SpecialTypeEnterView.lambda$new$9(SpecialTypeEnterView.this, view, windowInsetsCompat);
                }
            });
        }

        private int getInsetBottom(View view) {
            return ViewCompat.getSystemWindowInsetBottom(view);
        }

        private void hide(View view) {
            if (view != null && view.getVisibility() == 0) {
                if (this.mEnterHideAnim == null) {
                    this.mEnterHideAnim = AnimationUtils.loadAnimation(view.getContext(), R.anim.special_type_enter_out);
                }
                view.startAnimation(this.mEnterHideAnim);
                view.setVisibility(8);
            }
        }

        public static /* synthetic */ WindowInsetsCompat lambda$new$9(SpecialTypeEnterView specialTypeEnterView, View view, WindowInsetsCompat windowInsetsCompat) {
            int systemWindowInsetBottom = ViewCompat.getSystemWindowInsetBottom(specialTypeEnterView.mCommonEnterView);
            if (systemWindowInsetBottom != specialTypeEnterView.mSystemWindowInsetBottom) {
                specialTypeEnterView.mSystemWindowInsetBottom = systemWindowInsetBottom;
                specialTypeEnterView.updatePosition();
            }
            return windowInsetsCompat;
        }

        private void show(View view) {
            if (view != null && view.getVisibility() == 8) {
                if (this.mEnterShowAnim == null) {
                    this.mEnterShowAnim = AnimationUtils.loadAnimation(view.getContext(), R.anim.special_type_enter_in);
                }
                view.startAnimation(this.mEnterShowAnim);
                view.setVisibility(0);
            }
        }

        private void startViewAlphaAnim(View view, boolean z) {
            if (view != null && view.getVisibility() == 0) {
                view.animate().alpha(z ? 1.0f : 0.0f).setDuration(300).setInterpolator(new SineEaseInOutInterpolator()).start();
            }
        }

        private void updatePosition() {
            updateViewPosition(this.mCommonEnterView, R.dimen.specify_type_common_enter_margin_bottom);
            updateViewPosition(this.mVideoEnterView, R.dimen.specify_type_video_enter_margin_bottom);
        }

        private void updateViewPosition(View view, int i) {
            if (view != null) {
                MarginLayoutParams marginLayoutParams = (MarginLayoutParams) view.getLayoutParams();
                if (marginLayoutParams != null) {
                    marginLayoutParams.bottomMargin = getInsetBottom(view) + view.getResources().getDimensionPixelSize(i);
                    view.setLayoutParams(marginLayoutParams);
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public void setVisibility(int i) {
            this.mCommonEnterView.setVisibility(i);
            if (this.mVideoEnterView != null) {
                this.mVideoEnterView.setVisibility(i);
            }
        }

        /* access modifiers changed from: 0000 */
        public void startEnterAlphaAnim(boolean z) {
            startViewAlphaAnim(this.mCommonEnterView, z);
            startViewAlphaAnim(this.mVideoEnterView, z);
        }

        /* access modifiers changed from: 0000 */
        public void update(boolean z, boolean z2, int i, int i2) {
            View view;
            if (this.mVideoEnterView == null) {
                z2 = false;
            }
            if (z) {
                if (z2) {
                    view = this.mVideoEnterView;
                    show(this.mVideoEnterView);
                    hide(this.mCommonEnterView);
                } else {
                    view = this.mCommonEnterView;
                    show(this.mCommonEnterView);
                    hide(this.mVideoEnterView);
                }
                if (view instanceof ImageView) {
                    ((ImageView) view).setImageResource(i);
                } else if (view instanceof TextView) {
                    TextView textView = (TextView) view;
                    textView.setText(i2);
                    textView.setCompoundDrawablesRelativeWithIntrinsicBounds(view.getResources().getDrawable(i), null, null, null);
                }
            } else {
                hide(this.mCommonEnterView);
                hide(this.mVideoEnterView);
            }
        }
    }

    private static class SpecialTypeManager implements OnClickListener {
        private LongSparseArray<Callback> mCallbacks;
        private SpecialTypeEnterView mEnterView;
        private PhotoPageFragment mFragment;
        private int mMediaType;
        private int mOperationMask;
        private Callback mRecognitionCallback = new Callback() {
            public final void onDataItemRecognized(BaseDataItem baseDataItem) {
                SpecialTypeManager.lambda$new$8(SpecialTypeManager.this, baseDataItem);
            }
        };
        private RecognitionTask mRecognitionTask;
        private boolean mSupportEnter;

        public interface Callback {
            int getEnterDrawableId();

            int getEnterTextId();

            void onEnterClick(BaseDataItem baseDataItem);

            void onRecognized(BaseDataItem baseDataItem, boolean z);
        }

        public SpecialTypeManager(PhotoPageFragment photoPageFragment) {
            this.mFragment = photoPageFragment;
            this.mSupportEnter = !photoPageFragment.mStartWhenLockedAndSecret;
            this.mCallbacks = new LongSparseArray<>();
            Bundle arguments = photoPageFragment.getArguments();
            int i = -1;
            if (arguments != null) {
                i = arguments.getInt("support_operation_mask", -1);
            }
            this.mOperationMask = i;
            this.mEnterView = new SpecialTypeEnterView((ViewGroup) photoPageFragment.getView().findViewById(R.id.photo_layout), this);
            if (SpecialTypeMediaUtils.isMTSpecialAITypeSupport()) {
                this.mMediaType |= 1;
            }
        }

        private Callback getCallback(BaseDataItem baseDataItem) {
            if (baseDataItem == null || baseDataItem.getSpecialTypeFlags() <= 0) {
                return null;
            }
            int size = this.mCallbacks.size();
            for (int i = 0; i < size; i++) {
                if (baseDataItem.isSpecialType(this.mCallbacks.keyAt(i))) {
                    return (Callback) this.mCallbacks.valueAt(i);
                }
            }
            return null;
        }

        private BaseDataItem getCurrentItem() {
            if (this.mFragment == null) {
                return null;
            }
            return this.mFragment.mAdapter.getDataItem(this.mFragment.mPager.getCurrentItem());
        }

        public static /* synthetic */ void lambda$new$8(SpecialTypeManager specialTypeManager, BaseDataItem baseDataItem) {
            BaseDataItem currentItem = specialTypeManager.getCurrentItem();
            if (baseDataItem != null && baseDataItem.equals(currentItem)) {
                specialTypeManager.onRecognized(baseDataItem);
            }
            specialTypeManager.updateItemSpecialIndicator(baseDataItem);
        }

        private void onRecognized(BaseDataItem baseDataItem) {
            if (this.mFragment != null) {
                int size = this.mCallbacks.size();
                for (int i = 0; i < size; i++) {
                    ((Callback) this.mCallbacks.valueAt(i)).onRecognized(baseDataItem, baseDataItem != null && baseDataItem.isSpecialType(this.mCallbacks.keyAt(i)));
                }
                updateEnterView(baseDataItem);
            }
        }

        private void submitRecognizeTask(BaseDataItem baseDataItem) {
            if (this.mRecognitionTask == null) {
                this.mRecognitionTask = new RecognitionTask(this.mRecognitionCallback);
            }
            this.mRecognitionTask.execute(baseDataItem);
        }

        private void updateEnterView() {
            if (this.mMediaType != 0) {
                updateEnterView(getCurrentItem());
            }
        }

        /* JADX WARNING: Removed duplicated region for block: B:17:0x0036  */
        private void updateEnterView(BaseDataItem baseDataItem) {
            int i;
            int i2;
            if (this.mFragment != null && this.mSupportEnter) {
                boolean z = true;
                if (baseDataItem != null && PhotoOperationsUtil.isSupportedOptions(baseDataItem.getSupportOperations() & this.mOperationMask, 512)) {
                    Callback callback = getCallback(baseDataItem);
                    if (callback != null) {
                        i = callback.getEnterDrawableId();
                        i2 = callback.getEnterTextId();
                        if (this.mEnterView != null) {
                            boolean z2 = baseDataItem != null && i > 0 && this.mFragment.isActionBarVisible();
                            SpecialTypeEnterView specialTypeEnterView = this.mEnterView;
                            if (baseDataItem == null || !baseDataItem.isVideo()) {
                                z = false;
                            }
                            specialTypeEnterView.update(z2, z, i, i2);
                        }
                    }
                }
                i2 = 0;
                i = 0;
                if (this.mEnterView != null) {
                }
            }
        }

        private void updateItemSpecialIndicator(BaseDataItem baseDataItem) {
            BaseDataItem currentItem = getCurrentItem();
            if (baseDataItem != null && currentItem != null && baseDataItem.equals(currentItem)) {
                currentItem.setSpecialTypeFlags(baseDataItem.getSpecialTypeFlags());
                this.mFragment.mPagerHelper.getCurrentItem().updateSpecialTypeIndicator();
            }
        }

        public void addTypeCallback(long j, Callback callback, int i) {
            if (callback != null) {
                this.mMediaType = i | this.mMediaType;
                this.mCallbacks.put(j, callback);
            }
        }

        public void onActionBarVisibilityChanged() {
            updateEnterView();
        }

        public void onActivityResult() {
            updateEnterView();
        }

        public void onActivityTransition() {
            if (this.mEnterView != null) {
                this.mEnterView.setVisibility(8);
            }
        }

        public void onClick(View view) {
            if (view.getVisibility() == 0) {
                BaseDataItem currentItem = getCurrentItem();
                if (currentItem != null) {
                    if (this.mFragment.needDismissKeyGuard()) {
                        this.mFragment.dismissKeyGuard();
                    }
                    Callback callback = getCallback(currentItem);
                    if (callback != null) {
                        callback.onEnterClick(currentItem);
                    }
                }
            }
        }

        public void onDestroy() {
            this.mEnterView = null;
            this.mFragment = null;
            this.mCallbacks.clear();
            if (this.mRecognitionTask != null) {
                this.mRecognitionTask.release();
                this.mRecognitionTask = null;
            }
        }

        public void setEnterVisible(boolean z) {
            if (this.mEnterView != null) {
                this.mEnterView.startEnterAlphaAnim(z);
            }
        }

        public void updateItem(BaseDataItem baseDataItem) {
            if (this.mMediaType != 0) {
                if (baseDataItem == null || ((!baseDataItem.isImage() && !baseDataItem.isVideo()) || baseDataItem.hasFace())) {
                    onRecognized(null);
                } else if (baseDataItem.isSpecialTypeRecognized()) {
                    onRecognized(baseDataItem);
                } else if (baseDataItem.isBurstItem() && (this.mMediaType & 4) == 0) {
                    onRecognized(null);
                } else if ((baseDataItem.isVideo() && (this.mMediaType & 2) == 0) || (baseDataItem.isImage() && (this.mMediaType & 1) == 0)) {
                    onRecognized(null);
                } else if (TextUtils.isEmpty(baseDataItem.getOriginalPath()) || baseDataItem.isSecret()) {
                    onRecognized(null);
                } else {
                    submitRecognizeTask(baseDataItem);
                }
            }
        }
    }

    static class ThemeManager {
        private IMultiThemeView mHostView;

        ThemeManager(IMultiThemeView iMultiThemeView) {
            this.mHostView = iMultiThemeView;
        }

        public void setBackgroundAlpha(float f) {
            if (this.mHostView != null) {
                this.mHostView.setBackgroundAlpha(f);
            }
        }

        public void setDarkTheme(boolean z, boolean z2) {
            if (this.mHostView == null) {
                return;
            }
            if (z2) {
                this.mHostView.setTheme(Theme.DARK, z ? ThemeTransition.FADE_OUT : ThemeTransition.NONE, new CubicEaseOutInterpolator(), (long) ((View) this.mHostView).getContext().getResources().getInteger(R.integer.photo_background_out_quick_duration));
            } else {
                this.mHostView.setTheme(Theme.DARK, z ? ThemeTransition.FADE_OUT : ThemeTransition.NONE);
            }
        }

        public void setLightTheme(boolean z, boolean z2) {
            if (this.mHostView == null) {
                return;
            }
            if (z2) {
                this.mHostView.setTheme(Theme.LIGHT, z ? ThemeTransition.FADE_IN : ThemeTransition.NONE, new CubicEaseOutInterpolator(), (long) ((View) this.mHostView).getContext().getResources().getInteger(R.integer.photo_background_in_quick_duration));
            } else {
                this.mHostView.setTheme(Theme.LIGHT, z ? ThemeTransition.FADE_IN : ThemeTransition.NONE);
            }
        }
    }

    private abstract class TransitionEditorManager extends BaseEditorManager {
        private boolean mEverStartedEditor;
        private Runnable mOnLoadTimeOut;
        private long mStartTransition;

        private TransitionEditorManager() {
            super();
            this.mEverStartedEditor = false;
            this.mOnLoadTimeOut = new Runnable() {
                public void run() {
                    Log.w("PhotoPageFragment", "editor return to photo, image loading time out.");
                    TransitionEditorManager.this.finishTransition();
                }
            };
        }

        /* JADX WARNING: type inference failed for: r0v7, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* access modifiers changed from: private */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v7, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 19
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public void finishTransition() {
            Log.d("PhotoPageFragment", "editor transition delay %s", (Object) Long.valueOf(System.currentTimeMillis() - this.mStartTransition));
            ThreadManager.getMainHandler().removeCallbacks(this.mOnLoadTimeOut);
            if (PhotoPageFragment.this.mActivity != null) {
                ActivityCompat.startPostponedEnterTransition(PhotoPageFragment.this.mActivity);
            }
            this.mTargetFilePath = null;
            this.mTargetId = 0;
        }

        private boolean hasExportedMeasure(Intent intent) {
            return intent != null && intent.hasExtra("photo_edit_exported_width") && intent.hasExtra("photo_edit_exported_height");
        }

        private boolean isCurrentImageOverDisplayArea() {
            if (PhotoPageFragment.this.mPagerHelper != null) {
                RectF curItemDisplayRect = PhotoPageFragment.this.mPagerHelper.getCurItemDisplayRect();
                if (curItemDisplayRect != null) {
                    return isImageOverDisplayArea(curItemDisplayRect.width(), curItemDisplayRect.height());
                }
            }
            return false;
        }

        private boolean isExportedImageOverDisplayArea(Intent intent) {
            if (intent == null) {
                return false;
            }
            return isImageOverDisplayArea((float) intent.getIntExtra("photo_edit_exported_width", 0), (float) intent.getIntExtra("photo_edit_exported_height", 0));
        }

        private boolean isImageOverDisplayArea(float f, float f2) {
            boolean z = false;
            if (f <= 0.0f || f2 <= 0.0f || PhotoPageFragment.this.mMaskManager == null || PhotoPageFragment.this.mPager == null) {
                return false;
            }
            float f3 = f2 / f;
            if (f3 <= 1.34f) {
                return false;
            }
            float width = (float) PhotoPageFragment.this.mPager.getWidth();
            float height = (float) (PhotoPageFragment.this.mPager.getHeight() - (Math.max(PhotoPageFragment.this.mMaskManager.getSplitBarHeight(), PhotoPageFragment.this.mMaskManager.getTopBarHeight()) * 2));
            if (width <= 0.0f || height <= 0.0f) {
                return false;
            }
            if (f3 > height / width) {
                z = true;
            }
            return z;
        }

        /* access modifiers changed from: protected */
        public abstract boolean handleEditorResult(Intent intent);

        /* JADX WARNING: type inference failed for: r4v5, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r4v5, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 38
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public void onActivityReenter(Intent intent) {
            Log.d("PhotoPageFragment", "Transition onActivityReenter %s", (Object) Boolean.valueOf(this.mEverStartedEditor));
            if (hasExportedMeasure(intent)) {
                if (isExportedImageOverDisplayArea(intent)) {
                    PhotoPageFragment.this.hideActionBarView();
                } else {
                    PhotoPageFragment.this.showActionBarView();
                }
            }
            this.mTargetFilePath = null;
            this.mTargetId = 0;
            ImageLoader.getInstance().resume();
            this.mResultHandled = handleEditorResult(intent);
            if (VERSION.SDK_INT > 23 || this.mEverStartedEditor) {
                if (this.mResultHandled) {
                    this.mStartTransition = System.currentTimeMillis();
                    ActivityCompat.postponeEnterTransition(PhotoPageFragment.this.mActivity);
                    ThreadManager.getMainHandler().postDelayed(this.mOnLoadTimeOut, 2000);
                }
                return;
            }
            Log.w("PhotoPageFragment", "Transition stop, because activity restart.");
        }

        public void onActivityResult(int i, Intent intent) {
            super.onActivityResult(i, intent);
            PhotoPageFragment.this.showActionBarView();
            if (PhotoPageFragment.this.mSpecialTypeManager != null) {
                PhotoPageFragment.this.mSpecialTypeManager.onActivityResult();
            }
            if (i == -1) {
                if (!this.mResultHandled) {
                    handleEditorResult(intent);
                    this.mTargetFilePath = null;
                    this.mTargetId = 0;
                }
                this.mResultHandled = false;
            } else if (i == 0) {
                onCanceled();
            }
        }

        /* access modifiers changed from: protected */
        public void onCanceled() {
        }

        public void onImageLoadFinish(String str) {
            super.onImageLoadFinish(str);
            if (this.mTargetId > 0) {
                finishTransition();
                return;
            }
            if (!(this.mTargetFilePath == null || str == null || !TextUtils.equals(Uri.parse(str).getPath(), this.mTargetFilePath))) {
                finishTransition();
            }
        }

        public void onStartEditor() {
            super.onStartEditor();
            this.mEverStartedEditor = true;
            if (isCurrentImageOverDisplayArea()) {
                PhotoPageFragment.this.hideActionBarView();
            }
            if (PhotoPageFragment.this.mPagerHelper != null) {
                PhotoPageFragment.this.mPagerHelper.onActivityTransition();
            }
            if (PhotoPageFragment.this.mSpecialTypeManager != null) {
                PhotoPageFragment.this.mSpecialTypeManager.onActivityTransition();
            }
        }

        public void release() {
            super.release();
            ThreadManager.getMainHandler().removeCallbacks(this.mOnLoadTimeOut);
        }
    }

    private abstract class UpdatableEditorManager extends BaseEditorManager {
        private BroadcastReceiver mEditorReceiver;
        /* access modifiers changed from: private */
        public Runnable mOnLoadTimeOut;

        private class EditorBroadcastReceiver extends BroadcastReceiver {
            private EditorBroadcastReceiver() {
            }

            public void onReceive(Context context, Intent intent) {
                if (intent != null && "com.miui.gallery.action.EDITOR_RETURN".equals(intent.getAction())) {
                    Log.d("UpdatableEditorManager", "onEditorReturn");
                    UpdatableEditorManager.this.mResultHandled = UpdatableEditorManager.this.handleEditorResult(intent);
                    if (UpdatableEditorManager.this.mResultHandled) {
                        ImageLoader.getInstance().resume();
                        if (PhotoPageFragment.this.mPagerHelper != null) {
                            PhotoPageFragment.this.mPagerHelper.clearTrimMemoryFlag();
                        }
                        ThreadManager.getMainHandler().postDelayed(UpdatableEditorManager.this.mOnLoadTimeOut, 2000);
                        return;
                    }
                    UpdatableEditorManager.this.sendPreparedResult();
                }
            }
        }

        private UpdatableEditorManager() {
            super();
            this.mOnLoadTimeOut = new Runnable() {
                public final void run() {
                    UpdatableEditorManager.lambda$new$7(UpdatableEditorManager.this);
                }
            };
        }

        /* access modifiers changed from: private */
        public boolean handleEditorResult(Intent intent) {
            if (intent == null) {
                return false;
            }
            Uri data = intent.getData();
            if (data == null) {
                return false;
            }
            String path = data.getPath();
            if (TextUtils.isEmpty(path)) {
                return false;
            }
            insertAndNotifyDataSet(path, shouldInsertMediaStore(), true);
            setTargetPath(path);
            return true;
        }

        public static /* synthetic */ void lambda$new$7(UpdatableEditorManager updatableEditorManager) {
            Log.w("UpdatableEditorManager", "editor return to photo, image loading time out.");
            updatableEditorManager.sendPreparedResult();
        }

        private void registerReceiver() {
            if (this.mEditorReceiver == null && PhotoPageFragment.this.mActivity != null) {
                IntentFilter intentFilter = new IntentFilter();
                intentFilter.addAction("com.miui.gallery.action.EDITOR_RETURN");
                try {
                    intentFilter.addDataType("*/*");
                } catch (MalformedMimeTypeException e) {
                    Log.w("UpdatableEditorManager", (Throwable) e);
                }
                this.mEditorReceiver = new EditorBroadcastReceiver();
                PhotoPageFragment.this.mActivity.registerReceiver(this.mEditorReceiver, intentFilter);
            }
        }

        /* access modifiers changed from: private */
        public void sendPreparedResult() {
            ThreadManager.getMainHandler().removeCallbacks(this.mOnLoadTimeOut);
            if (PhotoPageFragment.this.mActivity != null) {
                Intent intent = new Intent("com.miui.gallery.action.IMAGE_PREPARED");
                intent.setPackage(getTargetPackageName());
                PhotoPageFragment.this.mActivity.sendBroadcast(intent);
                this.mTargetFilePath = null;
            }
        }

        private void unregisterReceiver() {
            if (this.mEditorReceiver != null && PhotoPageFragment.this.mActivity != null) {
                try {
                    PhotoPageFragment.this.mActivity.unregisterReceiver(this.mEditorReceiver);
                } catch (Exception e) {
                    Log.w("UpdatableEditorManager", (Throwable) e);
                }
                this.mEditorReceiver = null;
            }
        }

        /* access modifiers changed from: protected */
        public abstract String getTargetPackageName();

        public void onActivityResult(int i, Intent intent) {
            super.onActivityResult(i, intent);
            ThreadManager.getMainHandler().removeCallbacks(this.mOnLoadTimeOut);
            unregisterReceiver();
            if (i == -1 && !this.mResultHandled) {
                handleEditorResult(intent);
            }
            this.mResultHandled = false;
            this.mTargetFilePath = null;
        }

        public void onDestroy() {
            release();
            unregisterReceiver();
            ThreadManager.getMainHandler().removeCallbacks(this.mOnLoadTimeOut);
        }

        public void onImageLoadFinish(String str) {
            super.onImageLoadFinish(str);
            if (!(this.mTargetFilePath == null || str == null || !TextUtils.equals(Uri.parse(str).getPath(), this.mTargetFilePath))) {
                Log.d("UpdatableEditorManager", "onImageLoadFinish");
                sendPreparedResult();
            }
        }

        public void onStartEditor() {
            super.onStartEditor();
            registerReceiver();
            this.mResultHandled = false;
            this.mTargetFilePath = null;
        }

        /* access modifiers changed from: protected */
        public abstract boolean shouldInsertMediaStore();
    }

    private class VideoPlayerManager extends UpdatableEditorManager implements OnPlayVideoListener {
        private PlayerBroadcastReceiver mPlayerReceiver;
        /* access modifiers changed from: private */
        public boolean mPlayerResultHandled;
        private Callback mSlowMotionCallback;
        private Callback mSuperSlowMotionCallback;

        private class PlayerBroadcastReceiver extends BroadcastReceiver {
            private PlayerBroadcastReceiver() {
            }

            public void onReceive(Context context, Intent intent) {
                if (intent != null) {
                    String action = intent.getAction();
                    if ("com.miui.gallery.action.VIDEO_PLAYER_STARTED".equals(action)) {
                        Log.d("VideoPlayerManager", "onReceive VideoPlayer started");
                        VideoPlayerManager.this.setActivityVisible(false);
                    } else if ("com.miui.gallery.action.VIDEO_PLAYER_RETURN".equals(action)) {
                        Log.d("VideoPlayerManager", "onReceive VideoPlayer return");
                        VideoPlayerManager.this.setActionBarVisibleImmediately(intent.getBooleanExtra("action_bar_visible", true));
                        VideoPlayerManager.this.setActivityVisible(true);
                        long longExtra = intent.getLongExtra("seek_time", -1);
                        int intExtra = intent.getIntExtra("relative_index", 0);
                        if (intExtra != 0) {
                            if (PhotoPageFragment.this.mPager != null) {
                                PhotoPageFragment.this.mPager.setCurrentItem(PhotoPageFragment.this.mPager.getCurrentItem() + intExtra, false);
                            }
                            VideoPlayerManager.this.prepareFinish(context);
                        } else if (longExtra < 0 || PhotoPageFragment.this.mVideoPreviewManager == null) {
                            VideoPlayerManager.this.prepareFinish(context);
                        } else {
                            PhotoPageFragment.this.mVideoPreviewManager.seekTo(longExtra, true);
                        }
                        VideoPlayerManager.this.mPlayerResultHandled = true;
                    }
                }
            }
        }

        private VideoPlayerManager(SpecialTypeManager specialTypeManager) {
            super();
            this.mSlowMotionCallback = new Callback() {
                public int getEnterDrawableId() {
                    return R.drawable.slow_motion_btn;
                }

                public int getEnterTextId() {
                    return R.string.slow_motion_enter;
                }

                public void onEnterClick(BaseDataItem baseDataItem) {
                    VideoPlayerManager.this.playVideo(baseDataItem, 1);
                }

                public void onRecognized(BaseDataItem baseDataItem, boolean z) {
                }
            };
            this.mSuperSlowMotionCallback = new Callback() {
                public int getEnterDrawableId() {
                    return R.drawable.super_slow_motion_btn;
                }

                public int getEnterTextId() {
                    return R.string.super_slow_motion_enter;
                }

                public void onEnterClick(BaseDataItem baseDataItem) {
                    VideoPlayerManager.this.playVideo(baseDataItem, 2);
                }

                public void onRecognized(BaseDataItem baseDataItem, boolean z) {
                }
            };
            PhotoPageFragment.this.mPagerHelper.setOnPlayVideoListener(this);
            if (IntentUtil.isSupportNewVideoPlayer()) {
                specialTypeManager.addTypeCallback(4, this.mSlowMotionCallback, 2);
                specialTypeManager.addTypeCallback(8, this.mSlowMotionCallback, 2);
                specialTypeManager.addTypeCallback(16, this.mSuperSlowMotionCallback, 2);
            }
        }

        private String getItemMimeType(BaseDataItem baseDataItem) {
            if (baseDataItem == null) {
                return null;
            }
            String pathDisplayBetter = baseDataItem.getPathDisplayBetter();
            if (TextUtils.isEmpty(pathDisplayBetter)) {
                return "*/*";
            }
            String mimeType = baseDataItem.getMimeType();
            if (TextUtils.isEmpty(mimeType)) {
                mimeType = FileMimeUtil.getMimeType(pathDisplayBetter);
            }
            return mimeType;
        }

        private Uri getItemUri(BaseDataItem baseDataItem) {
            if (baseDataItem == null) {
                return null;
            }
            String pathDisplayBetter = baseDataItem.getPathDisplayBetter();
            return TextUtils.isEmpty(pathDisplayBetter) ? Uri.parse("") : Uri.fromFile(new File(pathDisplayBetter));
        }

        /* JADX WARNING: type inference failed for: r6v2, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* access modifiers changed from: private */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r6v2, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 39
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public void playVideo(final BaseDataItem baseDataItem, final int i) {
            if (baseDataItem != null && !TextUtils.isEmpty(baseDataItem.getOriginalPath())) {
                if (TextUtils.isEmpty(ConnectController.getInstance().getCurConnectedDevice()) || baseDataItem.isSecret()) {
                    final Uri fromFile = Uri.fromFile(new File(baseDataItem.getOriginalPath()));
                    if (!baseDataItem.isSecret() || baseDataItem.getSecretKey() == null) {
                        playVideo(baseDataItem, fromFile, baseDataItem.isSecret(), i);
                    } else {
                        ProcessTask processTask = new ProcessTask(new ProcessCallback<Uri, Uri>() {
                            public Uri doProcess(Uri[] uriArr) {
                                return SecretAlbumCryptoUtils.decryptVideo2CacheFolder(fromFile, baseDataItem.getSecretKey(), baseDataItem.getKey());
                            }
                        }, new ProcessTask.OnCompleteListener<Uri>() {
                            /* JADX WARNING: type inference failed for: r5v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
                            /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r5v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 11
                            	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
                            	at java.util.ArrayList.forEach(Unknown Source)
                            	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
                            	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
                            	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
                            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
                            	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
                            	at java.util.ArrayList.forEach(Unknown Source)
                            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
                            	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
                            	at java.util.ArrayList.forEach(Unknown Source)
                            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
                            	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
                            	at java.util.ArrayList.forEach(Unknown Source)
                            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
                            	at jadx.core.ProcessClass.process(ProcessClass.java:30)
                            	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
                            	at java.util.ArrayList.forEach(Unknown Source)
                            	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
                            	at jadx.core.ProcessClass.process(ProcessClass.java:35)
                            	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
                            	at jadx.api.JavaClass.decompile(JavaClass.java:62)
                            	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
                             */
                            /* JADX WARNING: Unknown variable types count: 1 */
                            public void onCompleteProcess(Uri uri) {
                                if (uri != null) {
                                    VideoPlayerManager.this.playVideo(baseDataItem, uri, true, i);
                                } else {
                                    ToastUtils.makeText((Context) PhotoPageFragment.this.mActivity, (int) R.string.decrypt_video_failed);
                                }
                            }
                        });
                        processTask.setCancelable(true);
                        processTask.showProgress(PhotoPageFragment.this.mActivity, PhotoPageFragment.this.mActivity.getResources().getString(R.string.decrypting_video));
                        processTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Uri[]{fromFile});
                    }
                } else {
                    ProjectVideoFragment.showProjectVideoFragment(PhotoPageFragment.this.mActivity, baseDataItem);
                }
            }
        }

        /* JADX WARNING: type inference failed for: r2v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: type inference failed for: r0v7, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* access modifiers changed from: private */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 50
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 2 */
        public void playVideo(BaseDataItem baseDataItem, Uri uri, boolean z, int i) {
            Intent intent = PhotoPageFragment.this.mActivity.getIntent();
            boolean z2 = intent != null && intent.getBooleanExtra("StartActivityWhenLocked", false);
            int requestedOrientation = PhotoPageFragment.this.mActivity.getRequestedOrientation();
            Bundle bundle = new Bundle();
            boolean isSupportNewVideoPlayer = IntentUtil.isSupportNewVideoPlayer();
            if (isSupportNewVideoPlayer) {
                prepareParams(baseDataItem, bundle, i);
            }
            if (IntentUtil.playVideo(PhotoPageFragment.this.mActivity, uri, baseDataItem.getMimeType(), isSupportNewVideoPlayer, z2, requestedOrientation, z, bundle) && isSupportNewVideoPlayer) {
                registerPlayerReceiver();
                super.onStartEditor();
                this.mPlayerResultHandled = false;
            }
            ArrayMap arrayMap = new ArrayMap();
            arrayMap.put(nexExportFormat.TAG_FORMAT_PATH, StorageUtils.getRelativePath(PhotoPageFragment.this.mActivity, baseDataItem.getOriginalPath()));
            arrayMap.put("duration", String.valueOf(baseDataItem.getDuration()));
            arrayMap.put("timestamp", String.valueOf(System.currentTimeMillis()));
            arrayMap.put("isSecret", String.valueOf(z));
            GalleryStatHelper.recordCountEvent("external_intent", "play_video", arrayMap);
        }

        /* JADX WARNING: type inference failed for: r2v5, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: type inference failed for: r2v8, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v5, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 73
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 2 */
        private void prepareParams(BaseDataItem baseDataItem, Bundle bundle, int i) {
            if (bundle != null && PhotoPageFragment.this.mActivity != null && PhotoPageFragment.this.mVideoPreviewManager != null) {
                int currentItem = PhotoPageFragment.this.mPager.getCurrentItem();
                BaseDataItem dataItem = PhotoPageFragment.this.mAdapter.getDataItem(currentItem - 1);
                BaseDataItem dataItem2 = PhotoPageFragment.this.mAdapter.getDataItem(currentItem + 1);
                Uri[] uriArr = {getItemUri(dataItem), getItemUri(dataItem2)};
                String[] strArr = {getItemMimeType(dataItem), getItemMimeType(dataItem2)};
                bundle.putString("title", baseDataItem.getViewTitle(PhotoPageFragment.this.mActivity));
                bundle.putString("subtitle", baseDataItem.getViewSubTitle(PhotoPageFragment.this.mActivity));
                bundle.putString("location", baseDataItem.getLocation());
                bundle.putParcelableArray("uri_list", uriArr);
                bundle.putStringArray("mime_type_list", strArr);
                bundle.putLong("seek_time", PhotoPageFragment.this.mVideoPreviewManager.getSeekTime());
                bundle.putBoolean("action_bar_visible", PhotoPageFragment.this.isActionBarVisible());
                ItemViewInfo itemViewInfo = PhotoPageFragment.this.getItemViewInfo(currentItem);
                if (itemViewInfo != null) {
                    bundle.putInt("item_x", itemViewInfo.getX());
                    bundle.putInt("item_y", itemViewInfo.getY());
                    bundle.putInt("item_width", itemViewInfo.getWidth());
                    bundle.putInt("item_height", itemViewInfo.getHeight());
                }
                bundle.putInt("mode", i);
            }
        }

        private void registerPlayerReceiver() {
            Log.d("VideoPlayerManager", "registerPlayerReceiver");
            if (PhotoPageFragment.this.mActivity != null && this.mPlayerReceiver == null) {
                this.mPlayerReceiver = new PlayerBroadcastReceiver();
                IntentFilter intentFilter = new IntentFilter();
                intentFilter.addAction("com.miui.gallery.action.VIDEO_PLAYER_STARTED");
                intentFilter.addAction("com.miui.gallery.action.VIDEO_PLAYER_RETURN");
                PhotoPageFragment.this.mActivity.registerReceiver(this.mPlayerReceiver, intentFilter);
            }
        }

        /* access modifiers changed from: private */
        public void setActionBarVisibleImmediately(boolean z) {
            if (PhotoPageFragment.this.mMaskManager != null) {
                if (z) {
                    PhotoPageFragment.this.mMaskManager.showMaskImmediately();
                } else {
                    PhotoPageFragment.this.mMaskManager.hideMaskImmediately();
                }
            }
            if (PhotoPageFragment.this.mThemeManager != null) {
                if (z) {
                    PhotoPageFragment.this.mThemeManager.setLightTheme(false, false);
                } else {
                    PhotoPageFragment.this.mThemeManager.setDarkTheme(false, false);
                }
            }
            if (PhotoPageFragment.this.getActionBar() != null) {
                ActionBarCompat.setShowHideAnimationEnabled(PhotoPageFragment.this.getActionBar(), false);
                PhotoPageFragment.this.setActionBarVisible(z);
                ActionBarCompat.setShowHideAnimationEnabled(PhotoPageFragment.this.getActionBar(), true);
            }
        }

        /* access modifiers changed from: private */
        public void setActivityVisible(boolean z) {
            Log.d("VideoPlayerManager", "setActivityVisible %b", (Object) Boolean.valueOf(z));
            if (PhotoPageFragment.this.mActivity != null) {
                View findViewById = PhotoPageFragment.this.mActivity.findViewById(16908290);
                if (findViewById != null) {
                    findViewById.setVisibility(z ? 0 : 4);
                }
            }
        }

        private void unregisterPlayerReceiver() {
            Log.d("VideoPlayerManager", "unregisterPlayerReceiver");
            if (PhotoPageFragment.this.mActivity != null && this.mPlayerReceiver != null) {
                PhotoPageFragment.this.mActivity.unregisterReceiver(this.mPlayerReceiver);
                this.mPlayerReceiver = null;
            }
        }

        /* access modifiers changed from: protected */
        public String getTargetPackageName() {
            return "com.miui.video";
        }

        public void onActivityResult(int i, Intent intent) {
            super.onActivityResult(i, intent);
            Log.d("VideoPlayerManager", "onActivityResult");
            unregisterPlayerReceiver();
            if (intent != null) {
                if (intent.getBooleanExtra("request_finish", false)) {
                    PhotoPageFragment.this.finish();
                } else {
                    setActivityVisible(true);
                    if (!this.mPlayerResultHandled) {
                        int intExtra = intent.getIntExtra("relative_index", 0);
                        if (intExtra == 0) {
                            long longExtra = intent.getLongExtra("seek_time", -1);
                            if (PhotoPageFragment.this.mVideoPreviewManager != null) {
                                PhotoPageFragment.this.mVideoPreviewManager.seekTo(longExtra, false);
                            }
                        } else if (PhotoPageFragment.this.mPager != null) {
                            PhotoPageFragment.this.mPager.setCurrentItem(PhotoPageFragment.this.mPager.getCurrentItem() + intExtra, false);
                        }
                    }
                }
                this.mPlayerResultHandled = false;
                if (i == -1) {
                    Uri data = intent.getData();
                    if (data != null) {
                        String path = data.getPath();
                        if (!TextUtils.isEmpty(path)) {
                            PhotoPageFragment.this.setActionBarVisible(true);
                            insertAndNotifyDataSet(path, false);
                        }
                    }
                }
            }
        }

        public void onDestroy() {
            release();
            unregisterPlayerReceiver();
        }

        public void onPlayVideo(BaseDataItem baseDataItem) {
            playVideo(baseDataItem, 0);
        }

        public void onResume() {
            setActivityVisible(true);
        }

        public void prepareFinish(Context context) {
            if (context != null) {
                Intent intent = new Intent("com.miui.video.ACTION_GALLERY_PREPARED");
                intent.setPackage("com.miui.video");
                context.sendBroadcast(intent);
            }
        }

        /* access modifiers changed from: protected */
        public boolean shouldInsertMediaStore() {
            return true;
        }
    }

    private class VideoPreviewManager implements OnSurfacePreparedListener, Listener, OnSeekBarChangeListener {
        private BaseDataItem mCurrentItem;
        private float mDragStartTransitionY = 0.0f;
        private int mDraggingIndex = 0;
        /* access modifiers changed from: private */
        public ViewGroup mDurationBar;
        private Runnable mDurationBarHideRunnable = new Runnable() {
            public void run() {
                VideoPreviewManager.this.mDurationBar.animate().alpha(0.0f).setDuration(120).setInterpolator(new SineEaseInInterpolator()).start();
            }
        };
        private int mDurationBarMargin;
        private TextView mDurationTextView;
        private long mLastRequestTime;
        private int mPagerScrollState = 0;
        private TextView mProgressTextView;
        private VideoFrameProvider mProvider;
        private VideoFrameSeekBar mSeekBar;
        private boolean mSeekNeedCallback = false;
        private int mThumbItemHeight;
        private int mThumbItemWidth;
        private ThumbListInfo mThumbListInfo;
        private long mTotalDuration;
        private PhotoPageVideoItem mVideoPageItem;

        /* JADX WARNING: type inference failed for: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: type inference failed for: r0v4, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 31
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 2 */
        VideoPreviewManager() {
            this.mProvider = new VideoFrameProvider(PhotoPageFragment.this.mActivity);
            this.mProvider.addListener(this);
            this.mSeekBar = (VideoFrameSeekBar) LayoutInflater.from(PhotoPageFragment.this.mActivity).inflate(R.layout.video_frame_seek_bar, null);
            this.mThumbItemWidth = PhotoPageFragment.this.getResources().getDimensionPixelSize(R.dimen.video_frame_thumb_width);
            this.mThumbItemHeight = PhotoPageFragment.this.getResources().getDimensionPixelSize(R.dimen.video_frame_thumb_height);
            this.mDurationBarMargin = PhotoPageFragment.this.getResources().getDimensionPixelSize(R.dimen.video_duration_bar_margin);
            PhotoPageFragment.this.setMenuCustomView(this.mSeekBar);
            this.mSeekBar.setOnSeekBarChangeListener(this);
        }

        private void dismissDurationBar() {
            if (this.mDurationBar != null) {
                this.mDurationBar.setVisibility(8);
                this.mDurationBar.removeCallbacks(this.mDurationBarHideRunnable);
                this.mDurationBar.animate().cancel();
                this.mDurationBar.setAlpha(0.0f);
            }
        }

        private void dismissSeekBar() {
            this.mSeekBar.setFrameList(null);
            this.mSeekBar.setVisibility(8);
        }

        private void hideDurationBar(boolean z) {
            if (this.mDurationBar != null && this.mDurationBar.getAlpha() != 0.0f) {
                this.mDurationBar.removeCallbacks(this.mDurationBarHideRunnable);
                if (z) {
                    this.mDurationBar.postDelayed(this.mDurationBarHideRunnable, 2000);
                } else {
                    this.mDurationBarHideRunnable.run();
                }
            }
        }

        private void onRequestFrameFailed() {
            Log.d("VideoPreviewManager", "onRequestFrameFailed");
            onSeekFinish();
        }

        /* JADX WARNING: type inference failed for: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 15
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        private void onSeekFinish() {
            if (this.mSeekNeedCallback && PhotoPageFragment.this.mVideoPlayerManager != null) {
                PhotoPageFragment.this.mVideoPlayerManager.prepareFinish(PhotoPageFragment.this.mActivity);
                Log.d("VideoPreviewManager", "onSeekFinish");
            }
            this.mSeekNeedCallback = false;
        }

        private void pauseSeekBarAnim() {
            if (this.mSeekBar.getVisibility() == 0) {
                this.mDragStartTransitionY = this.mSeekBar.getTranslationY();
                this.mSeekBar.animate().cancel();
            }
        }

        private void requestFrame(long j) {
            if (this.mCurrentItem == null || this.mThumbListInfo == null || j < 0 || j > this.mTotalDuration) {
                onRequestFrameFailed();
                return;
            }
            Surface previewSurface = this.mVideoPageItem.getPreviewSurface();
            if (previewSurface != null) {
                this.mLastRequestTime = j;
                this.mProvider.requestSingleFrame(this.mCurrentItem.getOriginalPath(), this.mThumbListInfo.getWidth(), this.mThumbListInfo.getHeight(), j, previewSurface);
            }
        }

        private void showDurationBar() {
            if (this.mDurationBar == null) {
                this.mDurationBar = (ViewGroup) ((ViewStub) PhotoPageFragment.this.getView().findViewById(R.id.video_duration_bar_stub)).inflate();
                this.mProgressTextView = (TextView) this.mDurationBar.findViewById(R.id.video_progress);
                this.mDurationTextView = (TextView) this.mDurationBar.findViewById(R.id.video_duration);
                this.mDurationBar.setAlpha(0.0f);
            }
            this.mDurationBar.setVisibility(0);
            updateDuration();
            updateDurationBarLayout();
            this.mDurationBar.removeCallbacks(this.mDurationBarHideRunnable);
            if (this.mDurationBar.getAlpha() < 1.0f) {
                this.mDurationBar.animate().alpha(1.0f).setDuration(260).setInterpolator(new SineEaseInOutInterpolator()).start();
            }
        }

        private void translateSeekBar(float f) {
            float height = (float) this.mSeekBar.getHeight();
            float f2 = f * height;
            if (this.mDragStartTransitionY > 0.0f) {
                f2 = Math.min(this.mDragStartTransitionY + f2, height);
            }
            this.mSeekBar.setTranslationY(f2);
        }

        private void updateAndShowSeekBar(ThumbListInfo thumbListInfo) {
            Log.d("VideoPreviewManager", "updateAndShowSeekBar");
            if (thumbListInfo != null) {
                if (this.mThumbListInfo == null || !this.mThumbListInfo.equals(thumbListInfo)) {
                    this.mTotalDuration = thumbListInfo.getDuration();
                    this.mSeekBar.setFrameList(thumbListInfo.getThumbList());
                    this.mThumbListInfo = thumbListInfo;
                }
                if (this.mSeekBar.getVisibility() != 0) {
                    this.mSeekBar.setVisibility(0);
                    this.mSeekBar.setTranslationY((float) this.mSeekBar.getHeight());
                }
                float translationY = this.mSeekBar.getTranslationY();
                if (translationY > 0.0f) {
                    this.mSeekBar.animate().translationY(0.0f).setDuration((long) Math.max((int) (((translationY * 1.0f) / ((float) this.mSeekBar.getHeight())) * 250.0f), 150)).setInterpolator(new CubicEaseOutInterpolator()).start();
                }
            }
        }

        private void updateDuration() {
            if (this.mDurationBar != null) {
                double progress = (double) (this.mSeekBar.getProgress() * ((float) this.mTotalDuration));
                TextView textView = this.mProgressTextView;
                Double.isNaN(progress);
                textView.setText(FormatUtil.formatVideoDuration((long) Math.floor(progress / 1000.0d)));
                TextView textView2 = this.mDurationTextView;
                double d = (double) this.mTotalDuration;
                Double.isNaN(d);
                textView2.setText(FormatUtil.formatVideoDuration((long) Math.floor(d / 1000.0d)));
            }
        }

        private void updateDurationBarLayout() {
            if (this.mDurationBar != null && PhotoPageFragment.this.mMaskManager != null) {
                MarginLayoutParams marginLayoutParams = (MarginLayoutParams) this.mDurationBar.getLayoutParams();
                marginLayoutParams.bottomMargin = PhotoPageFragment.this.mMaskManager.getSplitBarHeight() + this.mSeekBar.getHeight() + this.mDurationBarMargin;
                this.mDurationBar.setLayoutParams(marginLayoutParams);
            }
        }

        public long getSeekTime() {
            return Math.max(0, Math.min((long) ((int) (this.mSeekBar.getProgress() * ((float) this.mTotalDuration))), this.mTotalDuration));
        }

        /* access modifiers changed from: 0000 */
        public void onActionBarVisibilityChanged(boolean z) {
            if (!z) {
                hideDurationBar(false);
            }
        }

        public void onDestroy() {
            this.mProvider.release();
            dismissDurationBar();
        }

        /* access modifiers changed from: 0000 */
        public void onOrientationChanged() {
            dismissDurationBar();
        }

        public void onPageScrollStateChanged(int i) {
            this.mPagerScrollState = i;
            if (this.mCurrentItem != null) {
                if (i == 0) {
                    Log.d("VideoPreviewManager", "onPageScrollIdle");
                    settleItem();
                } else if (i == 1) {
                    this.mDraggingIndex = PhotoPageFragment.this.mPager.getCurrentItem();
                    hideDurationBar(false);
                    pauseSeekBarAnim();
                }
            }
        }

        public void onPageScrolled(int i, float f, int i2) {
            if (this.mCurrentItem != null || this.mSeekBar.getVisibility() == 0) {
                if (this.mDraggingIndex == i || this.mDraggingIndex - 1 == i) {
                    if (this.mDraggingIndex != i) {
                        f = 1.0f - f;
                    }
                    translateSeekBar(f);
                }
            }
        }

        public void onProgressChanged(float f) {
            if (this.mCurrentItem != null) {
                updateDuration();
                requestFrame((long) ((int) (f * ((float) this.mTotalDuration))));
            }
        }

        public void onScrollStateChanged(boolean z) {
            if (z) {
                showDurationBar();
                if (this.mVideoPageItem != null) {
                    this.mVideoPageItem.onPreviewStart();
                }
            } else {
                hideDurationBar(true);
                if (this.mVideoPageItem != null) {
                    this.mVideoPageItem.onPreviewStop();
                }
            }
            if (PhotoPageFragment.this.mSpecialTypeManager != null) {
                PhotoPageFragment.this.mSpecialTypeManager.setEnterVisible(!z);
            }
        }

        public void onSingleFrameResponse(String str, long j) {
            if (this.mCurrentItem != null && TextUtils.equals(str, this.mCurrentItem.getOriginalPath())) {
                Log.d("VideoPreviewManager", "onSingleFrameResponse %d", (Object) Long.valueOf(j));
                this.mVideoPageItem.onPreviewUpdate(j == this.mLastRequestTime);
            }
            onSeekFinish();
        }

        public void onStart() {
            this.mProvider.onStart();
        }

        public void onStop() {
            this.mProvider.onStop();
        }

        public void onSurfacePrepared(Surface surface) {
            if (this.mCurrentItem != null) {
                this.mProvider.setSurfaceForVideo(this.mCurrentItem.getOriginalPath(), surface);
            }
        }

        public void onThumbListResponse(String str, ThumbListInfo thumbListInfo) {
            Log.d("VideoPreviewManager", "onThumbListResponse");
            if (thumbListInfo != null && this.mCurrentItem != null && TextUtils.equals(str, this.mCurrentItem.getOriginalPath()) && this.mPagerScrollState == 0) {
                updateAndShowSeekBar(thumbListInfo);
            }
        }

        /* access modifiers changed from: 0000 */
        public void seekTo(long j, boolean z) {
            this.mSeekNeedCallback = z;
            if (this.mTotalDuration <= 0 || j < 0) {
                onSeekFinish();
                return;
            }
            long max = Math.max(0, Math.min(this.mTotalDuration, j));
            float f = (((float) max) * 1.0f) / ((float) this.mTotalDuration);
            this.mSeekBar.setProgress(Math.max(0.0f, Math.min(1.0f, f)));
            requestFrame(max);
            if (this.mVideoPageItem != null) {
                this.mVideoPageItem.onPreviewStop();
            }
            Log.d("VideoPreviewManager", "seekTo %d, total %d, percent %f", Long.valueOf(max), Long.valueOf(this.mTotalDuration), Float.valueOf(f));
        }

        /* access modifiers changed from: 0000 */
        public void settleItem() {
            if (this.mCurrentItem == null) {
                dismissSeekBar();
                dismissDurationBar();
                return;
            }
            Log.d("VideoPreviewManager", "onSettleItem");
            if (this.mVideoPageItem != null) {
                this.mVideoPageItem.getPreviewSurface();
            }
            ThumbListInfo thumbListInfo = this.mThumbListInfo;
            if (thumbListInfo == null) {
                thumbListInfo = this.mProvider.getThumbListInfo(this.mCurrentItem.getOriginalPath());
            }
            if (thumbListInfo == null) {
                dismissSeekBar();
                dismissDurationBar();
            } else {
                updateAndShowSeekBar(thumbListInfo);
            }
        }

        /* access modifiers changed from: 0000 */
        public void updateItem(BaseDataItem baseDataItem) {
            if (this.mCurrentItem != null) {
                this.mProvider.releaseForVideo(this.mCurrentItem.getOriginalPath());
            }
            if (this.mVideoPageItem != null) {
                this.mVideoPageItem.setOnSurfacePreparedListener(null);
            }
            this.mThumbListInfo = null;
            PhotoPageItem currentItem = PhotoPageFragment.this.mPagerHelper.getCurrentItem();
            if (baseDataItem == null || !baseDataItem.isVideo() || baseDataItem.isSecret() || TextUtils.isEmpty(baseDataItem.getOriginalPath()) || !(currentItem instanceof PhotoPageVideoItem)) {
                this.mCurrentItem = null;
                this.mVideoPageItem = null;
                return;
            }
            Log.d("VideoPreviewManager", "updateItem");
            this.mCurrentItem = baseDataItem;
            this.mVideoPageItem = (PhotoPageVideoItem) currentItem;
            this.mVideoPageItem.setOnSurfacePreparedListener(this);
            this.mProvider.prepareForVideo(baseDataItem.getOriginalPath());
            this.mProvider.requestThumbList(baseDataItem.getOriginalPath(), this.mThumbItemWidth, this.mThumbItemHeight);
        }
    }

    private class VoiceAssistantReceiver extends BroadcastReceiver {
        private VoiceAssistantReceiver() {
        }

        public void onReceive(Context context, Intent intent) {
            if (PhotoPageFragment.this.mChoiceManager != null && !PhotoPageFragment.this.mChoiceManager.isSlipped()) {
                BaseDataItem dataItem = PhotoPageFragment.this.mAdapter.getDataItem(PhotoPageFragment.this.mPager.getCurrentItem());
                Intent intent2 = new Intent("android.intent.action.SEND");
                if (dataItem.isVideo()) {
                    intent2.setType("video/*");
                } else {
                    intent2.setType("image/*");
                }
                String stringExtra = intent.getStringExtra("assistant_target_package");
                String stringExtra2 = intent.getStringExtra("assistant_target_class");
                boolean booleanExtra = intent.getBooleanExtra("assistant_need_beauty", false);
                if (!TextUtils.isEmpty(stringExtra) && !TextUtils.isEmpty(stringExtra2)) {
                    intent2.setComponent(new ComponentName(stringExtra, stringExtra2));
                    List queryIntentActivities = PhotoPageFragment.this.mActivity.getPackageManager().queryIntentActivities(intent2, 65536);
                    if (MiscUtil.isValid(queryIntentActivities) && queryIntentActivities.size() == 1) {
                        intent2.putExtra("assistant_need_beauty", booleanExtra);
                        PhotoPageFragment.this.mChoiceManager.sendCurrentToShare(intent2);
                    }
                }
            }
        }
    }

    /* access modifiers changed from: private */
    public boolean activityAlive() {
        return this.mActivity != null && !this.mActivity.isDestroyed() && !this.mActivity.isFinishing();
    }

    private boolean alwaysShowMenubar() {
        return this.mAlwaysShowMenubar;
    }

    private void configViewLayout(View view) {
        Resources resources = getResources();
        float fraction = resources.getFraction(R.fraction.share_title_ratio, 1, 1);
        float fraction2 = resources.getFraction(R.fraction.share_pager_ratio, 1, 1);
        float fraction3 = resources.getFraction(R.fraction.share_channel_ratio, 1, 1);
        VerticalSlipLayout verticalSlipLayout = (VerticalSlipLayout) view.findViewById(R.id.slip_layout);
        PhotoChoiceTitle photoChoiceTitle = (PhotoChoiceTitle) view.findViewById(R.id.photo_choice_title);
        View findViewById = view.findViewById(R.id.child_container);
        int max = Math.max(ScreenConfig.getRealScreenHeight(), ScreenConfig.getRealScreenWidth());
        int min = Math.min(ScreenConfig.getRealScreenHeight(), ScreenConfig.getRealScreenWidth());
        float f = (float) max;
        int i = (int) (fraction * f);
        int i2 = (int) (fraction3 * f);
        photoChoiceTitle.getLayoutParams().height = i;
        findViewById.getLayoutParams().height = i2;
        verticalSlipLayout.setFixedSideSlipDistance(i);
        int dimensionPixelSize = resources.getDimensionPixelSize(R.dimen.photo_slip_horizontal_margin);
        float f2 = 1.0f - ((((float) dimensionPixelSize) * 2.0f) / ((float) min));
        float dimensionPixelSize2 = (((float) resources.getDimensionPixelSize(R.dimen.viewpager_slip_page_margin)) * 1.0f) / ((float) resources.getDimensionPixelSize(R.dimen.viewpager_page_margin));
        this.mPager.setHeightSlipRatio(fraction2);
        this.mPager.setWidthSlipRatio(f2);
        this.mPager.setMarginSlipRatio(dimensionPixelSize2);
    }

    /* JADX WARNING: type inference failed for: r2v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 26
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    private void createBars() {
        this.mTopBar = new PhotoPageTopBar(this.mActivity, new OnClickListener() {
            public void onClick(View view) {
                PhotoPageFragment.this.doExit();
            }
        });
        final boolean z = !isShowBarsWhenEntering();
        if (!z) {
            setHasOptionsMenu(true);
        }
        this.mTopBar.getView().addOnLayoutChangeListener(new OnLayoutChangeListener() {
            public void onLayoutChange(View view, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8) {
                if (PhotoPageFragment.this.isResumed()) {
                    if (z) {
                        PhotoPageFragment.this.setHasOptionsMenu(true);
                    }
                    PhotoPageFragment.this.onBarsCreated();
                    PhotoPageFragment.this.mTopBar.getView().removeOnLayoutChangeListener(this);
                }
            }
        });
        getActionBar().setCustomView(this.mTopBar.getView(), new LayoutParams(-1, -1, 19));
        getActionBar().setBackgroundDrawable(getResources().getDrawable(R.drawable.photo_page_action_bar_background_with_divider));
        if (!isShowBarsWhenEntering()) {
            setActionBarVisible(false);
        }
    }

    /* access modifiers changed from: private */
    public void dismissKeyGuard() {
        this.mHasSendDismissCast = true;
        this.mActivity.sendBroadcast(new Intent("xiaomi.intent.action.SHOW_SECURE_KEYGUARD"));
    }

    private void doDataSetLoaded(BaseDataSet baseDataSet, boolean z) {
        this.mDataLoaded = true;
        if (z && this.mChoiceManager != null) {
            this.mChoiceManager.initSelected(baseDataSet);
        }
        if (this.mProjectManager != null) {
            this.mProjectManager.updateSet(baseDataSet);
        }
    }

    /* access modifiers changed from: private */
    public void doDownloadOrigin(final BaseDataItem baseDataItem, final DownloadType downloadType, final DownloadCallback downloadCallback) {
        AnonymousClass14 r0 = new OnDownloadListener() {
            public void onCanceled() {
                PhotoPageFragment.this.mDownloadListener.onLoadingCancelled(baseDataItem.getDownloadUri(), downloadType, null);
            }

            /* JADX WARNING: type inference failed for: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
            /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 35
            	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
            	at java.util.ArrayList.forEach(Unknown Source)
            	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
            	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
            	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
            	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
            	at java.util.ArrayList.forEach(Unknown Source)
            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
            	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
            	at java.util.ArrayList.forEach(Unknown Source)
            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
            	at jadx.core.ProcessClass.process(ProcessClass.java:30)
            	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
            	at java.util.ArrayList.forEach(Unknown Source)
            	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
            	at jadx.core.ProcessClass.process(ProcessClass.java:35)
            	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
            	at jadx.api.JavaClass.decompile(JavaClass.java:62)
            	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
             */
            /* JADX WARNING: Unknown variable types count: 1 */
            public void onDownloadComplete(List<BulkDownloadItem> list, List<BulkDownloadItem> list2) {
                if (list == null || list.size() < 1) {
                    DialogUtil.showInfoDialog((Context) PhotoPageFragment.this.mActivity, PhotoPageFragment.this.getResources().getString(R.string.download_retry_message), PhotoPageFragment.this.getResources().getString(R.string.download_retry_title), (int) R.string.download_retry_text, 17039360, (DialogInterface.OnClickListener) new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialogInterface, int i) {
                            PhotoPageFragment.this.downloadOrigin(baseDataItem, downloadCallback);
                        }
                    }, (DialogInterface.OnClickListener) new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialogInterface, int i) {
                            PhotoPageFragment.this.mDownloadListener.onLoadingCancelled(baseDataItem.getDownloadUri(), downloadType, null);
                        }
                    });
                    return;
                }
                baseDataItem.setFilePath(((BulkDownloadItem) list.get(0)).getDownloadPath());
                downloadCallback.downloadSuccess(((BulkDownloadItem) list.get(0)).getDownloadPath(), baseDataItem);
                PhotoPageFragment.this.mDownloadListener.onDownloadComplete(baseDataItem.getDownloadUri(), downloadType, null, baseDataItem.getOriginalPath());
            }
        };
        BulkDownloadItem bulkDownloadItem = new BulkDownloadItem(baseDataItem.getDownloadUri(), downloadType, baseDataItem.getSize());
        ArrayList arrayList = new ArrayList();
        arrayList.add(bulkDownloadItem);
        DownloadFragment newInstance = DownloadFragment.newInstance(arrayList);
        newInstance.setOnDownloadListener(r0);
        newInstance.showAllowingStateLoss(getFragmentManager(), "DownloadFragment");
    }

    private void doOnItemChanged(int i) {
        BaseDataItem dataItem = this.mAdapter.getDataItem(i);
        if (dataItem != null) {
            refreshTopBar(dataItem);
            if (this.mFavoritesManager != null) {
                this.mFavoritesManager.updateItem(dataItem);
            }
            if (this.mSmartVideoGuideManager != null) {
                this.mSmartVideoGuideManager.updateItem(dataItem);
            }
            if (this.mSpecialTypeManager != null) {
                this.mSpecialTypeManager.updateItem(dataItem);
            }
        }
        if (this.mMaskManager != null) {
            this.mMaskManager.refreshMask(false);
        }
        if (this.mDualCameraManager != null) {
            this.mDualCameraManager.updateItem(dataItem);
        }
        if (this.mVideoPreviewManager != null) {
            this.mVideoPreviewManager.updateItem(dataItem);
        }
    }

    /* JADX WARNING: type inference failed for: r1v4, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v4, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 63
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    private void doOnItemSettled(int i) {
        BaseDataItem dataItem = this.mAdapter.getDataItem(i);
        if (dataItem != null) {
            if (this.mMenuManager != null) {
                this.mMenuManager.settleItem(dataItem);
            }
            if (this.mProjectManager != null) {
                this.mProjectManager.settleItem(dataItem, i);
            }
            if (this.mOrientationManager != null) {
                this.mOrientationManager.settleItem(dataItem);
            }
            if (this.mNFCManager != null) {
                this.mNFCManager.settleItem(dataItem);
            }
            if (this.mChoiceManager != null) {
                this.mChoiceManager.settleItem(dataItem);
            }
            if (this.mDualCameraManager != null) {
                this.mDualCameraManager.settleItem(dataItem);
            }
            if (this.mVideoPreviewManager != null) {
                this.mVideoPreviewManager.settleItem();
            }
            this.mPagerHelper.onActionBarVisibleChanged(isActionBarVisible(), getActionBarHeight());
            int i2 = this.mActivity.getWindow().getAttributes().flags;
            if (dataItem.isSecret()) {
                if ((i2 & 8192) == 0) {
                    Log.d("PhotoPageFragment", "add FLAG_SECURE");
                    this.mActivity.getWindow().addFlags(8192);
                }
            } else if ((i2 & 8192) != 0) {
                Log.d("PhotoPageFragment", "clear FLAG_SECURE");
                this.mActivity.getWindow().clearFlags(8192);
            }
            TalkBackUtil.requestAnnouncementEvent(this.mPager, dataItem.getContentDescription(this.mActivity));
        }
    }

    /* JADX WARNING: type inference failed for: r0v4, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v4, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 21
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    private void doOnPause() {
        if (this.mOrientationManager != null) {
            this.mOrientationManager.pause();
        }
        if (this.mDualCameraManager != null) {
            this.mDualCameraManager.pause();
        }
        if (this.mProjectManager != null) {
            this.mProjectManager.disableRemoteControl();
        }
        if (this.mVoiceAssistantReceiver != null) {
            LocalBroadcastManager.getInstance(this.mActivity).unregisterReceiver(this.mVoiceAssistantReceiver);
            this.mVoiceAssistantReceiver = null;
        }
    }

    /* JADX WARNING: type inference failed for: r4v0, types: [android.app.Fragment, com.miui.gallery.ui.PhotoPageFragment] */
    /* JADX WARNING: type inference failed for: r0v11, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v11, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 42
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    private void doOnResume() {
        if (!isActionBarVisible()) {
            SystemUiUtil.setSystemBarsVisibility(false, this.mActivity.getWindow().getDecorView());
        }
        if (this.mOrientationManager != null) {
            this.mOrientationManager.resume();
        }
        if (this.mDualCameraManager != null) {
            this.mDualCameraManager.resume();
        }
        if (this.mProjectManager != null) {
            this.mProjectManager.enableRemoteControl();
        }
        if (isNeedConfirmPassWord(this.mAdapter.getDataItem(this.mPager.getCurrentItem()))) {
            this.mNeedConfirmPassWord = false;
            LockSettingsHelper.startAuthenticatePasswordActivity((Fragment) this, 27);
        }
        if (this.mVoiceAssistantReceiver == null) {
            this.mVoiceAssistantReceiver = new VoiceAssistantReceiver();
            LocalBroadcastManager.getInstance(this.mActivity).registerReceiver(this.mVoiceAssistantReceiver, new IntentFilter("com.miui.gallery.action.VOICE_ASSISTANT_SHARE"));
        }
        if (this.mVideoPlayerManager != null) {
            this.mVideoPlayerManager.onResume();
        }
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
    /* JADX WARNING: type inference failed for: r0v31, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* access modifiers changed from: private */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 74
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 2 */
    public void doOnTransitEnd() {
        super.delayDoAfterTransit();
        if (isTransparentTheme()) {
            LocalBroadcastManager.getInstance(this.mActivity).sendBroadcast(new Intent("com.miu.gallery.action.ENTER_PHOTO_PAGE"));
        }
        if (isPreviewMode()) {
            setActionBarVisible(false);
            return;
        }
        createBars();
        if (supportProjection()) {
            this.mProjectManager = new ProjectionManager();
        }
        this.mOrientationManager = new OrientationManager();
        this.mNFCManager = new NFCManager(this.mActivity);
        this.mChoiceManager = new ChoiceManager();
        this.mDualCameraManager = new DualCameraManager();
        this.mEditorManager = new PhotoEditorManager();
        this.mSpecialTypeManager = new SpecialTypeManager(this);
        this.mRefocusManager = new RefocusManager(this.mSpecialTypeManager);
        if (SmartVideoJudgeManager.isAvailable()) {
            this.mSmartVideoGuideManager = new SmartVideoGuideManager();
        }
        this.mVideoPlayerManager = new VideoPlayerManager(this.mSpecialTypeManager);
        this.mMotionPhotoManager = new MotionPhotoManager(this.mSpecialTypeManager, this.mTopBar);
        this.mMeituEditorManager = new MeituEditorManager();
        if (this.mIsSupportFordBurst) {
            this.mBurstPhotoManager = new BurstPhotoManager(this.mSpecialTypeManager);
        }
        if (IntentUtil.isSupportNewVideoPlayer()) {
            this.mVideoPreviewManager = new VideoPreviewManager();
        }
        if (isResumed()) {
            doOnResume();
        }
        if (this.mDataLoaded) {
            doDataSetLoaded(this.mAdapter.getDataSet(), true);
            doOnItemChanged(this.mPager.getCurrentItem());
            doOnItemSettled(this.mPager.getCurrentItem());
        }
        if (this.mThemeManager != null) {
            this.mThemeManager.setBackgroundAlpha(1.0f);
        }
    }

    /* access modifiers changed from: private */
    public void downloadOrigin() {
        PhotoPageItem currentItem = this.mPagerHelper.getCurrentItem();
        if (currentItem != null) {
            currentItem.downloadOrigin();
        }
    }

    /* JADX WARNING: type inference failed for: r3v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* access modifiers changed from: private */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r3v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 19
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    public void finishActivity(int i) {
        if (this.mActivity != null && !this.mActivity.isFinishing()) {
            if (isTransparentTheme()) {
                Intent intent = new Intent("com.miui.gallery.action.EXIT_PHOTO_PAGE");
                intent.putExtra("photo_result_code", i);
                LocalBroadcastManager.getInstance(this.mActivity).sendBroadcast(intent);
            }
            this.mActivity.finish();
        }
    }

    private boolean fromRecommendFacePage() {
        return this.mFromRecommendFacePage;
    }

    /* JADX WARNING: type inference failed for: r0v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* access modifiers changed from: private */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 11
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    public int getActionBarHeight() {
        int height = getActionBar().getHeight();
        return height > 0 ? height : MiscUtil.getStatusBarHeight(this.mActivity) + this.mActivity.getResources().getDimensionPixelSize(R.dimen.photo_page_actionbar_height);
    }

    /* access modifiers changed from: private */
    public String getItemClickEventCategory(BaseDataItem baseDataItem) {
        return baseDataItem.isSecret() ? "photo_secret" : "photo";
    }

    /* access modifiers changed from: private */
    public void hideActionBarView() {
        Log.d("PhotoPageFragment", "hideActionBarView");
        if (this.mTopBar != null && this.mTopBar.isShowing()) {
            this.mTopBar.hide();
            hideBottomMenu();
            if (this.mMaskManager != null) {
                this.mMaskManager.hideMaskImmediately();
            }
        }
    }

    private boolean inPreviewMode() {
        return !isActionBarVisible() && (this.mChoiceManager == null || !this.mChoiceManager.isPendingSlipped());
    }

    /* access modifiers changed from: private */
    public boolean isActionBarVisible() {
        return getActionBar() != null && getActionBar().isShowing();
    }

    /* access modifiers changed from: private */
    public boolean isFromCamera() {
        return this.isFromCamera;
    }

    private boolean isNaviBarShown() {
        boolean z = false;
        if (2 == this.mActivity.getResources().getConfiguration().orientation) {
            if (ViewCompat.getSystemWindowInsetLeft(this.mActivity.getWindow().getDecorView()) > 0 || ViewCompat.getSystemWindowInsetRight(this.mActivity.getWindow().getDecorView()) > 0) {
                z = true;
            }
            return z;
        }
        if (ViewCompat.getSystemWindowInsetBottom(this.mActivity.getWindow().getDecorView()) > 0) {
            z = true;
        }
        return z;
    }

    /* access modifiers changed from: private */
    public boolean isPreviewMode() {
        return fromRecommendFacePage() || this.mPreviewMode;
    }

    private boolean isSecureKeyguard() {
        return ((KeyguardManager) this.mActivity.getSystemService("keyguard")).isKeyguardSecure();
    }

    private boolean isShowBarsWhenEntering() {
        String string = getArguments().getString("photo_uri");
        return (!TextUtils.isEmpty(string) && UriUtil.isNetUri(Uri.parse(string))) || alwaysShowMenubar() || (getArguments().getBoolean("com.miui.gallery.extra.show_bars_when_enter", true) && !getArguments().getBoolean("com.miui.gallery.extra.photo_enter_choice_mode", false) && !isPreviewMode() && !isFromCamera());
    }

    private boolean isStatUserShowMenuBar() {
        return isFromCamera();
    }

    /* access modifiers changed from: private */
    public boolean isTransparentTheme() {
        return this.mTheme == 1;
    }

    /* access modifiers changed from: private */
    public boolean needDismissKeyGuard() {
        return this.mStartWhenLocked && !this.mStartWhenLockedAndSecret && !this.mHasSendDismissCast;
    }

    public static PhotoPageFragment newInstance(Uri uri, String str, Bundle bundle, int i) {
        if (bundle == null) {
            bundle = new Bundle();
        }
        bundle.putInt("key_theme", i);
        if (uri != null) {
            bundle.putString("photo_uri", uri.toString());
        }
        if (str != null) {
            bundle.putString("mime_type", str);
        }
        PhotoPageFragment photoPageFragment = new PhotoPageFragment();
        photoPageFragment.setArguments(bundle);
        return photoPageFragment;
    }

    private void onActionBarVisibilityChanged(boolean z) {
        int i = 0;
        if (z) {
            if (this.mDualCameraManager != null) {
                this.mDualCameraManager.showMoreFuncExceptRefocus(true);
            }
            if (this.mFavoritesManager != null) {
                this.mFavoritesManager.show();
            }
            if (this.mSmartVideoGuideManager != null) {
                this.mSmartVideoGuideManager.onActionBarVisibilityChanged(true);
            }
        } else {
            if (this.mDualCameraManager != null) {
                this.mDualCameraManager.hideMoreFuncExceptRefocus(true);
            }
            if (!isExiting() && this.mFavoritesManager != null) {
                this.mFavoritesManager.hide();
            }
            if (this.mSmartVideoGuideManager != null) {
                this.mSmartVideoGuideManager.onActionBarVisibilityChanged(false);
            }
        }
        if (this.mSpecialTypeManager != null) {
            this.mSpecialTypeManager.onActionBarVisibilityChanged();
        }
        if (this.mMaskManager != null) {
            this.mMaskManager.refreshMask(true);
        }
        if (this.mVideoPreviewManager != null) {
            this.mVideoPreviewManager.onActionBarVisibilityChanged(z);
        }
        if (!isExiting()) {
            refreshTheme(false);
            this.mPagerHelper.onActionBarVisibleChanged(z, getActionBarHeight());
            SystemUiUtil.setSystemBarsVisibility(z, this.mActivity.getWindow().getDecorView());
            if (isNaviBarShown()) {
                if (z) {
                    i = this.mIsNightMode ? -16777216 : -1;
                }
                WindowCompat.setNavigationBarColor(this.mActivity.getWindow(), i);
            }
        }
    }

    /* access modifiers changed from: private */
    public void onBarsCreated() {
        this.mMaskManager = new PhotoMaskManager();
        refreshTopBar(this.mAdapter.getDataItem(this.mPager.getCurrentItem()));
        if (isShowBarsWhenEntering()) {
            ActionBarCompat.setShowHideAnimationEnabled(getActionBar(), false);
            getActionBar().hide();
            ActionBarCompat.setShowHideAnimationEnabled(getActionBar(), true);
            setActionBarVisible(true);
            return;
        }
        ActionBarCompat.setShowHideAnimationEnabled(getActionBar(), false);
        setActionBarVisible(false);
        ActionBarCompat.setShowHideAnimationEnabled(getActionBar(), true);
    }

    private boolean parseArguments() {
        Bundle arguments = getArguments();
        if (arguments == null || TextUtils.isEmpty(arguments.getString("photo_uri"))) {
            return false;
        }
        this.isFromCamera = arguments.getBoolean("from_MiuiCamera", false);
        if (this.isFromCamera) {
            this.mStartWhenLocked = arguments.getBoolean("StartActivityWhenLocked", false);
            this.mStartWhenLockedAndSecret = this.mStartWhenLocked && isSecureKeyguard();
        }
        this.mTheme = arguments.getInt("key_theme", 0);
        this.mAlwaysShowMenubar = arguments.getBoolean("photo_always_show_menubar", false);
        this.mFromRecommendFacePage = arguments.getBoolean("from_recommend_face_page", false);
        this.mPreviewMode = arguments.getBoolean("photo_preview_mode");
        this.mIsSupportFordBurst = !arguments.getBoolean("unford_burst", false);
        return true;
    }

    /* JADX WARNING: type inference failed for: r2v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* access modifiers changed from: private */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 6
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    public boolean prohibitOperateProcessingItem(BaseDataItem baseDataItem) {
        if (!isProcessingMedia(baseDataItem)) {
            return false;
        }
        ToastUtils.makeText((Context) this.mActivity, (int) R.string.operate_processing_file_error);
        return true;
    }

    /* access modifiers changed from: private */
    public void refreshTheme(boolean z) {
        if (this.mThemeManager == null) {
            return;
        }
        if (inPreviewMode()) {
            this.mThemeManager.setDarkTheme(true, z);
        } else {
            this.mThemeManager.setLightTheme(true, z);
        }
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r1v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r1v4, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 18
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 3 */
    private void refreshTopBar(BaseDataItem baseDataItem) {
        if (baseDataItem != null && this.mTopBar != null) {
            this.mTopBar.setTitle(baseDataItem.getViewTitle(this.mActivity));
            this.mTopBar.setSubTitle(baseDataItem.getViewSubTitle(this.mActivity));
            this.mTopBar.setLocation(this.mActivity, baseDataItem.getLocation());
        }
    }

    /* access modifiers changed from: private */
    public void setActionBarVisible(boolean z) {
        if (z != isActionBarVisible()) {
            if (z) {
                if ((this.mChoiceManager == null || !this.mChoiceManager.isSlipped()) && !isPreviewMode()) {
                    getActionBar().show();
                } else {
                    return;
                }
            } else if (!alwaysShowMenubar()) {
                getActionBar().hide();
            } else {
                return;
            }
            onActionBarVisibilityChanged(z);
        }
    }

    /* access modifiers changed from: private */
    public void showActionBarView() {
        Log.d("PhotoPageFragment", "showActionBarView");
        if (this.mTopBar != null && !this.mTopBar.isShowing()) {
            this.mTopBar.show();
            showBottomMenu();
            if (this.mMaskManager != null) {
                this.mMaskManager.showMaskImmediately();
            }
        }
    }

    private void statUserShowMenuBar() {
        boolean z = true;
        HashMap hashMap = new HashMap(1);
        if (this.mUserShowBarIndex < 0) {
            z = false;
        }
        hashMap.put("isUserShowMenuBar", String.valueOf(z));
        if (z) {
            hashMap.put("showBarIndex", String.valueOf(this.mUserShowBarIndex));
        }
        GallerySamplingStatHelper.recordCountEvent("photo", "photo_user_show_menu_bar", hashMap);
    }

    private boolean supportProjection() {
        return CTA.canConnectNetwork() || !GalleryUtils.needImpunityDeclaration();
    }

    /* access modifiers changed from: protected */
    public void delayDoAfterTransit() {
        if (!isAdded()) {
            Log.i("PhotoPageFragment", "delayDoAfterTransit but not added");
            return;
        }
        if (isFromCamera()) {
            ThreadManager.getMainHandler().post(new Runnable() {
                public void run() {
                    if (PhotoPageFragment.this.mActivity != null) {
                        PhotoPageFragment.this.doOnTransitEnd();
                    }
                }
            });
        } else {
            doOnTransitEnd();
        }
    }

    /* access modifiers changed from: protected */
    public void doExit() {
        if (!isTransparentTheme() || PhotoPageDataCache.getInstance().isItemVisible(this.mPager.getCurrentItem()) || !PhotoPageDataCache.getInstance().viewToPosition(this.mPager.getCurrentItem())) {
            super.doExit();
        } else {
            ThreadManager.getMainHandler().post(new Runnable() {
                public void run() {
                    PhotoPageFragment.super.doExit();
                }
            });
        }
    }

    /* JADX WARNING: type inference failed for: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* access modifiers changed from: protected */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 16
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    public void downloadOrigin(final BaseDataItem baseDataItem, final DownloadCallback downloadCallback) {
        if (NetworkUtils.isActiveNetworkMetered()) {
            DialogUtil.showInfoDialog((Context) this.mActivity, getResources().getString(R.string.download_with_metered_network_msg), getResources().getString(R.string.download_with_metered_network_title), 17039370, 17039360, (DialogInterface.OnClickListener) new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    PhotoPageFragment.this.mMenuManager.refreshDownloadItem(null, true, false);
                    PhotoPageFragment.this.doDownloadOrigin(baseDataItem, DownloadType.ORIGIN_FORCE, downloadCallback);
                }
            }, (DialogInterface.OnClickListener) new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    dialogInterface.cancel();
                }
            });
            return;
        }
        this.mMenuManager.refreshDownloadItem(null, true, false);
        doDownloadOrigin(baseDataItem, DownloadType.ORIGIN, downloadCallback);
    }

    public void finish() {
        finishActivity(-1);
    }

    /* access modifiers changed from: protected */
    public ItemViewInfo getItemViewInfo(int i) {
        if (isTransparentTheme()) {
            return PhotoPageDataCache.getInstance().getItemViewInfo(i);
        }
        return null;
    }

    /* JADX WARNING: type inference failed for: r3v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* access modifiers changed from: protected */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r3v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 8
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    public View getLayout(LayoutInflater layoutInflater, ViewGroup viewGroup) {
        View pageLayout = PhotoPageDataCache.getInstance().getPageLayout();
        return pageLayout != null ? pageLayout : LayoutInflater.from(this.mActivity).inflate(R.layout.photo_page, viewGroup, false);
    }

    public PhotoPageItem getPageItem() {
        return this.mPagerHelper.getCurrentItem();
    }

    public String getPageName() {
        return "photo";
    }

    /* access modifiers changed from: protected */
    public PhotoPageInteractionListener getPhotoPageInteractionListener() {
        return new PhotoPageInteractionListener() {
            public int getActionBarHeight() {
                if (!PhotoPageFragment.this.isAdded() || PhotoPageFragment.this.getActionBar() == null) {
                    return 0;
                }
                return PhotoPageFragment.this.getActionBar().getHeight();
            }

            public int getMenuBarHeight() {
                if (PhotoPageFragment.this.isAdded()) {
                    return PhotoPageFragment.this.getMenuCollapsedHeight();
                }
                return 0;
            }

            public void notifyDataChanged() {
                if (PhotoPageFragment.this.isAdded()) {
                    PhotoPageFragment.this.onContentChanged();
                }
            }
        };
    }

    public ImageView getPhotoView() {
        PhotoPageItem currentItem = this.mPagerHelper.getCurrentItem();
        if (currentItem != null) {
            return (ImageView) currentItem.findViewById(R.id.photoview);
        }
        return null;
    }

    public String getTAG() {
        return "PhotoPageFragment";
    }

    /* access modifiers changed from: protected */
    public int getThemeRes() {
        return isTransparentTheme() ? 2131820713 : 2131820712;
    }

    public void onActivityReenter(int i, Intent intent) {
        if (intent != null) {
            String stringExtra = intent.getStringExtra("extra_photo_edit_type");
            if ("extra_photo_editor_type_common".equals(stringExtra)) {
                if (this.mEditorManager != null) {
                    this.mEditorManager.onActivityReenter(intent);
                }
            } else if ("extra_photo_editor_type_refocus".equals(stringExtra)) {
                if (this.mRefocusManager != null) {
                    this.mRefocusManager.onActivityReenter(intent);
                }
            } else if ("extra_photo_editor_type_re_pick".equals(stringExtra) && this.mMotionPhotoManager != null) {
                this.mMotionPhotoManager.onActivityReenter(intent);
            }
        }
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        switch (i) {
            case 24:
                if (this.mProjectManager != null) {
                    this.mProjectManager.exitSlideShow();
                    break;
                }
                break;
            case 27:
                if (i2 == -1) {
                    this.mNeedConfirmPassWord = false;
                    break;
                } else {
                    finishActivity(i2);
                    break;
                }
            case 30:
                if (this.mEditorManager != null) {
                    this.mEditorManager.onActivityResult(i2, intent);
                }
                if (intent != null && intent.getBooleanExtra("photo_secret_finish", false)) {
                    finishActivity(0);
                    break;
                } else {
                    this.mNeedConfirmPassWord = false;
                    break;
                }
            case 37:
                if (this.mDualCameraManager != null) {
                    this.mDualCameraManager.onDualPhotoEdited(intent);
                    break;
                }
                break;
            case 38:
                if (i2 != -1) {
                    finishActivity(i2);
                    break;
                } else {
                    this.mNeedConfirmPassWord = false;
                    break;
                }
            case 44:
                if (this.mRefocusManager != null) {
                    this.mRefocusManager.onActivityResult(i2, intent);
                    break;
                }
                break;
            case 45:
                if (this.mVideoPlayerManager != null) {
                    this.mVideoPlayerManager.onActivityResult(i2, intent);
                    break;
                }
                break;
            case 50:
                if (this.mMotionPhotoManager != null) {
                    this.mMotionPhotoManager.onActivityResult(i2, intent);
                    break;
                }
                break;
            case 51:
                if (this.mMeituEditorManager != null) {
                    this.mMeituEditorManager.onActivityResult(i2, intent);
                    break;
                }
                break;
            case 52:
                if (i2 == -1 && this.mBurstPhotoManager != null) {
                    this.mBurstPhotoManager.onActivityResult(intent);
                    break;
                }
        }
        super.onActivityResult(i, i2, intent);
        this.mPagerHelper.onActivityResult(i, i2, intent);
    }

    public boolean onBackPressed() {
        if (this.mChoiceManager == null || !this.mChoiceManager.onBackPressed()) {
            doExit();
        }
        return true;
    }

    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        if (this.mOrientationManager != null) {
            this.mOrientationManager.onUiOrientationChanged(configuration);
        }
        if (this.mChoiceManager != null) {
            this.mChoiceManager.onUiOrientationChanged(configuration);
        }
        if (this.mVideoPreviewManager != null) {
            this.mVideoPreviewManager.onOrientationChanged();
        }
    }

    /* JADX WARNING: type inference failed for: r0v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r4v10, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 36
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 2 */
    public void onCreate(Bundle bundle) {
        boolean parseArguments = parseArguments();
        super.onCreate(bundle);
        if (!parseArguments) {
            Log.e("PhotoPageFragment", "params error %s", (Object) getArguments());
            finish();
            return;
        }
        if (isFromCamera()) {
            if (this.mStartWhenLocked) {
                this.mActivity.getWindow().addFlags(nexEngine.ExportHEVCHighTierLevel52);
                this.mScreenReceiver = new ScreenBroadcastReceiver();
                ReceiverUtils.registerReceiver(this.mActivity, this.mScreenReceiver, "android.intent.action.SCREEN_OFF");
            }
            this.mPhotoRefreshReceiver = new PhotoRefreshReceiver();
            IntentFilter intentFilter = new IntentFilter();
            intentFilter.addAction("com.miui.gallery.SAVE_TO_CLOUD");
            LocalBroadcastManager.getInstance(this.mActivity).registerReceiver(this.mPhotoRefreshReceiver, intentFilter);
        }
        this.mIsNightMode = MiscUtil.isNightMode(getActivity());
    }

    public boolean onCreateOptionsMenu(Menu menu) {
        int i = 0;
        if (isPreviewMode()) {
            return false;
        }
        menu.clear();
        this.mActivity.getMenuInflater().inflate(R.menu.photo_page, menu);
        Bundle arguments = getArguments();
        if (arguments != null) {
            i = arguments.getInt("support_operation_mask", -1);
        }
        this.mMenuManager = new MenuManager(menu, i);
        this.mFavoritesManager = new FavoritesManager(menu);
        return true;
    }

    /* access modifiers changed from: protected */
    public void onDataSetLoaded(BaseDataSet baseDataSet, boolean z) {
        super.onDataSetLoaded(baseDataSet, z);
        doDataSetLoaded(baseDataSet, z);
    }

    /* JADX WARNING: type inference failed for: r0v22, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r0v24, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v22, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 54
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 2 */
    public void onDestroy() {
        PhotoReusedBitCache.getInstance().initFirstCacheBitmap();
        TileReusedBitCache.getInstance().clear();
        if (this.mScreenReceiver != null) {
            ReceiverUtils.safeUnregisterReceiver(this.mActivity, this.mScreenReceiver);
        }
        if (this.mPhotoRefreshReceiver != null) {
            LocalBroadcastManager.getInstance(this.mActivity).unregisterReceiver(this.mPhotoRefreshReceiver);
        }
        if (this.mDualCameraManager != null) {
            this.mDualCameraManager.onDestory();
        }
        if (this.mEditorManager != null) {
            this.mEditorManager.onDestroy();
        }
        if (this.mFavoritesManager != null) {
            this.mFavoritesManager.onDestroy();
        }
        if (this.mVideoPlayerManager != null) {
            this.mVideoPlayerManager.onDestroy();
        }
        if (this.mMotionPhotoManager != null) {
            this.mMotionPhotoManager.onDestroy();
        }
        if (this.mSpecialTypeManager != null) {
            this.mSpecialTypeManager.onDestroy();
        }
        if (this.mMeituEditorManager != null) {
            this.mMeituEditorManager.onDestroy();
        }
        if (this.mVideoPreviewManager != null) {
            this.mVideoPreviewManager.onDestroy();
        }
        CacheOfAllFacesInOnePhoto.getInstance().clearCache();
        if (isStatUserShowMenuBar()) {
            statUserShowMenuBar();
        }
        super.onDestroy();
    }

    public void onDestroyView() {
        super.onDestroyView();
        PhotoPagerSamplingStatHelper.onDestroy();
        if (this.mProjectManager != null) {
            this.mProjectManager.release();
        }
        if (this.mOrientationManager != null) {
            this.mOrientationManager.release();
        }
        if (this.mMaskManager != null) {
            this.mMaskManager.release();
        }
        if (this.mChoiceManager != null) {
            this.mChoiceManager.release();
        }
        if (this.mRefocusManager != null) {
            this.mRefocusManager.release();
            this.mRefocusManager = null;
        }
        if (this.mSmartVideoGuideManager != null) {
            this.mSmartVideoGuideManager.release();
        }
        if (this.mNFCManager != null) {
            this.mNFCManager.release();
        }
        this.mDataLoaded = false;
    }

    /* access modifiers changed from: protected */
    public void onExiting() {
        if (isFromCamera()) {
            getActionBar().setDisplayShowCustomEnabled(false);
        }
        setActionBarVisible(false);
    }

    public void onImageLoadFinish(String str) {
        if (this.mEditorManager != null) {
            this.mEditorManager.onImageLoadFinish(str);
        }
        if (this.mRefocusManager != null) {
            this.mRefocusManager.onImageLoadFinish(str);
        }
        if (this.mMotionPhotoManager != null) {
            this.mMotionPhotoManager.onImageLoadFinish(str);
        }
        if (this.mMeituEditorManager != null) {
            this.mMeituEditorManager.onImageLoadFinish(str);
        }
        if (this.mVideoPlayerManager != null) {
            this.mVideoPlayerManager.onImageLoadFinish(str);
        }
    }

    /* access modifiers changed from: protected */
    public void onItemChanged(int i) {
        super.onItemChanged(i);
        doOnItemChanged(i);
    }

    /* access modifiers changed from: protected */
    public void onItemSettled(int i) {
        super.onItemSettled(i);
        doOnItemSettled(i);
    }

    public void onMultiWindowModeChanged(boolean z) {
        Log.d("PhotoPageFragment", "isInMultiWindowMode: %b", (Object) Boolean.valueOf(z));
        if (this.mChoiceManager != null) {
            this.mChoiceManager.onMultiWindowModeChanged(z);
        }
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        this.mMenuManager.onMenuItemClick(menuItem);
        return true;
    }

    public void onPageScrollStateChanged(int i) {
        super.onPageScrollStateChanged(i);
        if (this.mVideoPreviewManager != null) {
            this.mVideoPreviewManager.onPageScrollStateChanged(i);
        }
    }

    public void onPageScrolled(int i, float f, int i2) {
        super.onPageScrolled(i, f, i2);
        if (this.mVideoPreviewManager != null) {
            this.mVideoPreviewManager.onPageScrolled(i, f, i2);
        }
    }

    public void onPause() {
        super.onPause();
        doOnPause();
    }

    public void onPrepareOptionsMenu(Menu menu) {
        if (this.mMenuManager != null) {
            this.mMenuManager.settleItem(this.mAdapter.getDataItem(this.mPager.getCurrentItem()));
        }
    }

    public void onResume() {
        super.onResume();
        doOnResume();
    }

    /* access modifiers changed from: protected */
    public void onShared() {
        super.onShared();
        if (this.mChoiceManager != null) {
            this.mChoiceManager.onShared();
        }
    }

    public void onStart() {
        super.onStart();
        if (this.mVideoPreviewManager != null) {
            this.mVideoPreviewManager.onStart();
        }
    }

    public void onStop() {
        this.mNeedConfirmPassWord = true;
        super.onStop();
        if (this.mVideoPreviewManager != null) {
            this.mVideoPreviewManager.onStop();
        }
    }

    public void onTrimMemory(int i) {
        super.onTrimMemory(i);
        if (i == 20) {
            Log.d("PhotoPageFragment", "onTrimMemory level:%d", (Object) Integer.valueOf(i));
            PhotoReusedBitCache.getInstance().clear();
            TileReusedBitCache.getInstance().clear();
        }
    }

    /* access modifiers changed from: protected */
    public void onViewInflated(View view) {
        super.onViewInflated(view);
        configViewLayout(view);
        setHasOptionsMenu(false);
        if (fromRecommendFacePage()) {
            this.mActivity.setRequestedOrientation(1);
        }
        this.mPagerHelper.setOnTapListener(this.mOnSingleTapListener);
        this.mPagerHelper.setOnScaleChangedListener(this.mOnPhotoScaleChangeListener);
        this.mPagerHelper.setOnDisplayRectChangedListener(this.mOnPhotoMatrixChangeListener);
        this.mPagerHelper.setOnDownloadListener(this.mDownloadListener);
        this.mPagerHelper.setOnExitListener(this.mOnExitListener);
        this.mPagerHelper.setOnAlphaChangedListener(this.mAlphaChangedListener);
        ((VerticalSlipLayout) view.findViewById(R.id.slip_layout)).setDraggable(false);
        this.mThemeManager = new ThemeManager((IMultiThemeView) view.findViewById(R.id.photo_layout));
        if (isFromCamera() || isPreviewMode()) {
            this.mThemeManager.setDarkTheme(false, true);
        }
        this.mThemeManager.setBackgroundAlpha(0.0f);
        SystemUiUtil.setLayoutFullScreen(this.mActivity.getWindow().getDecorView(), isShowBarsWhenEntering());
        com.android.internal.WindowCompat.setCutoutModeShortEdges(this.mActivity.getWindow());
    }
}
