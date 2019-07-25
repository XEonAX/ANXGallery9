package com.miui.gallery.video.editor.ui;

import android.app.Activity;
import android.app.Fragment;
import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.support.constraint.Guideline;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewTreeObserver.OnGlobalFocusChangeListener;
import android.widget.ProgressBar;
import com.android.internal.WindowCompat;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.video.editor.NexVideoEditor;
import com.miui.gallery.video.editor.VideoEditor;
import com.miui.gallery.video.editor.VideoEditor.OnCompletedListener;
import com.miui.gallery.video.editor.VideoEditor.StateChangeListener;
import com.miui.gallery.video.editor.activity.VideoEditorActivity;
import com.miui.gallery.video.editor.activity.VideoEditorActivity.OnBackPressedListener;
import com.miui.gallery.video.editor.interfaces.IVideoEditorListener.IVideoEditorFragmentCallback;
import com.miui.gallery.video.editor.model.MenuFragmentData;
import com.miui.gallery.video.editor.util.TempFileCollector;
import com.miui.gallery.video.editor.util.ToolsUtil;
import com.miui.gallery.video.editor.util.VideoEditorHelper;
import com.miui.gallery.video.editor.widget.DisplayWrapper;
import com.miui.gallery.video.editor.widget.DisplayWrapper.IProgress;
import com.nostra13.universalimageloader.core.ImageLoader;
import java.util.HashMap;
import java.util.List;

public class VideoEditorFragment extends Fragment implements OnBackPressedListener {
    /* access modifiers changed from: private */
    public Activity mActivity;
    /* access modifiers changed from: private */
    public int mCurrentTime = 0;
    /* access modifiers changed from: private */
    public Uri mData;
    /* access modifiers changed from: private */
    public DisplayWrapper mDisplayWrapperView;
    /* access modifiers changed from: private */
    public boolean mIsLoadSuccess;
    public IVideoEditorFragmentCallback mMenuFragmentCallBack = new IVideoEditorFragmentCallback() {
        public void changeEditMenu(MenuFragmentData menuFragmentData) {
            VideoEditorFragment.this.mVideoEditorHelper.changeEditMenu(menuFragmentData);
        }

        public List<MenuFragmentData> getNavigatorData(int i) {
            return VideoEditorFragment.this.mVideoEditorHelper.getNavigatorData(i);
        }

        public VideoEditor getVideoEditor() {
            return VideoEditorFragment.this.mVideoEditor;
        }

        public boolean isLoadSuccess() {
            return VideoEditorFragment.this.mIsLoadSuccess;
        }

        public void onCancel() {
            VideoEditorFragment.this.mVideoEditorHelper.onCancel();
        }

        public void onSave() {
            VideoEditorFragment.this.mVideoEditorHelper.onSave();
        }

        public void showNavEditMenu() {
            VideoEditorFragment.this.mVideoEditorHelper.showNavEditMenu();
        }

        public void updateAudioVoiceView(boolean z) {
            VideoEditorFragment.this.mVideoEditorHelper.updateAudioVoiceView(z);
        }

        public void updateAutoTrimView() {
            VideoEditorFragment.this.mVideoEditorHelper.updateAutoTrimView();
        }

        public void updatePalyBtnView() {
            VideoEditorFragment.this.mVideoEditorHelper.updatePlayView();
        }
    };
    /* access modifiers changed from: private */
    public View mMenuView;
    private MyStateChangeListener mMyStateChangeListener;
    OnGlobalFocusChangeListener mOnGlobalFocusChangeListener = new OnGlobalFocusChangeListener() {
        public void onGlobalFocusChanged(View view, View view2) {
            if (WindowCompat.isNotch(VideoEditorFragment.this.getActivity())) {
                VideoEditorFragment.this.mTopLine.setGuidelineBegin(WindowCompat.getTopNotchHeight(VideoEditorFragment.this.getActivity()) + VideoEditorFragment.this.getResources().getDimensionPixelSize(R.dimen.display_top_line));
            }
            VideoEditorFragment.this.mMenuView.getViewTreeObserver().removeOnGlobalFocusChangeListener(VideoEditorFragment.this.mOnGlobalFocusChangeListener);
        }
    };
    /* access modifiers changed from: private */
    public int mPlayProgress = 0;
    /* access modifiers changed from: private */
    public ProgressBar mProgressingView;
    /* access modifiers changed from: private */
    public Guideline mTopLine;
    /* access modifiers changed from: private */
    public VideoEditor mVideoEditor;
    /* access modifiers changed from: private */
    public VideoEditorHelper mVideoEditorHelper;

