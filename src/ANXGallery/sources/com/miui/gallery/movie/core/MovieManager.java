package com.miui.gallery.movie.core;

import android.view.View;

public abstract class MovieManager implements IMovieController, IMovieManager {
    protected View mDisplayView;
    protected int mState;

    public interface EncodeStateInterface {
        void onEncodeEnd(boolean z, boolean z2, int i);

        void onEncodeProgress(int i);

        void onEncodeStart();
    }

    public interface StateChangeListener {
        void onPlaybackEOF();

        void onPlaybackPreloadingCompletion();

        void onPlaybackTimeChanged(int i);

        void onStateChanged(int i);
    }

    public abstract void addStateChangeListener(StateChangeListener stateChangeListener);

    public void destroy() {
        this.mDisplayView = null;
    }

    public View getDisplayView() {
        return this.mDisplayView;
    }

    public int getState() {
        return this.mState;
    }

    public void keepScreenOn(boolean z) {
        if (this.mDisplayView != null) {
            this.mDisplayView.setKeepScreenOn(z);
        }
    }

    public void onPause() {
        keepScreenOn(false);
    }

    public void onResume() {
        keepScreenOn(true);
    }

    public abstract void removeStateChangeListener(StateChangeListener stateChangeListener);

    public void setState(int i) {
        this.mState = i;
    }
}
