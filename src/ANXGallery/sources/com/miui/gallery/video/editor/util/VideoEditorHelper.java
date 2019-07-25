package com.miui.gallery.video.editor.util;

import android.app.Activity;
import android.app.DialogFragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import com.miui.gallery.R;
import com.miui.gallery.provider.GalleryOpenProvider;
import com.miui.gallery.scanner.MediaScanner;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.FutureHandler;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.ui.ConfirmDialog;
import com.miui.gallery.ui.ConfirmDialog.ConfirmDialogInterface;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MediaStoreUtils;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.video.editor.VideoEditor;
import com.miui.gallery.video.editor.fragment.FilterAdjustFragment;
import com.miui.gallery.video.editor.fragment.VideoNavFragment;
import com.miui.gallery.video.editor.manager.SmartVideoJudgeManager;
import com.miui.gallery.video.editor.model.MenuFragmentData;
import com.miui.gallery.video.editor.ui.AudioFragment;
import com.miui.gallery.video.editor.ui.EncodeProgressDialog;
import com.miui.gallery.video.editor.ui.EncodeProgressDialog.OnCompletedListener;
import com.miui.gallery.video.editor.ui.MenuFragment;
import com.miui.gallery.video.editor.ui.SmartEffectFragment;
import com.miui.gallery.video.editor.ui.TrimFragment;
import com.miui.gallery.video.editor.ui.VideoEditorFragment;
import com.miui.gallery.video.editor.ui.WaterMarkFragment;
import com.miui.gallery.video.editor.widget.DisplayWrapper;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

public class VideoEditorHelper {
    /* access modifiers changed from: private */
    public Activity mActivity;
    private Context mContext;
    private int mCurrentEditType;
    /* access modifiers changed from: private */
    public MenuFragment mCurrentMenuFragment;
    /* access modifiers changed from: private */
    public DisplayWrapper mDisplayWrapperView;
    private int mEffectContainerId;
    /* access modifiers changed from: private */
    public VideoEditorFragment mFragment;
    private FragmentManager mFragmentManager;
    private String mLastTag;
    private LinkedHashMap<Integer, MenuFragmentData> mNavgatorDataMap;
    private List<MenuFragmentData> mNavigatorDataList = new ArrayList();
    private VideoEditor mVideoEditor;
    /* access modifiers changed from: private */
    public VideoSaveManager mVideoSaveManager;
    private boolean mVideoSaving;

    private static class VideoSaveManager {
        /* access modifiers changed from: private */
        public Future<Void> mFuture;
        private WeakReference<VideoEditorHelper> mHelperWeakReference;

        public VideoSaveManager(VideoEditorHelper videoEditorHelper) {
            this.mHelperWeakReference = new WeakReference<>(videoEditorHelper);
        }

        /* access modifiers changed from: private */
        public VideoEditorHelper getVideoEditorHelper() {
            if (this.mHelperWeakReference == null) {
                return null;
            }
            return (VideoEditorHelper) this.mHelperWeakReference.get();
        }

        public void handleVideoSave(final String str) {
            if (TextUtils.isEmpty(str)) {
                Log.d("VideoEditorHelper", "the video path is null. ");
            } else if (getVideoEditorHelper() == null) {
                Log.d("VideoEditorHelper", "the VideoEditorHelper is null. ");
            } else {
                if (this.mFuture != null) {
                    this.mFuture.cancel();
                }
                this.mFuture = ThreadManager.getMiscPool().submit(new Job<Void>() {
                    public Void run(JobContext jobContext) {
                        VideoEditorHelper access$700 = VideoSaveManager.this.getVideoEditorHelper();
                        if (access$700 != null && !VideoSaveManager.this.mFuture.isCancelled()) {
                            Activity access$300 = access$700.mActivity;
                            MediaScanner.scanSingleFile(access$300, str);
                            MediaStoreUtils.insert((Context) access$300, str, 2);
                            MediaStoreUtils.sendScannerBroadcast(access$300, str);
                        }
                        return null;
                    }
                }, new FutureHandler<Void>() {
                    public void onPostExecute(Future<Void> future) {
                        VideoEditorHelper access$700 = VideoSaveManager.this.getVideoEditorHelper();
                        if (!future.isCancelled() && access$700 != null) {
                            access$700.onVideoSaved(str);
                        }
                    }
                });
            }
        }

