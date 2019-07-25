package com.miui.gallery.video.editor.widget.rangeseekbar;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.animation.DecelerateInterpolator;
import com.miui.gallery.R;
import com.miui.gallery.video.editor.widget.rangeseekbar.drawable.DisabledRangeDrawable;
import com.miui.gallery.video.editor.widget.rangeseekbar.drawable.ThumbDrawable;
import com.miui.gallery.video.editor.widget.rangeseekbar.drawable.VideoThumbnailBackgroundDrawable;
import com.miui.gallery.video.editor.widget.rangeseekbar.drawable.VideoThumbnailBackgroundDrawable.BitmapProvider;

public class VideoEditorRangeSeekBar extends View {
    private static final int LONGPRESS_TIMEOUT = ViewConfiguration.getLongPressTimeout();
    private float autoMoveSpeed = 0.0f;
    private boolean autoMoving = false;
    private int mAvailableAreaLeft = Integer.MAX_VALUE;
    private float mAvailableAreaOffset = 0.0f;
    private int mAvailableAreaRight = Integer.MAX_VALUE;
    private VideoThumbnailBackgroundDrawable mBackgroundDrawable;
    private int mDragSlop;
    private int mDragState = -1;
    private int mEndRange = Integer.MAX_VALUE;
    private int mHeight;
    /* access modifiers changed from: private */
    public Animator mHideProgressAnimator;
    private Runnable mHideProgressBarAction;
    /* access modifiers changed from: private */
    public boolean mIsShowProgress = true;
    /* access modifiers changed from: private */
    public boolean mIsZooming;
    private float mLastTouchDownX = 0.0f;
    /* access modifiers changed from: private */
    public float mLeftRangeFloat = 0.0f;
    private ThumbDrawable mLeftThumbDrawable;
    private int mLockedAvailableAreaLeft;
    private int mLockedAvailableAreaRight;
    /* access modifiers changed from: private */
    public float mLongPressMoveDistanceFlag;
    private LongPressedRunnable mLongPressedRunnable;
    private int mMax;
    private OnSeekBarChangeListener mOnSeekBarChangeListener;
    private int mProgress;
    private Rect mProgressBounds = new Rect();
    private float mProgressFloat = 0.0f;
    private DisabledRangeDrawable mRangeDrawable;
    /* access modifiers changed from: private */
    public float mRightRangeFloat = 1.0f;
    private ThumbDrawable mRightThumbDrawable;
    /* access modifiers changed from: private */
    public int mScaledTouchSlop;
    /* access modifiers changed from: private */
    public float mStartLongPressMoveDistanceDownXFlag;
    private int mStartRange = 0;
    private boolean mStopSlide = false;
    private int mThumbOffset = 3;
    /* access modifiers changed from: private */
    public int mTotal = Integer.MAX_VALUE;
    private float mTouchDownX;
    private float mTouchMoveX = 0.0f;
    /* access modifiers changed from: private */
    public int mTouchState = 0;
    private int mVisibleAreaBottom;
    private int mVisibleAreaLeft;
    private int mVisibleAreaRight;
    private int mVisibleAreaTop;
    private int mWidth;
    private ThumbDrawable progressDrawable;

    public interface ISeekbarZooming {
        void onAnimationEnd();
    }

    private class LongPressedRunnable implements Runnable {
        private boolean mIsCanceled;

        private LongPressedRunnable() {
            this.mIsCanceled = false;
        }

        public void cancel() {
            this.mIsCanceled = true;
        }

        public void run() {
            if (this.mIsCanceled) {
                return;
            }
            if ((VideoEditorRangeSeekBar.this.mTouchState == 1 || VideoEditorRangeSeekBar.this.mTouchState == 2) && VideoEditorRangeSeekBar.this.mLongPressMoveDistanceFlag < ((float) VideoEditorRangeSeekBar.this.mScaledTouchSlop)) {
                int nearbyThumbId = VideoEditorRangeSeekBar.this.getNearbyThumbId((int) VideoEditorRangeSeekBar.this.mStartLongPressMoveDistanceDownXFlag, VideoEditorRangeSeekBar.this.mLongPressMoveDistanceFlag < 0.0f);
                if (nearbyThumbId == 1) {
                    VideoEditorRangeSeekBar.this.scaleTo(5.0f, VideoEditorRangeSeekBar.this.mLeftRangeFloat, false);
                } else if (nearbyThumbId == 2) {
                    VideoEditorRangeSeekBar.this.scaleTo(5.0f, VideoEditorRangeSeekBar.this.mRightRangeFloat, false);
                }
            }
        }
    }

    public interface OnSeekBarChangeListener {
        void onProgressChanged(VideoEditorRangeSeekBar videoEditorRangeSeekBar, int i, int i2, boolean z);

        void onProgressPreview(VideoEditorRangeSeekBar videoEditorRangeSeekBar, int i, int i2, boolean z);

        void onStartTrackingTouch(VideoEditorRangeSeekBar videoEditorRangeSeekBar, int i, int i2);
    }

