package com.miui.gallery.video.editor.ui;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.app.DialogFragment;
import android.app.Fragment;
import android.content.Context;
import android.os.Bundle;
import android.view.View;
import com.miui.gallery.R;
import com.miui.gallery.cloud.NetworkUtils;
import com.miui.gallery.net.download.Request.Listener;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.ui.ConfirmDialog;
import com.miui.gallery.ui.ConfirmDialog.ConfirmDialogInterface;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.video.editor.VideoEditor;
import com.miui.gallery.video.editor.factory.VideoEditorModuleFactory;
import com.miui.gallery.video.editor.interfaces.IVideoEditorListener.IDownloadListener;
import com.miui.gallery.video.editor.interfaces.IVideoEditorListener.IMenuFragment;
import com.miui.gallery.video.editor.interfaces.IVideoEditorListener.IUnzipFileListener;
import com.miui.gallery.video.editor.interfaces.IVideoEditorListener.IVideoEditorFragmentCallback;
import com.miui.gallery.video.editor.manager.DownloadManager;
import com.miui.gallery.video.editor.manager.SamplerManager;
import com.miui.gallery.video.editor.manager.SmartVideoJudgeManager;
import com.miui.gallery.video.editor.manager.UnzipTaskManager;
import com.miui.gallery.video.editor.model.VideoEditorBaseModel;
import java.util.HashMap;
import java.util.List;
import miui.view.animation.CubicEaseOutInterpolator;

