package com.miui.gallery.widget.editwrapper;

import android.animation.Animator;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.database.DataSetObserver;
import android.graphics.Matrix;
import android.graphics.drawable.Drawable;
import android.util.ArrayMap;
import android.util.LongSparseArray;
import android.util.SparseBooleanArray;
import android.view.ActionMode;
import android.view.ActionMode.Callback;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.AbsListView.OnScrollListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.AdapterView.OnItemLongClickListener;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.ListAdapter;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.adapter.BaseMediaAdapterDeprecated;
import com.miui.gallery.adapter.CheckableAdapter.CheckedItem;
import com.miui.gallery.ui.Checkable;
import com.miui.gallery.ui.CheckableView;
import com.miui.gallery.util.FileMimeUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.SyncSortUtil;
import com.miui.gallery.widget.ScalableImageView;
import com.miui.gallery.widget.editwrapper.PickAnimationHelper.BackgroundImageViewable;
import com.miui.gallery.widget.editwrapper.PickAnimationHelper.ShowNumberWhenPicking;
import com.tonicartos.widget.stickygridheaders.StickyGridHeadersBaseAdapter;
import com.tonicartos.widget.stickygridheaders.StickyGridHeadersGridView;
import com.tonicartos.widget.stickygridheaders.StickyGridHeadersSimpleAdapter;
import java.util.ArrayList;
import java.util.List;
import java.util.Stack;
import miui.gallery.support.MiuiSdkCompat;
import miui.view.EditActionMode;
import miui.view.animation.CubicEaseOutInterpolator;

