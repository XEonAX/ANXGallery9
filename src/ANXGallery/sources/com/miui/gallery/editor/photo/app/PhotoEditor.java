package com.miui.gallery.editor.photo.app;

import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.os.Bundle;
import android.transition.ChangeBounds;
import android.transition.Transition;
import android.transition.Transition.TransitionListener;
import android.transition.TransitionSet;
import android.view.KeyEvent;
import android.view.MotionEvent;
import com.miui.arcsoftbeauty.ArcsoftBeautyJni;
import com.miui.filtersdk.BeautificationSDK;
import com.miui.gallery.R;
import com.miui.gallery.compat.app.ActivityCompat;
import com.miui.gallery.compat.app.ActivityCompat.SharedElementCallback;
import com.miui.gallery.compat.transition.TransitionCompat;
import com.miui.gallery.compat.view.WindowCompat;
import com.miui.gallery.editor.photo.app.AlertDialogFragment.Builder;
import com.miui.gallery.editor.photo.app.AlertDialogFragment.Callbacks;
import com.miui.gallery.editor.photo.app.DraftManager.OnPreviewRefreshListener;
import com.miui.gallery.editor.photo.app.adjust.AdjustMenuFragment;
import com.miui.gallery.editor.photo.app.beautify.BeautifyFragment;
import com.miui.gallery.editor.photo.app.crop.CropMenuFragment;
import com.miui.gallery.editor.photo.app.doodle.DoodleMenuFragment;
import com.miui.gallery.editor.photo.app.filter.FilterFragment;
import com.miui.gallery.editor.photo.app.frame.FrameMenuFragment;
import com.miui.gallery.editor.photo.app.longcrop.LongCropFragment;
import com.miui.gallery.editor.photo.app.miuibeautify.MiuiBeautyFragment;
import com.miui.gallery.editor.photo.app.mosaic.MosaicMenuFragment;
import com.miui.gallery.editor.photo.app.navigator.PhotoNaviFragment;
import com.miui.gallery.editor.photo.app.navigator.ScreenshotNaviFragment;
import com.miui.gallery.editor.photo.app.remover.Inpaint;
import com.miui.gallery.editor.photo.app.remover.RemoverMenuFragment;
import com.miui.gallery.editor.photo.app.sticker.StickerMenuFragment;
import com.miui.gallery.editor.photo.app.text.TextMenuFragment;
import com.miui.gallery.editor.photo.core.Effect;
import com.miui.gallery.editor.photo.core.GLFragment;
import com.miui.gallery.editor.photo.core.GLFragment.GLContext.OnCreatedListener;
import com.miui.gallery.editor.photo.core.RenderData;
import com.miui.gallery.editor.photo.core.RenderFragment;
import com.miui.gallery.editor.photo.core.SdkManager;
import com.miui.gallery.editor.photo.origin.EditorOriginHandler;
import com.miui.gallery.editor.photo.utils.Callback;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.miui.gallery.permission.PermissionIntroductionUtils;
import com.miui.gallery.permission.core.OnPermissionIntroduced;
import com.miui.gallery.permission.core.PermissionCheckCallback;
import com.miui.gallery.permission.core.PermissionCheckHelper;
import com.miui.gallery.preference.GalleryPreferences.CTA;
import com.miui.gallery.provider.GalleryOpenProvider;
import com.miui.gallery.sdk.editor.Constants;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.SystemUiUtil;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.view.BrightnessManager;
import com.miui.privacy.LockSettingsHelper;
import com.nostra13.universalimageloader.core.ImageLoader;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import miui.view.animation.CubicEaseInOutInterpolator;
import miui.view.animation.CubicEaseOutInterpolator;