public abstract class MenuFragment extends Fragment implements IMenuFragment {
    private static int sAnimAppearDelay;
    private static int sAnimAppearDuration;
    private static int sAnimDisappearDuration;
    private static int sAnimOffset;
    /* access modifiers changed from: protected */
    public IVideoEditorFragmentCallback mCallback;
    /* access modifiers changed from: protected */
    public Context mContext;
    protected IDownloadListener mIDownloadListener = new IDownloadListener() {
        /* access modifiers changed from: private */
        public void unZipDownloadFile(final VideoEditorBaseModel videoEditorBaseModel, final int i) {
            MenuFragment menuFragment = MenuFragment.this;
            UnzipTaskManager unzipTaskManager = new UnzipTaskManager(MenuFragment.this.mContext, videoEditorBaseModel.isTemplate(), videoEditorBaseModel, getDownloadPath(videoEditorBaseModel), getUnzipPath(videoEditorBaseModel), new IUnzipFileListener() {
                public void onUnzipFileFailed() {
                    videoEditorBaseModel.setDownloadState(20);
                    ToastUtils.makeText(MenuFragment.this.mContext, (int) R.string.video_editor_unzip_file_fail);
                    MenuFragment.this.notifyDateSetChanged(i);
                }

                public void onUzipFileSuccess() {
                    MenuFragment.this.onDownlaodCompleted(videoEditorBaseModel, i);
                }
            });
            menuFragment.mUnzipTaskManager = unzipTaskManager;
            MenuFragment.this.mUnzipTaskManager.execute(new Void[0]);
        }

        public void downloadResource(VideoEditorBaseModel videoEditorBaseModel, int i, boolean z) {
            if (MenuFragment.this.mResourceDownloadManager == null) {
                MenuFragment.this.mResourceDownloadManager = new DownloadManager();
            }
            final long currentTimeMillis = System.currentTimeMillis();
            Log.d("MenuFragment", "downloadResource start.");
            videoEditorBaseModel.setDownloadState(18);
            DownloadManager downloadManager = MenuFragment.this.mResourceDownloadManager;
            IDownloadListener iDownloadListener = MenuFragment.this.mIDownloadListener;
            final int i2 = i;
            final VideoEditorBaseModel videoEditorBaseModel2 = videoEditorBaseModel;
            AnonymousClass1 r2 = new Listener() {
                public void onComplete(int i) {
                    if (i == 0) {
                        AnonymousClass2.this.unZipDownloadFile(videoEditorBaseModel2, i2);
                    } else {
                        ThreadManager.runOnMainThread(new Runnable() {
                            public void run() {
                                videoEditorBaseModel2.setDownloadState(20);
                                MenuFragment.this.notifyDateSetChanged(i2);
                                ToastUtils.makeText(MenuFragment.this.mContext, (int) R.string.video_editor_download_failed_for_notwork);
                                Log.e("MenuFragment", "the download task fail.");
                            }
                        });
                    }
                }

                public void onProgressUpdate(int i) {
                    Log.d("MenuFragment", "downloadResource onProgressUpdate:  %d", (Object) Integer.valueOf(i));
                }

                public void onStart() {
                    Log.d("MenuFragment", "downloadResource receive  download callback : %d ms", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
                    MenuFragment.this.notifyDateSetChanged(i2);
                }
            };
            downloadManager.download(videoEditorBaseModel, iDownloadListener, r2, z);
        }

        public void downloadResourceWithCheck(final VideoEditorBaseModel videoEditorBaseModel, final int i) {
            if (!NetworkUtils.isNetworkConnected()) {
                ToastUtils.makeText(MenuFragment.this.mContext, (int) R.string.video_editor_download_failed_for_notwork);
            } else if (NetworkUtils.isActiveNetworkMetered()) {
                MenuFragment.this.showNetworkConfirmDialog(new ConfirmDialogInterface() {
                    public void onCancel(DialogFragment dialogFragment) {
                        dialogFragment.dismiss();
                    }

                    public void onConfirm(DialogFragment dialogFragment) {
                        dialogFragment.dismiss();
                        AnonymousClass2.this.downloadResource(videoEditorBaseModel, i, true);
                    }
                });
            } else {
                downloadResource(videoEditorBaseModel, i, false);
            }
        }

        public String getDownloadPath(VideoEditorBaseModel videoEditorBaseModel) {
            if (MenuFragment.this.mModuleFactory == null) {
                return "";
            }
            StringBuilder sb = new StringBuilder();
            sb.append(MenuFragment.this.mModuleFactory.getTemplateDir(videoEditorBaseModel.getId()));
            sb.append(".zip");
            return sb.toString();
        }

        public String getUnzipPath(VideoEditorBaseModel videoEditorBaseModel) {
            return MenuFragment.this.mModuleFactory.getUnzipPath();
        }
    };
    protected VideoEditorModuleFactory mModuleFactory;
    protected DownloadManager mResourceDownloadManager;
    private SamplerManager mSamplerManager;
    /* access modifiers changed from: private */
    public UnzipTaskManager mUnzipTaskManager;
    /* access modifiers changed from: protected */
    public VideoEditor mVideoEditor;

    private void initAnimatorData() {
        if (sAnimOffset == 0) {
            sAnimOffset = getActivity().getResources().getDimensionPixelSize(R.dimen.video_editor_enter_sub_editor_main_menu_offset);
        }
        if (sAnimAppearDuration == 0) {
            sAnimAppearDuration = getActivity().getResources().getInteger(R.integer.video_editor_sub_editor_sub_menu_appear_duration);
        }
        if (sAnimDisappearDuration == 0) {
            sAnimDisappearDuration = getActivity().getResources().getInteger(R.integer.video_editor_sub_editor_sub_menu_disappear_duration);
        }
        if (sAnimAppearDelay == 0) {
            sAnimAppearDelay = getActivity().getResources().getInteger(R.integer.video_editor_sub_editor_sub_menu_appear_delay);
        }
    }

    private String mapIdToStatCate(int i) {
        switch (i) {
            case R.id.video_editor_audio /*2131297068*/:
                return "video_editor_audio";
            case R.id.video_editor_filter /*2131297073*/:
                return "video_editor_filter";
            case R.id.video_editor_smart_effect /*2131297080*/:
                return "video_editor_smart_effect";
            case R.id.video_editor_trim /*2131297086*/:
                return "video_editor_clip";
            case R.id.video_editor_water_mark /*2131297089*/:
                return "video_editor_text";
            default:
                return "video_editor_unknown";
        }
    }

    /* access modifiers changed from: private */
    public void showNetworkConfirmDialog(ConfirmDialogInterface confirmDialogInterface) {
        ConfirmDialog.showConfirmDialog(getFragmentManager(), getResources().getString(R.string.video_editor_download_with_metered_network_title), getResources().getString(R.string.video_editor_download_with_metered_network_msg), getResources().getString(R.string.video_editor_cancel_download), getResources().getString(R.string.video_editor_download), confirmDialogInterface);
    }

    public void cancelRequest() {
        if (this.mUnzipTaskManager != null) {
            this.mUnzipTaskManager.setListener(null);
            this.mUnzipTaskManager = null;
        }
        if (this.mResourceDownloadManager != null) {
            this.mResourceDownloadManager.cancelAll();
            this.mResourceDownloadManager = null;
        }
    }

    public void loadResourceData() {
    }

    public void notifyDateSetChanged(int i) {
    }

    public void onAttach(Context context) {
        super.onAttach(context);
        this.mContext = context;
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        initAnimatorData();
        this.mSamplerManager = SamplerManager.create();
    }

    public Animator onCreateAnimator(int i, boolean z, int i2) {
        ObjectAnimator objectAnimator = new ObjectAnimator();
        if (z) {
            objectAnimator.setValues(new PropertyValuesHolder[]{PropertyValuesHolder.ofFloat(View.TRANSLATION_Y, new float[]{(float) sAnimOffset, 0.0f}), PropertyValuesHolder.ofFloat(View.ALPHA, new float[]{0.0f, 1.0f})});
            objectAnimator.setInterpolator(new CubicEaseOutInterpolator());
            if (getView() != null) {
                getView().setVisibility(4);
            }
            objectAnimator.setStartDelay((long) sAnimAppearDelay);
            objectAnimator.setDuration((long) sAnimAppearDuration);
            objectAnimator.addListener(new AnimatorListener() {
                public void onAnimationCancel(Animator animator) {
                }

                public void onAnimationEnd(Animator animator) {
                }

                public void onAnimationRepeat(Animator animator) {
                }

                public void onAnimationStart(Animator animator) {
                    if (MenuFragment.this.getView() != null) {
                        MenuFragment.this.getView().setVisibility(0);
                    }
                }
            });
        } else {
            PropertyValuesHolder ofFloat = PropertyValuesHolder.ofFloat(View.ALPHA, new float[]{1.0f, 0.0f});
            objectAnimator.setInterpolator(new CubicEaseOutInterpolator());
            objectAnimator.setValues(new PropertyValuesHolder[]{ofFloat});
            objectAnimator.setDuration((long) sAnimDisappearDuration);
        }
        return objectAnimator;
    }

    public void onDetach() {
        super.onDetach();
        this.mCallback = null;
    }

    public void onDownlaodCompleted(VideoEditorBaseModel videoEditorBaseModel, int i) {
    }

    /* access modifiers changed from: protected */
    public void onExitMode() {
        if (this.mCallback != null) {
            this.mCallback.showNavEditMenu();
        }
    }

    public void onPlayButtonClicked() {
    }

    public void onVideoLoadCompleted() {
    }

    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        updatePalyBtnView();
    }

