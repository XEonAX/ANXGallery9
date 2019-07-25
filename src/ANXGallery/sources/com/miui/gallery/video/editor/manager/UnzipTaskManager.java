package com.miui.gallery.video.editor.manager;

import android.content.Context;
import android.os.AsyncTask;
import android.text.TextUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.video.editor.interfaces.IVideoEditorListener.IUnzipFileListener;
import com.miui.gallery.video.editor.model.VideoEditorBaseModel;
import com.miui.gallery.video.editor.util.FileHelper;

public class UnzipTaskManager extends AsyncTask<Void, Void, Boolean> {
    private String TAG = "UnzipTaskManager";
    private Context mContext;
    private VideoEditorBaseModel mData;
    private boolean mIsTemplate;
    private String mUnZipPath;
    private IUnzipFileListener mUnzipFileListener;
    private String mZipPath;

    public UnzipTaskManager(Context context, boolean z, VideoEditorBaseModel videoEditorBaseModel, String str, String str2, IUnzipFileListener iUnzipFileListener) {
        this.mContext = context;
        this.mIsTemplate = z;
        this.mData = videoEditorBaseModel;
        this.mZipPath = str;
        this.mUnzipFileListener = iUnzipFileListener;
        if (TextUtils.isEmpty(str2)) {
            this.mUnZipPath = this.mZipPath;
        } else {
            this.mUnZipPath = str2;
        }
    }

    /* access modifiers changed from: protected */
    public Boolean doInBackground(Void... voidArr) {
        boolean z;
        if (this.mContext != null) {
            if (this.mIsTemplate) {
                FileHelper.unZipTemplateFile(this.mZipPath, this.mUnZipPath);
            } else {
                this.mUnZipPath = FileHelper.unZipFile(this.mUnZipPath, this.mData.getFileName());
            }
            if (!TextUtils.isEmpty(this.mUnZipPath)) {
                this.mData.setUnZipPath(this.mUnZipPath);
                z = true;
                return Boolean.valueOf(z);
            }
        }
        z = false;
        return Boolean.valueOf(z);
    }

    /* access modifiers changed from: protected */
    public void onPostExecute(Boolean bool) {
        super.onPostExecute(bool);
        if (!bool.booleanValue() || this.mData == null) {
            Log.d(this.TAG, "file unzip fail");
            if (this.mUnzipFileListener != null) {
                this.mUnzipFileListener.onUnzipFileFailed();
                return;
            }
            return;
        }
        Log.d(this.TAG, "file unzip success");
        if (this.mUnzipFileListener != null) {
            this.mUnzipFileListener.onUzipFileSuccess();
        }
    }

    public void setListener(IUnzipFileListener iUnzipFileListener) {
        this.mUnzipFileListener = iUnzipFileListener;
    }
}
