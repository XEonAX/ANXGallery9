package com.google.android.flexbox;

import android.support.v4.view.MarginLayoutParamsCompat;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup.MarginLayoutParams;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

class FlexboxHelper {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private boolean[] mChildrenFrozen;
    private final FlexContainer mFlexContainer;
    int[] mIndexToFlexLine;
    long[] mMeasureSpecCache;
    private long[] mMeasuredSizeCache;

    static class FlexLinesResult {
        int mChildState;
        List<FlexLine> mFlexLines;

        FlexLinesResult() {
        }

        /* access modifiers changed from: 0000 */
        public void reset() {
            this.mFlexLines = null;
            this.mChildState = 0;
        }
    }

    FlexboxHelper(FlexContainer flexContainer) {
        this.mFlexContainer = flexContainer;
    }

    private void addFlexLine(List<FlexLine> list, FlexLine flexLine, int i, int i2) {
        flexLine.mSumCrossSizeBefore = i2;
        this.mFlexContainer.onNewFlexLineAdded(flexLine);
        flexLine.mLastIndex = i;
        list.add(flexLine);
    }

    /* JADX WARNING: Removed duplicated region for block: B:10:0x002d  */
    /* JADX WARNING: Removed duplicated region for block: B:11:0x0032  */
    /* JADX WARNING: Removed duplicated region for block: B:16:0x0040  */
    /* JADX WARNING: Removed duplicated region for block: B:18:? A[RETURN, SYNTHETIC] */
    private void checkSizeConstraints(View view, int i) {
        boolean z;
        FlexItem flexItem = (FlexItem) view.getLayoutParams();
        int measuredWidth = view.getMeasuredWidth();
        int measuredHeight = view.getMeasuredHeight();
        boolean z2 = true;
        if (measuredWidth < flexItem.getMinWidth()) {
            measuredWidth = flexItem.getMinWidth();
        } else if (measuredWidth > flexItem.getMaxWidth()) {
            measuredWidth = flexItem.getMaxWidth();
        } else {
            z = false;
            if (measuredHeight >= flexItem.getMinHeight()) {
                measuredHeight = flexItem.getMinHeight();
            } else if (measuredHeight > flexItem.getMaxHeight()) {
                measuredHeight = flexItem.getMaxHeight();
            } else {
                z2 = z;
            }
            if (!z2) {
                int makeMeasureSpec = MeasureSpec.makeMeasureSpec(measuredWidth, 1073741824);
                int makeMeasureSpec2 = MeasureSpec.makeMeasureSpec(measuredHeight, 1073741824);
                view.measure(makeMeasureSpec, makeMeasureSpec2);
                updateMeasureCache(i, makeMeasureSpec, makeMeasureSpec2, view);
                this.mFlexContainer.updateViewCache(i, view);
                return;
            }
            return;
        }
        z = true;
        if (measuredHeight >= flexItem.getMinHeight()) {
        }
        if (!z2) {
        }
    }

    private void ensureChildrenFrozen(int i) {
        if (this.mChildrenFrozen == null) {
            if (i < 10) {
                i = 10;
            }
            this.mChildrenFrozen = new boolean[i];
        } else if (this.mChildrenFrozen.length < i) {
            int length = this.mChildrenFrozen.length * 2;
            if (length >= i) {
                i = length;
            }
            this.mChildrenFrozen = new boolean[i];
        } else {
            Arrays.fill(this.mChildrenFrozen, false);
        }
    }