    static class SavedState implements Parcelable {
        public static final Creator<SavedState> CREATOR = new Creator<SavedState>() {
            public SavedState createFromParcel(Parcel parcel) {
                return new SavedState(parcel);
            }

            public SavedState[] newArray(int i) {
                return new SavedState[i];
            }
        };
        /* access modifiers changed from: private */
        public int availableAreaLeft;
        /* access modifiers changed from: private */
        public int availableAreaRight;
        public int endRange = Integer.MAX_VALUE;
        /* access modifiers changed from: private */
        public float leftRangeFloat;
        /* access modifiers changed from: private */
        public int lockedAvailableAreaLeft;
        /* access modifiers changed from: private */
        public int lockedAvailableAreaRight;
        public int max;
        public int progress;
        /* access modifiers changed from: private */
        public float progressFloat;
        /* access modifiers changed from: private */
        public float rightRangeFloat;
        public int startRange = 0;
        private Parcelable superState;
        public int total = Integer.MAX_VALUE;

        SavedState(Parcel parcel) {
            this.superState = parcel.readParcelable(getClass().getClassLoader());
            this.total = parcel.readInt();
            this.startRange = parcel.readInt();
            this.endRange = parcel.readInt();
            this.max = parcel.readInt();
            this.progress = parcel.readInt();
            this.availableAreaLeft = parcel.readInt();
            this.availableAreaRight = parcel.readInt();
            this.lockedAvailableAreaLeft = parcel.readInt();
            this.lockedAvailableAreaRight = parcel.readInt();
            this.leftRangeFloat = parcel.readFloat();
            this.rightRangeFloat = parcel.readFloat();
            this.progressFloat = parcel.readFloat();
        }

        SavedState(Parcelable parcelable) {
            this.superState = parcelable;
        }

        public int describeContents() {
            return 0;
        }

        public Parcelable getSuperState() {
            return this.superState;
        }

        public void writeToParcel(Parcel parcel, int i) {
            parcel.writeParcelable(this.superState, i);
            parcel.writeInt(this.total);
            parcel.writeInt(this.startRange);
            parcel.writeInt(this.endRange);
            parcel.writeInt(this.max);
            parcel.writeInt(this.progress);
            parcel.writeInt(this.availableAreaLeft);
            parcel.writeInt(this.availableAreaRight);
            parcel.writeInt(this.lockedAvailableAreaLeft);
            parcel.writeInt(this.lockedAvailableAreaRight);
            parcel.writeFloat(this.leftRangeFloat);
            parcel.writeFloat(this.rightRangeFloat);
            parcel.writeFloat(this.progressFloat);
        }
    }

    private class VideoEditorRangeSeekBarBitmapProviderWrapper implements BitmapProvider {
        private BitmapProvider mWrapped;

        public VideoEditorRangeSeekBarBitmapProviderWrapper(BitmapProvider bitmapProvider) {
            this.mWrapped = bitmapProvider;
        }

        public Bitmap getBitmap(int i, int i2) {
            return this.mWrapped.getBitmap((int) (((float) VideoEditorRangeSeekBar.this.mTotal) * (((float) i) / ((float) i2))), VideoEditorRangeSeekBar.this.mTotal);
        }
    }

    public VideoEditorRangeSeekBar(Context context) {
        super(context);
        init();
    }

    public VideoEditorRangeSeekBar(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init();
    }

    public VideoEditorRangeSeekBar(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init();
    }

    private void adjustThumb() {
        float f = ((float) this.mLockedAvailableAreaLeft) + (((float) (this.mLockedAvailableAreaRight - this.mLockedAvailableAreaLeft)) * this.mLeftRangeFloat);
        float f2 = ((float) this.mLockedAvailableAreaLeft) + (((float) (this.mLockedAvailableAreaRight - this.mLockedAvailableAreaLeft)) * this.mRightRangeFloat);
        if (f >= ((float) this.mVisibleAreaLeft) && f2 <= ((float) this.mVisibleAreaRight)) {
            clearAvailableAreaOffset();
            zoomAvailableAreaTo(this.mLockedAvailableAreaLeft, this.mLockedAvailableAreaRight, true, null);
        } else if (f2 - f >= ((float) getVisibleAreaWidth())) {
            clearAvailableAreaOffset();
            lockFloatRangeTo(this.mLeftRangeFloat, this.mRightRangeFloat, null);
        } else if (f2 > ((float) this.mVisibleAreaRight)) {
            float f3 = ((float) this.mVisibleAreaRight) - f2;
            int i = (int) ((f2 + f3) - 0.5f);
            if (((int) ((f + f3) - 0.5f)) >= this.mVisibleAreaLeft && i <= this.mVisibleAreaRight) {
                clearAvailableAreaOffset();
                zoomAvailableAreaTo((int) (((float) this.mLockedAvailableAreaLeft) + f3), (int) (((float) this.mLockedAvailableAreaRight) + f3), true, null);
            }
        } else if (f < ((float) this.mVisibleAreaLeft)) {
            float f4 = ((float) this.mVisibleAreaLeft) - f;
            int i2 = (int) (f2 + f4 + 0.5f);
            if (((int) (f + f4 + 0.5f)) >= this.mVisibleAreaLeft && i2 <= this.mVisibleAreaRight) {
                clearAvailableAreaOffset();
                zoomAvailableAreaTo((int) (((float) this.mLockedAvailableAreaLeft) + f4), (int) (((float) this.mLockedAvailableAreaRight) + f4), true, null);
            }
        } else {
            clearAvailableAreaOffset();
            lockFloatRangeTo(this.mLeftRangeFloat, this.mRightRangeFloat, null);
        }
    }

