package com.miui.gallery.widget;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.util.AttributeSet;
import android.util.Log;
import android.view.FocusFinder;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.SoundEffectConstants;
import android.view.VelocityTracker;
import android.view.View;
import android.view.View.BaseSavedState;
import android.view.View.MeasureSpec;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.animation.Interpolator;
import android.widget.EdgeEffect;
import android.widget.Scroller;
import com.miui.gallery.R;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.widget.slip.ISlipAnimView;
import com.nexstreaming.nexeditorsdk.nexEngine;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;

public class ViewPager extends ViewGroup implements ISlipAnimView {
    private static final Comparator<ItemInfo> COMPARATOR = new Comparator<ItemInfo>() {
        public int compare(ItemInfo itemInfo, ItemInfo itemInfo2) {
            return itemInfo.position - itemInfo2.position;
        }
    };
    private static final boolean DEBUG = Log.isLoggable("ViewPager", 3);
    /* access modifiers changed from: private */
    public static final int[] LAYOUT_ATTRS = {16842931};
    private static final Interpolator sInterpolator = new Interpolator() {
        public float getInterpolation(float f) {
            float f2 = f - 1.0f;
            return (f2 * f2 * f2 * f2 * f2) + 1.0f;
        }
    };
    private int mActivePointerId;
    private PagerAdapter mAdapter;
    private OnAdapterChangeListener mAdapterChangeListener;
    private float mBottomMarginProgress;
    private int mBottomPageBounds;
    private boolean mCalledSuper;
    private int mChildHeightMeasureSpec;
    private int mChildWidthMeasureSpec;
    private int mCloseEnough;
    private int mCurItem;
    private int mDecorChildCount;
    private int mDefaultGutterSize;
    boolean mDragEnabled;
    private boolean mFakeDragging;
    private boolean mFirstLayout;
    private float mFirstOffset;
    private float mFirstOffsetLeftScreen;
    private int mFlingDistance;
    private boolean mForceReplayout;
    private int mGutterSize;
    private float mHeightSlipRatio;
    private boolean mInLayout;
    private int mInitialHeight;
    private float mInitialMotionX;
    private int mInitialPageMargin;
    private int mInitialWidth;
    private OnPageChangeListener mInternalPageChangeListener;
    private boolean mIsBeingDragged;
    private boolean mIsUnableToDrag;
    private final ArrayList<ItemInfo> mItems;
    private float mLastMotionX;
    private float mLastMotionY;
    private float mLastOffset;
    private float mLastOffsetLeftScreen;
    private int mLastOrientation;
    float mLastPageOffset;
    private int mLastSettledItem;
    private EdgeEffect mLeftEdge;
    private int mLeftOffscreenPageLimit;
    private Drawable mMarginDrawable;
    private float mMarginSlipRatio;
    private int mMaximumVelocity;
    private int mMinimumVelocity;
    private boolean mNeedCalculatePageOffsets;
    private PagerObserver mObserver;
    private OnPageChangeListener mOnPageChangeListener;
    private int mPageMargin;
    private OnPageSettledListener mPageSettledListener;
    private boolean mPopulatePending;
    private Parcelable mRestoredAdapterState;
    private int mRestoredCurItem;
    private int mReverseVelocity;
    private EdgeEffect mRightEdge;
    private int mRightOffscreenPageLimit;
    private int mScrollState;
    private Scroller mScroller;
    private boolean mScrollingCacheEnabled;
    private float mSlipProgress;
    private final ItemInfo mTempItem;
    private final Rect mTempRect;
    private int mTopPageBounds;
    private int mTouchSlop;
    private VelocityTracker mVelocityTracker;
    private float mWidthSlipRatio;

    interface Decor {
    }

    static class ItemInfo {
        Object object;
        float offset;
        float offsetLeftScreen;
        float offsetTopScreen;
        int position;
        boolean scrolling;
        float widthFactor;

        ItemInfo() {
        }
    }

    public static class LayoutParams extends android.view.ViewGroup.LayoutParams {
        public int gravity;
        public boolean isDecor;
        public boolean needsMeasure;
        public float widthFactor = 0.0f;

        public LayoutParams() {
            super(-1, -1);
        }