    private void expandFlexItems(int i, int i2, FlexLine flexLine, int i3, int i4, boolean z) {
        float f;
        int i5;
        boolean z2;
        int i6;
        int i7;
        int i8;
        float f2;
        float f3;
        int i9;
        int i10;
        boolean z3;
        FlexLine flexLine2 = flexLine;
        int i11 = i3;
        if (flexLine2.mTotalFlexGrow > 0.0f && i11 >= flexLine2.mMainSize) {
            int i12 = flexLine2.mMainSize;
            float f4 = ((float) (i11 - flexLine2.mMainSize)) / flexLine2.mTotalFlexGrow;
            flexLine2.mMainSize = i4 + flexLine2.mDividerLengthInMainSize;
            if (!z) {
                flexLine2.mCrossSize = Integer.MIN_VALUE;
            }
            int i13 = 0;
            boolean z4 = false;
            float f5 = 0.0f;
            int i14 = 0;
            while (i13 < flexLine2.mItemCount) {
                int i15 = flexLine2.mFirstIndex + i13;
                View reorderedFlexItemAt = this.mFlexContainer.getReorderedFlexItemAt(i15);
                if (reorderedFlexItemAt == null || reorderedFlexItemAt.getVisibility() == 8) {
                    int i16 = i;
                    f = f4;
                    int i17 = i14;
                    int i18 = i2;
                    i5 = i17;
                    z4 = z4;
                    f5 = f5;
                } else {
                    FlexItem flexItem = (FlexItem) reorderedFlexItemAt.getLayoutParams();
                    int flexDirection = this.mFlexContainer.getFlexDirection();
                    if (flexDirection == 0 || flexDirection == 1) {
                        int i19 = i;
                        f = f4;
                        boolean z5 = z4;
                        float f6 = f5;
                        int measuredWidth = reorderedFlexItemAt.getMeasuredWidth();
                        if (this.mMeasuredSizeCache != null) {
                            measuredWidth = extractLowerInt(this.mMeasuredSizeCache[i15]);
                        }
                        int measuredHeight = reorderedFlexItemAt.getMeasuredHeight();
                        if (this.mMeasuredSizeCache != null) {
                            measuredHeight = extractHigherInt(this.mMeasuredSizeCache[i15]);
                        }
                        if (this.mChildrenFrozen[i15] || flexItem.getFlexGrow() <= 0.0f) {
                            i6 = i14;
                            int i20 = i2;
                            i8 = measuredWidth;
                            i7 = measuredHeight;
                            f2 = f6;
                        } else {
                            float flexGrow = ((float) measuredWidth) + (flexItem.getFlexGrow() * f);
                            boolean z6 = true;
                            if (i13 == flexLine2.mItemCount - 1) {
                                flexGrow += f6;
                                f6 = 0.0f;
                            }
                            int round = Math.round(flexGrow);
                            if (round > flexItem.getMaxWidth()) {
                                round = flexItem.getMaxWidth();
                                this.mChildrenFrozen[i15] = true;
                                flexLine2.mTotalFlexGrow -= flexItem.getFlexGrow();
                                i6 = i14;
                                f2 = f6;
                            } else {
                                float f7 = f6 + (flexGrow - ((float) round));
                                i6 = i14;
                                double d = (double) f7;
                                if (d > 1.0d) {
                                    round++;
                                    Double.isNaN(d);
                                    f7 = (float) (d - 1.0d);
                                } else if (d < -1.0d) {
                                    round--;
                                    Double.isNaN(d);
                                    f7 = (float) (d + 1.0d);
                                }
                                f2 = f7;
                                z6 = z5;
                            }
                            int childHeightMeasureSpecInternal = getChildHeightMeasureSpecInternal(i2, flexItem, flexLine2.mSumCrossSizeBefore);
                            int makeMeasureSpec = MeasureSpec.makeMeasureSpec(round, 1073741824);
                            reorderedFlexItemAt.measure(makeMeasureSpec, childHeightMeasureSpecInternal);
                            i8 = reorderedFlexItemAt.getMeasuredWidth();
                            i7 = reorderedFlexItemAt.getMeasuredHeight();
                            updateMeasureCache(i15, makeMeasureSpec, childHeightMeasureSpecInternal, reorderedFlexItemAt);
                            this.mFlexContainer.updateViewCache(i15, reorderedFlexItemAt);
                            z5 = z6;
                        }
                        i5 = Math.max(i6, i7 + flexItem.getMarginTop() + flexItem.getMarginBottom() + this.mFlexContainer.getDecorationLengthCrossAxis(reorderedFlexItemAt));
                        flexLine2.mMainSize += i8 + flexItem.getMarginLeft() + flexItem.getMarginRight();
                    } else {
                        int measuredHeight2 = reorderedFlexItemAt.getMeasuredHeight();
                        if (this.mMeasuredSizeCache != null) {
                            f = f4;
                            measuredHeight2 = extractHigherInt(this.mMeasuredSizeCache[i15]);
                        } else {
                            f = f4;
                        }
                        int measuredWidth2 = reorderedFlexItemAt.getMeasuredWidth();
                        if (this.mMeasuredSizeCache != null) {
                            z2 = z4;
                            f3 = f5;
                            measuredWidth2 = extractLowerInt(this.mMeasuredSizeCache[i15]);
                        } else {
                            z2 = z4;
                            f3 = f5;
                        }
                        if (this.mChildrenFrozen[i15] || flexItem.getFlexGrow() <= 0.0f) {
                            int i21 = i;
                            i9 = measuredHeight2;
                            f5 = f3;
                            i10 = measuredWidth2;
                        } else {
                            float flexGrow2 = ((float) measuredHeight2) + (flexItem.getFlexGrow() * f);
                            if (i13 == flexLine2.mItemCount - 1) {
                                flexGrow2 += f3;
                                f3 = 0.0f;
                            }
                            int round2 = Math.round(flexGrow2);
                            if (round2 > flexItem.getMaxHeight()) {
                                round2 = flexItem.getMaxHeight();
                                this.mChildrenFrozen[i15] = true;
                                flexLine2.mTotalFlexGrow -= flexItem.getFlexGrow();
                                f5 = f3;
                                z3 = true;
                            } else {
                                float f8 = f3 + (flexGrow2 - ((float) round2));
                                double d2 = (double) f8;
                                if (d2 > 1.0d) {
                                    round2++;
                                    Double.isNaN(d2);
                                    f8 = (float) (d2 - 1.0d);
                                } else if (d2 < -1.0d) {
                                    round2--;
                                    Double.isNaN(d2);
                                    f8 = (float) (d2 + 1.0d);
                                }
                                f5 = f8;
                                z3 = z2;
                            }
                            int childWidthMeasureSpecInternal = getChildWidthMeasureSpecInternal(i, flexItem, flexLine2.mSumCrossSizeBefore);
                            int makeMeasureSpec2 = MeasureSpec.makeMeasureSpec(round2, 1073741824);
                            reorderedFlexItemAt.measure(childWidthMeasureSpecInternal, makeMeasureSpec2);
                            i10 = reorderedFlexItemAt.getMeasuredWidth();
                            i9 = reorderedFlexItemAt.getMeasuredHeight();
                            updateMeasureCache(i15, childWidthMeasureSpecInternal, makeMeasureSpec2, reorderedFlexItemAt);
                            this.mFlexContainer.updateViewCache(i15, reorderedFlexItemAt);
                            z2 = z3;
                        }
                        i5 = Math.max(i14, i10 + flexItem.getMarginLeft() + flexItem.getMarginRight() + this.mFlexContainer.getDecorationLengthCrossAxis(reorderedFlexItemAt));
                        flexLine2.mMainSize += i9 + flexItem.getMarginTop() + flexItem.getMarginBottom();
                        int i22 = i2;
                    }
                    flexLine2.mCrossSize = Math.max(flexLine2.mCrossSize, i5);
                    z4 = z2;
                }
                i13++;
                i14 = i5;
                f4 = f;
            }
            int i23 = i;
            int i24 = i2;
            if (z4 && i12 != flexLine2.mMainSize) {
                expandFlexItems(i, i2, flexLine, i3, i4, true);
            }
        }
    }

    private int getChildHeightMeasureSpecInternal(int i, FlexItem flexItem, int i2) {
        int childHeightMeasureSpec = this.mFlexContainer.getChildHeightMeasureSpec(i, this.mFlexContainer.getPaddingTop() + this.mFlexContainer.getPaddingBottom() + flexItem.getMarginTop() + flexItem.getMarginBottom() + i2, flexItem.getHeight());
        int size = MeasureSpec.getSize(childHeightMeasureSpec);
        return size > flexItem.getMaxHeight() ? MeasureSpec.makeMeasureSpec(flexItem.getMaxHeight(), MeasureSpec.getMode(childHeightMeasureSpec)) : size < flexItem.getMinHeight() ? MeasureSpec.makeMeasureSpec(flexItem.getMinHeight(), MeasureSpec.getMode(childHeightMeasureSpec)) : childHeightMeasureSpec;
    }