    private class InitializeListener extends MyVideoLoadCompletedListener {
        private InitializeListener() {
            super();
        }

        public void onCompleted() {
            if (VideoEditorFragment.this.mVideoEditor instanceof NexVideoEditor) {
                if (!((NexVideoEditor) VideoEditorFragment.this.mVideoEditor).checkIDRSupport()) {
                    GallerySamplingStatHelper.recordCountEvent("video_editor", "idr_warning");
                }
                VideoEditorFragment.this.mVideoEditor.seek(VideoEditorFragment.this.mVideoEditor.getVideoStartTime(), null);
            }
            super.onCompleted();
        }
    }

    private class MyStateChangeListener implements StateChangeListener {
        private MyStateChangeListener() {
        }

        public void onStateChanged(int i) {
            if (i == -500) {
                ToastUtils.makeText((Context) VideoEditorFragment.this.mActivity, (int) R.string.video_editor_fatal_error);
                VideoEditorFragment.this.exit();
            } else if (i == 200) {
                ToolsUtil.hideView(VideoEditorFragment.this.mProgressingView);
            } else if (i != 500) {
                switch (i) {
                    case 0:
                    case 2:
                        ToolsUtil.hideView(VideoEditorFragment.this.mProgressingView);
                        break;
                    case 1:
                        ToolsUtil.hideView(VideoEditorFragment.this.mProgressingView);
                        break;
                    case 3:
                        ToolsUtil.hideView(VideoEditorFragment.this.mProgressingView);
                        break;
                }
            } else {
                VideoEditorFragment.this.handleNotSupportVideoFile();
            }
            VideoEditorFragment.this.mVideoEditorHelper.updatePlayView();
        }

        public void onTimeChanged(int i) {
            VideoEditorFragment.this.mDisplayWrapperView.showPlayProgress(true);
        }
    }

    private class MyVideoLoadCompletedListener implements OnCompletedListener {
        private MyVideoLoadCompletedListener() {
        }

        public void onCompleted() {
            if (VideoEditorFragment.this.mVideoEditor != null) {
                if (VideoEditorFragment.this.mVideoEditor.haveSavedEditState()) {
                    VideoEditorFragment.this.mVideoEditor.restoreEditState();
                    VideoEditorFragment.this.mVideoEditor.apply(new OnCompletedListener() {
                        public void onCompleted() {
                        }
                    });
                }
                VideoEditorFragment.this.mVideoEditorHelper.onVideoLoadCompleted();
                VideoEditorFragment.this.mIsLoadSuccess = true;
            }
        }
    }

    /* access modifiers changed from: private */
    public void AutoTrimAction(final View view) {
        if (!this.mIsLoadSuccess) {
            Log.e("VideoEditorFragment", "the video has not load success.");
            return;
        }
        this.mVideoEditor.saveEditState();
        this.mVideoEditor.resetProject(new OnCompletedListener() {
            public void onCompleted() {
                VideoEditorFragment.this.mDisplayWrapperView.setAutoTrimEnable(false);
                VideoEditorFragment.this.mVideoEditorHelper.setVideoSaving(true);
                VideoEditorFragment.this.mIsLoadSuccess = false;
                AutoTrimProgressDialog.startAutoTrim(VideoEditorFragment.this.mVideoEditor, new AutoTrimProgressDialog.OnCompletedListener() {
                    public void onCompleted(boolean z, String str, int i, String str2) {
                        if (VideoEditorFragment.this.mVideoEditor == null) {
                            Log.d("VideoEditorFragment", "the video editor is null with auto trim. ");
                            return;
                        }
                        VideoEditorFragment.this.mDisplayWrapperView.setAutoTrimEnable(true);
                        VideoEditorFragment.this.mVideoEditorHelper.setVideoSaving(false);
                        if (z) {
                            Log.d("VideoEditorFragment", "AutoTrimAction is success.");
                            GallerySamplingStatHelper.recordCountEvent("video_editor", "video_editor_autotrim_success");
                            TempFileCollector.add(str);
                            VideoEditorFragment.this.mVideoEditor.load(str, new MyVideoLoadCompletedListener());
                        } else {
                            HashMap hashMap = new HashMap();
                            hashMap.put("errormsg", String.valueOf(str2));
                            GallerySamplingStatHelper.recordCountEvent("video_editor", "video_editor_autotrim_failed", hashMap);
                            ToastUtils.makeText(view.getContext(), (CharSequence) view.getResources().getString(R.string.video_editor_encode_video_error));
                            StringBuilder sb = new StringBuilder();
                            sb.append("AutoTrimAction is fail, and video encode error  msg :");
                            sb.append(str2);
                            Log.e("VideoEditorFragment", sb.toString());
                            VideoEditorFragment.this.mVideoEditor.load(VideoEditorFragment.this.mData.getPath(), new MyVideoLoadCompletedListener());
                        }
                    }
                }, VideoEditorFragment.this.getFragmentManager());
            }
        });
    }