public class PhotoEditor extends Activity implements PermissionCheckCallback {
    private ArrayList<Integer> mActivatedEffects;
    private Intent mActivityIntent;
    private int mActivityResult = 0;
    private Callbacks mAlertDialogCallbacks = new Callbacks() {
        public void onCancel(AlertDialogFragment alertDialogFragment) {
        }

        public void onClick(AlertDialogFragment alertDialogFragment, int i) {
            Log.d("PhotoEditor", "confirm dialog from %s, event is %d", alertDialogFragment == null ? "unknown" : alertDialogFragment.getTag(), Integer.valueOf(i));
            if ("main_alert_dialog".equals(alertDialogFragment.getTag())) {
                if (i == -1) {
                    PhotoEditor.this.mNavigatorCallbacks.onExport();
                } else if (i == -2) {
                    PhotoEditor.this.mNavigatorCallbacks.onDiscard();
                }
            } else if ("menu_alert_dialog".equals(alertDialogFragment.getTag())) {
                Fragment findFragmentById = PhotoEditor.this.mFragments.findFragmentById(R.id.menu_panel);
                if (!(findFragmentById instanceof MenuFragment)) {
                    return;
                }
                if (i == -1) {
                    PhotoEditor.this.mMenuCallback.onSave((MenuFragment) findFragmentById);
                } else if (i == -2) {
                    PhotoEditor.this.mMenuCallback.onDiscard((MenuFragment) findFragmentById);
                }
            }
        }

        public void onDismiss(AlertDialogFragment alertDialogFragment) {
        }
    };
    private BrightnessManager mBrightnessManager;
    /* access modifiers changed from: private */
    public long mCreateTime;
    private InitializeController.Callbacks mDecoderCallbacks = new InitializeController.Callbacks() {
        public int doInitialize() {
            SdkManager.INSTANCE.onAttach(PhotoEditor.this.getApplication());
            SdkManager.INSTANCE.onActivityCreate();
            int i = 2;
            try {
                DraftManager access$000 = PhotoEditor.this.mDraftManager;
                if (access$000 != null ? access$000.initializeForPreview(PhotoEditor.this.mEditorOriginHandler.isInMainProcess()) : false) {
                    i = 3;
                }
                return i;
            } catch (FileNotFoundException e) {
                Log.w("PhotoEditor", (Throwable) e);
                return 1;
            } catch (SecurityException e2) {
                Log.w("PhotoEditor", (Throwable) e2);
                return 2;
            }
        }

        public void onDone() {
            Fragment findFragmentByTag = PhotoEditor.this.mFragments.findFragmentByTag(MovieStatUtils.PAGER_PREVIEW);
            PreviewFragment previewFragment = (PreviewFragment) findFragmentByTag;
            if (findFragmentByTag != null && findFragmentByTag.isAdded()) {
                previewFragment.setLoadDone(true);
                previewFragment.showForLoadDown();
                if (PhotoEditor.this.mDraftManager != null) {
                    PhotoEditor.this.mDraftManager.setOnPreviewRefreshListener(PhotoEditor.this.mOnPreviewRefreshListener);
                }
            }
            PhotoEditor.this.mTransitionConfig.onImageLoaded();
        }
    };
    /* access modifiers changed from: private */
    public DraftManager mDraftManager;
    /* access modifiers changed from: private */
    public EditorOriginHandler mEditorOriginHandler;
    private ExportFragment.Callbacks mExportCallbacks = new ExportFragment.Callbacks() {
        private long mStartTime;

        private void sampleExportTime(String str, long j) {
            PhotoEditor.this.mSampler.recordNumericEvent("_main", str, j / 100);
        }

        public boolean doExport() {
            DraftManager access$000 = PhotoEditor.this.mDraftManager;
            if (access$000 == null) {
                return false;
            }
            this.mStartTime = System.currentTimeMillis();
            PhotoEditor.this.mExportTask.prepareToExport(access$000);
            Log.d("PhotoEditor", "doExport start");
            boolean doExport = PhotoEditor.this.mEditorOriginHandler.doExport(access$000, PhotoEditor.this.mExportTask.getExportUri());
            Log.d("PhotoEditor", "doExport end, use time: %d", (Object) Long.valueOf(System.currentTimeMillis() - this.mStartTime));
            boolean onExport = PhotoEditor.this.mExportTask.onExport(access$000, doExport);
            sampleExportTime("compress_finished", System.currentTimeMillis() - this.mStartTime);
            return onExport;
        }

        public void onCancelled(boolean z) {
            PhotoEditor.this.mExportTask.onCancelled(z);
            sampleExportTime("compress_cancelled", System.currentTimeMillis() - this.mStartTime);
        }

        public void onExported(boolean z) {
            PhotoEditor.this.mExportTask.onPostExport(z);
            if (z) {
                if (!PhotoEditor.this.mExportTask.isExternalCall()) {
                    Log.d("PhotoEditor", "internal call, pass result");
                    Intent intent = new Intent();
                    intent.setDataAndType(GalleryOpenProvider.translateToContent(PhotoEditor.this.mExportTask.getExportUri().getPath()), "image/jpeg");
                    intent.putExtra("photo_secret_id", PhotoEditor.this.mExportTask.getSecretId());
                    PhotoEditor.this.setActivityResult(-1, intent);
                }
                PhotoEditor.this.onActivityFinish(true);
                ActivityCompat.finishAfterTransition(PhotoEditor.this);
                return;
            }
            PhotoEditor.this.mExportTask.closeExportDialog();
            ToastUtils.makeText((Context) PhotoEditor.this, (int) R.string.main_save_error_msg);
        }
    };
    /* access modifiers changed from: private */
    public ExportTask mExportTask;
    /* access modifiers changed from: private */
    public FragmentData[] mFragmentData = new FragmentData[Effect.values().length];
    /* access modifiers changed from: private */
    public FragmentManager mFragments;
    private OnViewReadyListener mGLMaskOutReadyListener = new OnViewReadyListener() {
        public void onViewReady() {
            MenuFragment access$2000 = PhotoEditor.this.findActiveMenu();
            if (access$2000 != null) {
                PhotoEditor.this.onExit(access$2000);
            } else {
                Log.i("PhotoEditor", "menu already exit.");
            }
        }
    };
    private OnCreatedListener mGLReadyListener = new OnCreatedListener() {
        public void onCreated() {
            Fragment findFragmentByTag = PhotoEditor.this.mFragments.findFragmentByTag("gl_mask_in");
            if (findFragmentByTag != null) {
                PhotoEditor.this.mFragments.beginTransaction().remove(findFragmentByTag).commitAllowingStateLoss();
                Log.d("PhotoEditor", "mGLReadyListener remove mask");
            }
        }
    };
    private InitializeController mInitializeController;
    /* access modifiers changed from: private */
    public MenuFragment.Callbacks mMenuCallback = new MenuFragment.Callbacks() {
        private void sample(String str, RenderFragment renderFragment, String str2) {
            List<String> sample = renderFragment.sample();
            HashMap hashMap = new HashMap();
            if (sample == null || sample.isEmpty()) {
                hashMap.put("effect", "*none*");
                PhotoEditor.this.mSampler.recordEvent(str, str2, hashMap);
                return;
            }
            for (String put : sample) {
                hashMap.put("effect", put);
                PhotoEditor.this.mSampler.recordEvent(str, str2, hashMap);
            }
        }

        public void onDiscard(MenuFragment menuFragment) {
            Fragment findFragmentByTag = PhotoEditor.this.mFragments.findFragmentByTag(MovieStatUtils.PAGER_PREVIEW);
            if (findFragmentByTag == null || !((PreviewFragment) findFragmentByTag).isRunningPreviewAnimator()) {
                RenderFragment renderFragment = menuFragment.getRenderFragment();
                if (renderFragment != null && renderFragment.isAdded()) {
                    sample(PhotoEditor.this.mSampleTags[menuFragment.mEffect.ordinal()], renderFragment, "discard_detail");
                    PhotoEditor.this.onExit(menuFragment);
                }
            }
        }

        public Bitmap onLoadOrigin() {
            if (PhotoEditor.this.mDraftManager == null) {
                return null;
            }
            return PhotoEditor.this.mDraftManager.decodeOrigin();
        }

        public Bitmap onLoadPreview() {
            if (PhotoEditor.this.mDraftManager == null) {
                return null;
            }
            return PhotoEditor.this.mDraftManager.getPreview();
        }

        public List<RenderData> onLoadRenderData() {
            ArrayList arrayList = new ArrayList();
            if (PhotoEditor.this.mDraftManager != null) {
                PhotoEditor.this.mDraftManager.getRenderData(arrayList);
            }
            return arrayList;
        }

        public void onSave(MenuFragment menuFragment) {
            Fragment findFragmentByTag = PhotoEditor.this.mFragments.findFragmentByTag(MovieStatUtils.PAGER_PREVIEW);
            if (findFragmentByTag == null || !((PreviewFragment) findFragmentByTag).isRunningPreviewAnimator()) {
                RenderFragment renderFragment = menuFragment.getRenderFragment();
                if (renderFragment == null || !renderFragment.isAdded()) {
                    Log.d("PhotoEditor", "no active render fragment");
                } else {
                    RenderData export = renderFragment.export();
                    if (export != null) {
                        sample(PhotoEditor.this.mSampleTags[menuFragment.mEffect.ordinal()], renderFragment, "save_detail");
                        if (PhotoEditor.this.mDraftManager != null) {
                            PhotoEditor.this.mDraftManager.enqueue(export, PhotoEditor.this.mPreviewSaveCallback);
                        }
                    } else {
                        PhotoEditor.this.mPreviewSaveCallback.onCancel();
                    }
                }
            }
        }
    };
    /* access modifiers changed from: private */
    public Callbacks mNavigatorCallbacks = new Callbacks() {
        public static /* synthetic */ void lambda$onNavigate$84(AnonymousClass4 r2, Effect effect) {
            PhotoEditor.this.mSuspendInputs = false;
            PhotoEditor.this.showEditFragment(effect);
        }

        private void sampleExit(String str) {
            if (PhotoEditor.this.mDraftManager != null) {
                HashMap hashMap = new HashMap();
                hashMap.put("step_count", String.valueOf(PhotoEditor.this.mDraftManager.getStepCount()));
                hashMap.put("total_time", String.valueOf((System.currentTimeMillis() - PhotoEditor.this.mCreateTime) / 100));
                if (PhotoEditor.this.mDraftManager.isRemoveWatermarkEnable()) {
                    hashMap.put("remove_watermark", String.valueOf(!PhotoEditor.this.mDraftManager.isWithWatermark()));
                }
                PhotoEditor.this.mSampler.recordEvent("_main", str, hashMap);
            }
        }

        private void sampleNavigate(Effect effect) {
            PhotoEditor.this.mSampler.recordEvent(PhotoEditor.this.mSampleTags[effect.ordinal()], "enter");
        }

        public void onDiscard() {
            PhotoEditor.this.onActivityFinish(false);
            ActivityCompat.finishAfterTransition(PhotoEditor.this);
            sampleExit("cancelled");
        }

        public void onExport() {
            PhotoEditor.this.mExportTask.showExportDialog();
            sampleExit("exported");
        }

        public void onNavigate(Effect effect) {
            if (PhotoEditor.this.mDraftManager == null || !PhotoEditor.this.mDraftManager.isPreviewEnable()) {
                Log.w("PhotoEditor", "has not load preview when click");
            } else if (!SdkManager.INSTANCE.getProvider(effect).initialized()) {
                Log.w("PhotoEditor", "SdkProvider: %s has not initialized when click", effect.name());
            } else {
                Log.d("PhotoEditor", "navigate %s", (Object) effect);
                if (PhotoEditor.this.mFragments.getBackStackEntryCount() != 0) {
                    Log.d("PhotoEditor", "last effect editor is still active");
                    return;
                }
                FragmentData fragmentData = PhotoEditor.this.mFragmentData[effect.ordinal()];
                RenderFragment renderFragment = (RenderFragment) PhotoEditor.this.mFragments.findFragmentByTag(fragmentData.renderTag);
                Fragment findFragmentByTag = PhotoEditor.this.mFragments.findFragmentByTag(fragmentData.gestureTag);
                MenuFragment newMenu = fragmentData.newMenu();
                boolean z = false;
                if (renderFragment == null) {
                    renderFragment = newMenu.createRenderFragment();
                    PhotoEditor.this.mFragments.beginTransaction().detach(renderFragment).add(R.id.display_panel, renderFragment, fragmentData.renderTag).hide(renderFragment).commit();
                    z = true;
                }
                if (!renderFragment.isSupportBitmap(PhotoEditor.this.mDraftManager.getPreview())) {
                    ToastUtils.makeText((Context) PhotoEditor.this, renderFragment.getUnSupportStringRes());
                    return;
                }
                if (findFragmentByTag == null) {
                    findFragmentByTag = newMenu.createGestureFragment();
                    if (findFragmentByTag != null) {
                        PhotoEditor.this.mFragments.beginTransaction().detach(findFragmentByTag).add(R.id.display_panel, findFragmentByTag, fragmentData.gestureTag).hide(findFragmentByTag).commit();
                        z = true;
                    }
                }
                if (z) {
                    PhotoEditor.this.mFragments.executePendingTransactions();
                }
                Bundle bundle = new Bundle();
                PhotoEditor.this.mFragments.putFragment(bundle, "MenuFragment:display_fragment", renderFragment);
                if (findFragmentByTag != null) {
                    PhotoEditor.this.mFragments.putFragment(bundle, "MenuFragment:gesture_fragment", findFragmentByTag);
                }
                newMenu.setArguments(bundle);
                Fragment findFragmentByTag2 = PhotoEditor.this.mFragments.findFragmentByTag("navigator");
                if (findFragmentByTag2 != null) {
                    PhotoEditor.this.mFragments.beginTransaction().detach(findFragmentByTag2).commitAllowingStateLoss();
                    PhotoEditor.this.mFragments.executePendingTransactions();
                }
                PhotoEditor.this.mFragments.beginTransaction().add(R.id.menu_panel, newMenu, fragmentData.menuTag).commitAllowingStateLoss();
                PhotoEditor.this.mFragments.executePendingTransactions();
                if (renderFragment.isSupportAnimation()) {
                    Fragment findFragmentByTag3 = PhotoEditor.this.mFragments.findFragmentByTag(MovieStatUtils.PAGER_PREVIEW);
                    if (findFragmentByTag3 != null) {
                        PhotoEditor.this.mSuspendInputs = true;
                        ((PreviewFragment) PreviewFragment.class.cast(findFragmentByTag3)).prepareShowEditFragment(effect, new OnPrepareEditFragmentListener() {
                            public final void showEditFragment(Effect effect) {
                                AnonymousClass4.lambda$onNavigate$84(AnonymousClass4.this, effect);
                            }
                        });
                    }
                } else {
                    PhotoEditor.this.showEditFragment(effect);
                }
                sampleNavigate(effect);
            }
        }
    };
    private boolean mNeedConfirmPassword;
    /* access modifiers changed from: private */
    public OnPreviewRefreshListener mOnPreviewRefreshListener = new OnPreviewRefreshListener() {
        public void onRefresh(Bitmap bitmap) {
            PhotoEditor.this.mPreviewRefreshedWhenInit = true;
            PhotoEditor.this.tryRefreshPreview();
        }
    };
    private PermissionCheckHelper mPermissionCheckHelper;
    private Callbacks mPreviewCallbacks = new Callbacks() {
        public boolean isPreviewChanged() {
            return PhotoEditor.this.mDraftManager != null && !PhotoEditor.this.mDraftManager.isEmpty();
        }

        public Bitmap onLoadPreview() {
            if (PhotoEditor.this.mDraftManager == null) {
                return null;
            }
            return PhotoEditor.this.mDraftManager.getPreview();
        }

        public Bitmap onLoadPreviewOriginal() {
            if (PhotoEditor.this.mDraftManager == null) {
                return null;
            }
            return PhotoEditor.this.mDraftManager.getPreviewOriginal();
        }

        public void reRender(boolean z) {
            if (PhotoEditor.this.mDraftManager != null) {
                PhotoEditor.this.mDraftManager.reRender(z, PhotoEditor.this.mReRenderCallback);
            }
        }
    };
    /* access modifiers changed from: private */
    public boolean mPreviewRefreshedWhenInit = false;
    /* access modifiers changed from: private */
    public Callback mPreviewSaveCallback = new Callback<Bitmap, Void>() {
        public void onCancel() {
            PhotoEditor.this.mSuspendInputs = false;
            PhotoEditor.this.onExit(PhotoEditor.this.findActiveMenu());
        }

        public void onDone(Bitmap bitmap) {
            PreviewFragment previewFragment = (PreviewFragment) PhotoEditor.this.mFragments.findFragmentByTag(MovieStatUtils.PAGER_PREVIEW);
            if (previewFragment != null) {
                previewFragment.setRemoveWatermarkEnable(PhotoEditor.this.mDraftManager.isRemoveWatermarkShow());
            }
            PhotoEditor.this.mSuspendInputs = false;
            MenuFragment access$2000 = PhotoEditor.this.findActiveMenu();
            if (access$2000 != null) {
                access$2000.hideProcessDialog();
                PhotoEditor.this.onExit(access$2000);
            }
            if (PhotoEditor.this.mDraftManager == null || PhotoEditor.this.mDraftManager.getStepCount() <= 1) {
                PhotoEditor.this.setExposeButtonEnable(true);
            }
        }

        public void onError(Void voidR) {
            PhotoEditor.this.mSuspendInputs = false;
            ToastUtils.makeText((Context) PhotoEditor.this, (int) R.string.main_save_error_msg);
        }

        public void onExecute(Bitmap bitmap) {
        }

        public void onPrepare() {
            PhotoEditor.this.mSuspendInputs = true;
        }
    };
    /* access modifiers changed from: private */
    public Callback mReRenderCallback = new Callback<Bitmap, Void>() {
        public void onCancel() {
            PhotoEditor.this.mSuspendInputs = false;
        }

        public void onDone(Bitmap bitmap) {
            boolean z = false;
            PhotoEditor.this.mSuspendInputs = false;
            PreviewFragment previewFragment = (PreviewFragment) PhotoEditor.this.mFragments.findFragmentByTag(MovieStatUtils.PAGER_PREVIEW);
            if (PhotoEditor.this.mDraftManager == null || PhotoEditor.this.mDraftManager.isEmpty()) {
                z = true;
            }
            if (previewFragment != null) {
                previewFragment.refreshPreview(bitmap);
                previewFragment.enableComparison(!z);
            }
            PhotoEditor.this.setExposeButtonEnable(!z);
        }

        public void onError(Void voidR) {
            PhotoEditor.this.mSuspendInputs = false;
        }

        public void onExecute(Bitmap bitmap) {
        }

        public void onPrepare() {
            PhotoEditor.this.mSuspendInputs = true;
        }
    };
    private boolean mResumed;
    /* access modifiers changed from: private */
    public String[] mSampleTags = new String[Effect.values().length];
    /* access modifiers changed from: private */
    public Sampler mSampler;
    /* access modifiers changed from: private */
    public boolean mSuspendInputs;
    /* access modifiers changed from: private */
    public TransitionConfiguration mTransitionConfig = new TransitionConfiguration(this);
    private boolean mTransitionEnd = false;

