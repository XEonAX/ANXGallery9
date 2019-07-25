package com.miui.gallery.movie.ui.view;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import com.miui.gallery.movie.core.MovieManager;
import com.miui.gallery.movie.core.MovieManager.StateChangeListener;
import com.miui.gallery.movie.entity.MovieInfo;
import com.miui.gallery.movie.ui.factory.MovieFactory;
import com.miui.gallery.movie.ui.view.BaseMovieView.IProgressChangeListener;

public class MovieControllerView extends BaseMovieView {
    /* access modifiers changed from: private */
    public boolean isLoopPlay;
    /* access modifiers changed from: private */
    public int mCurrentTime;
    private boolean mDeleteVisible;
    private DeleteIconVisibleListener mDeleteVisibleListener;
    /* access modifiers changed from: private */
    public boolean mIgnoreProgressHide;
    /* access modifiers changed from: private */
    public boolean mIsSeekDisable;
    /* access modifiers changed from: private */
    public MovieManager mMovieManager;
    private boolean mPlayProgressVisible;
    /* access modifiers changed from: private */
    public ProgressChangeListener mProgressChangeListener;
    private boolean mShowDeleteMode;
    private boolean mShowPlayBtnMode;
    private StateChangeListener mStateChangeListener = new StateChangeListener() {
        public void onPlaybackEOF() {
            onPlaybackTimeChanged(0);
            if (MovieControllerView.this.isLoopPlay) {
                MovieControllerView.this.mMovieManager.replay();
            } else {
                MovieControllerView.this.mIgnoreProgressHide = true;
                MovieControllerView.this.mMovieManager.seek(0);
                MovieControllerView.this.mMovieManager.pause();
            }
            if (MovieControllerView.this.mProgressChangeListener != null) {
                MovieControllerView.this.mProgressChangeListener.onPlaybackEOF();
            }
        }

        public void onPlaybackPreloadingCompletion() {
            MovieControllerView.this.showLoadingView(false);
        }

        public void onPlaybackTimeChanged(int i) {
            float totalTime = ((float) i) / ((float) MovieControllerView.this.mMovieManager.getTotalTime());
            MovieControllerView.this.setCurrentPlayTime(i, totalTime);
            if (MovieControllerView.this.mProgressChangeListener != null) {
                MovieControllerView.this.mProgressChangeListener.onChanged(totalTime, i);
            }
        }

        public void onStateChanged(int i) {
            MovieControllerView.this.mMovieManager.setState(i);
            if (MovieControllerView.this.mIgnoreProgressHide) {
                MovieControllerView.this.mIgnoreProgressHide = false;
            } else if (i == 2) {
                MovieControllerView.this.showPlayBtn(true);
            } else {
                MovieControllerView.this.showPlayBtn(false);
            }
            if (i != 3) {
                MovieControllerView.this.setDeleteVisible(false);
            }
            if (MovieControllerView.this.mProgressChangeListener != null) {
                MovieControllerView.this.mProgressChangeListener.onStateChanged(i);
            }
        }
    };

    public interface DeleteIconVisibleListener {
        void onChanged(boolean z);
    }

    public interface ProgressChangeListener {
        void onChanged(float f, int i);

        void onPlaybackEOF();

        void onStateChanged(int i);
    }

    public MovieControllerView(Context context) {
        super(context);
    }

    public MovieControllerView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public MovieControllerView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    /* access modifiers changed from: protected */
    public View createDisplayView() {
        return this.mMovieManager.getDisplayView();
    }

    public MovieManager getMovieManager() {
        return this.mMovieManager;
    }