    /* access modifiers changed from: private */
    public void handleNotSupportVideoFile() {
        ToastUtils.makeText((Context) this.mActivity, (int) R.string.video_editor_not_support_tips);
        if (this.mData != null) {
            HashMap hashMap = new HashMap();
            hashMap.put("file", this.mData.toString());
            GallerySamplingStatHelper.recordCountEvent("video_editor", "video_editor_not_support", hashMap);
        }
        exit();
    }

    private void initListener() {
        this.mVideoEditor.addStateChangeListener(this.mMyStateChangeListener);
        this.mDisplayWrapperView.setIvPlayListener(new OnClickListener() {
            public final void onClick(View view) {
                VideoEditorFragment.this.playVideoAction();
            }
        });
        this.mDisplayWrapperView.setAutoTrimListener(new OnClickListener() {
            public final void onClick(View view) {
                VideoEditorFragment.this.AutoTrimAction(view);
            }
        });
        this.mVideoEditor.addStateChangeListener(new StateChangeListener() {
            public void onStateChanged(int i) {
            }

            public void onTimeChanged(int i) {
                VideoEditorFragment.this.mCurrentTime = i;
                if (VideoEditorFragment.this.mVideoEditor != null) {
                    VideoEditorFragment.this.mPlayProgress = (int) ((((float) i) / ((float) VideoEditorFragment.this.mVideoEditor.getProjectTotalTime())) * VideoEditorFragment.this.mDisplayWrapperView.getViewWidth());
                    VideoEditorFragment.this.mDisplayWrapperView.updatePlayProgress(0, 0, VideoEditorFragment.this.mPlayProgress, 0);
                }
            }
        });
        this.mDisplayWrapperView.setClickListener(new OnClickListener() {
            public final void onClick(View view) {
                VideoEditorFragment.lambda$initListener$103(VideoEditorFragment.this, view);
            }
        });
        this.mDisplayWrapperView.setIProgress(new IProgress() {
            int tempCurrentTime;

            public void onVideoProgressChanged() {
                VideoEditorFragment.this.mCurrentTime = this.tempCurrentTime;
            }

            public void onVideoProgressChanging(int i, float f) {
                this.tempCurrentTime = VideoEditorFragment.this.mCurrentTime;
                if (VideoEditorFragment.this.mVideoEditor != null && f > 0.0f) {
                    int projectTotalTime = (int) (((float) VideoEditorFragment.this.mVideoEditor.getProjectTotalTime()) * f);
                    boolean z = false;
                    if (i == DisplayWrapper.LEFT) {
                        if (VideoEditorFragment.this.mCurrentTime > 0) {
                            this.tempCurrentTime = this.tempCurrentTime > projectTotalTime ? this.tempCurrentTime - projectTotalTime : 0;
                        } else {
                            return;
                        }
                    } else if (VideoEditorFragment.this.mCurrentTime < VideoEditorFragment.this.mVideoEditor.getProjectTotalTime()) {
                        this.tempCurrentTime += projectTotalTime;
                        if (this.tempCurrentTime > VideoEditorFragment.this.mVideoEditor.getProjectTotalTime()) {
                            this.tempCurrentTime = VideoEditorFragment.this.mVideoEditor.getProjectTotalTime();
                        }
                    } else {
                        return;
                    }
                    VideoEditorFragment.this.mVideoEditor.seek(this.tempCurrentTime, null);
                    VideoEditorFragment.this.mPlayProgress = (int) ((((float) this.tempCurrentTime) / ((float) VideoEditorFragment.this.mVideoEditor.getProjectTotalTime())) * VideoEditorFragment.this.mDisplayWrapperView.getViewWidth());
                    VideoEditorFragment.this.mDisplayWrapperView.updatePlayProgress(0, 0, VideoEditorFragment.this.mPlayProgress, 0);
                    DisplayWrapper access$600 = VideoEditorFragment.this.mDisplayWrapperView;
                    if (this.tempCurrentTime > 0) {
                        z = true;
                    }
                    access$600.showPlayProgress(z);
                }
            }
        });
    }