    private int getChildWidthMeasureSpecInternal(int i, FlexItem flexItem, int i2) {
        int childWidthMeasureSpec = this.mFlexContainer.getChildWidthMeasureSpec(i, this.mFlexContainer.getPaddingLeft() + this.mFlexContainer.getPaddingRight() + flexItem.getMarginLeft() + flexItem.getMarginRight() + i2, flexItem.getWidth());
        int size = MeasureSpec.getSize(childWidthMeasureSpec);
        return size > flexItem.getMaxWidth() ? MeasureSpec.makeMeasureSpec(flexItem.getMaxWidth(), MeasureSpec.getMode(childWidthMeasureSpec)) : size < flexItem.getMinWidth() ? MeasureSpec.makeMeasureSpec(flexItem.getMinWidth(), MeasureSpec.getMode(childWidthMeasureSpec)) : childWidthMeasureSpec;
    }

    private int getFlexItemMarginEndCross(FlexItem flexItem, boolean z) {
        return z ? flexItem.getMarginBottom() : flexItem.getMarginRight();
    }

    private int getFlexItemMarginEndMain(FlexItem flexItem, boolean z) {
        return z ? flexItem.getMarginRight() : flexItem.getMarginBottom();
    }

    private int getFlexItemMarginStartCross(FlexItem flexItem, boolean z) {
        return z ? flexItem.getMarginTop() : flexItem.getMarginLeft();
    }

    private int getFlexItemMarginStartMain(FlexItem flexItem, boolean z) {
        return z ? flexItem.getMarginLeft() : flexItem.getMarginTop();
    }

    private int getFlexItemSizeCross(FlexItem flexItem, boolean z) {
        return z ? flexItem.getHeight() : flexItem.getWidth();
    }

    private int getFlexItemSizeMain(FlexItem flexItem, boolean z) {
        return z ? flexItem.getWidth() : flexItem.getHeight();
    }

    private int getPaddingEndCross(boolean z) {
        return z ? this.mFlexContainer.getPaddingBottom() : this.mFlexContainer.getPaddingEnd();
    }

    private int getPaddingEndMain(boolean z) {
        return z ? this.mFlexContainer.getPaddingEnd() : this.mFlexContainer.getPaddingBottom();
    }

    private int getPaddingStartCross(boolean z) {
        return z ? this.mFlexContainer.getPaddingTop() : this.mFlexContainer.getPaddingStart();
    }

    private int getPaddingStartMain(boolean z) {
        return z ? this.mFlexContainer.getPaddingStart() : this.mFlexContainer.getPaddingTop();
    }

    private int getViewMeasuredSizeCross(View view, boolean z) {
        return z ? view.getMeasuredHeight() : view.getMeasuredWidth();
    }

    private int getViewMeasuredSizeMain(View view, boolean z) {
        return z ? view.getMeasuredWidth() : view.getMeasuredHeight();
    }

    private boolean isLastFlexItem(int i, int i2, FlexLine flexLine) {
        return i == i2 - 1 && flexLine.getItemCountNotGone() != 0;
    }

    private boolean isWrapRequired(View view, int i, int i2, int i3, int i4, FlexItem flexItem, int i5, int i6) {
        if (this.mFlexContainer.getFlexWrap() == 0) {
            return false;
        }
        boolean z = true;
        if (flexItem.isWrapBefore()) {
            return true;
        }
        if (i == 0) {
            return false;
        }
        int decorationLengthMainAxis = this.mFlexContainer.getDecorationLengthMainAxis(view, i5, i6);
        if (decorationLengthMainAxis > 0) {
            i4 += decorationLengthMainAxis;
        }
        if (i2 >= i3 + i4) {
            z = false;
        }
        return z;
    }