    private static class FragmentData {
        final String gestureTag;
        final Class<? extends MenuFragment> menu;
        final String menuTag;
        final String renderTag;

        public FragmentData(Class<? extends MenuFragment> cls, Effect effect) {
            this.menu = cls;
            StringBuilder sb = new StringBuilder();
            sb.append(effect.name());
            sb.append(":menu");
            this.menuTag = sb.toString();
            StringBuilder sb2 = new StringBuilder();
            sb2.append(effect.name());
            sb2.append(":render");
            this.renderTag = sb2.toString();
            StringBuilder sb3 = new StringBuilder();
            sb3.append(effect.name());
            sb3.append(":gesture");
            this.gestureTag = sb3.toString();
        }

        public MenuFragment newMenu() {
            try {
                return (MenuFragment) this.menu.newInstance();
            } catch (InstantiationException e) {
                Log.w("PhotoEditor", (Throwable) e);
                throw new IllegalStateException(e);
            } catch (IllegalAccessException e2) {
                Log.w("PhotoEditor", (Throwable) e2);
                throw new IllegalStateException(e2);
            }
        }
    }

    private static class TransitionConfiguration {
        /* access modifiers changed from: private */
        public PhotoEditor mEditor;
        private int mEnterDuration;
        private int mExitDuration;
        private int mImageHeight;
        private int mImageWidth;
        private Matrix mMatrix;
        private int mMenuOffset;
        private String mPhotoViewName;
        private boolean mRunTransition;
        private TransitionListener mTransitionListener = new TransitionListener() {
            public void onTransitionCancel(Transition transition) {
                TransitionConfiguration.this.mEditor.onEnterTransitionEnd();
            }

            public void onTransitionEnd(Transition transition) {
                TransitionConfiguration.this.mEditor.onEnterTransitionEnd();
            }

            public void onTransitionPause(Transition transition) {
            }

            public void onTransitionResume(Transition transition) {
            }

            public void onTransitionStart(Transition transition) {
            }
        };