    private void autoMove() {
        if (this.autoMoving) {
            this.mAvailableAreaOffset += this.autoMoveSpeed;
            if (((float) this.mAvailableAreaLeft) + this.mAvailableAreaOffset > ((float) this.mVisibleAreaLeft)) {
                this.mAvailableAreaOffset = (float) (this.mVisibleAreaLeft - this.mAvailableAreaLeft);
            }
            if (((float) this.mAvailableAreaRight) + this.mAvailableAreaOffset < ((float) this.mVisibleAreaRight)) {
                this.mAvailableAreaOffset = (float) (this.mVisibleAreaRight - this.mAvailableAreaRight);
            }
            trackTouchEvent(this.mLastTouchDownX);
            invalidate();
        }
    }

    private boolean canSlip() {
        return this.mProgress > this.mStartRange + (this.progressDrawable.getIntrinsicWidth() / 2) && this.mProgress < this.mEndRange + (this.progressDrawable.getIntrinsicWidth() / 2);
    }

    private void clearAvailableAreaOffset() {
        this.mAvailableAreaLeft = (int) (((float) this.mAvailableAreaLeft) + this.mAvailableAreaOffset);
        this.mAvailableAreaRight = (int) (((float) this.mAvailableAreaRight) + this.mAvailableAreaOffset);
        this.mAvailableAreaOffset = 0.0f;
    }

