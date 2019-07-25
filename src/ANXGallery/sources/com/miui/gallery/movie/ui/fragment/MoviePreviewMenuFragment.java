package com.miui.gallery.movie.ui.fragment;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.app.Fragment;
import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import com.meicam.sdk.NvsMultiThumbnailSequenceView;
import com.meicam.sdk.NvsMultiThumbnailSequenceView.OnScrollChangeListener;
import com.meicam.sdk.NvsMultiThumbnailSequenceView.ThumbnailSequenceDesc;
import com.miui.gallery.R;
import com.miui.gallery.movie.core.MovieManager;
import com.miui.gallery.movie.entity.MovieInfo;
import com.miui.gallery.movie.ui.listener.MenuFragmentListener;
import com.miui.gallery.movie.ui.view.MoviePreviewMenuBottomView;
import com.miui.gallery.movie.ui.view.MoviePreviewMenuBottomView.IMenuBottomViewClickListener;
import com.miui.gallery.movie.ui.view.MoviePreviewMenuTitle;
import com.miui.gallery.movie.ui.view.MoviePreviewMenuTitle.IMenuTitleClickListener;
import com.miui.gallery.movie.ui.view.MultiThumbnailSequenceView;
import com.miui.gallery.movie.ui.view.StrokeTextView;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.miui.gallery.util.Log;
import java.util.ArrayList;
import java.util.Locale;
import miui.view.animation.CubicEaseOutInterpolator;
import miui.view.animation.QuarticEaseOutInterpolator;

public class MoviePreviewMenuFragment extends Fragment {
    private StrokeTextView mCurrentTimeView;
    /* access modifiers changed from: private */
    public int mEndPadding;
    private boolean mIsSeekTimeline = true;
    private MoviePreviewMenuBottomView mMenuBottomView;
    private IMenuBottomViewClickListener mMenuBottomViewClickListener = new IMenuBottomViewClickListener() {
        public void onEditBtnClick() {
            if (MoviePreviewMenuFragment.this.mMenuFragmentListener != null) {
                MoviePreviewMenuFragment.this.mMenuFragmentListener.changeEditor();
                MovieStatUtils.statPreviewEnterEditPage(MoviePreviewMenuFragment.this.mMovieInfo.isShortVideo);
            }
        }

        public void onPlayAreaClick() {
            if (MoviePreviewMenuFragment.this.mMovieManager.getState() == 1) {
                MoviePreviewMenuFragment.this.mMovieManager.pause();
            } else {
                MoviePreviewMenuFragment.this.mMovieManager.resume();
            }
            MoviePreviewMenuFragment.this.updateMenuBottomView();
            MovieStatUtils.statPreviewPlayBtn(MoviePreviewMenuFragment.this.mMovieInfo.isShortVideo);
        }

        public void onSaveBtnClick() {
            if (MoviePreviewMenuFragment.this.mMenuFragmentListener != null) {
                MoviePreviewMenuFragment.this.mMenuFragmentListener.export(true);
            }
        }
    };
    /* access modifiers changed from: private */
    public MenuFragmentListener mMenuFragmentListener;
    private IMenuTitleClickListener mMenuTitleClickListener = new IMenuTitleClickListener() {
        public void onLongVideoTitleViewClick() {
            if (MoviePreviewMenuFragment.this.mMovieInfo.backToLongVideo()) {
                MoviePreviewMenuFragment.this.mMovieManager.resetImage(MoviePreviewMenuFragment.this.mMovieInfo.imageList, false);
                MoviePreviewMenuFragment.this.updateMultiThumbnailView();
            } else {
                MoviePreviewMenuFragment.this.mMovieManager.setIsShortVideo(false);
            }
            MoviePreviewMenuFragment.this.mMovieManager.replay();
            if (MoviePreviewMenuFragment.this.mMenuFragmentListener != null) {
                MoviePreviewMenuFragment.this.mMenuFragmentListener.updateShareData(false);
                MoviePreviewMenuFragment.this.mMenuFragmentListener.updateStorySha1Data();
            }
            MovieStatUtils.statDurationClick(MoviePreviewMenuFragment.this.mMovieInfo, true, false);
        }

        public void onShortVideoTitleViewClick() {
            if (MoviePreviewMenuFragment.this.mMovieInfo.changeToShortVideo()) {
                MoviePreviewMenuFragment.this.mMovieManager.resetImage(MoviePreviewMenuFragment.this.mMovieInfo.imageList, true);
                MoviePreviewMenuFragment.this.updateMultiThumbnailView();
            } else {
                MoviePreviewMenuFragment.this.mMovieManager.setIsShortVideo(true);
            }
            MoviePreviewMenuFragment.this.mMovieManager.replay();
            if (MoviePreviewMenuFragment.this.mMenuFragmentListener != null) {
                MoviePreviewMenuFragment.this.mMenuFragmentListener.updateShareData(true);
                MoviePreviewMenuFragment.this.mMenuFragmentListener.updateStorySha1Data();
            }
            MovieStatUtils.statDurationClick(MoviePreviewMenuFragment.this.mMovieInfo, true, true);
        }
    };
    private MoviePreviewMenuTitle mMenuTitleView;
    /* access modifiers changed from: private */
    public MovieInfo mMovieInfo;
    /* access modifiers changed from: private */
    public MovieManager mMovieManager;
    private OnGlobalLayoutListener mOnGlobalLayoutListener = new OnGlobalLayoutListener() {
        public void onGlobalLayout() {
            if (MoviePreviewMenuFragment.this.mMovieManager == null) {
                Log.e("MoviePreviewMenuFragment", "onGlobalLayout MovieManager is null");
                return;
            }
            MoviePreviewMenuFragment.this.mStartPadding = (MoviePreviewMenuFragment.this.mThumbnailSequenceView.getWidth() / 2) - (MoviePreviewMenuFragment.this.mWhiteView.getWidth() / 2);
            MoviePreviewMenuFragment.this.mEndPadding = (MoviePreviewMenuFragment.this.mThumbnailSequenceView.getWidth() / 2) - (MoviePreviewMenuFragment.this.mWhiteView.getWidth() / 2);
            MoviePreviewMenuFragment.this.updateMultiThumbnailView();
            MoviePreviewMenuFragment.this.updateMenuTitleView();
            MoviePreviewMenuFragment.this.updateMenuBottomView();
            MoviePreviewMenuFragment.this.initListener();
            MoviePreviewMenuFragment.this.removeOnGlobalLayoutListener();
        }
    };
    private double mPixelPerMicroSeconds;
    private int mSequenceWidth;
    /* access modifiers changed from: private */
    public int mStartPadding;
    private ArrayList<ThumbnailSequenceDesc> mThumbnailSequenceDescs;
    /* access modifiers changed from: private */
    public MultiThumbnailSequenceView mThumbnailSequenceView;
    /* access modifiers changed from: private */
    public View mWhiteView;