    private void shrinkFlexItems(int i, int i2, FlexLine flexLine, int i3, int i4, boolean z) {
        int i5;
        int i6;
        int i7;
        int i8;
        int i9;
        FlexLine flexLine2 = flexLine;
        int i10 = i3;
        int i11 = flexLine2.mMainSize;
        if (flexLine2.mTotalFlexShrink > 0.0f && i10 <= flexLine2.mMainSize) {
            float f = ((float) (flexLine2.mMainSize - i10)) / flexLine2.mTotalFlexShrink;
            flexLine2.mMainSize = i4 + flexLine2.mDividerLengthInMainSize;
            if (!z) {
                flexLine2.mCrossSize = Integer.MIN_VALUE;
            }
            int i12 = 0;
            boolean z2 = false;
            float f2 = 0.0f;
            int i13 = 0;
            while (i12 < flexLine2.mItemCount) {
                int i14 = flexLine2.mFirstIndex + i12;
                View reorderedFlexItemAt = this.mFlexContainer.getReorderedFlexItemAt(i14);
                if (reorderedFlexItemAt == null || reorderedFlexItemAt.getVisibility() == 8) {
                    int i15 = i2;
                } else {
                    FlexItem flexItem = (FlexItem) reorderedFlexItemAt.getLayoutParams();
                    int flexDirection = this.mFlexContainer.getFlexDirection();
                    if (flexDirection == 0 || flexDirection == 1) {
                        int i16 = i;
                        int measuredWidth = reorderedFlexItemAt.getMeasuredWidth();
                        if (this.mMeasuredSizeCache != null) {
                            measuredWidth = extractLowerInt(this.mMeasuredSizeCache[i14]);
                        }
                        int measuredHeight = reorderedFlexItemAt.getMeasuredHeight();
                        if (this.mMeasuredSizeCache != null) {
                            measuredHeight = extractHigherInt(this.mMeasuredSizeCache[i14]);
                        }
                        if (this.mChildrenFrozen[i14] || flexItem.getFlexShrink() <= 0.0f) {
                            int i17 = i2;
                            i7 = measuredWidth;
                            i6 = measuredHeight;
                        } else {
                            float flexShrink = ((float) measuredWidth) - (flexItem.getFlexShrink() * f);
                            if (i12 == flexLine2.mItemCount - 1) {
                                flexShrink += f2;
                                f2 = 0.0f;
                            }
                            int round = Math.round(flexShrink);
                            if (round < flexItem.getMinWidth()) {
                                round = flexItem.getMinWidth();
                                this.mChildrenFrozen[i14] = true;
                                flexLine2.mTotalFlexShrink -= flexItem.getFlexShrink();
                                z2 = true;
                            } else {
                                f2 += flexShrink - ((float) round);
                                double d = (double) f2;
                                if (d > 1.0d) {
                                    round++;
                                    f2 -= 1.0f;
                                } else if (d < -1.0d) {
                                    round--;
                                    f2 += 1.0f;
                                }
                            }
                            int childHeightMeasureSpecInternal = getChildHeightMeasureSpecInternal(i2, flexItem, flexLine2.mSumCrossSizeBefore);
                            int makeMeasureSpec = MeasureSpec.makeMeasureSpec(round, 1073741824);
                            reorderedFlexItemAt.measure(makeMeasureSpec, childHeightMeasureSpecInternal);
                            i7 = reorderedFlexItemAt.getMeasuredWidth();
                            i6 = reorderedFlexItemAt.getMeasuredHeight();
                            updateMeasureCache(i14, makeMeasureSpec, childHeightMeasureSpecInternal, reorderedFlexItemAt);
                            this.mFlexContainer.updateViewCache(i14, reorderedFlexItemAt);
                        }
                        i5 = Math.max(i13, i6 + flexItem.getMarginTop() + flexItem.getMarginBottom() + this.mFlexContainer.getDecorationLengthCrossAxis(reorderedFlexItemAt));
                        flexLine2.mMainSize += i7 + flexItem.getMarginLeft() + flexItem.getMarginRight();
                    } else {
                        int measuredHeight2 = reorderedFlexItemAt.getMeasuredHeight();
                        if (this.mMeasuredSizeCache != null) {
                            measuredHeight2 = extractHigherInt(this.mMeasuredSizeCache[i14]);
                        }
                        int measuredWidth2 = reorderedFlexItemAt.getMeasuredWidth();
                        if (this.mMeasuredSizeCache != null) {
                            measuredWidth2 = extractLowerInt(this.mMeasuredSizeCache[i14]);
                        }
                        if (this.mChildrenFrozen[i14] || flexItem.getFlexShrink() <= 0.0f) {
                            int i18 = i;
                            flexLine2 = flexLine;
                            i8 = measuredHeight2;
                            i9 = measuredWidth2;
                        } else {
                            float flexShrink2 = ((float) measuredHeight2) - (flexItem.getFlexShrink() * f);
                            flexLine2 = flexLine;
                            if (i12 == flexLine2.mItemCount - 1) {
                                flexShrink2 += f2;
                                f2 = 0.0f;
                            }
                            int round2 = Math.round(flexShrink2);
                            if (round2 < flexItem.getMinHeight()) {
                                round2 = flexItem.getMinHeight();
                                this.mChildrenFrozen[i14] = true;
                                flexLine2.mTotalFlexShrink -= flexItem.getFlexShrink();
                                z2 = true;
                            } else {
                                f2 += flexShrink2 - ((float) round2);
                                double d2 = (double) f2;
                                if (d2 > 1.0d) {
                                    round2++;
                                    f2 -= 1.0f;
                                } else if (d2 < -1.0d) {
                                    round2--;
                                    f2 += 1.0f;
                                }
                            }
                            int childWidthMeasureSpecInternal = getChildWidthMeasureSpecInternal(i, flexItem, flexLine2.mSumCrossSizeBefore);
                            int makeMeasureSpec2 = MeasureSpec.makeMeasureSpec(round2, 1073741824);
                            reorderedFlexItemAt.measure(childWidthMeasureSpecInternal, makeMeasureSpec2);
                            i9 = reorderedFlexItemAt.getMeasuredWidth();
                            i8 = reorderedFlexItemAt.getMeasuredHeight();
                            updateMeasureCache(i14, childWidthMeasureSpecInternal, makeMeasureSpec2, reorderedFlexItemAt);
                            this.mFlexContainer.updateViewCache(i14, reorderedFlexItemAt);
                        }
                        i5 = Math.max(i13, i9 + flexItem.getMarginLeft() + flexItem.getMarginRight() + this.mFlexContainer.getDecorationLengthCrossAxis(reorderedFlexItemAt));
                        flexLine2.mMainSize += i8 + flexItem.getMarginTop() + flexItem.getMarginBottom();
                        int i19 = i2;
                    }
                    flexLine2.mCrossSize = Math.max(flexLine2.mCrossSize, i5);
                    i13 = i5;
                }
                i12++;
                int i20 = i3;
            }
            int i21 = i2;
            if (z2 && i11 != flexLine2.mMainSize) {
                shrinkFlexItems(i, i2, flexLine, i3, i4, true);
            }
        }
    }

    private void stretchViewHorizontally(View view, int i, int i2) {
        FlexItem flexItem = (FlexItem) view.getLayoutParams();
        int min = Math.min(Math.max(((i - flexItem.getMarginLeft()) - flexItem.getMarginRight()) - this.mFlexContainer.getDecorationLengthCrossAxis(view), flexItem.getMinWidth()), flexItem.getMaxWidth());
        int makeMeasureSpec = MeasureSpec.makeMeasureSpec(this.mMeasuredSizeCache != null ? extractHigherInt(this.mMeasuredSizeCache[i2]) : view.getMeasuredHeight(), 1073741824);
        int makeMeasureSpec2 = MeasureSpec.makeMeasureSpec(min, 1073741824);
        view.measure(makeMeasureSpec2, makeMeasureSpec);
        updateMeasureCache(i2, makeMeasureSpec2, makeMeasureSpec, view);
        this.mFlexContainer.updateViewCache(i2, view);
    }

    private void stretchViewVertically(View view, int i, int i2) {
        FlexItem flexItem = (FlexItem) view.getLayoutParams();
        int min = Math.min(Math.max(((i - flexItem.getMarginTop()) - flexItem.getMarginBottom()) - this.mFlexContainer.getDecorationLengthCrossAxis(view), flexItem.getMinHeight()), flexItem.getMaxHeight());
        int makeMeasureSpec = MeasureSpec.makeMeasureSpec(this.mMeasuredSizeCache != null ? extractLowerInt(this.mMeasuredSizeCache[i2]) : view.getMeasuredWidth(), 1073741824);
        int makeMeasureSpec2 = MeasureSpec.makeMeasureSpec(min, 1073741824);
        view.measure(makeMeasureSpec, makeMeasureSpec2);
        updateMeasureCache(i2, makeMeasureSpec, makeMeasureSpec2, view);
        this.mFlexContainer.updateViewCache(i2, view);
    }