    private void init() {
        this.mLeftThumbDrawable = new ThumbDrawable(getResources().getDrawable(R.drawable.video_editor_handle_left));
        this.mRightThumbDrawable = new ThumbDrawable(getResources().getDrawable(R.drawable.video_editor_handle_right));
        this.progressDrawable = new ThumbDrawable(getResources().getDrawable(R.drawable.video_editor_seek_progress));
        this.mBackgroundDrawable = new VideoThumbnailBackgroundDrawable();
        this.mBackgroundDrawable.setCLayoutDirection(getLayoutDirection() == 0 ? 0 : 1);
        this.mRangeDrawable = new DisabledRangeDrawable(new ColorDrawable(getResources().getColor(R.color.video_editor_trim_mask_bg)));
        this.mRightThumbDrawable.setCallback(this);
        this.mLeftThumbDrawable.setCallback(this);
        this.mBackgroundDrawable.setCallback(this);
        this.mRangeDrawable.setCallback(this);
        double intrinsicWidth = (double) this.progressDrawable.getIntrinsicWidth();
        Double.isNaN(intrinsicWidth);
        this.mDragSlop = (int) (intrinsicWidth * 2.5d);
        this.mScaledTouchSlop = ViewConfiguration.get(getContext()).getScaledTouchSlop();
        int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.video_editor_video_trim_seek_bar_content_padding_top);
        int dimensionPixelSize2 = getResources().getDimensionPixelSize(R.dimen.video_editor_video_trim_progress_bar_content_padding_top);
        int dimensionPixelSize3 = getResources().getDimensionPixelSize(R.dimen.video_editor_video_trim_progress_bar_content_padding_bottom);
        int dimensionPixelSize4 = getResources().getDimensionPixelSize(R.dimen.video_editor_video_trim_seek_bar_content_padding_bottom);
        this.mBackgroundDrawable.setPadding(0, dimensionPixelSize, 0, dimensionPixelSize4);
        this.mRangeDrawable.setPadding(0, dimensionPixelSize, 0, dimensionPixelSize4);
        this.progressDrawable.setPadding(0, dimensionPixelSize2, 0, dimensionPixelSize3);
        int dimensionPixelSize5 = getResources().getDimensionPixelSize(R.dimen.video_editor_video_trim_seek_bar_thumb_bar_padding_bottom);
        this.mLeftThumbDrawable.setPadding(0, dimensionPixelSize, 0, dimensionPixelSize5);
        this.mRightThumbDrawable.setPadding(0, dimensionPixelSize, 0, dimensionPixelSize5);
    }

    private void lockFloatRangeTo(float f, float f2, ISeekbarZooming iSeekbarZooming) {
        float visibleAreaWidth = (float) getVisibleAreaWidth();
        float f3 = ((float) this.mVisibleAreaLeft) + (f * visibleAreaWidth);
        float f4 = ((float) this.mVisibleAreaLeft) + (f2 * visibleAreaWidth);
        float f5 = visibleAreaWidth / (f4 - f3);
        zoomAvailableAreaTo((int) (((float) this.mVisibleAreaLeft) - ((f3 - ((float) this.mVisibleAreaLeft)) * f5)), (int) (((float) this.mVisibleAreaRight) + ((((float) this.mVisibleAreaRight) - f4) * f5)), true, iSeekbarZooming);
    }

    private void onStartTrackingTouch() {
        if (this.mOnSeekBarChangeListener != null) {
            int i = 1;
            if (getLayoutDirection() == 0) {
                OnSeekBarChangeListener onSeekBarChangeListener = this.mOnSeekBarChangeListener;
                if (this.mDragState == 0) {
                    i = 0;
                }
                onSeekBarChangeListener.onStartTrackingTouch(this, i, this.mDragState == 0 ? this.mStartRange : this.mEndRange);
                return;
            }
            OnSeekBarChangeListener onSeekBarChangeListener2 = this.mOnSeekBarChangeListener;
            if (this.mDragState != 0) {
                i = 0;
            }
            onSeekBarChangeListener2.onStartTrackingTouch(this, i, this.mDragState == 0 ? this.mEndRange : this.mStartRange);
        }
    }

    private void onStopTrackingTouch() {
        if (this.mOnSeekBarChangeListener != null) {
            int i = 1;
            if (getLayoutDirection() == 0) {
                OnSeekBarChangeListener onSeekBarChangeListener = this.mOnSeekBarChangeListener;
                if (this.mDragState == 0) {
                    i = 0;
                }
                onSeekBarChangeListener.onStartTrackingTouch(this, i, this.mDragState == 0 ? this.mStartRange : this.mEndRange);
                return;
            }
            OnSeekBarChangeListener onSeekBarChangeListener2 = this.mOnSeekBarChangeListener;
            if (this.mDragState != 0) {
                i = 0;
            }
            onSeekBarChangeListener2.onStartTrackingTouch(this, i, this.mDragState == 0 ? this.mEndRange : this.mStartRange);
        }
    }

    private void recoverToLockedArea() {
        if (this.mAvailableAreaLeft != this.mLockedAvailableAreaLeft || this.mAvailableAreaRight != this.mLockedAvailableAreaRight || Float.compare(this.mAvailableAreaOffset, 0.0f) != 0) {
            if (Float.compare(this.mAvailableAreaOffset, 0.0f) != 0) {
                adjustThumb();
            } else {
                zoomAvailableAreaTo(this.mLockedAvailableAreaLeft, this.mLockedAvailableAreaRight, true, null);
            }
        }
    }

    /* access modifiers changed from: private */
    public void scaleTo(float f, float f2, boolean z) {
        float availableWidth = ((float) getAvailableWidth()) * (f - 1.0f);
        zoomAvailableAreaTo((int) (((float) this.mAvailableAreaLeft) - (availableWidth * f2)), (int) (((float) this.mAvailableAreaRight) + (availableWidth * (1.0f - f2))), z, null);
    }

    private void trackTouchEvent(float f) {
        this.mLastTouchDownX = f;
        if (f < ((float) this.mVisibleAreaLeft)) {
            this.autoMoveSpeed = (((float) this.mVisibleAreaLeft) - f) * 0.2f;
            f = (float) this.mVisibleAreaLeft;
        } else if (f > ((float) this.mVisibleAreaRight)) {
            this.autoMoveSpeed = (((float) this.mVisibleAreaRight) - f) * 0.2f;
            f = (float) this.mVisibleAreaRight;
        } else {
            this.autoMoveSpeed = 0.0f;
        }
        float availableWidth = ((f - ((float) this.mAvailableAreaLeft)) - this.mAvailableAreaOffset) / ((float) getAvailableWidth());
        switch (this.mDragState) {
            case 0:
                if (availableWidth <= this.mRightRangeFloat) {
                    this.mLeftRangeFloat = availableWidth;
                    break;
                } else {
                    this.mLeftRangeFloat = this.mRightRangeFloat;
                    break;
                }
            case 1:
                if (availableWidth >= this.mLeftRangeFloat) {
                    this.mRightRangeFloat = availableWidth;
                    break;
                } else {
                    this.mRightRangeFloat = this.mLeftRangeFloat;
                    break;
                }
            case 2:
                this.mProgressFloat = availableWidth;
                break;
        }
        updateRangeValue();
        int i = 0;
        if (Float.compare(this.autoMoveSpeed, 0.0f) == 0) {
            this.autoMoving = false;
        } else if ((this.autoMoveSpeed > 0.0f && this.mAvailableAreaLeft < this.mVisibleAreaLeft) || (this.autoMoveSpeed < 0.0f && this.mAvailableAreaRight > this.mVisibleAreaRight)) {
            if (this.mLeftRangeFloat < this.mRightRangeFloat) {
                this.autoMoving = true;
            } else {
                this.autoMoving = false;
            }
        }
        if (this.mDragState == 2) {
            if (canSlip()) {
                this.mOnSeekBarChangeListener.onProgressPreview(this, -1, this.mProgress, true);
            }
        } else if (getLayoutDirection() == 0) {
            OnSeekBarChangeListener onSeekBarChangeListener = this.mOnSeekBarChangeListener;
            if (this.mDragState != 0) {
                i = 1;
            }
            onSeekBarChangeListener.onProgressChanged(this, i, this.mDragState == 0 ? this.mStartRange : this.mEndRange, true);
        } else {
            OnSeekBarChangeListener onSeekBarChangeListener2 = this.mOnSeekBarChangeListener;
            if (this.mDragState == 0) {
                i = 1;
            }
            onSeekBarChangeListener2.onProgressChanged(this, i, this.mDragState == 0 ? this.mEndRange : this.mStartRange, true);
        }
        updateState();
    }

    private void updateRangeValue() {
        if (this.mDragState == 2) {
            this.mProgress = (int) ((((float) this.mTotal) * this.mProgressFloat) + 0.5f);
        } else if (getLayoutDirection() == 0) {
            this.mStartRange = (int) ((((float) this.mTotal) * this.mLeftRangeFloat) + 0.5f);
            this.mEndRange = (int) ((((float) this.mTotal) * this.mRightRangeFloat) + 0.5f);
        } else {
            this.mStartRange = (int) ((((float) this.mTotal) * (1.0f - this.mRightRangeFloat)) + 0.5f);
            this.mEndRange = (int) ((((float) this.mTotal) * (1.0f - this.mLeftRangeFloat)) + 0.5f);
        }
    }

    private void updateState() {
        int availableWidth = getAvailableWidth();
        this.mProgressBounds.set((int) (((float) this.mAvailableAreaLeft) + this.mAvailableAreaOffset), this.mVisibleAreaTop, (int) (((float) this.mAvailableAreaRight) + this.mAvailableAreaOffset), this.mVisibleAreaBottom);
        this.mBackgroundDrawable.setBounds(this.mProgressBounds);
        this.mRangeDrawable.setBounds(this.mProgressBounds);
        this.mBackgroundDrawable.setBounds(this.mProgressBounds);
        float f = (float) availableWidth;
        int i = (int) (this.mAvailableAreaOffset + (this.mLeftRangeFloat * f) + ((float) this.mAvailableAreaLeft) + 0.5f);
        int i2 = (int) (this.mAvailableAreaOffset + (this.mRightRangeFloat * f) + ((float) this.mAvailableAreaLeft) + 0.5f);
        if (this.mDragState == 2 && this.mTouchState == 2) {
            int i3 = (int) (this.mAvailableAreaOffset + (f * this.mProgressFloat) + ((float) this.mAvailableAreaLeft) + 0.5f);
            int intrinsicWidth = ((int) (((float) this.progressDrawable.getIntrinsicWidth()) * 0.9f)) + i;
            int intrinsicWidth2 = ((int) (((float) this.progressDrawable.getIntrinsicWidth()) * 0.1f)) + i2;
            if (i3 <= intrinsicWidth) {
                i3 = intrinsicWidth;
            } else if (i3 >= intrinsicWidth2) {
                i3 = intrinsicWidth2;
            }
            this.progressDrawable.moveProgressThumb(i3, this.mHeight / 2);
        } else {
            this.progressDrawable.moveTo(((int) (this.mAvailableAreaOffset + ((float) i) + (((float) (i2 - i)) * this.mProgressFloat) + 0.5f)) + ((int) (((float) this.progressDrawable.getIntrinsicWidth()) * 0.4f)), this.mHeight / 2);
        }
        this.mLeftThumbDrawable.moveLeftThumb(i, this.mHeight / 2);
        this.mRightThumbDrawable.moveRightThumb(i2, this.mHeight / 2);
        this.mRangeDrawable.setStartRangeScale(this.mLeftRangeFloat);
        this.mRangeDrawable.setEndRangeScale(this.mRightRangeFloat);
        invalidate();
    }

    private void zoomAvailableAreaTo(int i, int i2, boolean z, final ISeekbarZooming iSeekbarZooming) {
        if (i2 - i < this.mTotal) {
            AnimatorSet animatorSet = new AnimatorSet();
            animatorSet.setDuration(500);
            animatorSet.setInterpolator(new DecelerateInterpolator());
            animatorSet.playTogether(new Animator[]{ObjectAnimator.ofInt(this, "AvailableAreaLeft", new int[]{this.mAvailableAreaLeft, i}), ObjectAnimator.ofInt(this, "AvailableAreaRight", new int[]{this.mAvailableAreaRight, i2})});
            animatorSet.start();
            this.mIsZooming = true;
            animatorSet.addListener(new AnimatorListener() {
                public void onAnimationCancel(Animator animator) {
                }

                public void onAnimationEnd(Animator animator) {
                    if (iSeekbarZooming != null) {
                        iSeekbarZooming.onAnimationEnd();
                    }
                    VideoEditorRangeSeekBar.this.mIsZooming = false;
                }

                public void onAnimationRepeat(Animator animator) {
                }

                public void onAnimationStart(Animator animator) {
                }
            });
            if (z) {
                this.mLockedAvailableAreaLeft = i;
                this.mLockedAvailableAreaRight = i2;
            }
        }
    }

    public int getAvailableHeight() {
        return (this.mHeight - this.mBackgroundDrawable.getPaddingTop()) - this.mBackgroundDrawable.getPaddingBottom();
    }

    public int getAvailableWidth() {
        return this.mAvailableAreaRight - this.mAvailableAreaLeft;
    }

    public int getEndRange() {
        return this.mEndRange;
    }

    public int getNearbyThumbId(int i, boolean z) {
        int abs = Math.abs(this.mLeftThumbDrawable.getLocationX() - i);
        int abs2 = Math.abs(this.mRightThumbDrawable.getLocationX() - i);
        int abs3 = Math.abs(this.progressDrawable.getLocationX() - i);
        int abs4 = Math.abs(this.mLeftThumbDrawable.getLocationX() - this.progressDrawable.getLocationX());
        int abs5 = Math.abs(this.mRightThumbDrawable.getLocationX() - this.progressDrawable.getLocationX());
        boolean z2 = abs4 <= this.mDragSlop;
        boolean z3 = abs5 <= this.mDragSlop;
        if (z) {
            if (z2 && (abs < this.mDragSlop || abs3 < this.mDragSlop)) {
                return 1;
            }
            if (z3 && this.mIsShowProgress && (abs2 < this.mDragSlop || abs3 < this.mDragSlop)) {
                return 3;
            }
            if (this.mIsShowProgress && abs3 < this.mDragSlop) {
                return 3;
            }
            if (abs < this.mDragSlop) {
                return 1;
            }
            if (abs2 < this.mDragSlop) {
                return 2;
            }
        } else if (z3 && (abs2 < this.mDragSlop || abs3 < this.mDragSlop)) {
            return 2;
        } else {
            if (z2 && this.mIsShowProgress && (abs < this.mDragSlop || abs3 < this.mDragSlop)) {
                return 3;
            }
            if (this.mIsShowProgress && abs3 < this.mDragSlop) {
                return 3;
            }
            if (abs2 < this.mDragSlop) {
                return 2;
            }
            if (abs < this.mDragSlop) {
                return 1;
            }
        }
        return 0;
    }

    public int getStartRange() {
        return this.mStartRange;
    }

    public int getVisibleAreaWidth() {
        return this.mVisibleAreaRight - this.mVisibleAreaLeft;
    }

    public void hideProgressBar() {
        if (this.mIsShowProgress) {
            hideProgressBar(false);
        }
    }

    public void hideProgressBar(boolean z) {
        if (z) {
            this.mHideProgressAnimator = ObjectAnimator.ofInt(this, "ProgressBarAlpha", new int[]{255, 0}).setDuration(1000);
            this.mHideProgressAnimator.addListener(new AnimatorListener() {
                public void onAnimationCancel(Animator animator) {
                }

                public void onAnimationEnd(Animator animator) {
                    VideoEditorRangeSeekBar.this.mIsShowProgress = false;
                    VideoEditorRangeSeekBar.this.mHideProgressAnimator = null;
                }

                public void onAnimationRepeat(Animator animator) {
                }

                public void onAnimationStart(Animator animator) {
                }
            });
            this.mHideProgressAnimator.start();
            return;
        }
        this.mIsShowProgress = false;
        setProgressBarAlpha(0);
    }

    public boolean isTouching() {
        return this.mTouchState != 0;
    }

    public boolean isZooming() {
        return this.mIsZooming;
    }

    public void lockRangeTo(int i, int i2, ISeekbarZooming iSeekbarZooming) {
        if (i2 <= this.mTotal && i < i2 && i2 - i > this.mWidth) {
            if (getLayoutDirection() == 0) {
                lockFloatRangeTo(((float) i) / ((float) this.mTotal), ((float) i2) / ((float) this.mTotal), iSeekbarZooming);
            } else {
                lockFloatRangeTo(1.0f - (((float) i2) / ((float) this.mTotal)), 1.0f - (((float) i) / ((float) this.mTotal)), iSeekbarZooming);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        this.mBackgroundDrawable.draw(canvas);
        this.mRangeDrawable.draw(canvas);
        this.mLeftThumbDrawable.draw(canvas);
        this.mRightThumbDrawable.draw(canvas);
        if (this.mIsShowProgress) {
            this.progressDrawable.draw(canvas);
        }
        if (this.autoMoving) {
            autoMove();
        }
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        super.onLayout(z, i, i2, i3, i4);
        if (z) {
            this.mWidth = i3 - i;
            this.mHeight = i4 - i2;
            this.mLeftThumbDrawable.setSize(this.mLeftThumbDrawable.getIntrinsicWidth(), this.mHeight);
            this.mRightThumbDrawable.setSize(this.mRightThumbDrawable.getIntrinsicWidth(), this.mHeight);
            this.progressDrawable.setSize(this.progressDrawable.getIntrinsicWidth(), this.mHeight);
            this.mVisibleAreaLeft = this.mLeftThumbDrawable.getPaddingLeft() + getPaddingLeft();
            this.mVisibleAreaRight = (this.mWidth - this.mRightThumbDrawable.getPaddingRight()) - getPaddingRight();
            this.mVisibleAreaTop = getPaddingTop();
            this.mVisibleAreaBottom = this.mHeight - getPaddingBottom();
            this.mBackgroundDrawable.setDrawingArea(this.mVisibleAreaLeft, this.mVisibleAreaRight);
            this.mRangeDrawable.setDrawingArea(this.mVisibleAreaLeft - this.mThumbOffset, this.mVisibleAreaRight + this.mThumbOffset);
            this.mLeftThumbDrawable.setDrawingArea(this.mVisibleAreaLeft - this.mThumbOffset, this.mVisibleAreaRight + this.mThumbOffset);
            this.mRightThumbDrawable.setDrawingArea(this.mVisibleAreaLeft - this.mThumbOffset, this.mVisibleAreaRight + this.mThumbOffset);
            this.progressDrawable.setDrawingArea(this.mVisibleAreaLeft - this.mThumbOffset, this.mVisibleAreaRight + this.mThumbOffset);
            if (this.mAvailableAreaLeft == Integer.MAX_VALUE) {
                this.mAvailableAreaLeft = this.mVisibleAreaLeft;
                this.mLockedAvailableAreaLeft = this.mAvailableAreaLeft;
            }
            if (this.mAvailableAreaRight == Integer.MAX_VALUE) {
                this.mAvailableAreaRight = this.mVisibleAreaRight;
                this.mLockedAvailableAreaRight = this.mAvailableAreaRight;
            }
            updateState();
        }
    }

    /* access modifiers changed from: protected */
    public void onRestoreInstanceState(Parcelable parcelable) {
        if (parcelable != null && (parcelable instanceof SavedState)) {
            SavedState savedState = (SavedState) parcelable;
            super.onRestoreInstanceState(savedState.getSuperState());
            this.mTotal = savedState.total;
            this.mStartRange = savedState.startRange;
            this.mEndRange = savedState.endRange;
            this.mMax = savedState.max;
            this.mProgress = savedState.progress;
            this.mAvailableAreaLeft = savedState.availableAreaLeft;
            this.mAvailableAreaRight = savedState.availableAreaRight;
            this.mLockedAvailableAreaLeft = savedState.lockedAvailableAreaLeft;
            this.mLockedAvailableAreaRight = savedState.lockedAvailableAreaRight;
            this.mRightRangeFloat = savedState.rightRangeFloat;
            this.mLeftRangeFloat = savedState.leftRangeFloat;
            this.mProgressFloat = savedState.progressFloat;
        }
    }

    public void onRtlPropertiesChanged(int i) {
        super.onRtlPropertiesChanged(i);
        this.mBackgroundDrawable.setCLayoutDirection(i == 0 ? 0 : 1);
    }

    /* access modifiers changed from: protected */
    public Parcelable onSaveInstanceState() {
        SavedState savedState = new SavedState(super.onSaveInstanceState());
        savedState.total = this.mTotal;
        savedState.startRange = this.mStartRange;
        savedState.endRange = this.mEndRange;
        savedState.max = this.mMax;
        savedState.progress = this.mProgress;
        savedState.availableAreaLeft = this.mAvailableAreaLeft;
        savedState.availableAreaRight = this.mAvailableAreaRight;
        savedState.lockedAvailableAreaLeft = this.mLockedAvailableAreaLeft;
        savedState.lockedAvailableAreaRight = this.mLockedAvailableAreaRight;
        savedState.rightRangeFloat = this.mRightRangeFloat;
        savedState.leftRangeFloat = this.mLeftRangeFloat;
        savedState.progressFloat = this.mProgressFloat;
        return savedState;
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        switch (motionEvent.getAction()) {
            case 0:
                this.mTouchDownX = motionEvent.getX();
                this.mDragState = -1;
                this.mTouchState = 1;
                this.mTouchMoveX = 0.0f;
                this.mLongPressMoveDistanceFlag = 0.0f;
                this.mStartLongPressMoveDistanceDownXFlag = motionEvent.getX();
                this.mLongPressedRunnable = new LongPressedRunnable();
                postDelayed(this.mLongPressedRunnable, (long) LONGPRESS_TIMEOUT);
                break;
            case 1:
                this.mTouchState = 0;
                if (this.mLongPressedRunnable != null) {
                    this.mLongPressedRunnable.cancel();
                    this.mLongPressedRunnable = null;
                }
                if (this.mDragState != -1) {
                    onStopTrackingTouch();
                    this.mDragState = -1;
                    this.autoMoving = false;
                }
                recoverToLockedArea();
                break;
            case 2:
                this.mTouchState = 2;
                this.mLongPressMoveDistanceFlag = motionEvent.getX() - this.mStartLongPressMoveDistanceDownXFlag;
                this.mTouchMoveX = motionEvent.getX() - this.mTouchDownX;
                if (this.mAvailableAreaLeft == this.mLockedAvailableAreaLeft || this.mAvailableAreaRight == this.mLockedAvailableAreaRight) {
                    if (this.autoMoving || Math.abs(this.mLongPressMoveDistanceFlag) >= ((float) (this.mScaledTouchSlop / 2))) {
                        if (this.mLongPressedRunnable != null) {
                            this.mLongPressedRunnable.cancel();
                            this.mLongPressedRunnable = null;
                        }
                        this.mLongPressMoveDistanceFlag = 0.0f;
                        this.mStartLongPressMoveDistanceDownXFlag = motionEvent.getX();
                    } else if (this.mLongPressedRunnable == null) {
                        this.mLongPressedRunnable = new LongPressedRunnable();
                        postDelayed(this.mLongPressedRunnable, (long) LONGPRESS_TIMEOUT);
                    }
                }
                if (this.mDragState != -1) {
                    if (this.mStopSlide) {
                        if (this.mDragState != 0 || this.mTouchMoveX >= 0.0f) {
                            if (this.mDragState == 1 && this.mTouchMoveX > 0.0f) {
                                trackTouchEvent(motionEvent.getX());
                                break;
                            }
                        } else {
                            trackTouchEvent(motionEvent.getX());
                            break;
                        }
                    } else {
                        trackTouchEvent(motionEvent.getX());
                        break;
                    }
                } else {
                    this.mTouchMoveX = motionEvent.getX() - this.mTouchDownX;
                    if (Math.abs(this.mTouchMoveX) > ((float) this.mScaledTouchSlop)) {
                        switch (getNearbyThumbId((int) this.mTouchDownX, this.mTouchMoveX < 0.0f)) {
                            case 1:
                                this.mDragState = 0;
                                break;
                            case 2:
                                this.mDragState = 1;
                                break;
                            case 3:
                                this.mDragState = 2;
                                break;
                            default:
                                this.mDragState = -1;
                                break;
                        }
                        if (this.mDragState != -1) {
                            onStartTrackingTouch();
                            break;
                        }
                    }
                }
                break;
        }
        return true;
    }

    public void setAvailableAreaLeft(int i) {
        this.mAvailableAreaLeft = i;
        updateState();
    }

    public void setAvailableAreaRight(int i) {
        this.mAvailableAreaRight = i;
        updateState();
    }

    public void setBitmapProvider(BitmapProvider bitmapProvider) {
        this.mBackgroundDrawable.setmBitmapProvider(new VideoEditorRangeSeekBarBitmapProviderWrapper(bitmapProvider));
    }

    public void setEndRange(int i) {
        if (i > this.mTotal) {
            this.mEndRange = this.mTotal;
        } else if (i < this.mStartRange) {
            this.mEndRange = this.mStartRange;
        } else {
            this.mEndRange = i;
        }
        if (getLayoutDirection() == 0) {
            this.mRightRangeFloat = ((float) this.mEndRange) / ((float) this.mTotal);
        } else {
            this.mLeftRangeFloat = 1.0f - (((float) this.mEndRange) / ((float) this.mTotal));
        }
        updateState();
    }

    public void setMax(int i) {
        this.mProgress = (int) (((float) this.mMax) * (((float) this.mProgress) / ((float) this.mMax)));
        this.mMax = i;
        if (getLayoutDirection() == 0) {
            this.mProgressFloat = ((float) this.mProgress) / ((float) this.mMax);
        } else {
            this.mProgressFloat = 1.0f - (((float) this.mProgress) / ((float) this.mMax));
        }
        updateState();
    }

    public void setOnSeekBarChangeListener(OnSeekBarChangeListener onSeekBarChangeListener) {
        this.mOnSeekBarChangeListener = onSeekBarChangeListener;
    }

    public void setProgress(int i) {
        if (i < 0) {
            this.mProgress = 0;
        } else if (i > this.mMax) {
            this.mProgress = this.mMax;
        } else {
            this.mProgress = i;
        }
        if (getLayoutDirection() == 0) {
            this.mProgressFloat = ((float) this.mProgress) / ((float) this.mMax);
        } else {
            this.mProgressFloat = 1.0f - (((float) this.mProgress) / ((float) this.mMax));
        }
        updateState();
    }

    public void setProgressBarAlpha(int i) {
        this.progressDrawable.setAlpha(i);
        invalidate();
    }

    public void setStartRange(int i) {
        if (i < 0) {
            this.mStartRange = 0;
        } else if (i > this.mEndRange) {
            this.mStartRange = this.mEndRange;
        } else {
            this.mStartRange = i;
        }
        if (getLayoutDirection() == 0) {
            this.mLeftRangeFloat = ((float) this.mStartRange) / ((float) this.mTotal);
        } else {
            this.mRightRangeFloat = 1.0f - (((float) this.mStartRange) / ((float) this.mTotal));
        }
        updateState();
    }

    public void setStopSlide(boolean z) {
        this.mStopSlide = z;
    }

    public void setThumbnailAspectRatio(float f) {
        this.mBackgroundDrawable.setAspectRatio(f);
    }

    public void setTotal(int i) {
        this.mTotal = i;
        updateRangeValue();
    }

    public void showProgressBar() {
        if (!this.mIsShowProgress) {
            if (this.mHideProgressBarAction != null) {
                removeCallbacks(this.mHideProgressBarAction);
                this.mHideProgressBarAction = null;
            }
            if (this.mHideProgressAnimator != null) {
                this.mHideProgressAnimator.cancel();
                this.mHideProgressAnimator = null;
            }
            this.mIsShowProgress = true;
            setProgressBarAlpha(255);
        }
    }
}