        public void onDestroy() {
            if (this.mFuture != null) {
                this.mFuture.cancel();
                this.mFuture = null;
            }
        }
    }

    public VideoEditorHelper(Context context, VideoEditorFragment videoEditorFragment) {
        this.mContext = context;
        this.mFragment = videoEditorFragment;
        this.mActivity = videoEditorFragment.getActivity();
        this.mFragmentManager = this.mActivity.getFragmentManager();
        this.mVideoEditor = this.mFragment.getVideoEditor();
        this.mDisplayWrapperView = this.mVideoEditor.getDisplayWrapper();
        this.mEffectContainerId = this.mFragment.getEffectMenuContainerId();
        if (this.mNavgatorDataMap == null) {
            this.mNavgatorDataMap = new LinkedHashMap<>();
            initNavgatorData();
        }
        this.mVideoSaveManager = new VideoSaveManager(this);
        initListener();
    }

    private void initListener() {
        this.mDisplayWrapperView.setAudioVoiceListener(new OnClickListener() {
            public void onClick(View view) {
                boolean audioVoiceSelected = VideoEditorHelper.this.mDisplayWrapperView.getAudioVoiceSelected();
                VideoEditorHelper.this.mDisplayWrapperView.setAudioVoiceSelected(!audioVoiceSelected);
                VideoEditorHelper.this.mCurrentMenuFragment.updateVoiceState(audioVoiceSelected);
            }
        });
    }

    private void initNavgatorData() {
        this.mNavgatorDataMap.put(Integer.valueOf(16), new MenuFragmentData(VideoNavFragment.class, 0, 0, 16));
        this.mNavgatorDataMap.put(Integer.valueOf(17), new MenuFragmentData(SmartEffectFragment.class, R.drawable.video_editor_icon_smareffects, R.string.video_editor_intelligent_special_effect, 17));
        this.mNavgatorDataMap.put(Integer.valueOf(18), new MenuFragmentData(TrimFragment.class, R.drawable.video_editor_icon_trim, R.string.video_editor_trim, 18));
        this.mNavgatorDataMap.put(Integer.valueOf(19), new MenuFragmentData(FilterAdjustFragment.class, R.drawable.video_editor_icon_filter, R.string.video_editor_filter_and_regulator, 19));
        this.mNavgatorDataMap.put(Integer.valueOf(20), new MenuFragmentData(AudioFragment.class, R.drawable.video_editor_icon_music, R.string.video_editor_audio, 20));
        this.mNavgatorDataMap.put(Integer.valueOf(21), new MenuFragmentData(WaterMarkFragment.class, R.drawable.video_editor_icon_text, R.string.video_editor_watermark, 21));
        this.mNavgatorDataMap.put(Integer.valueOf(22), new MenuFragmentData(null, R.drawable.video_editor_icon_more, R.string.video_editor_more, 22));
    }

    private boolean isAudioEditMenu() {
        return R.id.video_editor_audio == this.mCurrentEditType;
    }

    /* access modifiers changed from: private */
    public boolean isNavEditMenu() {
        return R.id.video_editor_nav == this.mCurrentEditType;
    }

    private boolean isTrimEditMenu() {
        return R.id.video_editor_trim == this.mCurrentEditType;
    }

    private String makeMenuFragmentTag(String str) {
        StringBuilder sb = new StringBuilder();
        sb.append(VideoEditorHelper.class.getName());
        sb.append(str);
        return sb.toString();
    }

    /* access modifiers changed from: private */
    public void onMenuFragCancel() {
        if (this.mCurrentMenuFragment != null) {
            this.mCurrentMenuFragment.doCancel();
        }
    }

    /* access modifiers changed from: private */
    public void onVideoSaved(String str) {
        Intent intent = new Intent();
        intent.setData(GalleryOpenProvider.translateToContent(str));
        this.mFragment.getActivity().setResult(-1, intent);
        setVideoSaving(false);
        this.mFragment.exit();
    }