    private void updateMeasureCache(int i, int i2, int i3, View view) {
        if (this.mMeasureSpecCache != null) {
            this.mMeasureSpecCache[i] = makeCombinedLong(i2, i3);
        }
        if (this.mMeasuredSizeCache != null) {
            this.mMeasuredSizeCache[i] = makeCombinedLong(view.getMeasuredWidth(), view.getMeasuredHeight());
        }
    }

    /* access modifiers changed from: 0000 */
    public void calculateFlexLines(FlexLinesResult flexLinesResult, int i, int i2, int i3, int i4, int i5, List<FlexLine> list) {
        int i6;
        int i7;
        int i8;
        List<FlexLine> list2;
        int i9;
        int i10;
        List<FlexLine> list3;
        int i11;
        int i12;
        int i13;
        int i14;
        int i15;
        int i16;
        FlexLine flexLine;
        FlexLinesResult flexLinesResult2 = flexLinesResult;
        int i17 = i;
        int i18 = i2;
        int i19 = i5;
        boolean isMainAxisDirectionHorizontal = this.mFlexContainer.isMainAxisDirectionHorizontal();
        int mode = MeasureSpec.getMode(i);
        int size = MeasureSpec.getSize(i);
        List<FlexLine> arrayList = list == null ? new ArrayList<>() : list;
        flexLinesResult2.mFlexLines = arrayList;
        boolean z = i19 == -1;
        int paddingStartMain = getPaddingStartMain(isMainAxisDirectionHorizontal);
        int paddingEndMain = getPaddingEndMain(isMainAxisDirectionHorizontal);
        int paddingStartCross = getPaddingStartCross(isMainAxisDirectionHorizontal);
        int paddingEndCross = getPaddingEndCross(isMainAxisDirectionHorizontal);
        FlexLine flexLine2 = new FlexLine();
        int i20 = i4;
        flexLine2.mFirstIndex = i20;
        int i21 = paddingEndMain + paddingStartMain;
        flexLine2.mMainSize = i21;
        int flexItemCount = this.mFlexContainer.getFlexItemCount();
        boolean z2 = z;
        int i22 = 0;
        int i23 = 0;
        int i24 = 0;
        int i25 = Integer.MIN_VALUE;
        while (i6 < flexItemCount) {
            View reorderedFlexItemAt = this.mFlexContainer.getReorderedFlexItemAt(i6);
            if (reorderedFlexItemAt == null) {
                if (isLastFlexItem(i6, flexItemCount, flexLine2)) {
                    addFlexLine(arrayList, flexLine2, i6, i22);
                }
            } else if (reorderedFlexItemAt.getVisibility() == 8) {
                flexLine2.mGoneItemCount++;
                flexLine2.mItemCount++;
                if (isLastFlexItem(i6, flexItemCount, flexLine2)) {
                    addFlexLine(arrayList, flexLine2, i6, i22);
                }
            } else {
                FlexItem flexItem = (FlexItem) reorderedFlexItemAt.getLayoutParams();
                int i26 = flexItemCount;
                if (flexItem.getAlignSelf() == 4) {
                    flexLine2.mIndicesAlignSelfStretch.add(Integer.valueOf(i6));
                }
                int flexItemSizeMain = getFlexItemSizeMain(flexItem, isMainAxisDirectionHorizontal);
                if (flexItem.getFlexBasisPercent() != -1.0f && mode == 1073741824) {
                    flexItemSizeMain = Math.round(((float) size) * flexItem.getFlexBasisPercent());
                }
                if (isMainAxisDirectionHorizontal) {
                    list3 = arrayList;
                    int childWidthMeasureSpec = this.mFlexContainer.getChildWidthMeasureSpec(i17, i21 + getFlexItemMarginStartMain(flexItem, true) + getFlexItemMarginEndMain(flexItem, true), flexItemSizeMain);
                    i10 = size;
                    int childHeightMeasureSpec = this.mFlexContainer.getChildHeightMeasureSpec(i18, paddingStartCross + paddingEndCross + getFlexItemMarginStartCross(flexItem, true) + getFlexItemMarginEndCross(flexItem, true) + i22, getFlexItemSizeCross(flexItem, true));
                    reorderedFlexItemAt.measure(childWidthMeasureSpec, childHeightMeasureSpec);
                    updateMeasureCache(i6, childWidthMeasureSpec, childHeightMeasureSpec, reorderedFlexItemAt);
                    i11 = childWidthMeasureSpec;
                } else {
                    list3 = arrayList;
                    i10 = size;
                    int childWidthMeasureSpec2 = this.mFlexContainer.getChildWidthMeasureSpec(i18, paddingStartCross + paddingEndCross + getFlexItemMarginStartCross(flexItem, false) + getFlexItemMarginEndCross(flexItem, false) + i22, getFlexItemSizeCross(flexItem, false));
                    int childHeightMeasureSpec2 = this.mFlexContainer.getChildHeightMeasureSpec(i17, getFlexItemMarginStartMain(flexItem, false) + i21 + getFlexItemMarginEndMain(flexItem, false), flexItemSizeMain);
                    reorderedFlexItemAt.measure(childWidthMeasureSpec2, childHeightMeasureSpec2);
                    updateMeasureCache(i6, childWidthMeasureSpec2, childHeightMeasureSpec2, reorderedFlexItemAt);
                    i11 = childHeightMeasureSpec2;
                }
                this.mFlexContainer.updateViewCache(i6, reorderedFlexItemAt);
                checkSizeConstraints(reorderedFlexItemAt, i6);
                i23 = View.combineMeasuredStates(i23, reorderedFlexItemAt.getMeasuredState());
                int i27 = i22;
                int i28 = i26;
                int i29 = i21;
                FlexLine flexLine3 = flexLine2;
                i7 = mode;
                int i30 = i6;
                int i31 = i30;
                list2 = list3;
                int i32 = i11;
                i8 = i10;
                View view = reorderedFlexItemAt;
                if (isWrapRequired(reorderedFlexItemAt, mode, i10, flexLine2.mMainSize, getFlexItemMarginEndMain(flexItem, isMainAxisDirectionHorizontal) + getViewMeasuredSizeMain(reorderedFlexItemAt, isMainAxisDirectionHorizontal) + getFlexItemMarginStartMain(flexItem, isMainAxisDirectionHorizontal), flexItem, i30, i24)) {
                    if (flexLine3.getItemCountNotGone() > 0) {
                        i6 = i31;
                        if (i6 > 0) {
                            i16 = i6 - 1;
                            flexLine = flexLine3;
                        } else {
                            flexLine = flexLine3;
                            i16 = 0;
                        }
                        addFlexLine(list2, flexLine, i16, i27);
                        i15 = flexLine.mCrossSize + i27;
                    } else {
                        i6 = i31;
                        i15 = i27;
                    }
                    if (!isMainAxisDirectionHorizontal) {
                        int i33 = i32;
                        if (flexItem.getWidth() == -1) {
                            view.measure(this.mFlexContainer.getChildWidthMeasureSpec(i18, this.mFlexContainer.getPaddingLeft() + this.mFlexContainer.getPaddingRight() + flexItem.getMarginLeft() + flexItem.getMarginRight() + i15, flexItem.getWidth()), i33);
                            checkSizeConstraints(view, i6);
                        }
                    } else if (flexItem.getHeight() == -1) {
                        view.measure(i32, this.mFlexContainer.getChildHeightMeasureSpec(i18, this.mFlexContainer.getPaddingTop() + this.mFlexContainer.getPaddingBottom() + flexItem.getMarginTop() + flexItem.getMarginBottom() + i15, flexItem.getHeight()));
                        checkSizeConstraints(view, i6);
                    }
                    flexLine2 = new FlexLine();
                    flexLine2.mItemCount = 1;
                    i21 = i29;
                    flexLine2.mMainSize = i21;
                    flexLine2.mFirstIndex = i6;
                    i27 = i15;
                    i13 = Integer.MIN_VALUE;
                    i12 = 0;
                } else {
                    i21 = i29;
                    flexLine2 = flexLine3;
                    i6 = i31;
                    flexLine2.mItemCount++;
                    i12 = i24 + 1;
                    i13 = i25;
                }
                if (this.mIndexToFlexLine != null) {
                    this.mIndexToFlexLine[i6] = list2.size();
                }
                flexLine2.mMainSize += getViewMeasuredSizeMain(view, isMainAxisDirectionHorizontal) + getFlexItemMarginStartMain(flexItem, isMainAxisDirectionHorizontal) + getFlexItemMarginEndMain(flexItem, isMainAxisDirectionHorizontal);
                flexLine2.mTotalFlexGrow += flexItem.getFlexGrow();
                flexLine2.mTotalFlexShrink += flexItem.getFlexShrink();
                this.mFlexContainer.onNewFlexItemAdded(view, i6, i12, flexLine2);
                int max = Math.max(i13, getViewMeasuredSizeCross(view, isMainAxisDirectionHorizontal) + getFlexItemMarginStartCross(flexItem, isMainAxisDirectionHorizontal) + getFlexItemMarginEndCross(flexItem, isMainAxisDirectionHorizontal) + this.mFlexContainer.getDecorationLengthCrossAxis(view));
                flexLine2.mCrossSize = Math.max(flexLine2.mCrossSize, max);
                if (isMainAxisDirectionHorizontal) {
                    if (this.mFlexContainer.getFlexWrap() != 2) {
                        flexLine2.mMaxBaseline = Math.max(flexLine2.mMaxBaseline, view.getBaseline() + flexItem.getMarginTop());
                    } else {
                        flexLine2.mMaxBaseline = Math.max(flexLine2.mMaxBaseline, (view.getMeasuredHeight() - view.getBaseline()) + flexItem.getMarginBottom());
                    }
                }
                flexItemCount = i28;
                if (isLastFlexItem(i6, flexItemCount, flexLine2)) {
                    addFlexLine(list2, flexLine2, i6, i27);
                    i27 += flexLine2.mCrossSize;
                }
                i9 = i5;
                if (i9 != -1 && list2.size() > 0) {
                    if (((FlexLine) list2.get(list2.size() - 1)).mLastIndex >= i9 && i6 >= i9 && !z2) {
                        i14 = -flexLine2.getCrossSize();
                        z2 = true;
                        if (i14 <= i3 && z2) {
                            break;
                        }
                        i25 = max;
                        i22 = i14;
                        i24 = i12;
                        i20 = i6 + 1;
                        i19 = i9;
                        arrayList = list2;
                        size = i8;
                        mode = i7;
                        FlexLinesResult flexLinesResult3 = flexLinesResult;
                        i17 = i;
                    }
                }
                i14 = i27;
                if (i14 <= i3) {
                }
                i25 = max;
                i22 = i14;
                i24 = i12;
                i20 = i6 + 1;
                i19 = i9;
                arrayList = list2;
                size = i8;
                mode = i7;
                FlexLinesResult flexLinesResult32 = flexLinesResult;
                i17 = i;
            }
            int i34 = i3;
            i8 = size;
            i7 = mode;
            list2 = arrayList;
            i9 = i19;
            i20 = i6 + 1;
            i19 = i9;
            arrayList = list2;
            size = i8;
            mode = i7;
            FlexLinesResult flexLinesResult322 = flexLinesResult;
            i17 = i;
        }
        flexLinesResult.mChildState = i23;
    }

