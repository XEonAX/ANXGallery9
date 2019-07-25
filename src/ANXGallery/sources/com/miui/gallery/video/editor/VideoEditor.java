package com.miui.gallery.video.editor;

import android.content.Context;
import android.graphics.Bitmap;
import android.view.View;
import com.miui.gallery.video.editor.widget.DisplayWrapper;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public abstract class VideoEditor {
    protected DisplayWrapper mDisplayWrapper;
    protected boolean mIsInit = false;
    private OnVideoThumbnailChangedListener mOnVideoThumbnailChangedListener;
    private int mState = -1;
    private LinkedList<StateChangeListener> mStateChangeListeners = new LinkedList<>();

    public interface EnocdeStateInterface {
        void onEncodeEnd(boolean z, int i, int i2);

        void onEncodeProgress(int i);

        void onEncodeStart();
    }

    public class NotSupportVideoException extends Exception {
        public NotSupportVideoException() {
        }
    }

    public interface OnCompletedListener {
        void onCompleted();
    }

    public interface OnGetVideoThumbnailListener {
        void onGetVideoThumbnailCompleted(List<VideoThumbnail> list);
    }

    public interface OnVideoThumbnailChangedListener {
        void onVideoThumbnailChanged();
    }

    public interface StateChangeListener {
        void onStateChanged(int i);

        void onTimeChanged(int i);
    }

    public interface TrimStateInterface extends EnocdeStateInterface {
        void onTrimEnd(String str);

        void onTrimProgress(int i);

        void onTrimStart();
    }

    public static VideoEditor create(Context context, String str) {
        if ("nex".equals(str)) {
            return new NexVideoEditor(context);
        }
        return null;
    }

    public void addStateChangeListener(StateChangeListener stateChangeListener) {
        if (!this.mStateChangeListeners.contains(stateChangeListener)) {
            this.mStateChangeListeners.add(stateChangeListener);
        }
    }

    public abstract void adjustBrightness(int i);

    public abstract void adjustContrast(int i);

    public abstract void adjustSaturation(int i);

    public abstract void adjustSharpness(int i);

    public abstract void adjustVignetteRange(int i);

    public abstract boolean apply(OnCompletedListener onCompletedListener);

    public abstract void autoTrim(int i, TrimStateInterface trimStateInterface);

    public void autoTrim(TrimStateInterface trimStateInterface) {
        autoTrim(25000, trimStateInterface);
    }

    public abstract void cancelExport(OnCompletedListener onCompletedListener);

    public abstract void export(String str, EnocdeStateInterface enocdeStateInterface);

    public abstract float getCurrentDisplayRatio();

    public DisplayWrapper getDisplayWrapper() {
        return this.mDisplayWrapper;
    }

    public abstract int getProjectTotalTime();

    public int getState() {
        return this.mState;
    }

    public abstract int getVideoFrames();

    public abstract String getVideoPath();

    public abstract int getVideoStartTime();

    public abstract int getVideoTotalTime();

    public abstract boolean hasEdit();

    public abstract boolean haveSavedEditState();

    public boolean isInit() {
        return this.mIsInit;
    }

    public abstract boolean isSourceAudioEnable();

    public abstract boolean isSupportAutoTrim();

    public abstract void load(String str, OnCompletedListener onCompletedListener);

    public void notifyThumbnailChanged() {
        if (this.mOnVideoThumbnailChangedListener != null) {
            this.mOnVideoThumbnailChangedListener.onVideoThumbnailChanged();
        }
    }

    /* access modifiers changed from: protected */
    public void onTimeChanged(int i) {
        Iterator it = this.mStateChangeListeners.iterator();
        while (it.hasNext()) {
            ((StateChangeListener) it.next()).onTimeChanged(i);
        }
    }

    public abstract void pause();

    public abstract Bitmap pickThumbnail(int i);

    public abstract void play();

    public abstract void release();

    public void removeStateChangeListener(StateChangeListener stateChangeListener) {
        if (this.mStateChangeListeners.contains(stateChangeListener)) {
            this.mStateChangeListeners.remove(stateChangeListener);
        }
    }

    public abstract boolean resetProject(OnCompletedListener onCompletedListener);

    public abstract void restoreEditState();

    public abstract void resume();

    public abstract void saveEditState();

    public abstract void seek(int i, OnCompletedListener onCompletedListener);

    public abstract boolean setAutoWaterMark(String str, int i);

    public abstract void setBackgroundMusic(String str);

    /* access modifiers changed from: protected */
    public abstract void setDisplayView(View view);

    public void setDisplayWrapper(DisplayWrapper displayWrapper) {
        this.mDisplayWrapper = displayWrapper;
    }

    public abstract void setFilter(Filter filter);

    public void setOnVideoThumbnailChangedListener(OnVideoThumbnailChangedListener onVideoThumbnailChangedListener) {
        this.mOnVideoThumbnailChangedListener = onVideoThumbnailChangedListener;
    }

    public abstract boolean setSmartEffectTemplate(SmartEffect smartEffect);

    public abstract void setSourceAudioEnable(Boolean bool);

    /* access modifiers changed from: protected */
    public void setState(int i) {
        if (this.mState != i) {
            this.mState = i;
            Iterator it = this.mStateChangeListeners.iterator();
            while (it.hasNext()) {
                ((StateChangeListener) it.next()).onStateChanged(this.mState);
            }
        }
    }

    public abstract void setTrimInfo(int i, int i2);

    public abstract void setVideoEditorAdjust(boolean z);

    public abstract boolean setWarterMark(int i, String str);

    public abstract void startPreview();

    public abstract void toThirdEditor(Context context);
}