        public TransitionConfiguration(PhotoEditor photoEditor) {
            this.mEditor = photoEditor;
        }

        private void configureEnterTransition() {
            TransitionSet transitionSet = new TransitionSet();
            ImageTransition imageTransition = new ImageTransition(true, this.mMatrix, this.mImageWidth, this.mImageHeight);
            imageTransition.setInterpolator(new CubicEaseInOutInterpolator());
            TransitionCompat.addTarget(imageTransition, this.mPhotoViewName);
            MenuTransition menuTransition = new MenuTransition((float) this.mMenuOffset, true, this.mEditor.getResources());
            menuTransition.setInterpolator(new CubicEaseInOutInterpolator());
            menuTransition.addTarget(R.id.menu_panel);
            transitionSet.addTransition(imageTransition).addTransition(menuTransition).setDuration((long) this.mEnterDuration).addListener(this.mTransitionListener);
            WindowCompat.setSharedElementEnterTransition(this.mEditor.getWindow(), transitionSet);
        }

        private void configureExitTransition(boolean z) {
            TransitionSet transitionSet = new TransitionSet();
            Transition changeBounds = z ? new ChangeBounds() : new ImageTransition(false, this.mMatrix, this.mImageWidth, this.mImageHeight);
            changeBounds.setInterpolator(new CubicEaseOutInterpolator());
            changeBounds.setDuration((long) this.mExitDuration);
            TransitionCompat.addTarget(changeBounds, this.mPhotoViewName);
            MenuTransition menuTransition = new MenuTransition((float) this.mMenuOffset, false, this.mEditor.getResources());
            menuTransition.setInterpolator(new CubicEaseOutInterpolator());
            menuTransition.addTarget(R.id.menu_panel);
            transitionSet.addTransition(changeBounds).addTransition(menuTransition);
            WindowCompat.setSharedElementReturnTransition(this.mEditor.getWindow(), transitionSet);
        }

