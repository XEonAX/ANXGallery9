package com.miui.gallery.video.editor.activity;

import android.app.Fragment;
import android.content.Intent;
import android.os.Bundle;
import com.android.internal.WindowCompat;
import com.miui.gallery.R;
import com.miui.gallery.activity.BaseActivity;
import com.miui.gallery.util.SystemUiUtil;
import com.miui.gallery.video.editor.config.VideoEditorConfig;
import com.miui.gallery.video.editor.ui.MenuFragment;
import com.miui.gallery.video.editor.ui.VideoEditorFragment;
import com.miui.gallery.view.BrightnessManager;

public class VideoEditorActivity extends BaseActivity {
    private BrightnessManager mBrightnessManager;
    private OnBackPressedListener mOnBackPressedListener;
    private VideoEditorFragment mVideoEditorFragment;

    public interface OnBackPressedListener {
        boolean onBackPressed();
    }

    /* JADX WARNING: type inference failed for: r4v0, types: [android.app.Activity, com.miui.gallery.video.editor.activity.VideoEditorActivity] */
    private void initScreenBrightness() {
        Intent intent = getIntent();
        if (intent != null) {
            float floatExtra = intent.getFloatExtra("photo-brightness-manual", -1.0f);
            float floatExtra2 = intent.getFloatExtra("photo-brightness-auto", -1.0f);
            if (floatExtra >= 0.0f || floatExtra2 >= 0.0f) {
                this.mBrightnessManager = new BrightnessManager(this, floatExtra, floatExtra2);
            }
        }
    }

    private void initView() {
        getWindow().setFlags(1024, 1024);
        setContentView(R.layout.activity_video_editor);
        loadVideoEditorFragment();
    }

    /* access modifiers changed from: protected */
    public boolean hasCustomContentView() {
        return true;
    }

    public void loadVideoEditorFragment() {
        if (!isFinishing()) {
            this.mVideoEditorFragment = new VideoEditorFragment();
            getFragmentManager().beginTransaction().replace(R.id.video_editor_activity_root, this.mVideoEditorFragment).commitAllowingStateLoss();
        }
    }

    public void onAttachFragment(Fragment fragment) {
        super.onAttachFragment(fragment);
        if (fragment instanceof MenuFragment) {
            this.mVideoEditorFragment.onAttachMenuFragment(fragment);
        }
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [android.app.Activity, com.miui.gallery.video.editor.activity.VideoEditorActivity] */
    public void onAttachedToWindow() {
        if (WindowCompat.isNotch(this)) {
            SystemUiUtil.extendToStatusBar(getWindow().getDecorView());
        }
    }

    public void onBackPressed() {
        if (this.mOnBackPressedListener == null || !this.mOnBackPressedListener.onBackPressed()) {
            super.onBackPressed();
        }
    }

    /* JADX WARNING: type inference failed for: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context, com.miui.gallery.video.editor.activity.VideoEditorActivity] */
    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        super.onCreate(null);
        WindowCompat.setCutoutModeShortEdges(getWindow());
        SystemUiUtil.setDrawSystemBarBackground(getWindow());
        VideoEditorConfig.init(this);
        initView();
        initScreenBrightness();
    }

    /* access modifiers changed from: protected */
    public void onPause() {
        super.onPause();
        if (this.mBrightnessManager != null) {
            this.mBrightnessManager.onPause();
        }
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        super.onResume();
        if (this.mBrightnessManager != null) {
            this.mBrightnessManager.onResume();
        }
    }

    public void onWindowFocusChanged(boolean z) {
        super.onWindowFocusChanged(z);
        if (this.mBrightnessManager != null) {
            this.mBrightnessManager.onWindowFocusChanged(z);
        }
    }

    public void setOnBackPressedListener(OnBackPressedListener onBackPressedListener) {
        this.mOnBackPressedListener = onBackPressedListener;
    }
}