    public void init() {
        if (this.mMovieManager == null) {
            this.mMovieManager = MovieFactory.createMovieManager(getContext());
        }
        super.init();
        setProgressChangeListener(new IProgressChangeListener() {
            int tempCurrentTime;

            public void onVideoProgressChanged() {
                MovieControllerView.this.mCurrentTime = this.tempCurrentTime;
                MovieControllerView.this.mMovieManager.pause();
            }

            public void onVideoProgressChanging(int i, float f) {
                if (!MovieControllerView.this.mIsSeekDisable) {
                    this.tempCurrentTime = MovieControllerView.this.mCurrentTime;
                    if (f > 0.0f) {
                        int totalTime = (int) (((float) MovieControllerView.this.mMovieManager.getTotalTime()) * f);
                        if (i == 0) {
                            if (MovieControllerView.this.mCurrentTime > 0) {
                                this.tempCurrentTime = this.tempCurrentTime > totalTime ? this.tempCurrentTime - totalTime : 0;
                            } else {
                                return;
                            }
                        } else if (MovieControllerView.this.mCurrentTime < MovieControllerView.this.mMovieManager.getTotalTime()) {
                            this.tempCurrentTime += totalTime;
                            if (this.tempCurrentTime > MovieControllerView.this.mMovieManager.getTotalTime()) {
                                this.tempCurrentTime = MovieControllerView.this.mMovieManager.getTotalTime();
                            }
                        } else {
                            return;
                        }
                        MovieControllerView.this.mMovieManager.seek(this.tempCurrentTime);
                        float totalTime2 = ((float) this.tempCurrentTime) / ((float) MovieControllerView.this.mMovieManager.getTotalTime());
                        MovieControllerView.this.updatePlayProgress(totalTime2);
                        MovieControllerView.this.setDuration(this.tempCurrentTime / 1000);
                        MovieControllerView.this.setDeleteVisible(false);
                        if (MovieControllerView.this.mProgressChangeListener != null) {
                            MovieControllerView.this.mProgressChangeListener.onChanged(totalTime2, this.tempCurrentTime);
                        }
                    }
                }
            }
        });
        this.mMovieManager.addStateChangeListener(this.mStateChangeListener);
    }

    public void init(MovieManager movieManager) {
        this.mMovieManager = movieManager;
        init();
    }

    /* access modifiers changed from: protected */
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.mMovieManager.removeStateChangeListener(this.mStateChangeListener);
        this.mMovieManager = null;
    }

    public void onPause() {
        this.mMovieManager.onPause();
    }

    public void onResume() {
        this.mMovieManager.onResume();
    }

    public void setCurrentPlayTime(int i, float f) {
        this.mCurrentTime = i;
        updatePlayProgress(f);
        setDuration(i / 1000);
    }

    public void setDeleteVisible(boolean z) {
        if (this.mDeleteVisible != z) {
            if (this.mDeleteVisibleListener != null) {
                this.mDeleteVisibleListener.onChanged(z);
            }
            this.mDeleteVisible = z;
            if (!z || !this.mShowDeleteMode) {
                showDeleteIcon(false);
                showDuration(true);
            } else {
                showDeleteIcon(true);
                showDuration(false);
            }
        }
    }

    public void setDeleteVisibleListener(DeleteIconVisibleListener deleteIconVisibleListener) {
        this.mDeleteVisibleListener = deleteIconVisibleListener;
    }

    public void setLoopPlay(boolean z) {
        this.isLoopPlay = z;
    }

    public void setMovieInfo(MovieInfo movieInfo) {
        this.mMovieManager.setInfo(movieInfo);
    }

    public void setPlayProgressVisible(boolean z) {
        if (this.mPlayProgressVisible != z) {
            this.mPlayProgressVisible = z;
            showPlayProgress(this.mPlayProgressVisible);
        }
    }

    public void setProgressChangeListener(ProgressChangeListener progressChangeListener) {
        this.mProgressChangeListener = progressChangeListener;
    }

    public void setSeekDisable(boolean z) {
        this.mIsSeekDisable = z;
    }

    public void setShowDeleteMode(boolean z) {
        if (this.mShowDeleteMode != z) {
            this.mShowDeleteMode = z;
            if (!z) {
                showDeleteIcon(false);
                showDuration(true);
            } else if (this.mDeleteVisible) {
                showDeleteIcon(true);
                showDuration(false);
            }
        }
    }

    public void setShowPlayBtnMode(boolean z) {
        if (this.mShowPlayBtnMode != z) {
            this.mShowPlayBtnMode = z;
            if (!z) {
                showPlayBtn(false);
            } else {
                int state = this.mMovieManager.getState();
                if (state == 2 || state == 3) {
                    showPlayBtn(true);
                }
            }
        }
    }

    public void showPlayBtn(boolean z) {
        if (this.mShowPlayBtnMode) {
            super.showPlayBtn(z);
        } else {
            super.showPlayBtn(false);
        }
    }
}