    /* access modifiers changed from: private */
    public void initListener() {
        this.mThumbnailSequenceView.setOnScrollChangeListenser(new OnScrollChangeListener() {
            public final void onScrollChanged(NvsMultiThumbnailSequenceView nvsMultiThumbnailSequenceView, int i, int i2) {
                MoviePreviewMenuFragment.lambda$initListener$132(MoviePreviewMenuFragment.this, nvsMultiThumbnailSequenceView, i, i2);
            }
        });
        this.mMenuBottomView.setIMenuBottomViewClickListener(this.mMenuBottomViewClickListener);
        this.mMenuTitleView.setListener(this.mMenuTitleClickListener);
    }

    private void initView(View view) {
        this.mMenuTitleView = (MoviePreviewMenuTitle) view.findViewById(R.id.preview_title_area);
        this.mMenuBottomView = (MoviePreviewMenuBottomView) view.findViewById(R.id.preivew_menu_bottom);
        this.mThumbnailSequenceView = (MultiThumbnailSequenceView) view.findViewById(R.id.thumbnail_view);
        this.mCurrentTimeView = (StrokeTextView) view.findViewById(R.id.tv_movie_duration);
        this.mWhiteView = view.findViewById(R.id.white_view);
        this.mPixelPerMicroSeconds = this.mThumbnailSequenceView.getPixelPerMicrosecond() * 2.0d;
        view.getViewTreeObserver().addOnGlobalLayoutListener(this.mOnGlobalLayoutListener);
    }

    public static /* synthetic */ void lambda$initListener$132(MoviePreviewMenuFragment moviePreviewMenuFragment, NvsMultiThumbnailSequenceView nvsMultiThumbnailSequenceView, int i, int i2) {
        if (moviePreviewMenuFragment.mIsSeekTimeline) {
            double d = (double) i;
            double d2 = moviePreviewMenuFragment.mPixelPerMicroSeconds;
            Double.isNaN(d);
            int floor = ((int) Math.floor((d / d2) + 0.5d)) / 1000;
            if (moviePreviewMenuFragment.mMenuFragmentListener != null) {
                moviePreviewMenuFragment.mMenuFragmentListener.seek(floor);
            }
            moviePreviewMenuFragment.setDuration(floor);
        }
    }

    /* access modifiers changed from: private */
    public void removeOnGlobalLayoutListener() {
        getView().getViewTreeObserver().removeOnGlobalLayoutListener(this.mOnGlobalLayoutListener);
    }