        public LayoutParams(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, ViewPager.LAYOUT_ATTRS);
            this.gravity = obtainStyledAttributes.getInteger(0, 48);
            obtainStyledAttributes.recycle();
        }
    }

    interface OnAdapterChangeListener {
        void onAdapterChanged(PagerAdapter pagerAdapter, PagerAdapter pagerAdapter2);
    }

    public interface OnPageChangeListener {
        void onPageScrollStateChanged(int i);

        void onPageScrolled(int i, float f, int i2);

        void onPageSelected(int i);
    }

    public interface OnPageSettledListener {
        void onPageSettled(int i);
    }

    private class PagerObserver extends DataSetObserver {
        private PagerObserver() {
        }

        public void onChanged() {
            ViewPager.this.dataSetChanged();
        }

        public void onInvalidated() {
            ViewPager.this.dataSetChanged();
        }
    }

    public static class SavedState extends BaseSavedState {
        public static final Creator<SavedState> CREATOR = new Creator<SavedState>() {
            public SavedState createFromParcel(Parcel parcel) {
                return new SavedState(parcel);
            }

            public SavedState[] newArray(int i) {
                return new SavedState[i];
            }
        };
        Parcelable adapterState;
        int position;

        SavedState(Parcel parcel) {
            super(parcel);
            this.position = parcel.readInt();
            this.adapterState = parcel.readParcelable(null);
        }

        public SavedState(Parcelable parcelable) {
            super(parcelable);
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("FragmentPager.SavedState{");
            sb.append(Integer.toHexString(System.identityHashCode(this)));
            sb.append(" position=");
            sb.append(this.position);
            sb.append("}");
            return sb.toString();
        }

        public void writeToParcel(Parcel parcel, int i) {
            super.writeToParcel(parcel, i);
            parcel.writeInt(this.position);
            parcel.writeParcelable(this.adapterState, i);
        }
    }

    public ViewPager(Context context) {
        this(context, null);
    }

    public ViewPager(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public ViewPager(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mItems = new ArrayList<>();
        this.mTempItem = new ItemInfo();
        this.mTempRect = new Rect();
        this.mRestoredCurItem = -1;
        this.mRestoredAdapterState = null;
        this.mFirstOffset = -3.4028235E38f;
        this.mLastOffset = Float.MAX_VALUE;
        this.mFirstOffsetLeftScreen = 0.0f;
        this.mLastOffsetLeftScreen = 0.0f;
        this.mLeftOffscreenPageLimit = 1;
        this.mRightOffscreenPageLimit = 3;
        this.mActivePointerId = -1;
        this.mFirstLayout = true;
        this.mNeedCalculatePageOffsets = false;
        this.mDragEnabled = true;
        this.mLastPageOffset = 0.0f;
        this.mScrollState = 0;
        this.mInitialWidth = 0;
        this.mInitialHeight = 0;
        this.mInitialPageMargin = this.mPageMargin;
        this.mSlipProgress = 0.0f;
        this.mWidthSlipRatio = 1.0f;
        this.mHeightSlipRatio = 1.0f;
        this.mMarginSlipRatio = 1.0f;
        this.mLastOrientation = 0;
        initViewPager(context, attributeSet, 0);
    }

    private void calculatePageLimits(int i) {
        if (this.mCurItem > i) {
            this.mLeftOffscreenPageLimit = 3;
            this.mRightOffscreenPageLimit = 1;
        } else if (this.mCurItem < i) {
            this.mRightOffscreenPageLimit = 3;
            this.mLeftOffscreenPageLimit = 1;
        }
    }

    private void calculatePageOffsets(ItemInfo itemInfo, int i, ItemInfo itemInfo2) {
        ItemInfo itemInfo3;
        ItemInfo itemInfo4;
        calculatePageWidthFactor(itemInfo);
        int count = this.mAdapter.getCount();
        int width = getWidth();
        float f = 0.0f;
        float f2 = width > 0 ? ((float) this.mPageMargin) / ((float) width) : 0.0f;
        if (itemInfo2 != null) {
            int i2 = itemInfo2.position;
            if (i2 < itemInfo.position) {
                float f3 = itemInfo2.offset + itemInfo2.widthFactor + f2;
                int i3 = i2 + 1;
                int i4 = 0;
                while (i3 <= itemInfo.position && i4 < this.mItems.size()) {
                    Object obj = this.mItems.get(i4);
                    while (true) {
                        itemInfo4 = (ItemInfo) obj;
                        if (i3 > itemInfo4.position && i4 < this.mItems.size() - 1) {
                            i4++;
                            obj = this.mItems.get(i4);
                        }
                    }
                    while (i3 < itemInfo4.position) {
                        f3 += this.mAdapter.getPageWidth(i3) + f2;
                        i3++;
                    }
                    itemInfo4.offset = f3;
                    f3 += itemInfo4.widthFactor + f2;
                    i3++;
                }
            } else if (i2 > itemInfo.position) {
                int size = this.mItems.size() - 1;
                float f4 = itemInfo2.offset;
                while (true) {
                    i2--;
                    if (i2 < itemInfo.position || size < 0) {
                        break;
                    }
                    Object obj2 = this.mItems.get(size);
                    while (true) {
                        itemInfo3 = (ItemInfo) obj2;
                        if (i2 < itemInfo3.position && size > 0) {
                            size--;
                            obj2 = this.mItems.get(size);
                        }
                    }
                    while (i2 > itemInfo3.position) {
                        f4 -= this.mAdapter.getPageWidth(i2) + f2;
                        i2--;
                    }
                    f4 -= itemInfo3.widthFactor + f2;
                    itemInfo3.offset = f4;
                }
            }
        }
        int size2 = this.mItems.size();
        float f5 = itemInfo.offset;
        int i5 = itemInfo.position - 1;
        this.mFirstOffset = itemInfo.position == 0 ? itemInfo.offset : -3.4028235E38f;
        this.mFirstOffsetLeftScreen = itemInfo.position == 0 ? itemInfo.offsetLeftScreen : 0.0f;
        int i6 = count - 1;
        this.mLastOffset = itemInfo.position == i6 ? itemInfo.offset : Float.MAX_VALUE;
        if (itemInfo.position == i6) {
            f = itemInfo.offsetLeftScreen;
        }
        this.mLastOffsetLeftScreen = f;
        int i7 = i - 1;
        while (i7 >= 0) {
            ItemInfo itemInfo5 = (ItemInfo) this.mItems.get(i7);
            while (i5 > itemInfo5.position) {
                f5 -= this.mAdapter.getPageWidth(i5) + f2;
                i5--;
            }
            f5 -= itemInfo5.widthFactor + f2;
            itemInfo5.offset = f5;
            if (itemInfo5.position == 0) {
                this.mFirstOffset = f5;
                this.mFirstOffsetLeftScreen = itemInfo5.offsetLeftScreen;
            }
            i7--;
            i5--;
        }
        float f6 = itemInfo.offset + itemInfo.widthFactor + f2;
        int i8 = itemInfo.position + 1;
        int i9 = i + 1;
        while (i9 < size2) {
            ItemInfo itemInfo6 = (ItemInfo) this.mItems.get(i9);
            while (i8 < itemInfo6.position) {
                f6 += this.mAdapter.getPageWidth(i8) + f2;
                i8++;
            }
            if (itemInfo6.position == i6) {
                this.mLastOffset = f6;
                this.mLastOffsetLeftScreen = itemInfo6.offsetLeftScreen;
            }
            itemInfo6.offset = f6;
            f6 += itemInfo6.widthFactor + f2;
            i9++;
            i8++;
        }
        this.mNeedCalculatePageOffsets = false;
    }

    private void calculatePageWidthFactor(ItemInfo itemInfo) {
        float f = itemInfo.widthFactor;
        this.mPageMargin = (int) ((1.0f - ((1.0f - this.mMarginSlipRatio) * this.mSlipProgress)) * ((float) this.mInitialPageMargin));
        Iterator it = this.mItems.iterator();
        while (it.hasNext()) {
            ItemInfo itemInfo2 = (ItemInfo) it.next();
            itemInfo2.widthFactor = (!MiscUtil.floatEquals(this.mSlipProgress, 0.0f) ? 1.0f - ((1.0f - getSlipScale(itemInfo2.position)) * this.mSlipProgress) : 1.0f) * this.mAdapter.getPageWidth(itemInfo2.position);
            itemInfo2.offsetLeftScreen = (1.0f - itemInfo2.widthFactor) / 2.0f;
        }
        itemInfo.offset += (f - itemInfo.widthFactor) / 2.0f;
    }

    private void callBackPageSettled() {
        if (this.mLastSettledItem != this.mCurItem) {
            this.mLastSettledItem = this.mCurItem;
            if (this.mPageSettledListener != null) {
                this.mPageSettledListener.onPageSettled(this.mCurItem);
            }
        }
    }

    private void completeScroll() {
        boolean z = this.mScrollState == 2;
        boolean z2 = this.mScrollState == 2;
        if (z) {
            setScrollingCacheEnabled(false);
            this.mScroller.abortAnimation();
            int scrollX = getScrollX();
            int scrollY = getScrollY();
            int currX = this.mScroller.getCurrX();
            int currY = this.mScroller.getCurrY();
            if (!(scrollX == currX && scrollY == currY)) {
                scrollTo(currX, currY);
            }
            setScrollState(0);
        }
        if (z2) {
            callBackPageSettled();
        }
        this.mPopulatePending = false;
        Iterator it = this.mItems.iterator();
        while (it.hasNext()) {
            ItemInfo itemInfo = (ItemInfo) it.next();
            if (itemInfo.scrolling) {
                itemInfo.scrolling = false;
                z = true;
            }
        }
        if (z) {
            populate();
        }
    }

    private int determineTargetPage(int i, float f, int i2, int i3) {
        int i4;
        if (Math.abs(i3) <= this.mFlingDistance || Math.abs(i2) <= this.mMinimumVelocity) {
            i4 = (int) (((float) i) + (i >= this.mCurItem ? 0.6f : 0.4f) + f);
        } else if (i3 < 0) {
            i4 = (i2 > this.mReverseVelocity ? 0 : 1) + i;
            if (i2 < 0 && i4 == getCurrentItem()) {
                if (DEBUG) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("go on scrolling to new page, offset: ");
                    sb.append(f);
                    Log.d("ViewPager", sb.toString());
                }
                i4 += (int) (0.3f + f);
            }
        } else {
            i4 = (i2 < (-this.mReverseVelocity) ? 1 : 0) + i;
            if (i2 > 0 && i4 == getCurrentItem()) {
                if (DEBUG) {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("go on scrolling to new page, offset: ");
                    sb2.append(f);
                    Log.d("ViewPager", sb2.toString());
                }
                i4 -= f < 0.3f ? 1 : 0;
            }
        }
        if (this.mItems.size() > 0) {
            i4 = Math.max(((ItemInfo) this.mItems.get(0)).position, Math.min(i4, ((ItemInfo) this.mItems.get(this.mItems.size() - 1)).position));
        }
        if (DEBUG) {
            Log.d("ViewPager", String.format(Locale.US, "deltaX: %s, velocity: %s, offset: %s, curItem: %s, displayItem: %s, tarItem: %s", new Object[]{Integer.valueOf(i3), Integer.valueOf(i2), Float.valueOf(f), Integer.valueOf(getCurrentItem()), Integer.valueOf(i), Integer.valueOf(i4)}));
        }
        return i4;
    }

    private void endDrag() {
        this.mIsBeingDragged = false;
        this.mIsUnableToDrag = false;
        if (this.mVelocityTracker != null) {
            this.mVelocityTracker.recycle();
            this.mVelocityTracker = null;
        }
    }

    private int findPointerIndex(MotionEvent motionEvent, int i) {
        int findPointerIndex = motionEvent.findPointerIndex(i);
        int pointerCount = motionEvent.getPointerCount();
        if (findPointerIndex >= 0 && findPointerIndex < pointerCount) {
            return findPointerIndex;
        }
        HashMap hashMap = new HashMap();
        hashMap.put("invalid_pointer", String.format(Locale.US, "id[%d], index[%d], count[%d]", new Object[]{Integer.valueOf(i), Integer.valueOf(findPointerIndex), Integer.valueOf(pointerCount)}));
        GallerySamplingStatHelper.recordErrorEvent("gesture", "gesture_view_pager", hashMap);
        return -1;
    }

    private Rect getChildRectInPagerCoordinates(Rect rect, View view) {
        if (rect == null) {
            rect = new Rect();
        }
        if (view == null) {
            rect.set(0, 0, 0, 0);
            return rect;
        }
        rect.left = view.getLeft();
        rect.right = view.getRight();
        rect.top = view.getTop();
        rect.bottom = view.getBottom();
        ViewParent parent = view.getParent();
        while ((parent instanceof ViewGroup) && parent != this) {
            ViewGroup viewGroup = (ViewGroup) parent;
            rect.left += viewGroup.getLeft();
            rect.right += viewGroup.getRight();
            rect.top += viewGroup.getTop();
            rect.bottom += viewGroup.getBottom();
            parent = viewGroup.getParent();
        }
        return rect;
    }

    private float getMaxScrollOffset() {
        return this.mLastOffset - this.mLastOffsetLeftScreen;
    }

    private float getMinScrollOffset() {
        return this.mFirstOffset - this.mFirstOffsetLeftScreen;
    }

    private float getSlipScale(int i) {
        int slipWidth = this.mAdapter.getSlipWidth((int) (((float) this.mInitialHeight) * this.mHeightSlipRatio), i);
        return slipWidth > 0 ? Math.min(this.mWidthSlipRatio, (((float) slipWidth) * 1.0f) / ((float) this.mInitialWidth)) : this.mWidthSlipRatio;
    }

    private ItemInfo infoForCurrentScrollPosition() {
        int width = getWidth();
        float scrollX = width > 0 ? ((float) getScrollX()) / ((float) width) : 0.0f;
        float f = width > 0 ? ((float) this.mPageMargin) / ((float) width) : 0.0f;
        ItemInfo itemInfo = null;
        int i = 0;
        boolean z = true;
        int i2 = -1;
        float f2 = 0.0f;
        float f3 = 0.0f;
        while (i < this.mItems.size()) {
            ItemInfo itemInfo2 = (ItemInfo) this.mItems.get(i);
            if (!z) {
                int i3 = i2 + 1;
                if (itemInfo2.position != i3) {
                    itemInfo2 = this.mTempItem;
                    itemInfo2.offset = f2 + f3 + f;
                    itemInfo2.position = i3;
                    itemInfo2.widthFactor = this.mAdapter.getPageWidth(itemInfo2.position);
                    i--;
                }
            }
            f2 = itemInfo2.offset;
            float f4 = f2 - itemInfo2.offsetLeftScreen;
            float f5 = (f2 - itemInfo2.offsetLeftScreen) + itemInfo2.widthFactor + f;
            if (!z && scrollX < f4) {
                return itemInfo;
            }
            if (scrollX < f5 || i == this.mItems.size() - 1) {
                return itemInfo2;
            }
            i2 = itemInfo2.position;
            f3 = itemInfo2.widthFactor;
            i++;
            itemInfo = itemInfo2;
            z = false;
        }
        return itemInfo;
    }

    private boolean isGutterDrag(float f, float f2) {
        return (f < ((float) this.mGutterSize) && f2 > 0.0f) || (f > ((float) (getWidth() - this.mGutterSize)) && f2 < 0.0f);
    }

    private boolean needIntercept(float f, float f2) {
        if (f > ((float) this.mTouchSlop)) {
            double d = (double) f;
            double d2 = (double) f2;
            double tan = Math.tan(0.4363323129985824d);
            Double.isNaN(d2);
            if (d > d2 * tan) {
                return true;
            }
        }
        return false;
    }

    private void onSecondaryPointerUp(MotionEvent motionEvent) {
        int actionIndex = motionEvent.getActionIndex();
        if (motionEvent.getPointerId(actionIndex) == this.mActivePointerId) {
            int i = actionIndex == 0 ? 1 : 0;
            this.mLastMotionX = motionEvent.getX(i);
            this.mActivePointerId = motionEvent.getPointerId(i);
            if (this.mVelocityTracker != null) {
                this.mVelocityTracker.clear();
            }
        }
    }

    private boolean pageScrolled(int i, boolean z) {
        if (this.mItems.size() == 0) {
            this.mCalledSuper = false;
            onPageScrolled(0, 0.0f, 0);
            if (this.mCalledSuper) {
                return false;
            }
            throw new IllegalStateException("onPageScrolled did not call superclass implementation");
        }
        ItemInfo infoForCurrentScrollPosition = infoForCurrentScrollPosition();
        int width = getWidth();
        int i2 = this.mPageMargin + width;
        float f = (float) width;
        float f2 = ((float) this.mPageMargin) / f;
        int i3 = infoForCurrentScrollPosition.position;
        float f3 = (((((float) i) / f) - infoForCurrentScrollPosition.offset) - infoForCurrentScrollPosition.offsetLeftScreen) / (infoForCurrentScrollPosition.widthFactor + f2);
        int i4 = (int) (((float) i2) * f3);
        this.mCalledSuper = false;
        onPageScrolled(i3, f3, i4);
        if (this.mCalledSuper) {
            return true;
        }
        throw new IllegalStateException("onPageScrolled did not call superclass implementation");
    }

    private boolean performDrag(float f) {
        boolean z;
        boolean z2;
        float f2 = this.mLastMotionX - f;
        this.mLastMotionX = f;
        float scrollX = ((float) getScrollX()) + f2;
        float width = (float) getWidth();
        float minScrollOffset = getMinScrollOffset() * width;
        float maxScrollOffset = getMaxScrollOffset() * width;
        boolean z3 = false;
        ItemInfo itemInfo = (ItemInfo) this.mItems.get(0);
        ItemInfo itemInfo2 = (ItemInfo) this.mItems.get(this.mItems.size() - 1);
        if (itemInfo.position != 0) {
            minScrollOffset = (itemInfo.offset - itemInfo.offsetLeftScreen) * width;
            z = false;
        } else {
            z = true;
        }
        if (itemInfo2.position != this.mAdapter.getCount() - 1) {
            maxScrollOffset = (itemInfo2.offset - itemInfo2.offsetLeftScreen) * width;
            z2 = false;
        } else {
            z2 = true;
        }
        if (scrollX < minScrollOffset) {
            if (z) {
                this.mLeftEdge.onPull(Math.abs(minScrollOffset - scrollX) / width);
                z3 = true;
            }
            scrollX = minScrollOffset;
        } else if (scrollX > maxScrollOffset) {
            if (z2) {
                this.mRightEdge.onPull(Math.abs(scrollX - maxScrollOffset) / width);
                z3 = true;
            }
            scrollX = maxScrollOffset;
        }
        int i = (int) scrollX;
        this.mLastMotionX += scrollX - ((float) i);
        scrollTo(i, getScrollY());
        pageScrolled(i, true);
        return z3;
    }

    private int populateLeft(ItemInfo itemInfo, int i, int i2) {
        int i3 = i - 1;
        ItemInfo itemInfo2 = i3 >= 0 ? (ItemInfo) this.mItems.get(i3) : null;
        float f = 2.0f - itemInfo.widthFactor;
        float f2 = 0.0f;
        for (int i4 = this.mCurItem - 1; i4 >= 0; i4--) {
            if (f2 < f || i4 >= i2) {
                if (itemInfo2 == null || i4 != itemInfo2.position) {
                    f2 += addNewItem(i4, i3 + 1).widthFactor;
                    i++;
                    if (i3 >= 0) {
                        itemInfo2 = (ItemInfo) this.mItems.get(i3);
                    }
                } else {
                    f2 += itemInfo2.widthFactor;
                    i3--;
                    if (i3 >= 0) {
                        itemInfo2 = (ItemInfo) this.mItems.get(i3);
                    }
                }
            } else if (itemInfo2 == null) {
                break;
            } else {
                if (i4 == itemInfo2.position && !itemInfo2.scrolling) {
                    this.mItems.remove(i3);
                    this.mAdapter.destroyItem((ViewGroup) this, i4, itemInfo2.object);
                    i3--;
                    i--;
                    if (i3 >= 0) {
                        itemInfo2 = (ItemInfo) this.mItems.get(i3);
                    }
                }
            }
            itemInfo2 = null;
        }
        return i;
    }

    private int populateRight(ItemInfo itemInfo, int i, int i2) {
        float f = itemInfo.widthFactor;
        int i3 = i + 1;
        int count = this.mAdapter.getCount();
        if (f < 2.0f) {
            ItemInfo itemInfo2 = i3 < this.mItems.size() ? (ItemInfo) this.mItems.get(i3) : null;
            int i4 = this.mCurItem;
            while (true) {
                i4++;
                if (i4 >= count) {
                    break;
                }
                if (f < 2.0f || i4 <= i2) {
                    if (itemInfo2 == null || i4 != itemInfo2.position) {
                        ItemInfo addNewItem = addNewItem(i4, i3);
                        i3++;
                        f += addNewItem.widthFactor;
                        if (i3 < this.mItems.size()) {
                            itemInfo2 = (ItemInfo) this.mItems.get(i3);
                        }
                    } else {
                        f += itemInfo2.widthFactor;
                        i3++;
                        if (i3 < this.mItems.size()) {
                            itemInfo2 = (ItemInfo) this.mItems.get(i3);
                        }
                    }
                } else if (itemInfo2 == null) {
                    break;
                } else if (i4 == itemInfo2.position && !itemInfo2.scrolling) {
                    this.mItems.remove(i3);
                    this.mAdapter.destroyItem((ViewGroup) this, i4, itemInfo2.object);
                    if (i3 < this.mItems.size()) {
                        itemInfo2 = (ItemInfo) this.mItems.get(i3);
                    }
                }
                itemInfo2 = null;
            }
        }
        return i;
    }

    private void recomputeScrollPosition(int i, int i2, int i3, int i4) {
        if (i2 <= 0 || this.mItems.isEmpty()) {
            ItemInfo infoForPosition = infoForPosition(this.mCurItem);
            int min = (int) ((infoForPosition != null ? Math.min(infoForPosition.offset, this.mLastOffset) : 0.0f) * ((float) i));
            if (min != getScrollX()) {
                completeScroll();
                scrollTo(min, getScrollY());
            }
        } else {
            int scrollX = (int) ((((float) getScrollX()) / ((float) (i2 + i4))) * ((float) (i3 + i)));
            scrollTo(scrollX, getScrollY());
            if (!this.mScroller.isFinished()) {
                int duration = this.mScroller.getDuration() - this.mScroller.timePassed();
                ItemInfo infoForPosition2 = infoForPosition(this.mCurItem);
                if (infoForPosition2 != null) {
                    this.mScroller.startScroll(scrollX, 0, (int) ((infoForPosition2.offset - infoForPosition2.offsetLeftScreen) * ((float) i)), 0, duration);
                    return;
                }
            }
            this.mScroller.startScroll(scrollX, 0, 0, 0, 0);
            this.mScroller.abortAnimation();
        }
    }

    private void refreshItem(int i) {
        if (this.mAdapter != null && i >= 0 && i < this.mItems.size()) {
            ItemInfo itemInfo = (ItemInfo) this.mItems.get(i);
            if (itemInfo != null) {
                this.mAdapter.refreshItem(itemInfo.object, itemInfo.position);
            }
        }
    }

    private void removeNonDecorViews() {
        int i = 0;
        while (i < getChildCount()) {
            if (!((LayoutParams) getChildAt(i).getLayoutParams()).isDecor) {
                removeViewAt(i);
                i--;
            }
            i++;
        }
    }

    private void resetSlipInitials() {
        if (MiscUtil.floatEquals(this.mSlipProgress, 0.0f) && this.mInitialHeight != 0) {
            this.mInitialHeight = 0;
            this.mInitialWidth = 0;
        }
    }

    private void setScrollState(int i) {
        if (this.mScrollState != i) {
            this.mScrollState = i;
            if (this.mOnPageChangeListener != null) {
                this.mOnPageChangeListener.onPageScrollStateChanged(i);
            }
            if (this.mInternalPageChangeListener != null) {
                this.mInternalPageChangeListener.onPageScrollStateChanged(i);
            }
        }
    }

    private void setScrollingCacheEnabled(boolean z) {
        if (this.mScrollingCacheEnabled != z) {
            this.mScrollingCacheEnabled = z;
        }
    }

    public void addFocusables(ArrayList<View> arrayList, int i, int i2) {
        if (arrayList != null) {
            int size = arrayList.size();
            int descendantFocusability = getDescendantFocusability();
            if (descendantFocusability != 393216) {
                for (int i3 = 0; i3 < getChildCount(); i3++) {
                    View childAt = getChildAt(i3);
                    if (childAt.getVisibility() == 0) {
                        ItemInfo infoForChild = infoForChild(childAt);
                        if (infoForChild != null && infoForChild.position == this.mCurItem) {
                            childAt.addFocusables(arrayList, i, i2);
                        }
                    }
                }
            }
            if ((descendantFocusability == 262144 && size != arrayList.size()) || !isFocusable()) {
                return;
            }
            if ((i2 & 1) != 1 || !isInTouchMode() || isFocusableInTouchMode()) {
                arrayList.add(this);
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public ItemInfo addNewItem(int i, int i2) {
        ItemInfo itemInfo = new ItemInfo();
        itemInfo.position = i;
        itemInfo.object = this.mAdapter.instantiateItem((ViewGroup) this, i);
        itemInfo.widthFactor = this.mAdapter.getPageWidth(i);
        if (i2 < 0 || i2 >= this.mItems.size()) {
            this.mItems.add(itemInfo);
        } else {
            this.mItems.add(i2, itemInfo);
        }
        return itemInfo;
    }

    public void addTouchables(ArrayList<View> arrayList) {
        for (int i = 0; i < getChildCount(); i++) {
            View childAt = getChildAt(i);
            if (childAt.getVisibility() == 0) {
                ItemInfo infoForChild = infoForChild(childAt);
                if (infoForChild != null && infoForChild.position == this.mCurItem) {
                    childAt.addTouchables(arrayList);
                }
            }
        }
    }

    public void addView(View view, int i, android.view.ViewGroup.LayoutParams layoutParams) {
        if (!checkLayoutParams(layoutParams)) {
            layoutParams = generateLayoutParams(layoutParams);
        }
        LayoutParams layoutParams2 = (LayoutParams) layoutParams;
        layoutParams2.isDecor |= view instanceof Decor;
        if (!this.mInLayout) {
            super.addView(view, i, layoutParams);
        } else if (!layoutParams2.isDecor) {
            layoutParams2.needsMeasure = true;
            addViewInLayout(view, i, layoutParams);
        } else {
            throw new IllegalStateException("Cannot add pager decor view during layout");
        }
    }

    public boolean arrowScroll(int i) {
        boolean requestFocus;
        View findFocus = findFocus();
        if (findFocus == this) {
            findFocus = null;
        }
        boolean z = false;
        View findNextFocus = FocusFinder.getInstance().findNextFocus(this, findFocus, i);
        if (findNextFocus != null && findNextFocus != findFocus) {
            if (i == 17) {
                requestFocus = (findFocus == null || getChildRectInPagerCoordinates(this.mTempRect, findNextFocus).left < getChildRectInPagerCoordinates(this.mTempRect, findFocus).left) ? findNextFocus.requestFocus() : pageLeft();
            } else if (i == 66) {
                requestFocus = (findFocus == null || getChildRectInPagerCoordinates(this.mTempRect, findNextFocus).left > getChildRectInPagerCoordinates(this.mTempRect, findFocus).left) ? findNextFocus.requestFocus() : pageRight();
            }
            z = requestFocus;
        } else if (i == 17 || i == 1) {
            z = pageLeft();
        } else if (i == 66 || i == 2) {
            z = pageRight();
        }
        if (z) {
            playSoundEffect(SoundEffectConstants.getContantForFocusDirection(i));
        }
        return z;
    }

    /* access modifiers changed from: protected */
    public boolean canScroll(View view, boolean z, int i, int i2, int i3) {
        View view2 = view;
        boolean z2 = true;
        if (view2 instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view2;
            int scrollX = view.getScrollX();
            int scrollY = view.getScrollY();
            for (int childCount = viewGroup.getChildCount() - 1; childCount >= 0; childCount--) {
                View childAt = viewGroup.getChildAt(childCount);
                int i4 = i2 + scrollX;
                if (i4 >= childAt.getLeft() && i4 < childAt.getRight()) {
                    int i5 = i3 + scrollY;
                    if (i5 >= childAt.getTop() && i5 < childAt.getBottom()) {
                        if (canScroll(childAt, true, i, i4 - childAt.getLeft(), i5 - childAt.getTop())) {
                            return true;
                        }
                    }
                }
            }
        }
        if (!z || !view.canScrollHorizontally(-i)) {
            z2 = false;
        }
        return z2;
    }

    /* access modifiers changed from: protected */
    public boolean checkLayoutParams(android.view.ViewGroup.LayoutParams layoutParams) {
        return (layoutParams instanceof LayoutParams) && super.checkLayoutParams(layoutParams);
    }

    public void computeScroll() {
        if (this.mScroller.isFinished() || !this.mScroller.computeScrollOffset()) {
            completeScroll();
            return;
        }
        int scrollX = getScrollX();
        int scrollY = getScrollY();
        int currX = this.mScroller.getCurrX();
        int currY = this.mScroller.getCurrY();
        if (!(scrollX == currX && scrollY == currY)) {
            scrollTo(currX, currY);
            if (!pageScrolled(currX, false)) {
                this.mScroller.abortAnimation();
                scrollTo(0, currY);
            }
        }
        postInvalidateOnAnimation();
    }

    /* access modifiers changed from: 0000 */
    public void dataSetChanged() {
        boolean z = this.mItems.size() < (getLeftOffscreenPageLimit() + getRightOffscreenPageLimit()) + 1 && this.mItems.size() < this.mAdapter.getCount();
        int i = this.mCurItem;
        int i2 = 0;
        boolean z2 = false;
        while (i2 < this.mItems.size()) {
            ItemInfo itemInfo = (ItemInfo) this.mItems.get(i2);
            int itemPosition = this.mAdapter.getItemPosition(itemInfo.object, itemInfo.position);
            if (itemPosition != -1) {
                if (itemPosition == -3) {
                    refreshItem(i2);
                } else {
                    if (itemPosition == -2) {
                        this.mItems.remove(i2);
                        i2--;
                        if (!z2) {
                            this.mAdapter.startUpdate((ViewGroup) this);
                            z2 = true;
                        }
                        this.mAdapter.destroyItem((ViewGroup) this, itemInfo.position, itemInfo.object);
                        if (this.mCurItem == itemInfo.position) {
                            i = Math.max(0, Math.min(this.mCurItem, this.mAdapter.getCount() - 1));
                        }
                    } else if (itemInfo.position != itemPosition) {
                        if (itemInfo.position == this.mCurItem) {
                            i = itemPosition;
                        }
                        itemInfo.position = itemPosition;
                    }
                    z = true;
                }
            }
            i2++;
        }
        if (z2) {
            this.mAdapter.finishUpdate((ViewGroup) this);
        }
        Collections.sort(this.mItems, COMPARATOR);
        if (z) {
            int childCount = getChildCount();
            for (int i3 = 0; i3 < childCount; i3++) {
                LayoutParams layoutParams = (LayoutParams) getChildAt(i3).getLayoutParams();
                if (!layoutParams.isDecor) {
                    layoutParams.widthFactor = 0.0f;
                }
            }
            setCurrentItemInternal(i, false, true);
            requestLayout();
        }
    }

    public boolean dispatchKeyEvent(KeyEvent keyEvent) {
        return super.dispatchKeyEvent(keyEvent) || executeKeyEvent(keyEvent);
    }

    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = getChildAt(i);
            if (childAt.getVisibility() == 0) {
                ItemInfo infoForChild = infoForChild(childAt);
                if (infoForChild != null && infoForChild.position == this.mCurItem && childAt.dispatchPopulateAccessibilityEvent(accessibilityEvent)) {
                    return true;
                }
            }
        }
        return false;
    }

    /* access modifiers changed from: 0000 */
    public float distanceInfluenceForSnapDuration(float f) {
        double d = (double) (f - 0.5f);
        Double.isNaN(d);
        return (float) Math.sin((double) ((float) (d * 0.4712389167638204d)));
    }

    public void draw(Canvas canvas) {
        super.draw(canvas);
        int overScrollMode = getOverScrollMode();
        boolean z = false;
        if (overScrollMode == 0 || (overScrollMode == 1 && this.mAdapter != null && this.mAdapter.getCount() > 1)) {
            if (!this.mLeftEdge.isFinished()) {
                int save = canvas.save();
                int height = (getHeight() - getPaddingTop()) - getPaddingBottom();
                int width = getWidth();
                canvas.rotate(270.0f);
                canvas.translate((float) ((-height) + getPaddingTop()), this.mFirstOffset * ((float) width));
                this.mLeftEdge.setSize(height, width);
                z = this.mLeftEdge.draw(canvas);
                canvas.restoreToCount(save);
            }
            if (!this.mRightEdge.isFinished()) {
                int save2 = canvas.save();
                int width2 = getWidth();
                int height2 = (getHeight() - getPaddingTop()) - getPaddingBottom();
                canvas.rotate(90.0f);
                canvas.translate((float) (-getPaddingTop()), (-(this.mLastOffset + 1.0f)) * ((float) width2));
                this.mRightEdge.setSize(height2, width2);
                z |= this.mRightEdge.draw(canvas);
                canvas.restoreToCount(save2);
            }
        } else {
            this.mLeftEdge.finish();
            this.mRightEdge.finish();
        }
        if (z) {
            postInvalidateOnAnimation();
        }
    }

    /* access modifiers changed from: protected */
    public void drawableStateChanged() {
        super.drawableStateChanged();
        Drawable drawable = this.mMarginDrawable;
        if (drawable != null && drawable.isStateful()) {
            drawable.setState(getDrawableState());
        }
    }

    public boolean executeKeyEvent(KeyEvent keyEvent) {
        if (keyEvent.getAction() == 0) {
            int keyCode = keyEvent.getKeyCode();
            if (keyCode != 61) {
                switch (keyCode) {
                    case 21:
                        return arrowScroll(17);
                    case 22:
                        return arrowScroll(66);
                }
            } else if (VERSION.SDK_INT >= 11) {
                if (keyEvent.hasNoModifiers()) {
                    return arrowScroll(2);
                }
                if (keyEvent.hasModifiers(1)) {
                    return arrowScroll(1);
                }
            }
        }
        return false;
    }

    /* access modifiers changed from: protected */
    public android.view.ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new LayoutParams();
    }

    public android.view.ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return new LayoutParams(getContext(), attributeSet);
    }

    /* access modifiers changed from: protected */
    public android.view.ViewGroup.LayoutParams generateLayoutParams(android.view.ViewGroup.LayoutParams layoutParams) {
        return generateDefaultLayoutParams();
    }

    public final int getActiveCount() {
        return this.mItems.size();
    }

    public PagerAdapter getAdapter() {
        return this.mAdapter;
    }

    public int getCurrentItem() {
        return this.mCurItem;
    }

    public Object getItem(int i) {
        Iterator it = this.mItems.iterator();
        while (it.hasNext()) {
            ItemInfo itemInfo = (ItemInfo) it.next();
            if (itemInfo.position == i) {
                return itemInfo.object;
            }
        }
        return null;
    }

    public final Object getItemByNativeIndex(int i) {
        if (i < 0 || i >= this.mItems.size()) {
            return null;
        }
        return ((ItemInfo) this.mItems.get(i)).object;
    }

    public int getLeftOffscreenPageLimit() {
        return this.mLeftOffscreenPageLimit;
    }

    public int getPageMargin() {
        return this.mPageMargin;
    }

    public int getRightOffscreenPageLimit() {
        return this.mRightOffscreenPageLimit;
    }

    /* access modifiers changed from: 0000 */
    public ItemInfo infoForAnyChild(View view) {
        while (true) {
            ViewParent parent = view.getParent();
            if (parent == this) {
                return infoForChild(view);
            }
            if (!(parent instanceof View)) {
                return null;
            }
            view = (View) parent;
        }
    }

    /* access modifiers changed from: 0000 */
    public ItemInfo infoForChild(View view) {
        Iterator it = this.mItems.iterator();
        while (it.hasNext()) {
            ItemInfo itemInfo = (ItemInfo) it.next();
            if (this.mAdapter.isViewFromObject(view, itemInfo.object)) {
                return itemInfo;
            }
        }
        return null;
    }

    /* access modifiers changed from: 0000 */
    public ItemInfo infoForPosition(int i) {
        Iterator it = this.mItems.iterator();
        while (it.hasNext()) {
            ItemInfo itemInfo = (ItemInfo) it.next();
            if (itemInfo.position == i) {
                return itemInfo;
            }
        }
        return null;
    }

    /* access modifiers changed from: 0000 */
    public void initViewPager(Context context, AttributeSet attributeSet, int i) {
        if (attributeSet != null) {
            TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.ViewPager, i, 0);
            this.mLeftOffscreenPageLimit = obtainStyledAttributes.getInteger(1, 1);
            this.mRightOffscreenPageLimit = obtainStyledAttributes.getInteger(3, 3);
            this.mWidthSlipRatio = obtainStyledAttributes.getFloat(4, 1.0f);
            this.mHeightSlipRatio = obtainStyledAttributes.getFloat(0, 1.0f);
            this.mMarginSlipRatio = obtainStyledAttributes.getFloat(2, 1.0f);
            obtainStyledAttributes.recycle();
        }
        setWillNotDraw(false);
        setDescendantFocusability(nexEngine.ExportHEVCMainTierLevel52);
        setFocusable(true);
        this.mScroller = new Scroller(context, sInterpolator);
        ViewConfiguration viewConfiguration = ViewConfiguration.get(context);
        this.mTouchSlop = viewConfiguration.getScaledPagingTouchSlop();
        this.mMinimumVelocity = viewConfiguration.getScaledMinimumFlingVelocity();
        this.mMaximumVelocity = viewConfiguration.getScaledMaximumFlingVelocity();
        this.mReverseVelocity = Math.max(this.mMinimumVelocity * 10, this.mMaximumVelocity / 10);
        this.mLeftEdge = new EdgeEffect(context);
        this.mRightEdge = new EdgeEffect(context);
        float f = context.getResources().getDisplayMetrics().density;
        this.mFlingDistance = (int) (10.0f * f);
        this.mCloseEnough = (int) (2.0f * f);
        this.mDefaultGutterSize = (int) (f * 16.0f);
        if (getImportantForAccessibility() == 0) {
            setImportantForAccessibility(1);
        }
    }

    /* access modifiers changed from: protected */
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.mFirstLayout = true;
    }

    /* access modifiers changed from: protected */
    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        if (this.mLastOrientation != configuration.orientation) {
            this.mLastOrientation = configuration.orientation;
            resetSlipInitials();
        }
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        float f;
        float f2;
        float f3;
        if (this.mPageMargin > 0 && this.mMarginDrawable != null && this.mItems.size() > 0 && this.mAdapter != null) {
            int scrollX = getScrollX();
            int width = getWidth();
            float f4 = (float) width;
            float f5 = ((float) this.mPageMargin) / f4;
            int i = 0;
            ItemInfo itemInfo = (ItemInfo) this.mItems.get(0);
            float f6 = itemInfo.offset;
            int size = this.mItems.size();
            int i2 = itemInfo.position;
            int i3 = ((ItemInfo) this.mItems.get(size - 1)).position;
            while (true) {
                if (i2 >= i3) {
                    break;
                }
                while (i2 > itemInfo.position && i < size) {
                    i++;
                    itemInfo = (ItemInfo) this.mItems.get(i);
                }
                if (i2 == itemInfo.position) {
                    f2 = (itemInfo.offset + itemInfo.widthFactor) * f4;
                    f = itemInfo.offset + itemInfo.widthFactor + f5;
                } else {
                    float pageWidth = this.mAdapter.getPageWidth(i2);
                    f = f6 + pageWidth + f5;
                    f2 = (f6 + pageWidth) * f4;
                }
                if (((float) this.mPageMargin) + f2 > ((float) scrollX)) {
                    f3 = f5;
                    this.mMarginDrawable.setBounds((int) (f2 - 1.0f), this.mTopPageBounds, (int) (((float) this.mPageMargin) + f2 + 1.0f), this.mBottomPageBounds);
                    this.mMarginDrawable.draw(canvas);
                } else {
                    Canvas canvas2 = canvas;
                    f3 = f5;
                }
                if (f2 > ((float) (scrollX + width))) {
                    break;
                }
                i2++;
                f6 = f;
                f5 = f3;
            }
            super.onDraw(canvas);
        }
        Canvas canvas3 = canvas;
        super.onDraw(canvas);
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        super.onInitializeAccessibilityEvent(accessibilityEvent);
        accessibilityEvent.setClassName(ViewPager.class.getName());
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilityNodeInfo) {
        super.onInitializeAccessibilityNodeInfo(accessibilityNodeInfo);
        accessibilityNodeInfo.setClassName(ViewPager.class.getName());
        accessibilityNodeInfo.setScrollable(this.mAdapter != null && this.mAdapter.getCount() > 1);
        if (this.mAdapter != null && this.mCurItem >= 0 && this.mCurItem < this.mAdapter.getCount() - 1) {
            accessibilityNodeInfo.addAction(4096);
        }
        if (this.mAdapter != null && this.mCurItem > 0 && this.mCurItem < this.mAdapter.getCount()) {
            accessibilityNodeInfo.addAction(8192);
        }
    }

    public boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        float f;
        MotionEvent motionEvent2 = motionEvent;
        if (!this.mDragEnabled) {
            return false;
        }
        int action = motionEvent.getAction() & 255;
        if (action == 3 || action == 1) {
            if (DEBUG) {
                Log.v("ViewPager", "Intercept done!");
            }
            this.mIsBeingDragged = false;
            this.mIsUnableToDrag = false;
            this.mActivePointerId = -1;
            if (this.mVelocityTracker != null) {
                this.mVelocityTracker.recycle();
                this.mVelocityTracker = null;
            }
            return false;
        }
        if (action != 0) {
            if (this.mIsBeingDragged) {
                if (DEBUG) {
                    Log.v("ViewPager", "Intercept returning true!");
                }
                return true;
            } else if (this.mIsUnableToDrag) {
                if (DEBUG) {
                    Log.v("ViewPager", "Intercept returning false!");
                }
                return false;
            }
        }
        if (action == 0) {
            float x = motionEvent.getX();
            this.mInitialMotionX = x;
            this.mLastMotionX = x;
            this.mLastMotionY = motionEvent.getY();
            this.mActivePointerId = motionEvent2.getPointerId(0);
            this.mIsUnableToDrag = false;
            this.mScroller.computeScrollOffset();
            if (this.mScrollState != 2 || Math.abs(this.mScroller.getFinalX() - this.mScroller.getCurrX()) <= this.mCloseEnough) {
                completeScroll();
                this.mIsBeingDragged = false;
            } else {
                this.mScroller.abortAnimation();
                this.mPopulatePending = false;
                populate();
                this.mIsBeingDragged = true;
                setScrollState(1);
            }
            if (DEBUG) {
                StringBuilder sb = new StringBuilder();
                sb.append("Down at ");
                sb.append(this.mLastMotionX);
                sb.append(",");
                sb.append(this.mLastMotionY);
                sb.append(" mIsBeingDragged=");
                sb.append(this.mIsBeingDragged);
                sb.append("mIsUnableToDrag=");
                sb.append(this.mIsUnableToDrag);
                Log.v("ViewPager", sb.toString());
            }
        } else if (action == 2) {
            int i = this.mActivePointerId;
            if (i != -1) {
                int findPointerIndex = findPointerIndex(motionEvent2, i);
                if (findPointerIndex != -1) {
                    float x2 = motionEvent2.getX(findPointerIndex);
                    float f2 = x2 - this.mLastMotionX;
                    float abs = Math.abs(f2);
                    float y = motionEvent2.getY(findPointerIndex);
                    float abs2 = Math.abs(y - this.mLastMotionY);
                    if (DEBUG) {
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("Moved x to ");
                        sb2.append(x2);
                        sb2.append(",");
                        sb2.append(y);
                        sb2.append(" diff=");
                        sb2.append(abs);
                        sb2.append(",");
                        sb2.append(abs2);
                        Log.v("ViewPager", sb2.toString());
                    }
                    if (MiscUtil.floatEquals(f2, 0.0f) || isGutterDrag(this.mLastMotionX, f2)) {
                        f = 0.0f;
                    } else {
                        f = 0.0f;
                        if (canScroll(this, false, (int) f2, (int) x2, (int) y)) {
                            this.mLastMotionX = x2;
                            this.mInitialMotionX = x2;
                            this.mLastMotionY = y;
                            this.mIsUnableToDrag = true;
                            return false;
                        }
                    }
                    if (needIntercept(abs, abs2)) {
                        if (DEBUG) {
                            Log.v("ViewPager", "Starting drag!");
                        }
                        this.mIsBeingDragged = true;
                        setScrollState(1);
                        if (Math.abs(x2 - this.mInitialMotionX) > ((float) (this.mTouchSlop * 2))) {
                            this.mLastMotionX = x2;
                            this.mInitialMotionX = x2;
                            this.mLastMotionY = y;
                        } else {
                            this.mLastMotionX = f2 > f ? this.mInitialMotionX + ((float) this.mTouchSlop) : this.mInitialMotionX - ((float) this.mTouchSlop);
                        }
                        setScrollingCacheEnabled(true);
                    } else if (abs2 > ((float) this.mTouchSlop)) {
                        if (DEBUG) {
                            Log.v("ViewPager", "Starting unable to drag!");
                        }
                        this.mIsUnableToDrag = true;
                    }
                    if (this.mIsBeingDragged && performDrag(x2)) {
                        postInvalidateOnAnimation();
                    }
                }
            }
        } else if (action == 6) {
            onSecondaryPointerUp(motionEvent);
        }
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        }
        this.mVelocityTracker.addMovement(motionEvent2);
        return this.mIsBeingDragged;
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        int i5;
        int i6;
        int i7;
        int i8;
        int i9 = 1;
        this.mInLayout = true;
        populate();
        this.mInLayout = false;
        int childCount = getChildCount();
        int i10 = i3 - i;
        int i11 = i4 - i2;
        int paddingLeft = getPaddingLeft();
        int paddingTop = getPaddingTop();
        int paddingRight = getPaddingRight();
        int paddingBottom = getPaddingBottom();
        int scrollX = getScrollX();
        if (this.mInitialHeight == 0) {
            this.mInitialWidth = i10;
            this.mInitialHeight = i11;
        }
        int i12 = paddingBottom;
        int i13 = 0;
        int i14 = paddingTop;
        int i15 = paddingLeft;
        int i16 = 0;
        while (true) {
            i5 = 8;
            if (i16 >= childCount) {
                break;
            }
            View childAt = getChildAt(i16);
            if (childAt.getVisibility() != 8) {
                LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                if (layoutParams.isDecor) {
                    int i17 = layoutParams.gravity & 7;
                    int i18 = layoutParams.gravity & BaiduSceneResult.STREET_VIEW;
                    if (i17 == i9) {
                        i7 = Math.max((i10 - childAt.getMeasuredWidth()) / 2, i15);
                    } else if (i17 == 3) {
                        int i19 = i15;
                        i15 = childAt.getMeasuredWidth() + i15;
                        i7 = i19;
                    } else if (i17 != 5) {
                        i7 = i15;
                    } else {
                        i7 = (i10 - paddingRight) - childAt.getMeasuredWidth();
                        paddingRight += childAt.getMeasuredWidth();
                    }
                    if (i18 == 16) {
                        i8 = Math.max((i11 - childAt.getMeasuredHeight()) / 2, i14);
                    } else if (i18 == 48) {
                        i8 = i14;
                        i14 = childAt.getMeasuredHeight() + i14;
                    } else if (i18 != 80) {
                        i8 = i14;
                    } else {
                        i8 = (i11 - i12) - childAt.getMeasuredHeight();
                        i12 += childAt.getMeasuredHeight();
                    }
                    int i20 = i7 + scrollX;
                    childAt.layout(i20, i8, childAt.getMeasuredWidth() + i20, i8 + childAt.getMeasuredHeight());
                    i13++;
                }
            }
            i16++;
            i9 = 1;
        }
        int i21 = 0;
        while (i21 < childCount) {
            View childAt2 = getChildAt(i21);
            if (childAt2.getVisibility() != i5) {
                LayoutParams layoutParams2 = (LayoutParams) childAt2.getLayoutParams();
                if (!layoutParams2.isDecor) {
                    ItemInfo infoForChild = infoForChild(childAt2);
                    if (infoForChild != null) {
                        int i22 = ((int) (((float) i10) * infoForChild.offset)) + i15;
                        int i23 = (int) ((infoForChild.offsetTopScreen * ((float) i11)) + ((float) i14));
                        if (this.mForceReplayout || layoutParams2.needsMeasure) {
                            layoutParams2.needsMeasure = false;
                            int makeMeasureSpec = MeasureSpec.makeMeasureSpec((int) (((float) ((i10 - i15) - paddingRight)) * layoutParams2.widthFactor), 1073741824);
                            this.mForceReplayout = false;
                            i6 = childCount;
                            childAt2.measure(makeMeasureSpec, MeasureSpec.makeMeasureSpec((i11 - i14) - i12, 1073741824));
                        } else {
                            i6 = childCount;
                        }
                        if (DEBUG) {
                            StringBuilder sb = new StringBuilder();
                            sb.append("Positioning #");
                            sb.append(i21);
                            sb.append(" ");
                            sb.append(childAt2);
                            sb.append(" f=");
                            sb.append(infoForChild.object);
                            sb.append(":");
                            sb.append(i22);
                            sb.append(",");
                            sb.append(i14);
                            sb.append(" ");
                            sb.append(childAt2.getMeasuredWidth());
                            sb.append("x");
                            sb.append(childAt2.getMeasuredHeight());
                            Log.v("ViewPager", sb.toString());
                        }
                        childAt2.layout(i22, i23, childAt2.getMeasuredWidth() + i22, childAt2.getMeasuredHeight() - (i23 * 2));
                        i21++;
                        childCount = i6;
                        i5 = 8;
                    }
                }
            }
            i6 = childCount;
            i21++;
            childCount = i6;
            i5 = 8;
        }
        this.mTopPageBounds = i14;
        this.mBottomPageBounds = i11 - i12;
        this.mDecorChildCount = i13;
        this.mFirstLayout = false;
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x008b  */
    /* JADX WARNING: Removed duplicated region for block: B:33:0x0097  */
    /* JADX WARNING: Removed duplicated region for block: B:36:0x009c  */
    /* JADX WARNING: Removed duplicated region for block: B:40:0x00a5  */
    /* JADX WARNING: Removed duplicated region for block: B:43:0x00b4  */
    /* JADX WARNING: Removed duplicated region for block: B:44:0x00ba  */
    public void onMeasure(int i, int i2) {
        int i3;
        int i4;
        int i5;
        setMeasuredDimension(getDefaultSize(0, i), getDefaultSize(0, i2));
        int measuredWidth = getMeasuredWidth();
        this.mGutterSize = Math.min(measuredWidth / 10, this.mDefaultGutterSize);
        int paddingLeft = (measuredWidth - getPaddingLeft()) - getPaddingRight();
        int measuredHeight = (getMeasuredHeight() - getPaddingTop()) - getPaddingBottom();
        int childCount = getChildCount();
        int i6 = measuredHeight;
        int i7 = paddingLeft;
        int i8 = 0;
        while (true) {
            boolean z = true;
            int i9 = 1073741824;
            if (i8 >= childCount) {
                break;
            }
            View childAt = getChildAt(i8);
            if (childAt.getVisibility() != 8) {
                LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                if (layoutParams != null && layoutParams.isDecor) {
                    int i10 = layoutParams.gravity & 7;
                    int i11 = layoutParams.gravity & BaiduSceneResult.STREET_VIEW;
                    boolean z2 = i11 == 48 || i11 == 80;
                    if (!(i10 == 3 || i10 == 5)) {
                        z = false;
                    }
                    int i12 = Integer.MIN_VALUE;
                    if (z2) {
                        i12 = 1073741824;
                    } else if (z) {
                        i3 = 1073741824;
                        if (layoutParams.width == -2) {
                            i4 = layoutParams.width != -1 ? layoutParams.width : i7;
                            i12 = 1073741824;
                        } else {
                            i4 = i7;
                        }
                        if (layoutParams.height == -2) {
                            i5 = layoutParams.height != -1 ? layoutParams.height : i6;
                        } else {
                            i5 = i6;
                            i9 = i3;
                        }
                        childAt.measure(MeasureSpec.makeMeasureSpec(i4, i12), MeasureSpec.makeMeasureSpec(i5, i9));
                        if (!z2) {
                            i6 -= childAt.getMeasuredHeight();
                        } else if (z) {
                            i7 -= childAt.getMeasuredWidth();
                        }
                    }
                    i3 = Integer.MIN_VALUE;
                    if (layoutParams.width == -2) {
                    }
                    if (layoutParams.height == -2) {
                    }
                    childAt.measure(MeasureSpec.makeMeasureSpec(i4, i12), MeasureSpec.makeMeasureSpec(i5, i9));
                    if (!z2) {
                    }
                }
            }
            i8++;
        }
        this.mChildWidthMeasureSpec = MeasureSpec.makeMeasureSpec(i7, 1073741824);
        this.mChildHeightMeasureSpec = MeasureSpec.makeMeasureSpec(i6, 1073741824);
        this.mInLayout = true;
        populate();
        this.mInLayout = false;
        int childCount2 = getChildCount();
        for (int i13 = 0; i13 < childCount2; i13++) {
            View childAt2 = getChildAt(i13);
            if (childAt2.getVisibility() != 8) {
                if (DEBUG) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("Measuring #");
                    sb.append(i13);
                    sb.append(" ");
                    sb.append(childAt2);
                    sb.append(": ");
                    sb.append(this.mChildWidthMeasureSpec);
                    Log.v("ViewPager", sb.toString());
                }
                LayoutParams layoutParams2 = (LayoutParams) childAt2.getLayoutParams();
                if (!layoutParams2.isDecor) {
                    childAt2.measure(MeasureSpec.makeMeasureSpec((int) (((float) i7) * layoutParams2.widthFactor), 1073741824), MeasureSpec.makeMeasureSpec(i6, 1073741824));
                }
            }
        }
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Removed duplicated region for block: B:19:0x0063  */
    public void onPageScrolled(int i, float f, int i2) {
        int i3;
        int left;
        int i4;
        if (this.mDecorChildCount > 0) {
            int scrollX = getScrollX();
            int paddingLeft = getPaddingLeft();
            int paddingRight = getPaddingRight();
            int width = getWidth();
            int childCount = getChildCount();
            for (int i5 = 0; i5 < childCount; i5++) {
                View childAt = getChildAt(i5);
                LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                if (layoutParams.isDecor) {
                    int i6 = layoutParams.gravity & 7;
                    if (i6 != 1) {
                        if (i6 == 3) {
                            i3 = childAt.getWidth() + paddingLeft;
                        } else if (i6 != 5) {
                            i3 = paddingLeft;
                        } else {
                            i4 = (width - paddingRight) - childAt.getMeasuredWidth();
                            paddingRight += childAt.getMeasuredWidth();
                        }
                        left = (paddingLeft + scrollX) - childAt.getLeft();
                        if (left != 0) {
                            childAt.offsetLeftAndRight(left);
                        }
                        paddingLeft = i3;
                    } else {
                        i4 = Math.max((width - childAt.getMeasuredWidth()) / 2, paddingLeft);
                    }
                    int i7 = i4;
                    i3 = paddingLeft;
                    paddingLeft = i7;
                    left = (paddingLeft + scrollX) - childAt.getLeft();
                    if (left != 0) {
                    }
                    paddingLeft = i3;
                }
            }
        }
        if (this.mOnPageChangeListener != null) {
            this.mOnPageChangeListener.onPageScrolled(i, f, i2);
        }
        if (this.mInternalPageChangeListener != null) {
            this.mInternalPageChangeListener.onPageScrolled(i, f, i2);
        }
        this.mCalledSuper = true;
    }

    /* access modifiers changed from: protected */
    public boolean onRequestFocusInDescendants(int i, Rect rect) {
        int i2;
        int i3;
        int childCount = getChildCount();
        int i4 = -1;
        if ((i & 2) != 0) {
            i4 = childCount;
            i3 = 0;
            i2 = 1;
        } else {
            i3 = childCount - 1;
            i2 = -1;
        }
        while (i3 != i4) {
            View childAt = getChildAt(i3);
            if (childAt.getVisibility() == 0) {
                ItemInfo infoForChild = infoForChild(childAt);
                if (infoForChild != null && infoForChild.position == this.mCurItem && childAt.requestFocus(i, rect)) {
                    return true;
                }
            }
            i3 += i2;
        }
        return false;
    }

    public void onRestoreInstanceState(Parcelable parcelable) {
        if (!(parcelable instanceof SavedState)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        SavedState savedState = (SavedState) parcelable;
        super.onRestoreInstanceState(savedState.getSuperState());
        if (this.mAdapter != null) {
            this.mAdapter.restoreState(savedState.adapterState, null);
            setCurrentItemInternal(savedState.position, false, true);
        } else {
            this.mRestoredCurItem = savedState.position;
            this.mRestoredAdapterState = savedState.adapterState;
        }
    }

    public Parcelable onSaveInstanceState() {
        SavedState savedState = new SavedState(super.onSaveInstanceState());
        savedState.position = this.mCurItem;
        if (this.mAdapter != null) {
            savedState.adapterState = this.mAdapter.saveState();
        }
        return savedState;
    }

    /* access modifiers changed from: protected */
    public void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        if (i != i3) {
            recomputeScrollPosition(i, i3, 0, 0);
        }
    }

    public void onSlipping(float f) {
        this.mSlipProgress = f;
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        if (this.mFakeDragging) {
            return true;
        }
        boolean z = false;
        if ((motionEvent.getAction() == 0 && motionEvent.getEdgeFlags() != 0) || this.mAdapter == null || this.mAdapter.getCount() == 0) {
            return false;
        }
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        }
        this.mVelocityTracker.addMovement(motionEvent);
        switch (motionEvent.getAction() & 255) {
            case 0:
                this.mScroller.abortAnimation();
                this.mPopulatePending = false;
                populate();
                this.mIsBeingDragged = true;
                setScrollState(1);
                float x = motionEvent.getX();
                this.mInitialMotionX = x;
                this.mLastMotionX = x;
                this.mActivePointerId = motionEvent.getPointerId(0);
                break;
            case 1:
                if (this.mIsBeingDragged) {
                    VelocityTracker velocityTracker = this.mVelocityTracker;
                    velocityTracker.computeCurrentVelocity(1000, (float) this.mMaximumVelocity);
                    int xVelocity = (int) velocityTracker.getXVelocity(this.mActivePointerId);
                    this.mPopulatePending = true;
                    int width = getWidth();
                    int scrollX = getScrollX();
                    ItemInfo infoForCurrentScrollPosition = infoForCurrentScrollPosition();
                    int i = infoForCurrentScrollPosition.position;
                    float f = (((((float) scrollX) / ((float) width)) - infoForCurrentScrollPosition.offset) - infoForCurrentScrollPosition.offsetLeftScreen) / infoForCurrentScrollPosition.widthFactor;
                    int findPointerIndex = findPointerIndex(motionEvent, this.mActivePointerId);
                    if (findPointerIndex != -1) {
                        setCurrentItemInternal(determineTargetPage(i, f, xVelocity, (int) (motionEvent.getX(findPointerIndex) - this.mInitialMotionX)), true, true, xVelocity);
                        this.mActivePointerId = -1;
                        endDrag();
                        this.mLeftEdge.onRelease();
                        this.mRightEdge.onRelease();
                        z = this.mLeftEdge.isFinished() | this.mRightEdge.isFinished();
                        break;
                    }
                }
                break;
            case 2:
                if (!this.mIsBeingDragged) {
                    int findPointerIndex2 = findPointerIndex(motionEvent, this.mActivePointerId);
                    if (findPointerIndex2 != -1) {
                        float x2 = motionEvent.getX(findPointerIndex2);
                        float abs = Math.abs(x2 - this.mLastMotionX);
                        float y = motionEvent.getY(findPointerIndex2);
                        float abs2 = Math.abs(y - this.mLastMotionY);
                        if (DEBUG) {
                            StringBuilder sb = new StringBuilder();
                            sb.append("Moved x to ");
                            sb.append(x2);
                            sb.append(",");
                            sb.append(y);
                            sb.append(" diff=");
                            sb.append(abs);
                            sb.append(",");
                            sb.append(abs2);
                            Log.v("ViewPager", sb.toString());
                        }
                        if (needIntercept(abs, abs2)) {
                            if (DEBUG) {
                                Log.v("ViewPager", "Starting drag!");
                            }
                            this.mIsBeingDragged = true;
                            this.mLastMotionX = x2 - this.mInitialMotionX > 0.0f ? this.mInitialMotionX + ((float) this.mTouchSlop) : this.mInitialMotionX - ((float) this.mTouchSlop);
                            setScrollState(1);
                            setScrollingCacheEnabled(true);
                        }
                    }
                }
                if (this.mIsBeingDragged) {
                    int findPointerIndex3 = findPointerIndex(motionEvent, this.mActivePointerId);
                    if (findPointerIndex3 != -1) {
                        z = performDrag(motionEvent.getX(findPointerIndex3));
                        break;
                    }
                }
                break;
            case 3:
                if (this.mIsBeingDragged) {
                    setCurrentItemInternal(this.mCurItem, true, true);
                    this.mActivePointerId = -1;
                    endDrag();
                    this.mLeftEdge.onRelease();
                    this.mRightEdge.onRelease();
                    z = this.mLeftEdge.isFinished() | this.mRightEdge.isFinished();
                    break;
                }
                break;
            case 5:
                int actionIndex = motionEvent.getActionIndex();
                this.mLastMotionX = motionEvent.getX(actionIndex);
                this.mActivePointerId = motionEvent.getPointerId(actionIndex);
                break;
            case 6:
                onSecondaryPointerUp(motionEvent);
                int findPointerIndex4 = findPointerIndex(motionEvent, this.mActivePointerId);
                if (findPointerIndex4 != -1) {
                    this.mLastMotionX = motionEvent.getX(findPointerIndex4);
                    break;
                }
                break;
        }
        if (z) {
            postInvalidateOnAnimation();
        }
        return true;
    }

    /* access modifiers changed from: 0000 */
    public boolean pageLeft() {
        if (this.mCurItem <= 0) {
            return false;
        }
        setCurrentItem(this.mCurItem - 1, true);
        return true;
    }

    /* access modifiers changed from: 0000 */
    public boolean pageRight() {
        if (this.mAdapter == null || this.mCurItem >= this.mAdapter.getCount() - 1) {
            return false;
        }
        setCurrentItem(this.mCurItem + 1, true);
        return true;
    }

    public boolean performAccessibilityAction(int i, Bundle bundle) {
        if (super.performAccessibilityAction(i, bundle)) {
            return true;
        }
        if (i != 4096) {
            if (i != 8192 || this.mAdapter == null || this.mCurItem <= 0 || this.mCurItem >= this.mAdapter.getCount()) {
                return false;
            }
            setCurrentItem(this.mCurItem - 1);
            return true;
        } else if (this.mAdapter == null || this.mCurItem < 0 || this.mCurItem >= this.mAdapter.getCount() - 1) {
            return false;
        } else {
            setCurrentItem(this.mCurItem + 1);
            return true;
        }
    }

    /* access modifiers changed from: 0000 */
    public void populate() {
        populate(this.mCurItem);
    }

    /* access modifiers changed from: 0000 */
    /* JADX WARNING: Code restructure failed: missing block: B:28:0x007a, code lost:
        if (r7.position == r10.mCurItem) goto L_0x0081;
     */
    public void populate(int i) {
        ItemInfo itemInfo;
        ItemInfo itemInfo2;
        ItemInfo itemInfo3 = null;
        if (this.mCurItem != i) {
            calculatePageLimits(i);
            itemInfo = infoForPosition(this.mCurItem);
            this.mCurItem = i;
        } else {
            itemInfo = null;
        }
        if (this.mAdapter != null) {
            if (this.mPopulatePending) {
                if (DEBUG) {
                    Log.i("ViewPager", "populate is pending, skipping for now...");
                }
            } else if (getWindowToken() != null) {
                this.mAdapter.startUpdate((ViewGroup) this);
                int max = Math.max(0, this.mCurItem - getLeftOffscreenPageLimit());
                int count = this.mAdapter.getCount();
                int min = Math.min(count - 1, this.mCurItem + getRightOffscreenPageLimit());
                boolean z = count > 0 && this.mItems.isEmpty();
                int i2 = 0;
                while (true) {
                    if (i2 >= this.mItems.size()) {
                        break;
                    }
                    itemInfo2 = (ItemInfo) this.mItems.get(i2);
                    if (itemInfo2.position < this.mCurItem) {
                        i2++;
                    }
                }
                itemInfo2 = null;
                if (itemInfo2 == null && count > 0) {
                    itemInfo2 = addNewItem(this.mCurItem, i2);
                }
                if (itemInfo2 != null) {
                    calculatePageOffsets(itemInfo2, this.mLeftOffscreenPageLimit <= this.mRightOffscreenPageLimit ? populateRight(itemInfo2, populateLeft(itemInfo2, i2, max), min) : populateLeft(itemInfo2, populateRight(itemInfo2, i2, min), max), itemInfo);
                }
                if (DEBUG) {
                    Log.i("ViewPager", "Current page list:");
                    for (int i3 = 0; i3 < this.mItems.size(); i3++) {
                        StringBuilder sb = new StringBuilder();
                        sb.append("#");
                        sb.append(i3);
                        sb.append(": page ");
                        sb.append(((ItemInfo) this.mItems.get(i3)).position);
                        Log.i("ViewPager", sb.toString());
                    }
                }
                this.mAdapter.setPrimaryItem((ViewGroup) this, this.mCurItem, itemInfo2 != null ? itemInfo2.object : null);
                this.mAdapter.finishUpdate((ViewGroup) this);
                int childCount = getChildCount();
                for (int i4 = 0; i4 < childCount; i4++) {
                    View childAt = getChildAt(i4);
                    LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                    if (!layoutParams.isDecor) {
                        ItemInfo infoForChild = infoForChild(childAt);
                        if (infoForChild != null) {
                            layoutParams.widthFactor = infoForChild.widthFactor;
                        }
                    }
                }
                if (hasFocus()) {
                    View findFocus = findFocus();
                    if (findFocus != null) {
                        itemInfo3 = infoForAnyChild(findFocus);
                    }
                    if (itemInfo3 == null || itemInfo3.position != this.mCurItem) {
                        for (int i5 = 0; i5 < getChildCount(); i5++) {
                            View childAt2 = getChildAt(i5);
                            ItemInfo infoForChild2 = infoForChild(childAt2);
                            if (infoForChild2 != null && infoForChild2.position == this.mCurItem && childAt2.requestFocus(2)) {
                                break;
                            }
                        }
                    }
                }
                if (z) {
                    if (this.mOnPageChangeListener != null) {
                        this.mOnPageChangeListener.onPageSelected(this.mCurItem);
                    }
                    if (this.mPageSettledListener != null) {
                        this.mPageSettledListener.onPageSettled(this.mCurItem);
                    }
                }
            }
        }
    }

    public void setAdapter(PagerAdapter pagerAdapter) {
        if (this.mAdapter != null) {
            this.mAdapter.unregisterDataSetObserver(this.mObserver);
            this.mAdapter.startUpdate((ViewGroup) this);
            Iterator it = this.mItems.iterator();
            while (it.hasNext()) {
                ItemInfo itemInfo = (ItemInfo) it.next();
                this.mAdapter.destroyItem((ViewGroup) this, itemInfo.position, itemInfo.object);
            }
            this.mAdapter.finishUpdate((ViewGroup) this);
            this.mItems.clear();
            removeNonDecorViews();
            this.mCurItem = 0;
            scrollTo(0, 0);
        }
        PagerAdapter pagerAdapter2 = this.mAdapter;
        this.mAdapter = pagerAdapter;
        if (this.mAdapter != null) {
            if (this.mObserver == null) {
                this.mObserver = new PagerObserver();
            }
            this.mAdapter.registerDataSetObserver(this.mObserver);
            this.mPopulatePending = false;
            this.mFirstLayout = true;
            if (this.mRestoredCurItem >= 0) {
                this.mAdapter.restoreState(this.mRestoredAdapterState, null);
                setCurrentItemInternal(this.mRestoredCurItem, false, true);
                this.mRestoredCurItem = -1;
                this.mRestoredAdapterState = null;
            } else {
                populate();
            }
        }
        if (this.mAdapterChangeListener != null && pagerAdapter2 != pagerAdapter) {
            this.mAdapterChangeListener.onAdapterChanged(pagerAdapter2, pagerAdapter);
        }
    }

    public void setBottomMarginProgress(float f) {
        this.mBottomMarginProgress = f;
        this.mForceReplayout = true;
        requestLayout();
        invalidate();
    }

    public void setCurrentItem(int i) {
        this.mPopulatePending = false;
        setCurrentItemInternal(i, !this.mFirstLayout, false);
    }

    public void setCurrentItem(int i, boolean z) {
        this.mPopulatePending = false;
        setCurrentItemInternal(i, z, false);
    }

    /* access modifiers changed from: 0000 */
    public void setCurrentItemInternal(int i, boolean z, boolean z2) {
        setCurrentItemInternal(i, z, z2, 0);
    }

    /* access modifiers changed from: 0000 */
    public void setCurrentItemInternal(int i, boolean z, boolean z2, int i2) {
        int i3;
        if (this.mAdapter == null || this.mAdapter.getCount() <= 0) {
            setScrollingCacheEnabled(false);
        } else if (z2 || this.mCurItem != i || this.mItems.size() == 0) {
            boolean z3 = true;
            if (i < 0) {
                i = 0;
            } else if (i >= this.mAdapter.getCount()) {
                i = this.mAdapter.getCount() - 1;
            }
            if (i > this.mCurItem + getRightOffscreenPageLimit() || i < this.mCurItem - getLeftOffscreenPageLimit()) {
                Iterator it = this.mItems.iterator();
                while (it.hasNext()) {
                    ((ItemInfo) it.next()).scrolling = true;
                }
            }
            if (this.mCurItem == i) {
                z3 = false;
            }
            populate(i);
            ItemInfo infoForPosition = infoForPosition(i);
            if (infoForPosition != null) {
                i3 = (int) (((float) getWidth()) * Math.max(getMinScrollOffset(), Math.min(infoForPosition.offset - infoForPosition.offsetLeftScreen, getMaxScrollOffset())));
            } else {
                i3 = 0;
            }
            if (z) {
                smoothScrollTo(i3, 0, i2);
                if (z3 && this.mOnPageChangeListener != null) {
                    this.mOnPageChangeListener.onPageSelected(i);
                }
                if (z3 && this.mInternalPageChangeListener != null) {
                    this.mInternalPageChangeListener.onPageSelected(i);
                }
            } else {
                if (z3 && this.mOnPageChangeListener != null) {
                    this.mOnPageChangeListener.onPageSelected(i);
                }
                if (z3 && this.mInternalPageChangeListener != null) {
                    this.mInternalPageChangeListener.onPageSelected(i);
                }
                completeScroll();
                scrollTo(i3, 0);
                callBackPageSettled();
            }
        } else {
            setScrollingCacheEnabled(false);
        }
    }

    public void setDraggable(boolean z) {
        this.mDragEnabled = z;
    }

    public void setHeightSlipRatio(float f) {
        this.mHeightSlipRatio = MiscUtil.clamp(f, 0.0f, 1.0f);
        if (isLaidOut()) {
            if (DEBUG) {
                Log.d("ViewPager", "update height slip ratio, request layout");
            }
            requestLayout();
        }
    }

    public void setLeftOffscreenPageLimit(int i) {
        if (i != this.mLeftOffscreenPageLimit) {
            this.mLeftOffscreenPageLimit = i;
            populate();
        }
    }

    public void setMarginSlipRatio(float f) {
        this.mMarginSlipRatio = MiscUtil.clamp(f, 0.0f, 1.0f);
        if (isLaidOut()) {
            if (DEBUG) {
                Log.d("ViewPager", "update margin slip ratio, request layout");
            }
            requestLayout();
        }
    }

    /* access modifiers changed from: 0000 */
    public void setOnAdapterChangeListener(OnAdapterChangeListener onAdapterChangeListener) {
        this.mAdapterChangeListener = onAdapterChangeListener;
    }

    public void setOnPageChangeListener(OnPageChangeListener onPageChangeListener) {
        this.mOnPageChangeListener = onPageChangeListener;
    }

    public void setOnPageSettledListener(OnPageSettledListener onPageSettledListener) {
        this.mPageSettledListener = onPageSettledListener;
    }

    public void setPageMargin(int i) {
        int i2 = this.mPageMargin;
        this.mPageMargin = i;
        this.mInitialPageMargin = this.mPageMargin;
        int width = getWidth();
        recomputeScrollPosition(width, width, i, i2);
        requestLayout();
    }

    public void setPageMarginDrawable(int i) {
        setPageMarginDrawable(getContext().getResources().getDrawable(i));
    }

    public void setPageMarginDrawable(Drawable drawable) {
        setPageMarginDrawable(drawable, true);
    }

    public void setPageMarginDrawable(Drawable drawable, boolean z) {
        this.mMarginDrawable = drawable;
        if (drawable != null) {
            refreshDrawableState();
        }
        setWillNotDraw(drawable == null);
        if (z) {
            invalidate();
        }
    }

    public void setRightOffscreenPageLimit(int i) {
        if (i != this.mRightOffscreenPageLimit) {
            this.mRightOffscreenPageLimit = i;
            populate();
        }
    }

    public void setWidthSlipRatio(float f) {
        this.mWidthSlipRatio = MiscUtil.clamp(f, 0.0f, 1.0f);
        if (isLaidOut()) {
            if (DEBUG) {
                Log.d("ViewPager", "update width slip ratio, request layout");
            }
            requestLayout();
        }
    }

    /* access modifiers changed from: 0000 */
    public void smoothScrollTo(int i, int i2, int i3) {
        int i4;
        if (getChildCount() == 0) {
            setScrollingCacheEnabled(false);
            return;
        }
        int scrollX = getScrollX();
        int scrollY = getScrollY();
        int i5 = i - scrollX;
        int i6 = i2 - scrollY;
        if (i5 == 0 && i6 == 0) {
            completeScroll();
            populate();
            setScrollState(0);
            callBackPageSettled();
            return;
        }
        setScrollingCacheEnabled(true);
        setScrollState(2);
        int width = getWidth();
        int i7 = width / 2;
        float f = (float) width;
        float f2 = (float) i7;
        float distanceInfluenceForSnapDuration = f2 + (distanceInfluenceForSnapDuration(Math.min(1.0f, (((float) Math.abs(i5)) * 1.0f) / f)) * f2);
        int abs = Math.abs(i3);
        if (abs > 0) {
            i4 = Math.round(Math.abs(distanceInfluenceForSnapDuration / ((float) abs)) * 1000.0f) * 4;
        } else {
            i4 = (int) (((((float) Math.abs(i5)) / ((f * this.mAdapter.getPageWidth(this.mCurItem)) + ((float) this.mPageMargin))) + 1.0f) * 100.0f);
        }
        this.mScroller.startScroll(scrollX, scrollY, i5, i6, Math.min(i4, 600));
        postInvalidateOnAnimation();
    }

    /* access modifiers changed from: protected */
    public boolean verifyDrawable(Drawable drawable) {
        return super.verifyDrawable(drawable) || drawable == this.mMarginDrawable;
    }
}
