package com.miui.gallery.video.editor.ui;

import android.app.FragmentManager;
import android.os.Bundle;
import com.miui.gallery.R;
import com.miui.gallery.video.editor.VideoEditor;
import com.miui.gallery.video.editor.VideoEditor.TrimStateInterface;
import com.miui.gallery.video.editor.ui.ProgressDialog.ProgressDialogInterface;

public class AutoTrimProgressDialog extends ProgressDialog implements TrimStateInterface, ProgressDialogInterface {
    private int mCurrentWorkState = -1;
    private FragmentManager mFragmentManager;
    private OnCompletedListener mOnCompletedListener;
    private String mOutPutFilePath;
    private VideoEditor mVideoEditor;

    public interface OnCompletedListener {
        void onCompleted(boolean z, String str, int i, String str2);
    }

    public static void startAutoTrim(VideoEditor videoEditor, OnCompletedListener onCompletedListener, FragmentManager fragmentManager) {
        AutoTrimProgressDialog autoTrimProgressDialog = new AutoTrimProgressDialog();
        autoTrimProgressDialog.setVideoEditor(videoEditor);
        autoTrimProgressDialog.setOnCompletedListener(onCompletedListener);
        autoTrimProgressDialog.setFragmentManager(fragmentManager);
        videoEditor.autoTrim(autoTrimProgressDialog);
    }

    public boolean onCancelClicked() {
        if (this.mCurrentWorkState == 2) {
            this.mVideoEditor.cancelExport(null);
        }
        return false;
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setCancleButtonEnable(false);
        setProgressDialogInterface(this);
    }

    public void onEncodeEnd(boolean z, int i, int i2) {
        if (this.mOnCompletedListener != null) {
            this.mOnCompletedListener.onCompleted(z, this.mOutPutFilePath, i, "");
        }
        dismissSafely();
    }

    public void onEncodeProgress(int i) {
        setProgress(((int) ((((float) i) / 100.0f) * 95.0f)) + 5);
    }

    public void onEncodeStart() {
        this.mCurrentWorkState = 2;
        setProgress(5);
        setCancleButtonEnable(true);
    }

    public void onTrimEnd(String str) {
        this.mOutPutFilePath = str;
    }

    public void onTrimProgress(int i) {
        setProgress((int) ((((float) i) / 100.0f) * 5.0f));
    }

    public void onTrimStart() {
        showAllowingStateLoss(this.mFragmentManager, "AutoTrimProgressDialog");
        this.mCurrentWorkState = 1;
        setMsg(R.string.video_editor_auto_trim_tip);
        setCancelable(false);
    }

    public void setFragmentManager(FragmentManager fragmentManager) {
        this.mFragmentManager = fragmentManager;
    }

    public void setOnCompletedListener(OnCompletedListener onCompletedListener) {
        this.mOnCompletedListener = onCompletedListener;
    }

    public void setVideoEditor(VideoEditor videoEditor) {
        this.mVideoEditor = videoEditor;
    }
}