    public void changeEditMenu(MenuFragmentData menuFragmentData) {
        if (menuFragmentData != null) {
            String tag = menuFragmentData.getTag();
            if (menuFragmentData.isModuleMore()) {
                this.mVideoEditor.toThirdEditor(this.mContext);
                return;
            }
            MenuFragment menuFragment = (MenuFragment) this.mFragmentManager.findFragmentByTag(makeMenuFragmentTag(this.mLastTag));
            if (menuFragment == null) {
                menuFragment = (MenuFragment) this.mFragmentManager.findFragmentById(this.mEffectContainerId);
            }
            MenuFragment menuFragment2 = (MenuFragment) this.mFragmentManager.findFragmentByTag(makeMenuFragmentTag(tag));
            if (menuFragment2 != null && menuFragment2.equals(menuFragment)) {
                menuFragment = null;
            }
            FragmentTransaction beginTransaction = this.mFragmentManager.beginTransaction();
            if (menuFragment2 != null) {
                beginTransaction.attach(menuFragment2);
                this.mCurrentMenuFragment = menuFragment2;
            } else {
                Class menu = menuFragmentData.getMenu();
                if (menu != null) {
                    try {
                        MenuFragment menuFragment3 = (MenuFragment) menu.newInstance();
                        beginTransaction.add(this.mEffectContainerId, menuFragment3, makeMenuFragmentTag(tag));
                        this.mCurrentMenuFragment = menuFragment3;
                    } catch (Exception e) {
                        e.printStackTrace();
                        Log.d("VideoEditorHelper", e.toString());
                    }
                }
            }
            this.mCurrentMenuFragment.updateLastFragment(menuFragment);
            if (menuFragment != null) {
                beginTransaction.detach(menuFragment);
            }
            beginTransaction.commitAllowingStateLoss();
            this.mLastTag = tag;
            this.mCurrentEditType = this.mCurrentMenuFragment.getEffectId();
        }
    }

    public List<MenuFragmentData> getNavigatorData(int i) {
        if (this.mNavigatorDataList.isEmpty()) {
            for (MenuFragmentData menuFragmentData : this.mNavgatorDataMap.values()) {
                if (menuFragmentData != null && !menuFragmentData.isNavModule()) {
                    boolean z = SmartVideoJudgeManager.isAvailable() && i <= 120;
                    Log.d("VideoEditorHelper", "smartVideoAvailable: %s", (Object) Boolean.valueOf(z));
                    if (menuFragmentData.module != 17 || z) {
                        this.mNavigatorDataList.add(menuFragmentData);
                    }
                }
            }
        }
        return this.mNavigatorDataList;
    }

    public boolean isWaterMarkEditMenu() {
        return R.id.video_editor_water_mark == this.mCurrentEditType;
    }

    public boolean onBackPressed() {
        if (this.mVideoEditor == null) {
            return false;
        }
        if (!this.mVideoEditor.isInit()) {
            return true;
        }
        if (!this.mVideoEditor.hasEdit()) {
            GallerySamplingStatHelper.recordCountEvent("video_editor", "cancel");
            if (isNavEditMenu()) {
                this.mFragment.exit();
            } else if (isTrimEditMenu()) {
                onMenuFragCancel();
            } else {
                showNavEditMenu();
            }
        } else if (!isNavEditMenu()) {
            onMenuFragCancel();
            return true;
        } else {
            ConfirmDialog.showConfirmDialog(this.mFragmentManager, this.mFragment.getString(R.string.video_editor_abandon_changes_tip_title), this.mFragment.getString(R.string.video_editor_abandon_changes_tip_message), this.mFragment.getString(R.string.video_editor_cancel), this.mFragment.getString(R.string.video_editor_ok), new ConfirmDialogInterface() {
                public void onCancel(DialogFragment dialogFragment) {
                }

                public void onConfirm(DialogFragment dialogFragment) {
                    GallerySamplingStatHelper.recordCountEvent("video_editor", "cancel");
                    if (VideoEditorHelper.this.isNavEditMenu()) {
                        VideoEditorHelper.this.mFragment.exit();
                    } else {
                        VideoEditorHelper.this.onMenuFragCancel();
                    }
                }
            });
        }
        return true;
    }