    /* access modifiers changed from: 0000 */
    public void calculateHorizontalFlexLines(FlexLinesResult flexLinesResult, int i, int i2, int i3, int i4, List<FlexLine> list) {
        calculateFlexLines(flexLinesResult, i, i2, i3, i4, -1, list);
    }

    /* access modifiers changed from: 0000 */
    public void calculateHorizontalFlexLinesToIndex(FlexLinesResult flexLinesResult, int i, int i2, int i3, int i4, List<FlexLine> list) {
        calculateFlexLines(flexLinesResult, i, i2, i3, 0, i4, list);
    }

    /* access modifiers changed from: 0000 */
    public void calculateVerticalFlexLines(FlexLinesResult flexLinesResult, int i, int i2, int i3, int i4, List<FlexLine> list) {
        calculateFlexLines(flexLinesResult, i2, i, i3, i4, -1, list);
    }

    /* access modifiers changed from: 0000 */
    public void calculateVerticalFlexLinesToIndex(FlexLinesResult flexLinesResult, int i, int i2, int i3, int i4, List<FlexLine> list) {
        calculateFlexLines(flexLinesResult, i2, i, i3, 0, i4, list);
    }

    /* access modifiers changed from: 0000 */
    public void clearFlexLines(List<FlexLine> list, int i) {
        int i2 = this.mIndexToFlexLine[i];
        if (i2 == -1) {
            i2 = 0;
        }
        for (int size = list.size() - 1; size >= i2; size--) {
            list.remove(size);
        }
        int length = this.mIndexToFlexLine.length - 1;
        if (i > length) {
            Arrays.fill(this.mIndexToFlexLine, -1);
        } else {
            Arrays.fill(this.mIndexToFlexLine, i, length, -1);
        }
        int length2 = this.mMeasureSpecCache.length - 1;
        if (i > length2) {
            Arrays.fill(this.mMeasureSpecCache, 0);
        } else {
            Arrays.fill(this.mMeasureSpecCache, i, length2, 0);
        }
    }