        /* access modifiers changed from: 0000 */
        public void onActivityCreate(boolean z) {
            Intent intent = this.mEditor.getIntent();
            boolean z2 = false;
            if (WindowCompat.requestActivityTransition(this.mEditor.getWindow()) && intent.getBooleanExtra("extra_custom_transition", false) && !z) {
                z2 = true;
            }
            this.mRunTransition = z2;
            SystemUiUtil.setDrawSystemBarBackground(this.mEditor.getWindow());
        }

        /* access modifiers changed from: 0000 */
        public void onExit(boolean z) {
            PreviewFragment previewFragment = (PreviewFragment) this.mEditor.mFragments.findFragmentByTag(MovieStatUtils.PAGER_PREVIEW);
            if (previewFragment != null) {
                previewFragment.setRemoveWatermarkEnable(false);
            }
            if (this.mRunTransition) {
                configureExitTransition(z);
                ActivityCompat.setEnterSharedElementCallback(this.mEditor, new SharedElementCallback() {
                    public void onSharedElementStart() {
                        TransitionConfiguration.this.mEditor.mExportTask.closeExportDialog();
                    }
                });
                return;
            }
            this.mEditor.mExportTask.closeExportDialog();
        }

        /* access modifiers changed from: 0000 */
        public void onImageLoaded() {
            if (this.mRunTransition) {
                ActivityCompat.startPostponedEnterTransition(this.mEditor);
            } else {
                this.mEditor.onEnterTransitionEnd();
            }
        }

        /* access modifiers changed from: 0000 */
        public void postActivityCreate() {
            if (this.mRunTransition) {
                Intent intent = this.mEditor.getIntent();
                this.mImageWidth = intent.getIntExtra("extra_image_width", 0);
                this.mImageHeight = intent.getIntExtra("extra_image_height", 0);
                float[] floatArrayExtra = intent.getFloatArrayExtra("extra_image_matrix");
                this.mMatrix = new Matrix();
                this.mMatrix.setValues(floatArrayExtra);
                Resources resources = this.mEditor.getResources();
                this.mMenuOffset = resources.getDimensionPixelOffset(R.dimen.photo_editor_transition_menu_offset);
                this.mPhotoViewName = resources.getString(R.string.photo_editor_transition_image_view);
                this.mEnterDuration = resources.getInteger(R.integer.photo_editor_enter_transition_duration);
                this.mExitDuration = resources.getInteger(R.integer.photo_editor_exit_transition_duration);
                configureEnterTransition();
                ActivityCompat.postponeEnterTransition(this.mEditor);
            }
        }
    }

    public PhotoEditor() {
        this.mFragmentData[Effect.BEAUTIFY.ordinal()] = new FragmentData(BeautifyFragment.class, Effect.BEAUTIFY);
        this.mFragmentData[Effect.ADJUST.ordinal()] = new FragmentData(AdjustMenuFragment.class, Effect.ADJUST);
        this.mFragmentData[Effect.FILTER.ordinal()] = new FragmentData(FilterFragment.class, Effect.FILTER);
        this.mFragmentData[Effect.CROP.ordinal()] = new FragmentData(CropMenuFragment.class, Effect.CROP);
        this.mFragmentData[Effect.TEXT.ordinal()] = new FragmentData(TextMenuFragment.class, Effect.TEXT);
        this.mFragmentData[Effect.DOODLE.ordinal()] = new FragmentData(DoodleMenuFragment.class, Effect.DOODLE);
        this.mFragmentData[Effect.STICKER.ordinal()] = new FragmentData(StickerMenuFragment.class, Effect.STICKER);
        this.mFragmentData[Effect.LONG_CROP.ordinal()] = new FragmentData(LongCropFragment.class, Effect.LONG_CROP);
        this.mFragmentData[Effect.MOSAIC.ordinal()] = new FragmentData(MosaicMenuFragment.class, Effect.MOSAIC);
        this.mFragmentData[Effect.REMOVER.ordinal()] = new FragmentData(RemoverMenuFragment.class, Effect.REMOVER);
        this.mFragmentData[Effect.MIUIBEAUTIFY.ordinal()] = new FragmentData(MiuiBeautyFragment.class, Effect.MIUIBEAUTIFY);
        this.mFragmentData[Effect.FRAME.ordinal()] = new FragmentData(FrameMenuFragment.class, Effect.FRAME);
        this.mSampleTags[Effect.BEAUTIFY.ordinal()] = "_beautify";
        this.mSampleTags[Effect.ADJUST.ordinal()] = "_enhance";
        this.mSampleTags[Effect.FILTER.ordinal()] = "_filter";
        this.mSampleTags[Effect.CROP.ordinal()] = "_crop";
        this.mSampleTags[Effect.STICKER.ordinal()] = "_sticker";
        this.mSampleTags[Effect.LONG_CROP.ordinal()] = "_beautify";
        this.mSampleTags[Effect.TEXT.ordinal()] = "_text";
        this.mSampleTags[Effect.MOSAIC.ordinal()] = "_mosaic";
        this.mSampleTags[Effect.DOODLE.ordinal()] = "_doodle";
        this.mSampleTags[Effect.REMOVER.ordinal()] = "_remover";
        this.mSampleTags[Effect.MIUIBEAUTIFY.ordinal()] = "_miuibeautify";
        this.mSampleTags[Effect.FRAME.ordinal()] = "_frame";
    }

    /* access modifiers changed from: private */
    public MenuFragment findActiveMenu() {
        if (this.mFragments.getBackStackEntryCount() > 0) {
            Fragment findFragmentById = this.mFragments.findFragmentById(R.id.menu_panel);
            if (findFragmentById != null && findFragmentById.isAdded()) {
                if (findFragmentById instanceof MenuFragment) {
                    return (MenuFragment) findFragmentById;
                }
                Log.w("PhotoEditor", "not menu in menu panel: %s", findFragmentById);
            }
        }
        Log.w("PhotoEditor", "no active menu fragment found");
        return null;
    }

