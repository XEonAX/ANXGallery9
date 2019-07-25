package com.miui.gallery.video.editor.ui;

import android.graphics.Bitmap;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.video.editor.VideoEditor.OnCompletedListener;
import com.miui.gallery.video.editor.VideoEditor.OnVideoThumbnailChangedListener;
import com.miui.gallery.video.editor.VideoEditor.StateChangeListener;
import com.miui.gallery.video.editor.ui.menu.TrimView;
import com.miui.gallery.video.editor.widget.rangeseekbar.VideoEditorRangeSeekBar;
import com.miui.gallery.video.editor.widget.rangeseekbar.VideoEditorRangeSeekBar.ISeekbarZooming;
import com.miui.gallery.video.editor.widget.rangeseekbar.VideoEditorRangeSeekBar.OnSeekBarChangeListener;
import com.miui.gallery.video.editor.widget.rangeseekbar.drawable.VideoThumbnailBackgroundDrawable.BitmapProvider;
import java.util.ArrayList;
import java.util.List;

public class TrimFragment extends MenuFragment implements OnSeekBarChangeListener {
    private View mCancelView;
    private boolean mHasCliped;
    /* access modifiers changed from: private */
    public boolean mIsModified = false;
    private View mOkView;
    /* access modifiers changed from: private */
    public VideoEditorRangeSeekBar mRangeSeekBar;
    /* access modifiers changed from: private */
    public int mSavedEndRange = 0;
    /* access modifiers changed from: private */
    public int mSavedStartRange = 0;
    private MyStateChangeListener mStateChangeListener = new MyStateChangeListener();
    private TextView mTitleView;
    private TextView mTvVideoTime;
    /* access modifiers changed from: private */
    public boolean needResetTrimInfo = false;

    private class MyStateChangeListener implements StateChangeListener {
        private MyStateChangeListener() {
        }

        public void onStateChanged(int i) {
            if (i == 1) {
                TrimFragment.this.mRangeSeekBar.setMax(TrimFragment.this.mVideoEditor.getProjectTotalTime());
                TrimFragment.this.updatePalyBtnView();
            }
        }

        public void onTimeChanged(int i) {
            TrimFragment.this.mRangeSeekBar.setProgress(i);
            TrimFragment.this.mRangeSeekBar.showProgressBar();
        }
    }