    /* access modifiers changed from: 0000 */
    public void determineMainSize(int i, int i2) {
        determineMainSize(i, i2, 0);
    }

    /* access modifiers changed from: 0000 */
    public void determineMainSize(int i, int i2, int i3) {
        int i4;
        int i5;
        ensureChildrenFrozen(this.mFlexContainer.getFlexItemCount());
        if (i3 < this.mFlexContainer.getFlexItemCount()) {
            int flexDirection = this.mFlexContainer.getFlexDirection();
            switch (this.mFlexContainer.getFlexDirection()) {
                case 0:
                case 1:
                    int mode = MeasureSpec.getMode(i);
                    int size = MeasureSpec.getSize(i);
                    if (mode != 1073741824) {
                        size = this.mFlexContainer.getLargestMainSize();
                    }
                    i5 = this.mFlexContainer.getPaddingLeft() + this.mFlexContainer.getPaddingRight();
                    break;
                case 2:
                case 3:
                    int mode2 = MeasureSpec.getMode(i2);
                    i4 = MeasureSpec.getSize(i2);
                    if (mode2 != 1073741824) {
                        i4 = this.mFlexContainer.getLargestMainSize();
                    }
                    i5 = this.mFlexContainer.getPaddingTop() + this.mFlexContainer.getPaddingBottom();
                    break;
                default:
                    StringBuilder sb = new StringBuilder();
                    sb.append("Invalid flex direction: ");
                    sb.append(flexDirection);
                    throw new IllegalArgumentException(sb.toString());
            }
            int i6 = 0;
            if (this.mIndexToFlexLine != null) {
                i6 = this.mIndexToFlexLine[i3];
            }
            List flexLinesInternal = this.mFlexContainer.getFlexLinesInternal();
            int size2 = flexLinesInternal.size();
            for (int i7 = i6; i7 < size2; i7++) {
                FlexLine flexLine = (FlexLine) flexLinesInternal.get(i7);
                if (flexLine.mMainSize < i4) {
                    expandFlexItems(i, i2, flexLine, i4, i5, false);
                } else {
                    shrinkFlexItems(i, i2, flexLine, i4, i5, false);
                }
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public void ensureIndexToFlexLine(int i) {
        if (this.mIndexToFlexLine == null) {
            if (i < 10) {
                i = 10;
            }
            this.mIndexToFlexLine = new int[i];
        } else if (this.mIndexToFlexLine.length < i) {
            int length = this.mIndexToFlexLine.length * 2;
            if (length >= i) {
                i = length;
            }
            this.mIndexToFlexLine = Arrays.copyOf(this.mIndexToFlexLine, i);
        }
    }

    /* access modifiers changed from: 0000 */
    public void ensureMeasureSpecCache(int i) {
        if (this.mMeasureSpecCache == null) {
            if (i < 10) {
                i = 10;
            }
            this.mMeasureSpecCache = new long[i];
        } else if (this.mMeasureSpecCache.length < i) {
            int length = this.mMeasureSpecCache.length * 2;
            if (length >= i) {
                i = length;
            }
            this.mMeasureSpecCache = Arrays.copyOf(this.mMeasureSpecCache, i);
        }
    }

    /* access modifiers changed from: 0000 */
    public void ensureMeasuredSizeCache(int i) {
        if (this.mMeasuredSizeCache == null) {
            if (i < 10) {
                i = 10;
            }
            this.mMeasuredSizeCache = new long[i];
        } else if (this.mMeasuredSizeCache.length < i) {
            int length = this.mMeasuredSizeCache.length * 2;
            if (length >= i) {
                i = length;
            }
            this.mMeasuredSizeCache = Arrays.copyOf(this.mMeasuredSizeCache, i);
        }
    }

    /* access modifiers changed from: 0000 */
    public int extractHigherInt(long j) {
        return (int) (j >> 32);
    }

    /* access modifiers changed from: 0000 */
    public int extractLowerInt(long j) {
        return (int) j;
    }

    /* access modifiers changed from: 0000 */
    public void layoutSingleChildHorizontal(View view, FlexLine flexLine, int i, int i2, int i3, int i4) {
        FlexItem flexItem = (FlexItem) view.getLayoutParams();
        int alignItems = this.mFlexContainer.getAlignItems();
        if (flexItem.getAlignSelf() != -1) {
            alignItems = flexItem.getAlignSelf();
        }
        int i5 = flexLine.mCrossSize;
        switch (alignItems) {
            case 0:
            case 4:
                if (this.mFlexContainer.getFlexWrap() != 2) {
                    view.layout(i, i2 + flexItem.getMarginTop(), i3, i4 + flexItem.getMarginTop());
                    return;
                } else {
                    view.layout(i, i2 - flexItem.getMarginBottom(), i3, i4 - flexItem.getMarginBottom());
                    return;
                }
            case 1:
                if (this.mFlexContainer.getFlexWrap() != 2) {
                    int i6 = i2 + i5;
                    view.layout(i, (i6 - view.getMeasuredHeight()) - flexItem.getMarginBottom(), i3, i6 - flexItem.getMarginBottom());
                    return;
                }
                view.layout(i, (i2 - i5) + view.getMeasuredHeight() + flexItem.getMarginTop(), i3, (i4 - i5) + view.getMeasuredHeight() + flexItem.getMarginTop());
                return;
            case 2:
                int measuredHeight = (((i5 - view.getMeasuredHeight()) + flexItem.getMarginTop()) - flexItem.getMarginBottom()) / 2;
                if (this.mFlexContainer.getFlexWrap() != 2) {
                    int i7 = i2 + measuredHeight;
                    view.layout(i, i7, i3, view.getMeasuredHeight() + i7);
                    return;
                }
                int i8 = i2 - measuredHeight;
                view.layout(i, i8, i3, view.getMeasuredHeight() + i8);
                return;
            case 3:
                if (this.mFlexContainer.getFlexWrap() != 2) {
                    int max = Math.max(flexLine.mMaxBaseline - view.getBaseline(), flexItem.getMarginTop());
                    view.layout(i, i2 + max, i3, i4 + max);
                    return;
                }
                int max2 = Math.max((flexLine.mMaxBaseline - view.getMeasuredHeight()) + view.getBaseline(), flexItem.getMarginBottom());
                view.layout(i, i2 - max2, i3, i4 - max2);
                return;
            default:
                return;
        }
    }

    /* access modifiers changed from: 0000 */
    public void layoutSingleChildVertical(View view, FlexLine flexLine, boolean z, int i, int i2, int i3, int i4) {
        FlexItem flexItem = (FlexItem) view.getLayoutParams();
        int alignItems = this.mFlexContainer.getAlignItems();
        if (flexItem.getAlignSelf() != -1) {
            alignItems = flexItem.getAlignSelf();
        }
        int i5 = flexLine.mCrossSize;
        switch (alignItems) {
            case 0:
            case 3:
            case 4:
                if (!z) {
                    view.layout(i + flexItem.getMarginLeft(), i2, i3 + flexItem.getMarginLeft(), i4);
                    return;
                } else {
                    view.layout(i - flexItem.getMarginRight(), i2, i3 - flexItem.getMarginRight(), i4);
                    return;
                }
            case 1:
                if (!z) {
                    view.layout(((i + i5) - view.getMeasuredWidth()) - flexItem.getMarginRight(), i2, ((i3 + i5) - view.getMeasuredWidth()) - flexItem.getMarginRight(), i4);
                    return;
                } else {
                    view.layout((i - i5) + view.getMeasuredWidth() + flexItem.getMarginLeft(), i2, (i3 - i5) + view.getMeasuredWidth() + flexItem.getMarginLeft(), i4);
                    return;
                }
            case 2:
                MarginLayoutParams marginLayoutParams = (MarginLayoutParams) view.getLayoutParams();
                int measuredWidth = (((i5 - view.getMeasuredWidth()) + MarginLayoutParamsCompat.getMarginStart(marginLayoutParams)) - MarginLayoutParamsCompat.getMarginEnd(marginLayoutParams)) / 2;
                if (!z) {
                    view.layout(i + measuredWidth, i2, i3 + measuredWidth, i4);
                    return;
                } else {
                    view.layout(i - measuredWidth, i2, i3 - measuredWidth, i4);
                    return;
                }
            default:
                return;
        }
    }

    /* access modifiers changed from: 0000 */
    public long makeCombinedLong(int i, int i2) {
        return (((long) i) & 4294967295L) | (((long) i2) << 32);
    }

    /* access modifiers changed from: 0000 */
    public void stretchViews() {
        stretchViews(0);
    }

    /* access modifiers changed from: 0000 */
    public void stretchViews(int i) {
        if (i < this.mFlexContainer.getFlexItemCount()) {
            int flexDirection = this.mFlexContainer.getFlexDirection();
            if (this.mFlexContainer.getAlignItems() == 4) {
                List flexLinesInternal = this.mFlexContainer.getFlexLinesInternal();
                int size = flexLinesInternal.size();
                for (int i2 = this.mIndexToFlexLine != null ? this.mIndexToFlexLine[i] : 0; i2 < size; i2++) {
                    FlexLine flexLine = (FlexLine) flexLinesInternal.get(i2);
                    int i3 = flexLine.mItemCount;
                    for (int i4 = 0; i4 < i3; i4++) {
                        int i5 = flexLine.mFirstIndex + i4;
                        if (i4 < this.mFlexContainer.getFlexItemCount()) {
                            View reorderedFlexItemAt = this.mFlexContainer.getReorderedFlexItemAt(i5);
                            if (!(reorderedFlexItemAt == null || reorderedFlexItemAt.getVisibility() == 8)) {
                                FlexItem flexItem = (FlexItem) reorderedFlexItemAt.getLayoutParams();
                                if (flexItem.getAlignSelf() == -1 || flexItem.getAlignSelf() == 4) {
                                    switch (flexDirection) {
                                        case 0:
                                        case 1:
                                            stretchViewVertically(reorderedFlexItemAt, flexLine.mCrossSize, i5);
                                            break;
                                        case 2:
                                        case 3:
                                            stretchViewHorizontally(reorderedFlexItemAt, flexLine.mCrossSize, i5);
                                            break;
                                        default:
                                            StringBuilder sb = new StringBuilder();
                                            sb.append("Invalid flex direction: ");
                                            sb.append(flexDirection);
                                            throw new IllegalArgumentException(sb.toString());
                                    }
                                }
                            }
                        }
                    }
                }
            } else {
                for (FlexLine flexLine2 : this.mFlexContainer.getFlexLinesInternal()) {
                    Iterator it = flexLine2.mIndicesAlignSelfStretch.iterator();
                    while (true) {
                        if (it.hasNext()) {
                            Integer num = (Integer) it.next();
                            View reorderedFlexItemAt2 = this.mFlexContainer.getReorderedFlexItemAt(num.intValue());
                            switch (flexDirection) {
                                case 0:
                                case 1:
                                    stretchViewVertically(reorderedFlexItemAt2, flexLine2.mCrossSize, num.intValue());
                                    break;
                                case 2:
                                case 3:
                                    stretchViewHorizontally(reorderedFlexItemAt2, flexLine2.mCrossSize, num.intValue());
                                    break;
                                default:
                                    StringBuilder sb2 = new StringBuilder();
                                    sb2.append("Invalid flex direction: ");
                                    sb2.append(flexDirection);
                                    throw new IllegalArgumentException(sb2.toString());
                            }
                        }
                    }
                }
            }
        }
    }
}
