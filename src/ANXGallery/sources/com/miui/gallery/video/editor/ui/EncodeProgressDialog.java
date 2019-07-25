package com.miui.gallery.video.editor.ui;

import android.app.FragmentManager;
import android.os.Bundle;
import com.miui.gallery.R;
import com.miui.gallery.video.editor.VideoEditor;
import com.miui.gallery.video.editor.VideoEditor.EnocdeStateInterface;
import com.miui.gallery.video.editor.ui.ProgressDialog.ProgressDialogInterface;
import com.nexstreaming.nexeditorsdk.nexExportFormat;

public class EncodeProgressDialog extends ProgressDialog implements EnocdeStateInterface, ProgressDialogInterface {
    private FragmentManager mFragmentManager;
    private OnCompletedListener mOnCompletedListener;
    private String mOutPutPath;
    private VideoEditor mVideoEditor;

    public interface OnCompletedListener {
        void onCompleted(String str, boolean z, int i, int i2);
    }

    public static void startEncode(VideoEditor videoEditor, String str, OnCompletedListener onCompletedListener, FragmentManager fragmentManager) {
        EncodeProgressDialog encodeProgressDialog = new EncodeProgressDialog();
        Bundle bundle = new Bundle();
        bundle.putString(nexExportFormat.TAG_FORMAT_PATH, str);
        encodeProgressDialog.setArguments(bundle);
        encodeProgressDialog.setVideoEditor(videoEditor);
        encodeProgressDialog.setOnCompletedListener(onCompletedListener);
        encodeProgressDialog.setFragmentManager(fragmentManager);
        videoEditor.export(str, encodeProgressDialog);
    }

    public boolean onCancelClicked() {
        if (this.mVideoEditor != null) {
            this.mVideoEditor.cancelExport(null);
        }
        return false;
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setProgressDialogInterface(this);
        setMax(100);
        this.mOutPutPath = getArguments().getString(nexExportFormat.TAG_FORMAT_PATH);
    }

    public void onEncodeEnd(boolean z, int i, int i2) {
        setProgress(100);
        if (this.mOnCompletedListener != null) {
            this.mOnCompletedListener.onCompleted(this.mOutPutPath, z, i, i2);
        }
        dismissSafely();
    }

    public void onEncodeProgress(int i) {
        setProgress(i);
    }

    public void onEncodeStart() {
        showAllowingStateLoss(this.mFragmentManager, "EncodeProgressDialog");
        setMsg(R.string.video_editor_encode_video);
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