    private void initScreenBrightness() {
        Intent intent = getIntent();
        if (intent != null) {
            float floatExtra = intent.getFloatExtra("photo-brightness-manual", -1.0f);
            float floatExtra2 = intent.getFloatExtra("photo-brightness-auto", -1.0f);
            if (floatExtra >= 0.0f || floatExtra2 >= 0.0f) {
                this.mBrightnessManager = new BrightnessManager(this, floatExtra, floatExtra2);
                if (this.mResumed) {
                    this.mBrightnessManager.onResume();
                }
            }
        }
    }

    private boolean isNeedConfirmPassword() {
        return this.mDraftManager != null && this.mDraftManager.isSecret() && this.mNeedConfirmPassword;
    }

    /* access modifiers changed from: private */
    public void onActivityFinish(boolean z) {
        this.mTransitionConfig.onExit(z);
        Fragment findFragmentById = this.mFragments.findFragmentById(R.id.display_panel);
        if (findFragmentById instanceof PreviewFragment) {
            ((PreviewFragment) findFragmentById).onExit(z);
        }
        if (isNeedConfirmPassword()) {
            setPhotoSecretFinishResult();
        }
    }

    /* access modifiers changed from: private */
    public void onEnterTransitionEnd() {
        this.mTransitionEnd = true;
        tryRefreshPreview();
        PreviewFragment previewFragment = (PreviewFragment) this.mFragments.findFragmentByTag(MovieStatUtils.PAGER_PREVIEW);
        if (previewFragment != null) {
            previewFragment.setRemoveWatermarkEnable(this.mDraftManager.isRemoveWatermarkEnable());
        }
    }

    /* access modifiers changed from: private */
    public void onExit(MenuFragment menuFragment) {
        boolean z = menuFragment.getRenderFragment() instanceof GLFragment;
        if (z) {
            Log.d("PhotoEditor", "exiting gl render view");
            if (this.mFragments.findFragmentByTag("gl_mask_out") == null) {
                Log.d("PhotoEditor", "display mask first");
                PreviewFragment previewFragment = new PreviewFragment();
                Bundle bundle = new Bundle();
                bundle.putBoolean("overwrite_background", true);
                previewFragment.setArguments(bundle);
                this.mFragments.beginTransaction().add(R.id.display_panel, previewFragment, "gl_mask_out").commitAllowingStateLoss();
                this.mFragments.executePendingTransactions();
                return;
            }
            Log.d("PhotoEditor", "mask displayed, remove render view");
            Fragment findFragmentByTag = this.mFragments.findFragmentByTag("gl_mask_in");
            if (findFragmentByTag != null) {
                Log.d("PhotoEditor", "in mask not gone");
                this.mFragments.beginTransaction().remove(findFragmentByTag).commitAllowingStateLoss();
                this.mFragments.executePendingTransactions();
            }
        } else {
            Log.d("PhotoEditor", "no gl view on top, do exit");
        }
        this.mFragments.popBackStackImmediate();
        FragmentTransaction beginTransaction = this.mFragments.beginTransaction();
        beginTransaction.remove(menuFragment.getRenderFragment());
        Fragment gestureFragment = menuFragment.getGestureFragment();
        if (gestureFragment != null) {
            beginTransaction.remove(gestureFragment);
        }
        beginTransaction.remove(menuFragment);
        beginTransaction.commitAllowingStateLoss();
        this.mFragments.executePendingTransactions();
        Fragment findFragmentByTag2 = this.mFragments.findFragmentByTag("navigator");
        if (findFragmentByTag2 != null) {
            this.mFragments.beginTransaction().attach(findFragmentByTag2).commitAllowingStateLoss();
            this.mFragments.executePendingTransactions();
        }
        if (z) {
            if (this.mDraftManager != null && !this.mDraftManager.isEmpty()) {
                setExposeButtonEnable(true);
            }
            Fragment findFragmentByTag3 = this.mFragments.findFragmentByTag("gl_mask_out");
            if (findFragmentByTag3 != null) {
                Log.d("PhotoEditor", "remove mask view");
                this.mFragments.beginTransaction().remove(findFragmentByTag3).commitAllowingStateLoss();
                this.mFragments.executePendingTransactions();
            }
        }
    }