    private void setDuration(int i) {
        if (this.mCurrentTimeView != null) {
            this.mCurrentTimeView.setText(String.format(Locale.US, "00:%02d", new Object[]{Integer.valueOf(i / 1000)}));
        }
    }

    /* access modifiers changed from: private */
    public void updateMenuBottomView() {
        MoviePreviewMenuBottomView moviePreviewMenuBottomView = this.mMenuBottomView;
        boolean z = true;
        if (this.mMovieManager.getState() != 1) {
            z = false;
        }
        moviePreviewMenuBottomView.updatePlayBtnState(z);
    }

    /* access modifiers changed from: private */
    public void updateMenuTitleView() {
        if (this.mMovieInfo != null) {
            this.mMenuTitleView.updateTitleViewState(this.mMovieInfo.isShortVideo);
        }
    }

    /* access modifiers changed from: private */
    public void updateMultiThumbnailView() {
        this.mThumbnailSequenceDescs = this.mMovieManager.getThumbnailImages();
        this.mThumbnailSequenceView.setThumbnailAspectRatio(1.0f);
        this.mThumbnailSequenceView.setThumbnailImageFillMode(1);
        this.mThumbnailSequenceView.setThumbnailSequenceDescArray(this.mThumbnailSequenceDescs);
        this.mThumbnailSequenceView.setPixelPerMicrosecond(this.mPixelPerMicroSeconds);
        this.mThumbnailSequenceView.setStartPadding(this.mStartPadding);
        this.mThumbnailSequenceView.setEndPadding(this.mEndPadding);
        this.mSequenceWidth = this.mThumbnailSequenceView.getSequenceWidth((long) this.mMovieManager.getTotalTime(), this.mPixelPerMicroSeconds);
    }

    public void onAttach(Context context) {
        super.onAttach(context);
        if (context instanceof MenuFragmentListener) {
            this.mMenuFragmentListener = (MenuFragmentListener) context;
            this.mMovieManager = this.mMenuFragmentListener.getMovieManager();
            this.mMovieInfo = this.mMenuFragmentListener.getMovieInfo();
        }
    }

    public Animator onCreateAnimator(int i, boolean z, int i2) {
        ObjectAnimator objectAnimator = new ObjectAnimator();
        int dimension = (int) getResources().getDimension(R.dimen.movie_preview_height_offset);
        if (z) {
            objectAnimator.setValues(new PropertyValuesHolder[]{PropertyValuesHolder.ofFloat(View.TRANSLATION_Y, new float[]{(float) dimension, 0.0f})});
            objectAnimator.setInterpolator(new CubicEaseOutInterpolator());
            objectAnimator.setStartDelay((long) getResources().getInteger(R.integer.movie_preview_appear_delay));
            objectAnimator.setDuration((long) getResources().getInteger(R.integer.movie_preview_appear_duration));
            getView().setAlpha(0.0f);
            objectAnimator.addListener(new AnimatorListenerAdapter() {
                public void onAnimationStart(Animator animator) {
                    MoviePreviewMenuFragment.this.getView().setAlpha(1.0f);
                }
            });
        } else {
            objectAnimator.setValues(new PropertyValuesHolder[]{PropertyValuesHolder.ofFloat(View.TRANSLATION_Y, new float[]{0.0f, (float) dimension})});
            objectAnimator.setInterpolator(new QuarticEaseOutInterpolator());
            objectAnimator.setDuration((long) getResources().getInteger(R.integer.movie_preview_disappear_duration));
        }
        return objectAnimator;
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.movie_fragment_preview, viewGroup, false);
        initView(inflate);
        return inflate;
    }

    public void onDestroyView() {
        super.onDestroyView();
        if (this.mMenuTitleView != null) {
            this.mMenuTitleView.removeListener();
        }
        if (this.mMenuBottomView != null) {
            this.mMenuBottomView.removeListener();
        }
        removeOnGlobalLayoutListener();
    }

    public void onHiddenChanged(boolean z) {
        super.onHiddenChanged(z);
        if (!z) {
            updateMultiThumbnailView();
            updateMenuTitleView();
        }
    }

    public void onPlaybackEOF() {
        this.mIsSeekTimeline = false;
        this.mThumbnailSequenceView.fullScroll(17);
        this.mIsSeekTimeline = true;
        setDuration(0);
    }

    public void onProgressChange(float f, int i) {
        this.mIsSeekTimeline = false;
        this.mThumbnailSequenceView.scrollTo(Math.round(f * ((float) this.mSequenceWidth)), 0);
        this.mIsSeekTimeline = true;
        setDuration(i);
    }

    public void onStateChanged(int i) {
        updateMenuBottomView();
    }
}