    private String getCurrentVideoTime(int i) {
        String str;
        int i2 = i / 60000;
        int i3 = (i - ((i2 * 60) * 1000)) / 1000;
        if (i2 >= 10) {
            StringBuilder sb = new StringBuilder();
            sb.append(i2);
            sb.append("");
            str = sb.toString();
        } else if (i2 > 0) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append(MovieStatUtils.DOWNLOAD_SUCCESS);
            sb2.append(i2);
            str = sb2.toString();
        } else {
            str = "00";
        }
        if (i3 >= 10) {
            StringBuilder sb3 = new StringBuilder();
            sb3.append(str);
            sb3.append(":");
            sb3.append(i3);
            return sb3.toString();
        } else if (i3 >= 1) {
            StringBuilder sb4 = new StringBuilder();
            sb4.append(str);
            sb4.append(":0");
            sb4.append(i3);
            return sb4.toString();
        } else {
            StringBuilder sb5 = new StringBuilder();
            sb5.append(str);
            sb5.append(":01");
            return sb5.toString();
        }
    }

    private void initListener() {
        this.mOkView.setOnClickListener(new OnClickListener() {
            public final void onClick(View view) {
                TrimFragment.this.doApply();
            }
        });
        this.mCancelView.setOnClickListener(new OnClickListener() {
            public final void onClick(View view) {
                TrimFragment.this.doCancel();
            }
        });
    }

    private void updateAutoTrimView() {
        if (this.mCallback != null) {
            this.mCallback.updateAutoTrimView();
        }
    }

    public boolean doApply() {
        if (this.mRangeSeekBar != null && this.mRangeSeekBar.isTouching()) {
            return false;
        }
        if (this.mVideoEditor == null) {
            Log.d("TrimFragment", "doApply: videoEditor is null.");
            return false;
        }
        final int startRange = this.mRangeSeekBar.getStartRange();
        final int endRange = this.mRangeSeekBar.getEndRange();
        if (startRange >= endRange || endRange - startRange <= 1000) {
            ToastUtils.makeText(this.mRangeSeekBar.getContext(), (int) R.string.video_editor_invalid_trim_arguments);
            onExitMode();
        } else {
            this.mVideoEditor.setTrimInfo(startRange, endRange);
            this.mRangeSeekBar.lockRangeTo(startRange, endRange, new ISeekbarZooming() {
                public void onAnimationEnd() {
                    TrimFragment.this.mVideoEditor.apply(new OnCompletedListener() {
                        public void onCompleted() {
                            if (TrimFragment.this.mVideoEditor != null) {
                                TrimFragment.this.mSavedStartRange = startRange;
                                TrimFragment.this.mSavedEndRange = endRange;
                                TrimFragment.this.needResetTrimInfo = true;
                                TrimFragment.this.mIsModified = false;
                                TrimFragment.this.mVideoEditor.play();
                                TrimFragment.this.recordEventWithApply();
                                TrimFragment.this.onExitMode();
                            }
                        }
                    });
                }
            });
        }
        return true;
    }

    public boolean doCancel() {
        if (this.mVideoEditor == null) {
            Log.d("TrimFragment", "doCancel: videoEditor is null.");
            return false;
        } else if (this.mRangeSeekBar == null || this.mRangeSeekBar.isZooming() || this.mRangeSeekBar.isTouching()) {
            return false;
        } else {
            if (this.mHasCliped) {
                this.mVideoEditor.setTrimInfo(this.mSavedStartRange, this.mSavedEndRange);
                return this.mVideoEditor.apply(new OnCompletedListener() {
                    public void onCompleted() {
                        if (TrimFragment.this.mVideoEditor != null) {
                            TrimFragment.this.needResetTrimInfo = true;
                            TrimFragment.this.mVideoEditor.play();
                            TrimFragment.this.mRangeSeekBar.setStartRange(TrimFragment.this.mSavedStartRange);
                            TrimFragment.this.mRangeSeekBar.setEndRange(TrimFragment.this.mSavedEndRange);
                            TrimFragment.this.mIsModified = false;
                            TrimFragment.this.recordEventWithCancel();
                            TrimFragment.this.onExitMode();
                        }
                    }
                });
            }
            onExitMode();
            return true;
        }
    }

    public List<String> getCurrentEffect() {
        return new ArrayList();
    }

    public int getEffectId() {
        return R.id.video_editor_trim;
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return new TrimView(viewGroup.getContext());
    }

    public void onDestroyView() {
        super.onDestroyView();
        this.mVideoEditor.removeStateChangeListener(this.mStateChangeListener);
        this.mRangeSeekBar = null;
        updateAutoTrimView();
    }

    public void onPlayButtonClicked() {
        if (this.mVideoEditor != null) {
            int state = this.mVideoEditor.getState();
            if ((state == 0 || state == 2) && this.mIsModified) {
                int startRange = this.mRangeSeekBar.getStartRange();
                int endRange = this.mRangeSeekBar.getEndRange();
                if (startRange >= endRange || endRange - startRange <= 1000) {
                    ToastUtils.makeText(this.mContext, (int) R.string.video_editor_invalid_trim_arguments);
                    return;
                }
                this.mVideoEditor.setTrimInfo(startRange, endRange);
                this.mVideoEditor.apply(new OnCompletedListener() {
                    public void onCompleted() {
                        TrimFragment.this.needResetTrimInfo = true;
                        TrimFragment.this.mVideoEditor.play();
                    }
                });
                this.mIsModified = false;
            }
        }
    }

    public void onProgressChanged(VideoEditorRangeSeekBar videoEditorRangeSeekBar, int i, int i2, boolean z) {
        int endRange = this.mRangeSeekBar.getEndRange() - this.mRangeSeekBar.getStartRange();
        this.mRangeSeekBar.setStopSlide("00:01".equals(getCurrentVideoTime(endRange)));
        this.mVideoEditor.seek(this.mVideoEditor.getVideoStartTime() + i2, null);
        this.mIsModified = true;
        this.mRangeSeekBar.hideProgressBar();
        this.mTvVideoTime.setText(getCurrentVideoTime(endRange));
        this.mHasCliped = true;
    }

    public void onProgressPreview(VideoEditorRangeSeekBar videoEditorRangeSeekBar, int i, int i2, boolean z) {
        if (this.mVideoEditor != null) {
            double videoTotalTime = (double) this.mVideoEditor.getVideoTotalTime();
            double projectTotalTime = (double) this.mVideoEditor.getProjectTotalTime();
            double d = (double) i2;
            Double.isNaN(d);
            Double.isNaN(projectTotalTime);
            double d2 = d * projectTotalTime;
            Double.isNaN(videoTotalTime);
            this.mVideoEditor.seek((int) (d2 / videoTotalTime), null);
        }
    }

    public void onStartTrackingTouch(VideoEditorRangeSeekBar videoEditorRangeSeekBar, final int i, int i2) {
        if (this.needResetTrimInfo) {
            this.mVideoEditor.setTrimInfo(0, this.mVideoEditor.getVideoTotalTime());
            this.mVideoEditor.apply(new OnCompletedListener() {
                public void onCompleted() {
                    if (TrimFragment.this.mVideoEditor != null) {
                        TrimFragment.this.needResetTrimInfo = false;
                        TrimFragment.this.mIsModified = true;
                        TrimFragment.this.mVideoEditor.seek(TrimFragment.this.mVideoEditor.getVideoStartTime() + i == 0 ? TrimFragment.this.mRangeSeekBar.getStartRange() : TrimFragment.this.mRangeSeekBar.getEndRange(), null);
                    }
                }
            });
        }
        recordEventWithEffectChanged();
    }

    public void onVideoLoadCompleted() {
        super.onVideoLoadCompleted();
        if (this.mVideoEditor != null && this.mRangeSeekBar != null) {
            this.mRangeSeekBar.setTotal(this.mVideoEditor.getVideoTotalTime());
            this.mRangeSeekBar.setMax(this.mVideoEditor.getProjectTotalTime());
            this.mSavedEndRange = this.mVideoEditor.getVideoTotalTime();
            this.mSavedStartRange = 0;
            this.mRangeSeekBar.setStartRange(0);
            this.mRangeSeekBar.setEndRange(this.mVideoEditor.getVideoTotalTime());
            this.mRangeSeekBar.lockRangeTo(0, this.mVideoEditor.getVideoTotalTime(), null);
            this.mTvVideoTime.setText(getCurrentVideoTime(this.mVideoEditor.getProjectTotalTime()));
            this.mRangeSeekBar.setStopSlide("00:01".equals(getCurrentVideoTime(this.mVideoEditor.getVideoTotalTime())));
            updateAutoTrimView();
        }
    }

    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        this.mCancelView = view.findViewById(R.id.cancel);
        this.mOkView = view.findViewById(R.id.ok);
        this.mTitleView = (TextView) view.findViewById(R.id.title);
        this.mTitleView.setText(this.mContext.getResources().getString(R.string.video_editor_trim));
        this.mRangeSeekBar = (VideoEditorRangeSeekBar) view.findViewById(R.id.video_editor_trim_range_seek_bar);
        this.mRangeSeekBar.setOnSeekBarChangeListener(this);
        this.mTvVideoTime = (TextView) view.findViewById(R.id.trim_tv_time);
        this.mRangeSeekBar.setTotal(this.mVideoEditor.getVideoTotalTime());
        this.mRangeSeekBar.setMax(this.mVideoEditor.getProjectTotalTime());
        this.mSavedStartRange = this.mRangeSeekBar.getStartRange();
        this.mSavedEndRange = this.mRangeSeekBar.getEndRange();
        this.needResetTrimInfo = true;
        this.mTvVideoTime.setText(getCurrentVideoTime(this.mVideoEditor.getProjectTotalTime()));
        this.mRangeSeekBar.setBitmapProvider(new BitmapProvider() {
            public Bitmap getBitmap(int i, int i2) {
                return TrimFragment.this.mVideoEditor.pickThumbnail(i);
            }
        });
        this.mRangeSeekBar.setThumbnailAspectRatio(this.mVideoEditor.getCurrentDisplayRatio());
        this.mVideoEditor.addStateChangeListener(this.mStateChangeListener);
        this.mVideoEditor.setOnVideoThumbnailChangedListener(new OnVideoThumbnailChangedListener() {
            public void onVideoThumbnailChanged() {
                if (TrimFragment.this.mVideoEditor != null && TrimFragment.this.mRangeSeekBar != null) {
                    TrimFragment.this.mRangeSeekBar.setThumbnailAspectRatio(TrimFragment.this.mVideoEditor.getCurrentDisplayRatio());
                }
            }
        });
        updateAutoTrimView();
        initListener();
    }

    public void onViewStateRestored(Bundle bundle) {
        super.onViewStateRestored(bundle);
        this.mRangeSeekBar.setTotal(this.mVideoEditor.getVideoTotalTime());
        this.mRangeSeekBar.setMax(this.mVideoEditor.getProjectTotalTime());
        this.mSavedStartRange = this.mRangeSeekBar.getStartRange();
        this.mSavedEndRange = this.mRangeSeekBar.getEndRange();
    }
}