    public static /* synthetic */ void lambda$initListener$103(VideoEditorFragment videoEditorFragment, View view) {
        if (videoEditorFragment.mVideoEditorHelper.isWaterMarkEditMenu()) {
            if (videoEditorFragment.mVideoEditor.getState() == 1) {
                videoEditorFragment.mVideoEditor.pause();
            } else if (videoEditorFragment.mVideoEditor.getState() == 2 || videoEditorFragment.mVideoEditor.getState() == 0) {
                videoEditorFragment.mVideoEditor.resume();
            }
        } else if (videoEditorFragment.mVideoEditor.getState() == 1) {
            videoEditorFragment.mVideoEditor.pause();
        }
    }

    private void loadData() {
        this.mData = this.mActivity.getIntent().getData();
        if (this.mData == null || this.mData.getPath() == null) {
            handleNotSupportVideoFile();
        } else {
            this.mVideoEditor.load(this.mData.getPath(), new InitializeListener());
        }
    }

    /* access modifiers changed from: private */
    public void playVideoAction() {
        if (!this.mIsLoadSuccess) {
            Log.e("VideoEditorFragment", "the video has not loaded success.");
            return;
        }
        this.mVideoEditorHelper.onPlayButtonClicked();
        int state = this.mVideoEditor.getState();
        if (state == 0) {
            this.mVideoEditor.play();
        } else if (state == 2) {
            this.mVideoEditor.resume();
        }
    }

    public void exit() {
        if (this.mVideoEditor != null && this.mVideoEditor.isInit()) {
            this.mVideoEditor.release();
        }
        TempFileCollector.deleteAllTempFile(GalleryApp.sGetAndroidContext());
        this.mActivity.finish();
    }

    public Uri getData() {
        return this.mData;
    }

    public int getEffectMenuContainerId() {
        if (this.mMenuView != null) {
            return this.mMenuView.getId();
        }
        return 0;
    }

    public VideoEditor getVideoEditor() {
        return this.mVideoEditor;
    }

    public void onAttach(Activity activity) {
        super.onAttach(activity);
        this.mActivity = activity;
        if (this.mActivity instanceof VideoEditorActivity) {
            ((VideoEditorActivity) this.mActivity).setOnBackPressedListener(this);
        }
    }

    public void onAttachMenuFragment(Fragment fragment) {
        if (fragment instanceof MenuFragment) {
            ((MenuFragment) fragment).setCallBack(this.mMenuFragmentCallBack);
        }
    }

    public boolean onBackPressed() {
        return this.mVideoEditorHelper.onBackPressed();
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mVideoEditor = VideoEditor.create(getActivity().getApplicationContext(), "nex");
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.fragment_video_editor, null);
        this.mDisplayWrapperView = (DisplayWrapper) inflate.findViewById(R.id.display_wrapper);
        this.mMenuView = inflate.findViewById(R.id.menu_panel);
        this.mTopLine = (Guideline) inflate.findViewById(R.id.display_top_line);
        this.mProgressingView = (ProgressBar) inflate.findViewById(R.id.progressing);
        this.mMyStateChangeListener = new MyStateChangeListener();
        this.mVideoEditor.setDisplayWrapper(this.mDisplayWrapperView);
        loadData();
        this.mVideoEditorHelper = new VideoEditorHelper(viewGroup.getContext(), this);
        this.mVideoEditorHelper.showNavEditMenu();
        this.mMenuView.getViewTreeObserver().addOnGlobalFocusChangeListener(this.mOnGlobalFocusChangeListener);
        initListener();
        return inflate;
    }

    public void onDestroy() {
        super.onDestroy();
        if (this.mVideoEditor != null) {
            this.mVideoEditor.removeStateChangeListener(this.mMyStateChangeListener);
            this.mVideoEditor = null;
        }
        if (this.mVideoEditorHelper != null) {
            this.mVideoEditorHelper.onDestroy();
        }
        TempFileCollector.deleteAllTempFile(GalleryApp.sGetAndroidContext());
    }

    public void onDetach() {
        super.onDetach();
        if (this.mActivity instanceof VideoEditorActivity) {
            ((VideoEditorActivity) this.mActivity).setOnBackPressedListener(null);
        }
        this.mActivity = null;
    }

    public void onPause() {
        super.onPause();
        if (this.mVideoEditor != null) {
            this.mVideoEditor.pause();
        }
        ImageLoader.getInstance().pause();
        GallerySamplingStatHelper.recordPageEnd(getActivity(), "video_editor");
    }

    public void onResume() {
        super.onResume();
        if (this.mVideoEditor != null) {
            this.mVideoEditor.startPreview();
        }
        ImageLoader.getInstance().resume();
        this.mVideoEditorHelper.updatePlayView();
        GallerySamplingStatHelper.recordPageStart(this.mActivity, "video_editor");
    }
}