    /* access modifiers changed from: protected */
    public void recordEventWithApply() {
        HashMap hashMap = new HashMap();
        List<String> currentEffect = getCurrentEffect();
        if (currentEffect == null || currentEffect.isEmpty()) {
            hashMap.put("effect", "none");
            GallerySamplingStatHelper.recordCountEvent(mapIdToStatCate(getEffectId()), "save_detail", hashMap);
            if (SmartVideoJudgeManager.isAvailable()) {
                this.mSamplerManager.recordEvent(mapIdToStatCate(getEffectId()), "save_detail", hashMap);
            }
        } else {
            for (String put : currentEffect) {
                hashMap.put("effect", put);
                GallerySamplingStatHelper.recordCountEvent(mapIdToStatCate(getEffectId()), "save_detail", hashMap);
                if (SmartVideoJudgeManager.isAvailable()) {
                    this.mSamplerManager.recordEvent(mapIdToStatCate(getEffectId()), "save_detail", hashMap);
                }
            }
        }
        GallerySamplingStatHelper.recordCountEvent(mapIdToStatCate(getEffectId()), "save");
    }

    /* access modifiers changed from: protected */
    public void recordEventWithCancel() {
        HashMap hashMap = new HashMap();
        List<String> currentEffect = getCurrentEffect();
        if (currentEffect == null || currentEffect.isEmpty()) {
            hashMap.put("effect", "none");
            GallerySamplingStatHelper.recordCountEvent(mapIdToStatCate(getEffectId()), "save_detail", hashMap);
            if (SmartVideoJudgeManager.isAvailable()) {
                this.mSamplerManager.recordEvent(mapIdToStatCate(getEffectId()), "save_detail", hashMap);
            }
        } else {
            for (String put : currentEffect) {
                hashMap.put("effect", put);
                GallerySamplingStatHelper.recordCountEvent(mapIdToStatCate(getEffectId()), "save_detail", hashMap);
                if (SmartVideoJudgeManager.isAvailable()) {
                    this.mSamplerManager.recordEvent(mapIdToStatCate(getEffectId()), "save_detail", hashMap);
                }
            }
        }
        GallerySamplingStatHelper.recordCountEvent(mapIdToStatCate(getEffectId()), "save");
    }

    /* access modifiers changed from: protected */
    public void recordEventWithEffectChanged() {
        GallerySamplingStatHelper.recordCountEvent(mapIdToStatCate(getEffectId()), "enter");
    }

    public void setCallBack(IVideoEditorFragmentCallback iVideoEditorFragmentCallback) {
        this.mCallback = iVideoEditorFragmentCallback;
        this.mVideoEditor = this.mCallback.getVideoEditor();
    }

    public void updateLastFragment(MenuFragment menuFragment) {
    }

    public void updatePalyBtnView() {
        if (this.mCallback != null) {
            this.mCallback.updatePalyBtnView();
        }
    }

    public void updateVoiceState(boolean z) {
    }
}