    public void onCancel() {
        onBackPressed();
    }

    public void onDestroy() {
        if (this.mVideoSaveManager != null) {
            this.mVideoSaveManager.onDestroy();
        }
    }

    public void onPlayButtonClicked() {
        if (this.mCurrentMenuFragment != null) {
            this.mCurrentMenuFragment.onPlayButtonClicked();
        }
    }

    public void onSave() {
        if (this.mVideoEditor == null || this.mVideoSaving) {
            Log.e("VideoEditorHelper", "the video is saving:  %s ", (Object) Boolean.valueOf(this.mVideoSaving));
            return;
        }
        Log.d("VideoEditorHelper", "start save video！");
        Uri data = this.mFragment.getData();
        setVideoSaving(true);
        EncodeProgressDialog.startEncode(this.mVideoEditor, FileHelper.generateOutputFilePath(data.getPath(), false), new OnCompletedListener() {
            public void onCompleted(String str, boolean z, int i, int i2) {
                Log.d("VideoEditorHelper", "video save success: %s, and video encode error errorCode :%s", Boolean.valueOf(z), String.valueOf(i));
                if (z) {
                    GallerySamplingStatHelper.recordCountEvent("video_editor", "video_editor_export_success");
                    VideoEditorHelper.this.mVideoSaveManager.handleVideoSave(str);
                } else if (i2 == -1) {
                    VideoEditorHelper.this.setVideoSaving(false);
                } else {
                    HashMap hashMap = new HashMap();
                    hashMap.put("errorCode", String.valueOf(i));
                    GallerySamplingStatHelper.recordCountEvent("video_editor", "video_editor_export_failed", hashMap);
                    ToastUtils.makeText((Context) VideoEditorHelper.this.mActivity, (CharSequence) VideoEditorHelper.this.mActivity.getResources().getString(R.string.video_editor_encode_video_error));
                    VideoEditorHelper.this.setVideoSaving(false);
                }
            }
        }, this.mFragment.getFragmentManager());
    }

    public void onVideoLoadCompleted() {
        if (this.mCurrentMenuFragment != null) {
            this.mCurrentMenuFragment.onVideoLoadCompleted();
        }
    }

    public void setVideoSaving(boolean z) {
        this.mVideoSaving = z;
    }

    public void showNavEditMenu() {
        changeEditMenu((MenuFragmentData) this.mNavgatorDataMap.get(Integer.valueOf(16)));
    }

    public void updateAudioVoiceView(boolean z) {
        if (isAudioEditMenu()) {
            this.mDisplayWrapperView.showAudioVoice(true);
            this.mDisplayWrapperView.setAudioVoiceSelected(!z);
            return;
        }
        this.mDisplayWrapperView.showAudioVoice(false);
    }

    public void updateAutoTrimView() {
        boolean z = false;
        if (isTrimEditMenu()) {
            DisplayWrapper displayWrapper = this.mDisplayWrapperView;
            if (this.mVideoEditor != null && this.mVideoEditor.isSupportAutoTrim()) {
                z = true;
            }
            displayWrapper.showAutoTrimBtn(z);
            return;
        }
        this.mDisplayWrapperView.showAutoTrimBtn(false);
    }

    public void updatePlayView() {
        if (this.mVideoSaving) {
            this.mDisplayWrapperView.showPlayBtn(false);
        } else if (isWaterMarkEditMenu()) {
            this.mDisplayWrapperView.showPlayBtn(false);
        } else {
            int state = this.mVideoEditor.getState();
            if (state == 2 || state == 0) {
                this.mDisplayWrapperView.showPlayBtn(true);
            } else if (!isTrimEditMenu() || !(state == 3 || state == 200)) {
                this.mDisplayWrapperView.showPlayBtn(false);
            } else {
                this.mDisplayWrapperView.showPlayBtn(true);
            }
        }
    }
}