public class EditableListViewWrapperDeprecated {
    private SimpleWrapper mAdapterWrapper;
    private ArrayMap<ListAdapter, SimpleWrapper> mAdapterWrappers;
    /* access modifiers changed from: private */
    public AnimationManager mAnimationManager = new AnimationManager();
    private OnItemClickListener mCheckItemListener = new OnItemClickListener() {
        public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
            if ((view instanceof Checkable) && i >= EditableListViewWrapperDeprecated.this.mListHeaderCount) {
                int access$500 = i - EditableListViewWrapperDeprecated.this.mListHeaderCount;
                boolean z = !EditableListViewWrapperDeprecated.this.mCheckState.getCheckState(access$500);
                EditableListViewWrapperDeprecated.this.mCheckState.setCheckState(access$500, z);
                ((Checkable) view).setChecked(z);
                EditableListViewWrapperDeprecated.this.updateActionMode();
                EditableListViewWrapperDeprecated.this.mMultiChoiceModeCallback.mWrapped.onItemCheckedStateChanged(EditableListViewWrapperDeprecated.this.mChoiceActionMode, access$500, j, z);
                if (view instanceof BackgroundImageViewable) {
                    EditableListViewWrapperDeprecated.this.mAnimationManager.startScaleItemImageViewAnimation(((BackgroundImageViewable) view).getBackgroundImageView(), access$500);
                }
                if (z && (view instanceof ShowNumberWhenPicking)) {
                    EditableListViewWrapperDeprecated.this.mAnimationManager.startPickingNumberAnimation((ShowNumberWhenPicking) view);
                }
            }
        }
    };
    /* access modifiers changed from: private */
    public CheckState mCheckState;
    /* access modifiers changed from: private */
    public ActionMode mChoiceActionMode;
    /* access modifiers changed from: private */
    public EditActionMode mEditActionMode;
    private OnItemLongClickListener mEnterActionModeListener = new OnItemLongClickListener() {
        public boolean onItemLongClick(AdapterView<?> adapterView, View view, int i, long j) {
            if (i < EditableListViewWrapperDeprecated.this.mListHeaderCount) {
                return false;
            }
            EditableListViewWrapperDeprecated.this.startActionMode();
            EditableListViewWrapperDeprecated.this.mAnimationManager.setLongTouchPosition(i);
            return true;
        }
    };
    /* access modifiers changed from: private */
    public boolean mIsInActionMode;
    /* access modifiers changed from: private */
    public boolean mIsInChoiceMode;
    private OnItemClickListener mItemClickDelegate;
    /* access modifiers changed from: private */
    public int mListHeaderCount;
    /* access modifiers changed from: private */
    public int mListScrollState = 0;
    /* access modifiers changed from: private */
    public AbsListView mListView;
    /* access modifiers changed from: private */
    public MultiChoiceModeCallback mMultiChoiceModeCallback;
    private DataSetObserver mRestoreCheckStateObserver = new DataSetObserver() {
        public void onChanged() {
            super.onChanged();
            EditableListViewWrapperDeprecated.this.handleDataChanged();
        }

        public void onInvalidated() {
            super.onInvalidated();
            EditableListViewWrapperDeprecated.this.handleDataInvalid();
        }
    };
    private OnScrollListener mScrollDelegate = new OnScrollListener() {
        public void onScroll(AbsListView absListView, int i, int i2, int i3) {
            if (EditableListViewWrapperDeprecated.this.mScrollListener != null) {
                EditableListViewWrapperDeprecated.this.mScrollListener.onScroll(absListView, i, i2, i3);
            }
        }

        public void onScrollStateChanged(AbsListView absListView, int i) {
            EditableListViewWrapperDeprecated.this.mListScrollState = i;
            if (EditableListViewWrapperDeprecated.this.mScrollListener != null) {
                EditableListViewWrapperDeprecated.this.mScrollListener.onScrollStateChanged(absListView, i);
            }
        }
    };
    /* access modifiers changed from: private */
    public OnScrollListener mScrollListener;

    class AnimationManager implements OnTouchListener {
        private boolean isTurnOnScaleImageViewAni = true;
        private ScaleType mOriginalScaleType = null;
        private Scroll2PickHelper mScroll2PickHelper = new Scroll2PickHelper();

        private class MyScaleItemImageViewAnimatorListener implements AnimatorUpdateListener {
            private ImageView mImage;
            public Matrix mPrimaryMatrix;

            public MyScaleItemImageViewAnimatorListener(ImageView imageView) {
                this.mPrimaryMatrix = new Matrix(imageView.getImageMatrix());
                this.mImage = imageView;
            }

            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                AnimationManager.this.setImageViewScale(this.mImage, ((Float) valueAnimator.getAnimatedValue()).floatValue());
            }
        }

        class Scroll2PickHelper implements OnTouchListener {
            private boolean mHasEverPickLongTouchPosition;
            private int mLastPosition;
            private float mLastX;
            private float mLastY;
            private int mLongTouchPosition = -1;
            private Stack<Integer> mMathStack = new Stack<>();
            private int mMotionPosition;
            private float mMotionX;
            private boolean mScollXMode2PickEnable;
            private boolean mScollYMode2PickEnable;
            private boolean mScollYMode2PickEnableAfterLeft;
            private boolean mScollYMode2PickEnableAfterRight;

            Scroll2PickHelper() {
            }

            private void ifScrollYModeEnable(float f, float f2) {
                if (!this.mScollYMode2PickEnable) {
                    boolean z = true;
                    if (f - this.mMotionX > 10.0f && !this.mScollYMode2PickEnableAfterRight) {
                        this.mScollYMode2PickEnableAfterRight = true;
                    } else if (f - this.mMotionX < -10.0f && !this.mScollYMode2PickEnableAfterLeft) {
                        this.mScollYMode2PickEnableAfterLeft = true;
                    }
                    if (!this.mScollYMode2PickEnableAfterRight && !this.mScollYMode2PickEnableAfterLeft) {
                        z = false;
                    }
                    this.mScollYMode2PickEnable = z;
                    if (this.mScollYMode2PickEnable) {
                        this.mMotionPosition = EditableListViewWrapperDeprecated.this.mListView.pointToPosition((int) f, (int) f2);
                        this.mMathStack.push(Integer.valueOf(this.mMotionPosition));
                    }
                }
            }

            private boolean interceptEvent() {
                return this.mScollXMode2PickEnable || this.mScollYMode2PickEnable;
            }

            private boolean onTouchMove(MotionEvent motionEvent) {
                float x = motionEvent.getX();
                float y = motionEvent.getY();
                if (Math.abs(x - this.mLastX) >= Math.abs(y - this.mLastY) && Math.abs(x - this.mLastX) > 10.0f) {
                    int pointToPosition = EditableListViewWrapperDeprecated.this.mListView.pointToPosition((int) x, (int) y);
                    if (!(pointToPosition == -1 || pointToPosition == this.mLastPosition)) {
                        int itemIndexByItemPosition = ((StickyGridHeadersGridView) EditableListViewWrapperDeprecated.this.mListView).getItemIndexByItemPosition(pointToPosition);
                        if (pickOrNotByPosition(pointToPosition, !EditableListViewWrapperDeprecated.this.mCheckState.getCheckState(itemIndexByItemPosition))) {
                            EditableListViewWrapperDeprecated.this.updateActionMode();
                            EditableListViewWrapperDeprecated.this.mMultiChoiceModeCallback.mWrapped.onAllItemsCheckedStateChanged(EditableListViewWrapperDeprecated.this.mChoiceActionMode, true);
                            this.mScollXMode2PickEnable = true;
                            if (itemIndexByItemPosition == this.mLongTouchPosition) {
                                this.mHasEverPickLongTouchPosition = true;
                            }
                        }
                        this.mLastPosition = pointToPosition;
                    }
                    ifScrollYModeEnable(x, y);
                } else if (this.mScollYMode2PickEnable && Math.abs(y - this.mLastY) > 10.0f && Math.abs(x - this.mLastX) < Math.abs(y - this.mLastY)) {
                    int pointToPosition2 = EditableListViewWrapperDeprecated.this.mListView.pointToPosition((int) x, (int) y);
                    if (!(pointToPosition2 == -1 || pointToPosition2 == this.mLastPosition)) {
                        pickOrNotByPosition(pointToPosition2, true);
                        this.mLastPosition = pointToPosition2;
                        if (pointToPosition2 < this.mMotionPosition) {
                            if (this.mMathStack.isEmpty() || pointToPosition2 < ((Integer) this.mMathStack.peek()).intValue()) {
                                for (int i = this.mMotionPosition - 1; i >= pointToPosition2; i--) {
                                    if (this.mMathStack.isEmpty() || i < ((Integer) this.mMathStack.peek()).intValue()) {
                                        this.mMathStack.push(Integer.valueOf(i));
                                    }
                                }
                            } else {
                                while (((Integer) this.mMathStack.peek()).intValue() < pointToPosition2 && !this.mMathStack.isEmpty()) {
                                    pickOrNotByPosition(((Integer) this.mMathStack.pop()).intValue(), false);
                                }
                            }
                            for (int i2 = this.mMotionPosition; i2 >= pointToPosition2; i2--) {
                                pickOrNotByPosition(i2, true);
                            }
                        } else {
                            if (this.mMathStack.isEmpty() || pointToPosition2 > ((Integer) this.mMathStack.peek()).intValue()) {
                                for (int i3 = this.mMotionPosition + 1; i3 <= pointToPosition2; i3++) {
                                    if (this.mMathStack.isEmpty() || i3 > ((Integer) this.mMathStack.peek()).intValue()) {
                                        this.mMathStack.push(Integer.valueOf(i3));
                                    }
                                }
                            } else {
                                while (!this.mMathStack.isEmpty() && ((Integer) this.mMathStack.peek()).intValue() > pointToPosition2) {
                                    pickOrNotByPosition(((Integer) this.mMathStack.pop()).intValue(), false);
                                }
                            }
                            for (int i4 = this.mMotionPosition; i4 <= pointToPosition2; i4++) {
                                pickOrNotByPosition(i4, true);
                            }
                        }
                        EditableListViewWrapperDeprecated.this.updateActionMode();
                        EditableListViewWrapperDeprecated.this.mMultiChoiceModeCallback.mWrapped.onAllItemsCheckedStateChanged(EditableListViewWrapperDeprecated.this.mChoiceActionMode, true);
                    }
                }
                this.mLastX = x;
                this.mLastY = y;
                return interceptEvent();
            }

            private boolean pickOrNotByPosition(int i, boolean z) {
                View childAt = EditableListViewWrapperDeprecated.this.mListView.getChildAt(i - EditableListViewWrapperDeprecated.this.mListView.getFirstVisiblePosition());
                if (!(childAt instanceof BackgroundImageViewable)) {
                    return false;
                }
                ImageView backgroundImageView = ((BackgroundImageViewable) childAt).getBackgroundImageView();
                int itemIndexByItemPosition = ((StickyGridHeadersGridView) EditableListViewWrapperDeprecated.this.mListView).getItemIndexByItemPosition(i);
                AnimationManager.this.startScaleItemImageViewAnimationByScrollPicked(backgroundImageView, itemIndexByItemPosition, z);
                EditableListViewWrapperDeprecated.this.mCheckState.setCheckState(itemIndexByItemPosition, z);
                ((Checkable) childAt).setChecked(z);
                return true;
            }

            /* access modifiers changed from: private */
            public void setLongPressPosition(int i) {
                this.mLongTouchPosition = i;
                this.mHasEverPickLongTouchPosition = false;
            }

            public boolean onTouch(View view, MotionEvent motionEvent) {
                switch (motionEvent.getActionMasked()) {
                    case 0:
                        this.mScollXMode2PickEnable = false;
                        this.mMotionX = motionEvent.getX();
                        this.mLastX = motionEvent.getX();
                        this.mLastY = motionEvent.getY();
                        this.mLastPosition = 0;
                        this.mScollYMode2PickEnable = false;
                        this.mScollYMode2PickEnableAfterLeft = false;
                        this.mScollYMode2PickEnableAfterRight = false;
                        if (!this.mMathStack.isEmpty()) {
                            this.mMathStack.clear();
                            break;
                        }
                        break;
                    case 1:
                    case 3:
                        if (!EditableListViewWrapperDeprecated.this.isInChoiceMode()) {
                            return false;
                        }
                        this.mMathStack.clear();
                        if (!this.mHasEverPickLongTouchPosition && this.mLongTouchPosition != -1) {
                            this.mHasEverPickLongTouchPosition = true;
                            View childViewByItemIndex = ((StickyGridHeadersGridView) EditableListViewWrapperDeprecated.this.mListView).getChildViewByItemIndex(this.mLongTouchPosition);
                            if (childViewByItemIndex instanceof BackgroundImageViewable) {
                                AnimationManager.this.startScaleItemImageViewAnimation(((BackgroundImageViewable) childViewByItemIndex).getBackgroundImageView(), this.mLongTouchPosition, true, 0, 200);
                                EditableListViewWrapperDeprecated.this.mCheckState.setCheckState(this.mLongTouchPosition, true);
                                ((Checkable) childViewByItemIndex).setChecked(true);
                                EditableListViewWrapperDeprecated.this.updateActionMode();
                                EditableListViewWrapperDeprecated.this.mMultiChoiceModeCallback.mWrapped.onAllItemsCheckedStateChanged(EditableListViewWrapperDeprecated.this.mChoiceActionMode, true);
                            }
                        }
                        return interceptEvent();
                    case 2:
                        if (!EditableListViewWrapperDeprecated.this.isInChoiceMode()) {
                            return false;
                        }
                        boolean interceptEvent = interceptEvent();
                        boolean onTouchMove = onTouchMove(motionEvent);
                        if (EditableListViewWrapperDeprecated.this.mListScrollState != 0 && !interceptEvent && onTouchMove) {
                            EditableListViewWrapperDeprecated.this.mListView.setOnTouchListener(null);
                            EditableListViewWrapperDeprecated.this.mListView.requestDisallowInterceptTouchEvent(true);
                            MotionEvent obtain = MotionEvent.obtain(motionEvent);
                            obtain.setAction(1);
                            EditableListViewWrapperDeprecated.this.mListView.dispatchTouchEvent(obtain);
                            EditableListViewWrapperDeprecated.this.mListView.requestDisallowInterceptTouchEvent(false);
                            EditableListViewWrapperDeprecated.this.mListView.setOnTouchListener(EditableListViewWrapperDeprecated.this.mAnimationManager);
                        }
                        return onTouchMove;
                }
                return false;
            }
        }

        AnimationManager() {
        }

        private void finishImageViewScaleAnimatorIfNecessary(ImageView imageView) {
            ValueAnimator valueAnimator = (ValueAnimator) imageView.getTag(R.id.tag_animator);
            if (valueAnimator != null && valueAnimator.isRunning()) {
                valueAnimator.end();
            }
            if (valueAnimator != null) {
                float imageViewScale = getImageViewScale(imageView);
                float floatValue = ((Float) imageView.getTag(R.id.tag_target_scale)).floatValue();
                if (Math.abs(imageViewScale - floatValue) > Float.MIN_NORMAL) {
                    setImageViewScale(imageView, floatValue);
                }
            }
        }

        private float getImageViewScale(ImageView imageView) {
            if (imageView instanceof ScalableImageView) {
                return ((ScalableImageView) imageView).getMatrixScale();
            }
            return 0.0f;
        }

        /* access modifiers changed from: private */
        public void setImageViewScale(ImageView imageView, float f) {
            if (imageView instanceof ScalableImageView) {
                ((ScalableImageView) imageView).setMatrixScale(f);
            }
        }

        private void setItemImageView2OriginalScaleAfterEnlarge(ImageView imageView) {
            finishImageViewScaleAnimatorIfNecessary(imageView);
            setImageViewScale(imageView, 1.0f);
            if (this.mOriginalScaleType != null) {
                imageView.setScaleType(this.mOriginalScaleType);
            }
            imageView.setTag(R.id.tag_matrix, null);
            imageView.setTag(R.id.tag_animator, null);
        }

        private void setItemImageViewEnlargeAfterChecked(ImageView imageView, int i) {
            finishImageViewScaleAnimatorIfNecessary(imageView);
            imageView.setTag(R.id.tag_matrix, imageView.getImageMatrix());
            imageView.setTag(R.id.tag_pick_position, Integer.valueOf(i));
            setImageViewScale(imageView, 1.2f);
            imageView.setTag(R.id.tag_animator, null);
        }

        private void startScaleItemImageViewAnimationInternal(ImageView imageView, boolean z, int i, int i2, int i3) {
            ValueAnimator valueAnimator;
            if (this.isTurnOnScaleImageViewAni) {
                finishImageViewScaleAnimatorIfNecessary(imageView);
                Drawable drawable = imageView.getDrawable();
                if (drawable != null && drawable.getIntrinsicWidth() > 0) {
                    if (z) {
                        valueAnimator = ValueAnimator.ofFloat(new float[]{1.0f, 1.2f});
                        valueAnimator.addUpdateListener(new MyScaleItemImageViewAnimatorListener(imageView));
                        valueAnimator.setInterpolator(new CubicEaseOutInterpolator());
                        imageView.setTag(R.id.tag_matrix, imageView.getImageMatrix());
                        if (this.mOriginalScaleType == null) {
                            this.mOriginalScaleType = imageView.getScaleType();
                        }
                        imageView.setTag(R.id.tag_target_scale, Float.valueOf(1.2f));
                    } else {
                        valueAnimator = ValueAnimator.ofFloat(new float[]{1.2f, 1.0f});
                        valueAnimator.addUpdateListener(new MyScaleItemImageViewAnimatorListener(imageView));
                        valueAnimator.setInterpolator(new CubicEaseOutInterpolator());
                        imageView.setTag(R.id.tag_matrix, null);
                        imageView.setTag(R.id.tag_target_scale, Float.valueOf(1.0f));
                    }
                    imageView.setTag(R.id.tag_pick_position, Integer.valueOf(i));
                    valueAnimator.setDuration((long) i3);
                    valueAnimator.setStartDelay((long) i2);
                    imageView.setScaleType(ScaleType.MATRIX);
                    imageView.setTag(R.id.tag_animator, valueAnimator);
                    valueAnimator.start();
                }
            }
        }

        private void startScaleListViewAnimation(AbsListView absListView, boolean z) {
            float f = 1.0f;
            float f2 = 0.92f;
            if (z) {
                f = 0.92f;
                f2 = 1.0f;
            }
            for (int i = 0; i < absListView.getChildCount(); i++) {
                View childAt = absListView.getChildAt(i);
                if (childAt instanceof Checkable) {
                    ObjectAnimator duration = ObjectAnimator.ofPropertyValuesHolder(childAt, new PropertyValuesHolder[]{PropertyValuesHolder.ofFloat("scaleX", new float[]{f, f2}), PropertyValuesHolder.ofFloat("scaleY", new float[]{f, f2})}).setDuration(300);
                    duration.setInterpolator(new CubicEaseOutInterpolator());
                    duration.start();
                    childAt.setTag(R.id.tag_scale_factor, Float.valueOf(f2));
                    if (z && (childAt instanceof BackgroundImageViewable)) {
                        ImageView backgroundImageView = ((BackgroundImageViewable) childAt).getBackgroundImageView();
                        if (backgroundImageView.getTag(R.id.tag_matrix) != null) {
                            startScaleItemImageViewAnimationInternal(backgroundImageView, false, ((Integer) backgroundImageView.getTag(R.id.tag_pick_position)).intValue(), 0, 300);
                        }
                    }
                }
            }
        }

        public void disableScaleImageViewAni() {
            this.isTurnOnScaleImageViewAni = false;
        }

        public void enableScaleImageViewAni() {
            this.isTurnOnScaleImageViewAni = true;
        }

        public boolean onTouch(View view, MotionEvent motionEvent) {
            if (!(EditableListViewWrapperDeprecated.this.mListView instanceof StickyGridHeadersGridView)) {
                return false;
            }
            return this.mScroll2PickHelper.onTouch(view, motionEvent);
        }

        public void resetViewPropertyIfNeed(View view, View view2, int i) {
            Object tag = view.getTag(R.id.tag_scale_factor);
            if (EditableListViewWrapperDeprecated.this.isInChoiceMode()) {
                if (tag == null || !MiscUtil.floatEquals(((Float) tag).floatValue(), 0.92f)) {
                    view.setScaleX(0.92f);
                    view.setScaleY(0.92f);
                    view.setTag(R.id.tag_scale_factor, Float.valueOf(0.92f));
                }
            } else if (tag == null || !MiscUtil.floatEquals(((Float) tag).floatValue(), 1.0f)) {
                view.setScaleX(1.0f);
                view.setScaleY(1.0f);
                view.setTag(R.id.tag_scale_factor, Float.valueOf(1.0f));
            }
            if (this.isTurnOnScaleImageViewAni && (view instanceof BackgroundImageViewable)) {
                ImageView backgroundImageView = ((BackgroundImageViewable) view).getBackgroundImageView();
                if (EditableListViewWrapperDeprecated.this.isInChoiceMode()) {
                    if (!(backgroundImageView.getTag(R.id.tag_pick_position) == null || ((Integer) backgroundImageView.getTag(R.id.tag_pick_position)).intValue() == i || EditableListViewWrapperDeprecated.this.mCheckState.getCheckState(i))) {
                        setItemImageView2OriginalScaleAfterEnlarge(backgroundImageView);
                    }
                    if (EditableListViewWrapperDeprecated.this.mCheckState.getCheckState(i) && backgroundImageView.getTag(R.id.tag_matrix) == null) {
                        setItemImageViewEnlargeAfterChecked(backgroundImageView, i);
                    }
                } else if (backgroundImageView.getTag(R.id.tag_matrix) != null) {
                    setItemImageView2OriginalScaleAfterEnlarge(backgroundImageView);
                }
            }
        }

        public void setLongTouchPosition(int i) {
            this.mScroll2PickHelper.setLongPressPosition(i);
        }

        public void startEnterActionModeAni() {
            startScaleListViewAnimation(EditableListViewWrapperDeprecated.this.mListView, false);
        }

        public void startExistActionModeAni() {
            startScaleListViewAnimation(EditableListViewWrapperDeprecated.this.mListView, true);
        }

        public void startPickingNumberAnimation(ShowNumberWhenPicking showNumberWhenPicking) {
            ImageView backgroundMask = showNumberWhenPicking.getBackgroundMask();
            backgroundMask.setVisibility(0);
            TextView showNumberTextView = showNumberWhenPicking.getShowNumberTextView();
            showNumberTextView.setText(String.format("%d", new Object[]{Integer.valueOf(EditableListViewWrapperDeprecated.this.mCheckState.getCount())}));
            ObjectAnimator duration = ObjectAnimator.ofPropertyValuesHolder(showNumberTextView, new PropertyValuesHolder[]{PropertyValuesHolder.ofFloat("alpha", new float[]{0.0f, 1.0f}), PropertyValuesHolder.ofFloat("scaleX", new float[]{0.8f, 1.0f}), PropertyValuesHolder.ofFloat("scaleY", new float[]{0.8f, 1.0f})}).setDuration(300);
            duration.setInterpolator(new CubicEaseOutInterpolator());
            ObjectAnimator duration2 = ObjectAnimator.ofPropertyValuesHolder(showNumberTextView, new PropertyValuesHolder[]{PropertyValuesHolder.ofFloat("alpha", new float[]{1.0f, 0.0f})}).setDuration(200);
            duration2.setInterpolator(new CubicEaseOutInterpolator());
            duration2.setStartDelay(200);
            AnimatorSet animatorSet = new AnimatorSet();
            animatorSet.playSequentially(new Animator[]{duration, duration2});
            animatorSet.start();
            ObjectAnimator duration3 = ObjectAnimator.ofPropertyValuesHolder(backgroundMask, new PropertyValuesHolder[]{PropertyValuesHolder.ofFloat("alpha", new float[]{1.0f, 0.0f})}).setDuration(700);
            duration3.setInterpolator(new CubicEaseOutInterpolator());
            duration3.start();
        }

        public void startScaleAllItemImageViewAnimation(StickyGridHeadersGridView stickyGridHeadersGridView, boolean z) {
            int i = 0;
            for (int firstVisiblePosition = stickyGridHeadersGridView.getFirstVisiblePosition(); firstVisiblePosition < stickyGridHeadersGridView.getLastVisiblePosition(); firstVisiblePosition++) {
                View childAt = stickyGridHeadersGridView.getChildAt(firstVisiblePosition - stickyGridHeadersGridView.getFirstVisiblePosition());
                if (childAt instanceof BackgroundImageViewable) {
                    int i2 = i + 1;
                    startScaleItemImageViewAnimation(((BackgroundImageViewable) childAt).getBackgroundImageView(), stickyGridHeadersGridView.getItemIndexByItemPosition(firstVisiblePosition), z, i * 40);
                    i = i2;
                }
            }
        }

        public void startScaleItemImageViewAnimation(ImageView imageView, int i) {
            if (imageView.getTag(R.id.tag_matrix) == null) {
                startScaleItemImageViewAnimationInternal(imageView, true, i, 100, 300);
            } else {
                startScaleItemImageViewAnimationInternal(imageView, false, i, 100, 300);
            }
        }

        public void startScaleItemImageViewAnimation(ImageView imageView, int i, boolean z, int i2) {
            startScaleItemImageViewAnimation(imageView, i, z, i2, 300);
        }

        public void startScaleItemImageViewAnimation(ImageView imageView, int i, boolean z, int i2, int i3) {
            if (imageView.getTag(R.id.tag_matrix) == null && z) {
                startScaleItemImageViewAnimationInternal(imageView, true, i, i2, i3);
            }
            if (imageView.getTag(R.id.tag_matrix) != null && !z) {
                startScaleItemImageViewAnimationInternal(imageView, false, i, i2, i3);
            }
        }

        public void startScaleItemImageViewAnimationByScrollPicked(ImageView imageView, int i, boolean z) {
            startScaleItemImageViewAnimation(imageView, i, z, 100);
        }
    }

    private static class CheckState {
        protected Mode mCheckMode;
        protected SparseBooleanArray mCheckState;
        protected long mIndex;
        private long mReverseIndex;
        protected LongSparseArray<Long> mReverseModeSelectedIdIndex;
        protected Source mSource;
        protected Status mStatus;
        protected LongSparseArray<Long> mUserSelectedIdIndex;

        protected enum Mode {
            NORMAL,
            REVERSE
        }

        public interface Source {
            int getCount();

            long getItemId(int i);
        }

        protected enum Status {
            DIRTY,
            CLEAN
        }

        private CheckState() {
            this.mUserSelectedIdIndex = new LongSparseArray<>(0);
            this.mReverseModeSelectedIdIndex = new LongSparseArray<>(0);
            this.mCheckMode = Mode.NORMAL;
            this.mCheckState = new SparseBooleanArray(0);
            this.mStatus = Status.CLEAN;
            this.mIndex = 0;
            this.mReverseIndex = 0;
        }

        private long[] getSortedKeysByIndex(long[] jArr, long[] jArr2) {
            if (jArr.length != jArr2.length) {
                return jArr;
            }
            SyncSortUtil.sort(jArr, jArr2, 0, jArr.length - 1);
            return jArr;
        }

        private int[] getSortedPositionsByIndex(int[] iArr, long[] jArr) {
            if (iArr.length != jArr.length) {
                return iArr;
            }
            SyncSortUtil.sort(iArr, jArr, 0, iArr.length - 1);
            return iArr;
        }

        public void bind(Source source) {
            if (source != null) {
                this.mSource = source;
            }
        }

        public void clear() {
            this.mCheckMode = Mode.NORMAL;
            this.mStatus = Status.CLEAN;
            this.mCheckState.clear();
            this.mUserSelectedIdIndex.clear();
            this.mReverseModeSelectedIdIndex.clear();
            this.mIndex = 0;
            this.mReverseIndex = 0;
        }

        public boolean getCheckState(int i) {
            return this.mStatus == Status.CLEAN ? this.mCheckState.get(i, false) : getCheckState(this.mSource.getItemId(i));
        }

        public boolean getCheckState(long j) {
            if (this.mCheckMode == Mode.REVERSE) {
                if (this.mUserSelectedIdIndex.get(j) != null) {
                    return false;
                }
            } else if (this.mUserSelectedIdIndex.get(j) == null) {
                return false;
            }
            return true;
        }

        public long[] getCheckedItemIds() {
            int count = getCount();
            int i = 0;
            if (count == 0) {
                return new long[0];
            }
            if (this.mCheckMode == Mode.NORMAL) {
                long[] jArr = new long[this.mUserSelectedIdIndex.size()];
                long[] jArr2 = new long[this.mUserSelectedIdIndex.size()];
                int i2 = 0;
                while (i < this.mUserSelectedIdIndex.size() && i2 < count) {
                    int i3 = i2 + 1;
                    jArr[i2] = this.mUserSelectedIdIndex.keyAt(i);
                    jArr2[i2] = ((Long) this.mUserSelectedIdIndex.valueAt(i)).longValue();
                    i++;
                    i2 = i3;
                }
                return getSortedKeysByIndex(jArr, jArr2);
            }
            long[] jArr3 = new long[count];
            int i4 = 0;
            for (int i5 = 0; i5 < this.mSource.getCount(); i5++) {
                long itemId = this.mSource.getItemId(i5);
                if (this.mUserSelectedIdIndex.indexOfKey(itemId) < 0 && this.mReverseModeSelectedIdIndex.indexOfKey(itemId) < 0) {
                    int i6 = i4 + 1;
                    jArr3[i4] = itemId;
                    i4 = i6;
                }
            }
            if (this.mReverseModeSelectedIdIndex.size() > 0) {
                long[] jArr4 = new long[this.mReverseModeSelectedIdIndex.size()];
                long[] jArr5 = new long[this.mReverseModeSelectedIdIndex.size()];
                for (int i7 = 0; i7 < this.mReverseModeSelectedIdIndex.size(); i7++) {
                    jArr4[i7] = this.mReverseModeSelectedIdIndex.keyAt(i7);
                    jArr5[i7] = ((Long) this.mReverseModeSelectedIdIndex.valueAt(i7)).longValue();
                }
                long[] sortedKeysByIndex = getSortedKeysByIndex(jArr4, jArr5);
                while (i < sortedKeysByIndex.length && i4 < count) {
                    int i8 = i4 + 1;
                    jArr3[i4] = sortedKeysByIndex[i];
                    i++;
                    i4 = i8;
                }
            }
            return jArr3;
        }

        public int[] getCheckedItemOrderedPositions() {
            int count = getCount();
            int i = 0;
            if (count == 0) {
                return new int[0];
            }
            if (this.mCheckMode == Mode.NORMAL) {
                int[] iArr = new int[this.mUserSelectedIdIndex.size()];
                long[] jArr = new long[this.mUserSelectedIdIndex.size()];
                int i2 = 0;
                while (i < this.mSource.getCount() && i2 < count) {
                    long itemId = this.mSource.getItemId(i);
                    if (this.mUserSelectedIdIndex.indexOfKey(itemId) >= 0) {
                        int i3 = i2 + 1;
                        iArr[i2] = i;
                        jArr[i2] = ((Long) this.mUserSelectedIdIndex.get(itemId)).longValue();
                        i2 = i3;
                    }
                    i++;
                }
                return getSortedPositionsByIndex(iArr, jArr);
            }
            int[] iArr2 = new int[count];
            int[] iArr3 = new int[this.mReverseModeSelectedIdIndex.size()];
            long[] jArr2 = new long[this.mReverseModeSelectedIdIndex.size()];
            int i4 = 0;
            int i5 = 0;
            for (int i6 = 0; i6 < this.mSource.getCount(); i6++) {
                long itemId2 = this.mSource.getItemId(i6);
                if (this.mUserSelectedIdIndex.indexOfKey(itemId2) < 0 && this.mReverseModeSelectedIdIndex.indexOfKey(itemId2) < 0) {
                    int i7 = i4 + 1;
                    iArr2[i4] = i6;
                    i4 = i7;
                }
                if (this.mReverseModeSelectedIdIndex.size() >= 0 && this.mReverseModeSelectedIdIndex.indexOfKey(itemId2) >= 0) {
                    int i8 = i5 + 1;
                    iArr3[i5] = i6;
                    jArr2[i5] = ((Long) this.mReverseModeSelectedIdIndex.get(itemId2)).longValue();
                    i5 = i8;
                }
            }
            if (this.mReverseModeSelectedIdIndex.size() > 0) {
                int[] sortedPositionsByIndex = getSortedPositionsByIndex(iArr3, jArr2);
                while (i < sortedPositionsByIndex.length && i4 < count) {
                    int i9 = i4 + 1;
                    iArr2[i4] = sortedPositionsByIndex[i];
                    i++;
                    i4 = i9;
                }
            }
            return iArr2;
        }

        public SparseBooleanArray getCheckedItemPositions() {
            if (this.mStatus == Status.DIRTY) {
                this.mCheckState = new SparseBooleanArray(this.mSource.getCount());
                for (int i = 0; i < this.mSource.getCount(); i++) {
                    long itemId = this.mSource.getItemId(i);
                    this.mCheckState.append(i, (this.mCheckMode == Mode.NORMAL && this.mUserSelectedIdIndex.indexOfKey(itemId) >= 0) || (this.mCheckMode == Mode.REVERSE && this.mUserSelectedIdIndex.indexOfKey(itemId) < 0));
                }
                this.mStatus = Status.CLEAN;
            }
            return this.mCheckState.clone();
        }

        public int getCount() {
            return this.mCheckMode == Mode.NORMAL ? this.mUserSelectedIdIndex.size() : this.mSource.getCount() - this.mUserSelectedIdIndex.size();
        }

        public void handleDataChanged() {
            this.mCheckState.clear();
            this.mStatus = Status.DIRTY;
        }

        public void setAllChecked(boolean z) {
            this.mStatus = Status.CLEAN;
            this.mCheckMode = z ? Mode.REVERSE : Mode.NORMAL;
            this.mUserSelectedIdIndex.clear();
            this.mReverseModeSelectedIdIndex.clear();
            this.mIndex = 0;
            this.mReverseIndex = 0;
            for (int i = 0; i < this.mSource.getCount(); i++) {
                this.mCheckState.append(i, z);
            }
        }

        public void setCheckState(int i, boolean z) {
            if (this.mStatus == Status.CLEAN) {
                this.mCheckState.put(i, z);
            }
            long itemId = this.mSource.getItemId(i);
            if (this.mCheckMode == Mode.NORMAL) {
                if (z) {
                    LongSparseArray<Long> longSparseArray = this.mUserSelectedIdIndex;
                    long j = this.mIndex;
                    this.mIndex = 1 + j;
                    longSparseArray.put(itemId, Long.valueOf(j));
                    return;
                }
                this.mUserSelectedIdIndex.remove(itemId);
            } else if (z) {
                this.mUserSelectedIdIndex.remove(itemId);
                LongSparseArray<Long> longSparseArray2 = this.mReverseModeSelectedIdIndex;
                long j2 = this.mReverseIndex;
                this.mReverseIndex = 1 + j2;
                longSparseArray2.put(itemId, Long.valueOf(j2));
            } else {
                LongSparseArray<Long> longSparseArray3 = this.mUserSelectedIdIndex;
                long j3 = this.mIndex;
                this.mIndex = 1 + j3;
                longSparseArray3.put(itemId, Long.valueOf(j3));
                this.mReverseModeSelectedIdIndex.remove(itemId);
            }
        }
    }

    private static class CheckStateWithGroup extends CheckState {
        private SparseBooleanArray mGroupCheckState = new SparseBooleanArray(0);
        private AnimationManager mListAnimationManager;
        private StickyGridHeadersGridView mListView;

        public CheckStateWithGroup(AbsListView absListView, AnimationManager animationManager) {
            super();
            this.mListView = (StickyGridHeadersGridView) absListView;
            this.mListAnimationManager = animationManager;
        }

        private void setCheckStateInternal(int i, boolean z, boolean z2) {
            boolean z3;
            super.setCheckState(i, z);
            if (this.mStatus == Status.CLEAN && z2) {
                int groupIndexByItemIndex = this.mListView.getGroupIndexByItemIndex(i);
                boolean groupCheckState = getGroupCheckState(groupIndexByItemIndex);
                int groupItemStartIndex = this.mListView.getGroupItemStartIndex(groupIndexByItemIndex);
                int i2 = groupItemStartIndex;
                while (true) {
                    if (i2 >= this.mListView.getGroupItemsCount(groupIndexByItemIndex) + groupItemStartIndex) {
                        z3 = true;
                        break;
                    } else if (!getCheckState(i2)) {
                        z3 = false;
                        break;
                    } else {
                        i2++;
                    }
                }
                if (groupCheckState != z3) {
                    this.mGroupCheckState.put(groupIndexByItemIndex, z3);
                    this.mListView.notifyChanged();
                }
            }
        }

        public void clear() {
            super.clear();
            this.mGroupCheckState.clear();
        }

        public boolean getGroupCheckState(int i) {
            return this.mGroupCheckState.get(i);
        }

        public void setAllChecked(boolean z) {
            super.setAllChecked(z);
            for (int i = 0; i < this.mListView.getHeaderNum(); i++) {
                this.mGroupCheckState.put(i, z);
            }
            this.mListView.notifyChanged();
        }

        public void setCheckState(int i, boolean z) {
            setCheckStateInternal(i, z, true);
        }

        public boolean setGroupCheckState(int i) {
            boolean z = !getGroupCheckState(i);
            this.mGroupCheckState.put(i, z);
            StickyGridHeadersGridView stickyGridHeadersGridView = this.mListView;
            int groupItemStartIndex = stickyGridHeadersGridView.getGroupItemStartIndex(i);
            int i2 = 0;
            for (int i3 = groupItemStartIndex; i3 < stickyGridHeadersGridView.getGroupItemsCount(i) + groupItemStartIndex; i3++) {
                setCheckStateInternal(i3, z, false);
                View childViewByItemIndex = this.mListView.getChildViewByItemIndex(i3);
                if (childViewByItemIndex != null && (childViewByItemIndex instanceof BackgroundImageViewable)) {
                    int i4 = i2 + 1;
                    this.mListAnimationManager.startScaleItemImageViewAnimation(((BackgroundImageViewable) childViewByItemIndex).getBackgroundImageView(), i3, z, i2 * 40);
                    i2 = i4;
                }
            }
            return z;
        }
    }

    private class MultiChoiceModeCallback implements Callback {
        /* access modifiers changed from: private */
        public MultiChoiceModeListener mWrapped;

        private MultiChoiceModeCallback() {
        }

        public boolean hasWrappedCallback() {
            return this.mWrapped != null;
        }

        public boolean onActionItemClicked(ActionMode actionMode, MenuItem menuItem) {
            if (this.mWrapped.onActionItemClicked(actionMode, menuItem)) {
                return true;
            }
            switch (menuItem.getItemId()) {
                case 16908313:
                    actionMode.finish();
                    return true;
                case 16908314:
                    EditableListViewWrapperDeprecated.this.setAllItemsCheckState(!EditableListViewWrapperDeprecated.this.isAllItemsChecked());
                    return true;
                default:
                    return false;
            }
        }

        public boolean onCreateActionMode(ActionMode actionMode, Menu menu) {
            if (!this.mWrapped.onCreateActionMode(actionMode, menu)) {
                return false;
            }
            actionMode.setTitle(miui.R.string.select_item);
            if (actionMode instanceof EditActionMode) {
                EditActionMode editActionMode = (EditActionMode) actionMode;
                MiuiSdkCompat.setEditActionModeButton(EditableListViewWrapperDeprecated.this.mListView.getContext(), editActionMode, 16908313, 3);
                MiuiSdkCompat.setEditActionModeButton(EditableListViewWrapperDeprecated.this.mListView.getContext(), editActionMode, 16908314, 0);
            }
            EditableListViewWrapperDeprecated.this.enterChoiceMode();
            EditableListViewWrapperDeprecated.this.mIsInActionMode = true;
            return true;
        }

        public void onDestroyActionMode(ActionMode actionMode) {
            EditableListViewWrapperDeprecated.this.mEditActionMode = null;
            EditableListViewWrapperDeprecated.this.mChoiceActionMode = null;
            EditableListViewWrapperDeprecated.this.mIsInChoiceMode = false;
            EditableListViewWrapperDeprecated.this.exitChoiceMode();
            this.mWrapped.onDestroyActionMode(actionMode);
            EditableListViewWrapperDeprecated.this.mIsInActionMode = false;
        }

        public boolean onPrepareActionMode(ActionMode actionMode, Menu menu) {
            return this.mWrapped.onPrepareActionMode(actionMode, menu);
        }

        public void setWrapped(MultiChoiceModeListener multiChoiceModeListener) {
            this.mWrapped = multiChoiceModeListener;
        }
    }

    private class SimpleTimeLineWrapper extends SimpleWrapper implements StickyGridHeadersSimpleAdapter {
        private StickyGridHeadersSimpleAdapter mWrapped;

        public SimpleTimeLineWrapper(StickyGridHeadersSimpleAdapter stickyGridHeadersSimpleAdapter) {
            super(stickyGridHeadersSimpleAdapter);
            this.mWrapped = stickyGridHeadersSimpleAdapter;
        }

        public View getDividerView(int i, View view, ViewGroup viewGroup) {
            return this.mWrapped.getDividerView(i, view, viewGroup);
        }

        public long getHeaderId(int i) {
            return this.mWrapped.getHeaderId(i);
        }

        public View getHeaderView(int i, View view, ViewGroup viewGroup) {
            View headerView = this.mWrapped.getHeaderView(i, view, viewGroup);
            if (headerView instanceof CheckableView) {
                EditableListViewWrapperDeprecated.this.setCheckableHeaderView((CheckableView) headerView, ((StickyGridHeadersGridView) EditableListViewWrapperDeprecated.this.mListView).getGroupIndexByItemIndex(i));
            }
            return headerView;
        }

        public boolean shouldDrawDivider() {
            return this.mWrapped.shouldDrawDivider();
        }
    }

    private class SimpleWrapper implements ListAdapter, Source {
        /* access modifiers changed from: private */
        public ListAdapter mWrapped;

        public SimpleWrapper(ListAdapter listAdapter) {
            this.mWrapped = listAdapter;
        }

        public boolean areAllItemsEnabled() {
            return this.mWrapped.areAllItemsEnabled();
        }

        public int getCount() {
            return this.mWrapped.getCount();
        }

        public Object getItem(int i) {
            return this.mWrapped.getItem(i);
        }

        public long getItemId(int i) {
            return this.mWrapped.getItemId(i);
        }

        public int getItemViewType(int i) {
            return this.mWrapped.getItemViewType(i);
        }

        public View getView(int i, View view, ViewGroup viewGroup) {
            View view2 = this.mWrapped.getView(i, view, viewGroup);
            if (view2 instanceof Checkable) {
                Checkable checkable = (Checkable) view2;
                checkable.setCheckable(EditableListViewWrapperDeprecated.this.isInChoiceMode());
                checkable.setChecked(EditableListViewWrapperDeprecated.this.mCheckState.getCheckState(i));
                EditableListViewWrapperDeprecated.this.mAnimationManager.resetViewPropertyIfNeed(view2, view, i);
                return view2;
            }
            throw new IllegalArgumentException("view must be instance of Checkable!");
        }

        public int getViewTypeCount() {
            return this.mWrapped.getViewTypeCount();
        }

        public ListAdapter getWrapped() {
            return this.mWrapped;
        }

        public boolean hasStableIds() {
            return this.mWrapped.hasStableIds();
        }

        public boolean isEmpty() {
            return this.mWrapped.isEmpty();
        }

        public boolean isEnabled(int i) {
            return this.mWrapped.isEnabled(i);
        }

        public void registerDataSetObserver(DataSetObserver dataSetObserver) {
            this.mWrapped.registerDataSetObserver(dataSetObserver);
        }

        public void unregisterDataSetObserver(DataSetObserver dataSetObserver) {
            this.mWrapped.unregisterDataSetObserver(dataSetObserver);
        }
    }

    private class TimeLineWrapper extends SimpleWrapper implements StickyGridHeadersBaseAdapter {
        private StickyGridHeadersBaseAdapter mWrapped;

        public TimeLineWrapper(StickyGridHeadersBaseAdapter stickyGridHeadersBaseAdapter) {
            super(stickyGridHeadersBaseAdapter);
            this.mWrapped = stickyGridHeadersBaseAdapter;
        }

        public int getCountForHeader(int i) {
            return this.mWrapped.getCountForHeader(i);
        }

        public View getDividerView(int i, View view, ViewGroup viewGroup) {
            return this.mWrapped.getDividerView(i, view, viewGroup);
        }

        public View getHeaderView(int i, View view, ViewGroup viewGroup) {
            View headerView = this.mWrapped.getHeaderView(i, view, viewGroup);
            if (headerView instanceof CheckableView) {
                EditableListViewWrapperDeprecated.this.setCheckableHeaderView((CheckableView) headerView, i);
            }
            return headerView;
        }

        public int getNumHeaders() {
            return this.mWrapped.getNumHeaders();
        }

        public boolean shouldDrawDivider() {
            return this.mWrapped.shouldDrawDivider();
        }
    }

    public EditableListViewWrapperDeprecated(AbsListView absListView) {
        if (absListView != null) {
            this.mListView = absListView;
            this.mAdapterWrappers = new ArrayMap<>();
            this.mListView.setOnTouchListener(this.mAnimationManager);
            this.mListView.setOnScrollListener(this.mScrollDelegate);
            return;
        }
        throw new IllegalArgumentException("listview can't be null");
    }

    private void checkMultiChoiceModeCallback() {
        if (this.mMultiChoiceModeCallback == null || !this.mMultiChoiceModeCallback.hasWrappedCallback()) {
            throw new IllegalStateException("no MultiChoiceModeListener is set");
        }
    }

    /* access modifiers changed from: private */
    public void enterChoiceMode() {
        this.mListView.setLongClickable(false);
        this.mListView.setOnItemClickListener(this.mCheckItemListener);
        for (int i = 0; i < this.mListView.getChildCount(); i++) {
            View childAt = this.mListView.getChildAt(i);
            if (childAt instanceof Checkable) {
                ((Checkable) childAt).setCheckable(true);
            }
        }
        this.mAnimationManager.startEnterActionModeAni();
        this.mCheckState.clear();
        notifyDataChanged();
    }

    /* access modifiers changed from: private */
    public void exitChoiceMode() {
        this.mListView.setLongClickable(true);
        this.mListView.setOnItemClickListener(this.mItemClickDelegate);
        for (int i = 0; i < this.mListView.getChildCount(); i++) {
            View childAt = this.mListView.getChildAt(i);
            if (childAt instanceof Checkable) {
                Checkable checkable = (Checkable) childAt;
                checkable.setCheckable(false);
                checkable.setChecked(false);
            }
        }
        this.mAnimationManager.startExistActionModeAni();
        this.mCheckState.clear();
        notifyDataChanged();
    }

    /* access modifiers changed from: private */
    public void handleDataChanged() {
        this.mCheckState.handleDataChanged();
        updateActionMode();
    }

    /* access modifiers changed from: private */
    public void notifyDataChanged() {
        if (this.mListView instanceof StickyGridHeadersGridView) {
            ((StickyGridHeadersGridView) this.mListView).notifyChanged();
        }
    }

    /* access modifiers changed from: private */
    public void setCheckableHeaderView(CheckableView checkableView, final int i) {
        checkableView.setCheckable(isInChoiceMode());
        if (isInChoiceMode()) {
            checkableView.setCheckableListener(new OnClickListener() {
                public void onClick(View view) {
                    EditableListViewWrapperDeprecated.this.setGroupCheck(i);
                    EditableListViewWrapperDeprecated.this.notifyDataChanged();
                    if (EditableListViewWrapperDeprecated.this.mMultiChoiceModeCallback != null) {
                        EditableListViewWrapperDeprecated.this.mMultiChoiceModeCallback.mWrapped.onAllItemsCheckedStateChanged(EditableListViewWrapperDeprecated.this.mChoiceActionMode, true);
                    }
                }
            });
            checkableView.setChecked(((CheckStateWithGroup) this.mCheckState).getGroupCheckState(i));
        }
    }

    /* access modifiers changed from: private */
    public boolean setGroupCheck(int i) {
        if (!(this.mListView instanceof StickyGridHeadersGridView)) {
            return false;
        }
        boolean groupCheckState = ((CheckStateWithGroup) this.mCheckState).setGroupCheckState(i);
        updateOnScreenViewsState();
        updateActionMode();
        return groupCheckState;
    }

    /* access modifiers changed from: private */
    public void updateActionMode() {
        if (this.mChoiceActionMode != null) {
            if (this.mCheckState.getCount() == 0) {
                this.mChoiceActionMode.setTitle(this.mListView.getResources().getString(miui.R.string.select_item));
            } else {
                this.mChoiceActionMode.setTitle(this.mListView.getResources().getQuantityString(miui.R.plurals.items_selected, this.mCheckState.getCount(), new Object[]{Integer.valueOf(this.mCheckState.getCount())}));
            }
            if (this.mEditActionMode != null) {
                MiuiSdkCompat.setEditActionModeButton(this.mListView.getContext(), this.mEditActionMode, 16908314, isAllItemsChecked() ? 1 : 0);
            }
        }
    }

    private void updateOnScreenViewsState() {
        int firstVisiblePosition = this.mListView.getFirstVisiblePosition();
        for (int i = this.mListHeaderCount; i < this.mListView.getChildCount(); i++) {
            View childAt = this.mListView.getChildAt(i);
            if (childAt instanceof Checkable) {
                ((Checkable) childAt).setChecked(this.mCheckState.getCheckState(this.mListView.getItemIdAtPosition(firstVisiblePosition + i)));
            }
        }
    }

    public void clearChoices() {
        this.mCheckState.clear();
        updateActionMode();
        updateOnScreenViewsState();
    }

    public void disableScaleImageViewAniWhenInActionMode() {
        this.mAnimationManager.disableScaleImageViewAni();
    }

    public void enableScaleImageViewAniWhenInActionMode() {
        this.mAnimationManager.enableScaleImageViewAni();
    }

    public ListAdapter getAdapter() {
        if (this.mAdapterWrapper != null) {
            return this.mAdapterWrapper.mWrapped;
        }
        return null;
    }

    public int getCheckedItemCount() {
        return this.mCheckState.getCount();
    }

    public long[] getCheckedItemIds() {
        return this.mCheckState.getCheckedItemIds();
    }

    public int[] getCheckedItemOrderedPositions() {
        return this.mCheckState.getCheckedItemOrderedPositions();
    }

    public SparseBooleanArray getCheckedItemPositions() {
        return this.mCheckState.getCheckedItemPositions();
    }

    public List<CheckedItem> getCheckedItems() {
        ArrayList arrayList = new ArrayList();
        if (this.mAdapterWrapper != null && (this.mAdapterWrapper.getWrapped() instanceof BaseMediaAdapterDeprecated)) {
            BaseMediaAdapterDeprecated baseMediaAdapterDeprecated = (BaseMediaAdapterDeprecated) this.mAdapterWrapper.getWrapped();
            int[] checkedItemOrderedPositions = getCheckedItemOrderedPositions();
            if (checkedItemOrderedPositions != null && checkedItemOrderedPositions.length > 0) {
                for (int checkedItem : checkedItemOrderedPositions) {
                    CheckedItem checkedItem2 = baseMediaAdapterDeprecated.getCheckedItem(checkedItem);
                    if (checkedItem2 != null) {
                        arrayList.add(checkedItem2);
                    }
                }
            }
        }
        return arrayList;
    }

    public void handleDataInvalid() {
        this.mCheckState.clear();
        updateActionMode();
    }

    public boolean isAllItemsChecked() {
        int count = this.mCheckState.getCount();
        return count > 0 && count == this.mAdapterWrapper.getCount();
    }

    public boolean isCheckedItemContainVideo() {
        if (this.mAdapterWrapper != null && (this.mAdapterWrapper.getWrapped() instanceof BaseMediaAdapterDeprecated)) {
            BaseMediaAdapterDeprecated baseMediaAdapterDeprecated = (BaseMediaAdapterDeprecated) this.mAdapterWrapper.getWrapped();
            SparseBooleanArray checkedItemPositions = getCheckedItemPositions();
            if (checkedItemPositions != null && checkedItemPositions.size() > 0) {
                for (int i = 0; i < checkedItemPositions.size(); i++) {
                    if (checkedItemPositions.valueAt(i) && FileMimeUtil.isVideoFromMimeType(baseMediaAdapterDeprecated.getMimeType(checkedItemPositions.keyAt(i)))) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    public boolean isInActionMode() {
        return this.mIsInActionMode;
    }

    public boolean isInChoiceMode() {
        return this.mIsInChoiceMode;
    }

    public void setAdapter(ListAdapter listAdapter) {
        SimpleWrapper simpleWrapper = this.mAdapterWrapper;
        this.mAdapterWrapper = (SimpleWrapper) this.mAdapterWrappers.get(listAdapter);
        if (simpleWrapper == null || simpleWrapper != this.mAdapterWrapper) {
            if (this.mAdapterWrapper != null) {
                this.mAdapterWrapper.unregisterDataSetObserver(this.mRestoreCheckStateObserver);
            }
            this.mCheckState = new CheckState();
            if (listAdapter == null) {
                this.mAdapterWrapper = null;
                this.mListView.setAdapter(null);
                handleDataInvalid();
                return;
            }
            if (this.mAdapterWrapper == null) {
                if (listAdapter instanceof StickyGridHeadersBaseAdapter) {
                    this.mAdapterWrapper = new TimeLineWrapper((StickyGridHeadersBaseAdapter) listAdapter);
                } else if (listAdapter instanceof StickyGridHeadersSimpleAdapter) {
                    this.mAdapterWrapper = new SimpleTimeLineWrapper((StickyGridHeadersSimpleAdapter) listAdapter);
                } else {
                    this.mAdapterWrapper = new SimpleWrapper(listAdapter);
                }
                this.mAdapterWrappers.put(listAdapter, this.mAdapterWrapper);
            }
            if ((listAdapter instanceof StickyGridHeadersBaseAdapter) || (listAdapter instanceof StickyGridHeadersSimpleAdapter)) {
                this.mCheckState = new CheckStateWithGroup(this.mListView, this.mAnimationManager);
            }
            this.mAdapterWrapper.registerDataSetObserver(this.mRestoreCheckStateObserver);
            this.mListView.setAdapter(this.mAdapterWrapper);
            this.mCheckState.bind(this.mAdapterWrapper);
            handleDataChanged();
            return;
        }
        Log.d("EditableListViewWrapperDeprecated", "setAdapter the same adapter");
    }

    public void setAllItemsCheckState(boolean z) {
        this.mCheckState.setAllChecked(z);
        updateOnScreenViewsState();
        updateActionMode();
        this.mMultiChoiceModeCallback.mWrapped.onAllItemsCheckedStateChanged(this.mChoiceActionMode, z);
        if (this.mListView instanceof StickyGridHeadersGridView) {
            this.mAnimationManager.startScaleAllItemImageViewAnimation((StickyGridHeadersGridView) this.mListView, z);
        }
    }

    public void setChoiceMode(int i) {
        if (3 == i) {
            this.mListView.setLongClickable(true);
            this.mListView.setChoiceMode(0);
            this.mListView.setOnItemLongClickListener(this.mEnterActionModeListener);
            return;
        }
        this.mListView.setChoiceMode(i);
    }

    public void setEmptyView(View view) {
        this.mListView.setEmptyView(view);
    }

    public void setItemChecked(int i, boolean z) {
        if (i >= this.mListHeaderCount) {
            if (this.mChoiceActionMode == null) {
                startActionMode();
            }
            this.mCheckState.setCheckState(i - this.mListHeaderCount, z);
            int firstVisiblePosition = this.mListView.getFirstVisiblePosition();
            if (i > firstVisiblePosition && i < this.mListView.getChildCount() + firstVisiblePosition) {
                View childAt = this.mListView.getChildAt(i - firstVisiblePosition);
                if (childAt instanceof Checkable) {
                    ((Checkable) childAt).setChecked(true);
                }
            }
        }
    }

    public void setMultiChoiceModeListener(MultiChoiceModeListener multiChoiceModeListener) {
        if (this.mMultiChoiceModeCallback == null) {
            this.mMultiChoiceModeCallback = new MultiChoiceModeCallback();
        }
        this.mMultiChoiceModeCallback.setWrapped(multiChoiceModeListener);
    }

    public void setOnItemClickListener(OnItemClickListener onItemClickListener) {
        this.mItemClickDelegate = onItemClickListener;
        this.mListView.setOnItemClickListener(onItemClickListener);
    }

    public void setOnScrollListener(OnScrollListener onScrollListener) {
        this.mScrollListener = onScrollListener;
    }

    public void startActionMode() {
        checkMultiChoiceModeCallback();
        if (!this.mIsInChoiceMode) {
            this.mChoiceActionMode = this.mListView.startActionMode(this.mMultiChoiceModeCallback);
            if (this.mChoiceActionMode instanceof EditActionMode) {
                this.mEditActionMode = this.mChoiceActionMode;
            }
            this.mIsInChoiceMode = true;
            this.mMultiChoiceModeCallback.mWrapped.onAllItemsCheckedStateChanged(this.mChoiceActionMode, false);
        }
    }

    public void startChoiceMode() {
        checkMultiChoiceModeCallback();
        if (!this.mIsInChoiceMode) {
            this.mIsInChoiceMode = true;
            enterChoiceMode();
        }
    }

    public void stopActionMode() {
        if (this.mChoiceActionMode != null) {
            this.mChoiceActionMode.finish();
        }
    }
}