    private void prepareNavigator() {
        this.mActivatedEffects = resolveEffects(getIntent().getExtras());
        ArrayList arrayList = (ArrayList) this.mActivatedEffects.clone();
        Effect[] values = Effect.values();
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            int intValue = ((Integer) it.next()).intValue();
            if (SdkManager.INSTANCE.getProvider(values[intValue]) == null) {
                Log.d("PhotoEditor", "%s not supported, skip", (Object) values[intValue]);
                this.mActivatedEffects.remove(Integer.valueOf(intValue));
            }
        }
        showNavigator();
    }

    private void prepareResult(Intent intent) {
        if (this.mDraftManager != null) {
            intent.putExtra("photo_edit_exported_width", this.mDraftManager.getExportedWidth());
            intent.putExtra("photo_edit_exported_height", this.mDraftManager.getExportedHeight());
        }
    }

    private ArrayList<Integer> resolveEffects(Bundle bundle) {
        if (bundle == null || !bundle.getBoolean(Constants.EXTRA_IS_SCREENSHOT)) {
            ArrayList<Integer> arrayList = new ArrayList<>(Arrays.asList(new Integer[]{Integer.valueOf(Effect.BEAUTIFY.ordinal()), Integer.valueOf(Effect.CROP.ordinal()), Integer.valueOf(Effect.FILTER.ordinal()), Integer.valueOf(Effect.STICKER.ordinal()), Integer.valueOf(Effect.DOODLE.ordinal()), Integer.valueOf(Effect.TEXT.ordinal()), Integer.valueOf(Effect.ADJUST.ordinal()), Integer.valueOf(Effect.FRAME.ordinal()), Integer.valueOf(Effect.MOSAIC.ordinal())}));
            if (ArcsoftBeautyJni.idBeautyAvailable()) {
                arrayList.add(arrayList.indexOf(Integer.valueOf(Effect.FILTER.ordinal())), Integer.valueOf(Effect.MIUIBEAUTIFY.ordinal()));
                this.mSampler.recordEvent(this.mSampleTags[Effect.MIUIBEAUTIFY.ordinal()], "category_show");
            }
            if (Inpaint.isAvailable()) {
                arrayList.add(Integer.valueOf(Effect.REMOVER.ordinal()));
            }
            return arrayList;
        } else if (bundle.getBoolean(Constants.EXTRA_IS_LONG_SCREENSHOT)) {
            return new ArrayList<>(Arrays.asList(new Integer[]{Integer.valueOf(Effect.LONG_CROP.ordinal()), Integer.valueOf(Effect.DOODLE.ordinal()), Integer.valueOf(Effect.MOSAIC.ordinal())}));
        } else {
            return new ArrayList<>(Arrays.asList(new Integer[]{Integer.valueOf(Effect.CROP.ordinal()), Integer.valueOf(Effect.DOODLE.ordinal()), Integer.valueOf(Effect.TEXT.ordinal()), Integer.valueOf(Effect.MOSAIC.ordinal())}));
        }
    }

    private AbstractNaviFragment resolveNavigator(Bundle bundle) {
        return (bundle == null || !bundle.getBoolean(Constants.EXTRA_IS_SCREENSHOT)) ? new PhotoNaviFragment() : new ScreenshotNaviFragment();
    }

    /* access modifiers changed from: private */
    public void setExposeButtonEnable(boolean z) {
        AbstractNaviFragment abstractNaviFragment = (AbstractNaviFragment) this.mFragments.findFragmentByTag("navigator");
        if (abstractNaviFragment != null && abstractNaviFragment.isAdded() && abstractNaviFragment.getView() != null) {
            abstractNaviFragment.setExportEnabled(z);
        }
    }

    private void setPhotoSecretFinishResult() {
        if (this.mActivityIntent == null) {
            this.mActivityIntent = new Intent();
        }
        prepareResult(this.mActivityIntent);
        this.mActivityIntent.putExtra("photo_secret_finish", true);
        this.mActivityIntent.putExtra("extra_photo_edit_type", "extra_photo_editor_type_common");
        setResult(this.mActivityResult, this.mActivityIntent);
    }

    private void showNavigator() {
        AbstractNaviFragment resolveNavigator = resolveNavigator(getIntent().getExtras());
        Bundle bundle = new Bundle();
        bundle.putIntegerArrayList("content", this.mActivatedEffects);
        resolveNavigator.setArguments(bundle);
        this.mFragments.beginTransaction().setTransition(8194).add(R.id.menu_panel, resolveNavigator, "navigator").commitAllowingStateLoss();
        this.mFragments.executePendingTransactions();
    }

    /* access modifiers changed from: private */
    public void tryRefreshPreview() {
        if (this.mPreviewRefreshedWhenInit && this.mTransitionEnd) {
            PreviewFragment previewFragment = (PreviewFragment) this.mFragments.findFragmentByTag(MovieStatUtils.PAGER_PREVIEW);
            if (previewFragment != null) {
                previewFragment.refreshPreview(this.mDraftManager.getPreview());
            }
        }
    }

    public boolean dispatchKeyEvent(KeyEvent keyEvent) {
        return this.mSuspendInputs || super.dispatchKeyEvent(keyEvent);
    }

    public boolean dispatchTouchEvent(MotionEvent motionEvent) {
        return this.mSuspendInputs || super.dispatchTouchEvent(motionEvent);
    }

    public String[] getRuntimePermissions() {
        return new String[]{"android.permission.WRITE_EXTERNAL_STORAGE"};
    }

    public boolean isPermissionRequired(String str) {
        return true;
    }

    /* access modifiers changed from: protected */
    public void onActivityResult(int i, int i2, Intent intent) {
        if (i == 27) {
            if (i2 != -1) {
                setPhotoSecretFinishResult();
                finish();
            } else {
                this.mNeedConfirmPassword = false;
            }
        }
        super.onActivityResult(i, i2, intent);
    }

    public void onAttachFragment(Fragment fragment) {
        if (fragment instanceof MenuFragment) {
            ((MenuFragment) fragment).mCallbacks = this.mMenuCallback;
        } else if (fragment instanceof AbstractNaviFragment) {
            ((AbstractNaviFragment) fragment).mCallbacks = this.mNavigatorCallbacks;
        } else if (fragment instanceof PreviewFragment) {
            PreviewFragment previewFragment = (PreviewFragment) fragment;
            previewFragment.mCallbacks = this.mPreviewCallbacks;
            if ("gl_mask_out".equals(previewFragment.getTag())) {
                previewFragment.mOnViewReadyListener = this.mGLMaskOutReadyListener;
            }
        } else if (fragment instanceof ExportFragment) {
            ((ExportFragment) fragment).setCallbacks(this.mExportCallbacks);
        } else if (fragment instanceof AlertDialogFragment) {
            ((AlertDialogFragment) fragment).setCallbacks(this.mAlertDialogCallbacks);
        }
        if (fragment instanceof GLFragment) {
            ((GLFragment) fragment).getGLContext().setOnCreatedListener(this.mGLReadyListener);
        }
    }

    public void onAttachedToWindow() {
        if (com.android.internal.WindowCompat.isNotch(this)) {
            SystemUiUtil.extendToStatusBar(getWindow().getDecorView());
        }
    }

    public void onBackPressed() {
        Fragment findFragmentById = this.mFragments.findFragmentById(R.id.menu_panel);
        if (findFragmentById instanceof AbstractNaviFragment) {
            Log.d("PhotoEditor", "back pressed on navigator");
            if (this.mDraftManager != null && !this.mDraftManager.isEmpty()) {
                Log.d("PhotoEditor", "have pending operation");
                new Builder().setMessage(R.string.main_discard_confirm_message).setPositiveButton(R.string.main_discard_positive_btn).setNegativeButton(R.string.main_discard_negative_btn).setCancellable(true).build().showAllowingStateLoss(this.mFragments, "main_alert_dialog");
                return;
            }
        } else if (findFragmentById instanceof MenuFragment) {
            Log.d("PhotoEditor", "back pressed on menu");
            MenuFragment menuFragment = (MenuFragment) findFragmentById;
            if (menuFragment.getRenderFragment() == null || menuFragment.getRenderFragment().isEmpty()) {
                onExit(menuFragment);
                return;
            }
            Log.d("PhotoEditor", "menu has pending operation");
            new Builder().setMessage(R.string.sub_discard_confirm_message).setPositiveButton(R.string.sub_discard_positive_btn).setNegativeButton(R.string.sub_discard_negative_btn).setCancellable(true).build().showAllowingStateLoss(this.mFragments, "menu_alert_dialog");
            return;
        }
        Log.d("PhotoEditor", "neither handled back press event, just call default");
        onActivityFinish(false);
        super.onBackPressed();
    }

    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        CTA.setToAllowUseOnOfflineGlobal(getIntent().getBooleanExtra("allow_use_on_offline_global", false));
        super.onCreate(null);
        com.android.internal.WindowCompat.setCutoutModeShortEdges(getWindow());
        this.mTransitionConfig.onActivityCreate(bundle != null);
        this.mDraftManager = new DraftManager(this, getIntent().getData(), getIntent().getExtras());
        this.mExportTask = ExportTask.from(this);
        if (this.mExportTask == null) {
            ActivityCompat.finishAfterTransition(this);
            ToastUtils.makeText((Context) this, (int) R.string.image_invalid_path);
            return;
        }
        setContentView(R.layout.photo_editor_main);
        this.mSampler = Sampler.from(getIntent().getExtras());
        this.mEditorOriginHandler = new EditorOriginHandler(this, this.mExportTask.getSource());
        this.mFragments = getFragmentManager();
        this.mPermissionCheckHelper = new PermissionCheckHelper(this, false, this);
        this.mPermissionCheckHelper.checkPermission();
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        super.onDestroy();
        if (this.mDraftManager != null) {
            this.mDraftManager.release();
            this.mDraftManager = null;
        }
        if (this.mExportTask != null) {
            this.mExportTask.closeExportDialog();
        }
    }

    /* access modifiers changed from: protected */
    public void onPause() {
        this.mResumed = false;
        super.onPause();
        MenuFragment findActiveMenu = findActiveMenu();
        if (findActiveMenu != null) {
            RenderFragment renderFragment = findActiveMenu.getRenderFragment();
            if (renderFragment != null && renderFragment.isAdded() && (renderFragment instanceof GLFragment)) {
                ((GLFragment) renderFragment).getGLContext().performPause();
            }
        }
        if (this.mBrightnessManager != null) {
            this.mBrightnessManager.onPause();
        }
        this.mSampler.recordPageEnd(this);
        ImageLoader.getInstance().onPagePause();
    }

    public void onPermissionsChecked(String[] strArr, int[] iArr) {
        this.mInitializeController = new InitializeController(this, this.mDecoderCallbacks);
        this.mInitializeController.doInitialize();
        this.mCreateTime = System.currentTimeMillis();
        this.mSampler.recordEvent("_main", "enter");
        BeautificationSDK.init(getApplicationContext());
        this.mTransitionConfig.postActivityCreate();
        initScreenBrightness();
        PreviewFragment previewFragment = new PreviewFragment();
        previewFragment.setLoadDone(false);
        this.mFragments.beginTransaction().add(R.id.display_panel, previewFragment, MovieStatUtils.PAGER_PREVIEW).commit();
        prepareNavigator();
    }

    public void onRequestPermissionsResult(int i, String[] strArr, int[] iArr) {
        this.mPermissionCheckHelper.onRequestPermissionsResult(i, strArr, iArr);
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        super.onResume();
        MenuFragment findActiveMenu = findActiveMenu();
        if (findActiveMenu != null) {
            RenderFragment renderFragment = findActiveMenu.getRenderFragment();
            if (renderFragment != null && renderFragment.isAdded() && (renderFragment instanceof GLFragment)) {
                ((GLFragment) renderFragment).getGLContext().performResume();
            }
        }
        if (this.mBrightnessManager != null) {
            this.mBrightnessManager.onResume();
        }
        this.mSampler.recordPageStart(this);
        this.mResumed = true;
        ImageLoader.getInstance().onPageResume();
        if (isNeedConfirmPassword()) {
            this.mNeedConfirmPassword = false;
            LockSettingsHelper.startAuthenticatePasswordActivity((Activity) this, 27);
        }
    }

    /* access modifiers changed from: protected */
    public void onSaveInstanceState(Bundle bundle) {
        Log.d("PhotoEditor", "onSaveInstanceState");
    }

    /* access modifiers changed from: protected */
    public void onStart() {
        super.onStart();
        if (this.mEditorOriginHandler != null) {
            this.mEditorOriginHandler.onStart();
        }
    }

    /* access modifiers changed from: protected */
    public void onStop() {
        this.mNeedConfirmPassword = true;
        super.onStop();
        if (this.mEditorOriginHandler != null) {
            this.mEditorOriginHandler.onDestroy();
        }
    }

    public void onWindowFocusChanged(boolean z) {
        super.onWindowFocusChanged(z);
        if (this.mBrightnessManager != null) {
            this.mBrightnessManager.onWindowFocusChanged(z);
        }
    }

    public void setActivityResult(int i, Intent intent) {
        this.mActivityResult = i;
        this.mActivityIntent = intent;
        prepareResult(intent);
        intent.putExtra("extra_photo_edit_type", "extra_photo_editor_type_common");
        setResult(this.mActivityResult, this.mActivityIntent);
    }

    public void showEditFragment(Effect effect) {
        boolean z;
        FragmentData fragmentData = this.mFragmentData[effect.ordinal()];
        RenderFragment renderFragment = (RenderFragment) this.mFragments.findFragmentByTag(fragmentData.renderTag);
        Fragment findFragmentByTag = this.mFragments.findFragmentByTag(fragmentData.gestureTag);
        if (renderFragment != null) {
            this.mFragments.beginTransaction().show(renderFragment).commit();
            z = true;
        } else {
            z = false;
        }
        if (findFragmentByTag != null) {
            this.mFragments.beginTransaction().show(findFragmentByTag).commit();
            z = true;
        }
        if (z) {
            this.mFragments.executePendingTransactions();
        }
        Fragment findFragmentByTag2 = this.mFragments.findFragmentByTag(MovieStatUtils.PAGER_PREVIEW);
        if (findFragmentByTag2 != null) {
            this.mFragments.beginTransaction().detach(findFragmentByTag2).addToBackStack(null).commit();
            this.mFragments.executePendingTransactions();
        }
        if (renderFragment instanceof GLFragment) {
            PreviewFragment previewFragment = new PreviewFragment();
            Bundle bundle = new Bundle();
            bundle.putBoolean("overwrite_background", true);
            previewFragment.setArguments(bundle);
            this.mFragments.beginTransaction().add(R.id.display_panel, previewFragment, "gl_mask_in").commit();
            this.mFragments.executePendingTransactions();
        }
    }

    public void showPermissionIntroduction(Activity activity, String str, OnPermissionIntroduced onPermissionIntroduced) {
        PermissionIntroductionUtils.showPermissionIntroduction(activity, str, onPermissionIntroduced);
    }
}
