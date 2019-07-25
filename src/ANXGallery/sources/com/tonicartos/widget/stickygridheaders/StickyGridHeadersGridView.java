package com.tonicartos.widget.stickygridheaders;

import android.content.Context;
import android.database.DataSetObserver;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.Handler;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.v4.util.ArrayMap;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.BaseSavedState;
import android.view.View.MeasureSpec;
import android.view.ViewConfiguration;
import android.view.ViewGroup.LayoutParams;
import android.widget.AbsListView;
import android.widget.AbsListView.OnScrollListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.AdapterView.OnItemLongClickListener;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.GridView;
import android.widget.ListAdapter;
import com.google.common.collect.Lists;
import com.miui.gallery.R;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.photoview.ScrollableView;
import com.miui.gallery.view.GestureDetector;
import com.miui.gallery.view.GestureDetector.OnGestureListener;
import com.miui.gallery.view.GestureDetector.SimpleOnGestureListener;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class StickyGridHeadersGridView extends GridView implements OnScrollListener, OnItemClickListener, OnItemLongClickListener, OnItemSelectedListener, ScrollableView {
    /* access modifiers changed from: private */
    public static final String ERROR_PLATFORM;
    static final String TAG = StickyGridHeadersGridView.class.getSimpleName();
    protected StickyGridHeadersBaseAdapterWrapper mAdapter;
    private boolean mAreHeadersSticky;
    private boolean mClipToPaddingHasBeenSet;
    private final Rect mClippingRect;
    private boolean mClippingToPadding;
    private long mCurrentHeaderId;
    protected boolean mDataChanged;
    private DataSetObserver mDataSetObserver;
    private ArrayList<FixedViewInfo> mFooterViewInfos;
    private GestureDetector mGestureDetector;
    OnGestureListener mGestureListener;
    private int mHeaderBottomPosition;
    boolean mHeaderChildBeingPressed;
    private ArrayList<FixedViewInfo> mHeaderViewInfos;
    private boolean mHeadersIgnorePadding;
    private int mHorizontalSpacing;
    private boolean mMaskStickyHeaderRegion;
    protected int mMotionHeaderPosition;
    private float mMotionY;
    private OnHeaderClickListener mOnHeaderClickListener;
    private OnHeaderLongClickListener mOnHeaderLongClickListener;
    private OnItemClickListener mOnItemClickListener;
    private OnItemLongClickListener mOnItemLongClickListener;
    private OnItemSelectedListener mOnItemSelectedListener;
    public CheckForHeaderLongPress mPendingCheckForLongPress;
    public CheckForHeaderTap mPendingCheckForTap;
    private PerformHeaderClick mPerformHeaderClick;
    /* access modifiers changed from: private */
    public int mPreScrollState;
    private ListAdapter mRealAdapter;
    private int mRequestedNumColumns;
    private OnScrollListener mScrollListener;
    /* access modifiers changed from: private */
    public int mScrollState;
    private View mStickiedHeader;
    private int mStickyHeaderBackgroundAlpha;
    private Drawable mStickyHeaderBackgroundDrawable;
    protected int mTouchMode;
    /* access modifiers changed from: private */
    public Runnable mTouchModeReset;
    private int mTouchSlop;
    private int mVerticalSpacing;

    private class CheckForHeaderLongPress extends WindowRunnable implements Runnable {
        private CheckForHeaderLongPress() {
            super();
        }

        public void run() {
            if (StickyGridHeadersGridView.this.getHeaderAt(StickyGridHeadersGridView.this.mMotionHeaderPosition) != null) {
                if (sameWindow()) {
                    boolean z = StickyGridHeadersGridView.this.mDataChanged;
                }
                StickyGridHeadersGridView.this.mTouchMode = 2;
            }
        }
    }

    final class CheckForHeaderTap implements Runnable {
        CheckForHeaderTap() {
        }

        public void run() {
            if (StickyGridHeadersGridView.this.mTouchMode == 0) {
                StickyGridHeadersGridView.this.mTouchMode = 1;
                View headerAt = StickyGridHeadersGridView.this.getHeaderAt(StickyGridHeadersGridView.this.mMotionHeaderPosition);
                if (headerAt != null && !StickyGridHeadersGridView.this.mHeaderChildBeingPressed) {
                    if (!StickyGridHeadersGridView.this.mDataChanged) {
                        headerAt.setPressed(true);
                        StickyGridHeadersGridView.this.setPressed(true);
                        StickyGridHeadersGridView.this.refreshDrawableState();
                        int longPressTimeout = ViewConfiguration.getLongPressTimeout();
                        if (StickyGridHeadersGridView.this.isLongClickable()) {
                            if (StickyGridHeadersGridView.this.mPendingCheckForLongPress == null) {
                                StickyGridHeadersGridView.this.mPendingCheckForLongPress = new CheckForHeaderLongPress();
                            }
                            StickyGridHeadersGridView.this.mPendingCheckForLongPress.rememberWindowAttachCount();
                            StickyGridHeadersGridView.this.postDelayed(StickyGridHeadersGridView.this.mPendingCheckForLongPress, (long) longPressTimeout);
                            return;
                        }
                        StickyGridHeadersGridView.this.mTouchMode = 2;
                        return;
                    }
                    StickyGridHeadersGridView.this.mTouchMode = 2;
                }
            }
        }
    }

    public class FixedViewInfo {
        public Object data;
        public View view;

        public FixedViewInfo() {
        }
    }

    public interface OnHeaderClickListener {
        void onHeaderClick(AdapterView<?> adapterView, View view, long j);
    }

    public interface OnHeaderLongClickListener {
    }

    private class PerformHeaderClick extends WindowRunnable implements Runnable {
        int mClickMotionPosition;

        private PerformHeaderClick() {
            super();
        }

        public void run() {
            if (!StickyGridHeadersGridView.this.mDataChanged && StickyGridHeadersGridView.this.mAdapter != null && StickyGridHeadersGridView.this.mAdapter.getCount() > 0 && this.mClickMotionPosition != -1 && this.mClickMotionPosition < StickyGridHeadersGridView.this.mAdapter.getCount() && sameWindow()) {
                View headerAt = StickyGridHeadersGridView.this.getHeaderAt(this.mClickMotionPosition);
                if (headerAt != null) {
                    StickyGridHeadersGridView.this.performHeaderClick(headerAt, StickyGridHeadersGridView.this.headerViewPositionToId(this.mClickMotionPosition));
                }
            }
        }
    }

    class RuntimePlatformSupportException extends RuntimeException {
        private static final long serialVersionUID = -6512098808936536538L;

        public RuntimePlatformSupportException(Exception exc) {
            super(StickyGridHeadersGridView.ERROR_PLATFORM, exc);
        }
    }

    static class SavedState extends BaseSavedState {
        public static final Creator<SavedState> CREATOR = new Creator<SavedState>() {
            public SavedState createFromParcel(Parcel parcel) {
                return new SavedState(parcel);
            }

            public SavedState[] newArray(int i) {
                return new SavedState[i];
            }
        };
        boolean areHeadersSticky;

        private SavedState(Parcel parcel) {
            super(parcel);
            this.areHeadersSticky = parcel.readByte() != 0;
        }

        public SavedState(Parcelable parcelable) {
            super(parcelable);
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("StickyGridHeadersGridView.SavedState{");
            sb.append(Integer.toHexString(System.identityHashCode(this)));
            sb.append(" areHeadersSticky=");
            sb.append(this.areHeadersSticky);
            sb.append("}");
            return sb.toString();
        }

        public void writeToParcel(Parcel parcel, int i) {
            super.writeToParcel(parcel, i);
            parcel.writeByte(this.areHeadersSticky ? (byte) 1 : 0);
        }
    }

    private class WindowRunnable {
        private int mOriginalAttachCount;

        private WindowRunnable() {
        }

        public void rememberWindowAttachCount() {
            this.mOriginalAttachCount = StickyGridHeadersGridView.this.getWindowAttachCount();
        }

        public boolean sameWindow() {
            return StickyGridHeadersGridView.this.hasWindowFocus() && StickyGridHeadersGridView.this.getWindowAttachCount() == this.mOriginalAttachCount;
        }
    }

    static {
        StringBuilder sb = new StringBuilder();
        sb.append("Error supporting platform ");
        sb.append(VERSION.SDK_INT);
        sb.append(".");
        ERROR_PLATFORM = sb.toString();
    }

    public StickyGridHeadersGridView(Context context) {
        this(context, null);
    }

    public StickyGridHeadersGridView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public StickyGridHeadersGridView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mAreHeadersSticky = true;
        this.mClippingRect = new Rect();
        this.mCurrentHeaderId = -1;
        this.mDataSetObserver = new DataSetObserver() {
            public void onChanged() {
                StickyGridHeadersGridView.this.reset();
            }

            public void onInvalidated() {
                StickyGridHeadersGridView.this.reset();
            }
        };
        this.mMaskStickyHeaderRegion = false;
        this.mStickyHeaderBackgroundAlpha = 250;
        this.mPreScrollState = 0;
        this.mScrollState = 0;
        this.mHeaderChildBeingPressed = false;
        this.mHeaderViewInfos = Lists.newArrayList();
        this.mFooterViewInfos = Lists.newArrayList();
        this.mGestureListener = new SimpleOnGestureListener() {
            public boolean onSingleTapUp(MotionEvent motionEvent) {
                Log.d(StickyGridHeadersGridView.TAG, "onSingleTapUp mPreScrollState %s, mScrollState %s", Integer.valueOf(StickyGridHeadersGridView.this.mPreScrollState), Integer.valueOf(StickyGridHeadersGridView.this.mScrollState));
                if (StickyGridHeadersGridView.this.mPreScrollState == 0 || StickyGridHeadersGridView.this.mScrollState != 0) {
                    int pointToPosition = StickyGridHeadersGridView.this.pointToPosition((int) motionEvent.getX(), (int) motionEvent.getY());
                    if (pointToPosition != -1 && pointToPosition < StickyGridHeadersGridView.this.mAdapter.getCount() && StickyGridHeadersGridView.this.mAdapter.isEnabled(pointToPosition)) {
                        View childAt = StickyGridHeadersGridView.this.getChildAt(pointToPosition - StickyGridHeadersGridView.this.getFirstVisiblePosition());
                        if (childAt != null) {
                            StickyGridHeadersGridView.this.onItemClick(StickyGridHeadersGridView.this, childAt, pointToPosition, StickyGridHeadersGridView.this.mAdapter.getItemId(pointToPosition));
                        }
                    }
                }
                return super.onSingleTapUp(motionEvent);
            }
        };
        super.setOnScrollListener(this);
        setVerticalFadingEdgeEnabled(false);
        this.mTouchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
    }

    private int findMotionHeader(float f) {
        if (this.mStickiedHeader != null && f <= ((float) this.mHeaderBottomPosition)) {
            return -2;
        }
        int i = 0;
        int firstVisiblePosition = getFirstVisiblePosition();
        while (firstVisiblePosition <= getLastVisiblePosition()) {
            if (getItemIdAtPosition(firstVisiblePosition) == -1) {
                View childAt = getChildAt(i);
                int bottom = childAt.getBottom();
                int top = childAt.getTop();
                if (f <= ((float) bottom) && f >= ((float) top)) {
                    return i;
                }
            }
            firstVisiblePosition += getNumColumns();
            i += getNumColumns();
        }
        return -1;
    }

    private int getHeaderHeight() {
        if (this.mStickiedHeader != null) {
            return this.mStickiedHeader.getMeasuredHeight();
        }
        return 0;
    }

    /* access modifiers changed from: private */
    public long headerViewPositionToId(int i) {
        return i == -2 ? this.mCurrentHeaderId : this.mAdapter.getHeaderId(getFirstVisiblePosition() + i);
    }

    private void measureHeader() {
        if (this.mStickiedHeader != null) {
            int makeMeasureSpec = this.mHeadersIgnorePadding ? MeasureSpec.makeMeasureSpec(getWidth(), 1073741824) : MeasureSpec.makeMeasureSpec((getWidth() - getPaddingLeft()) - getPaddingRight(), 1073741824);
            LayoutParams layoutParams = this.mStickiedHeader.getLayoutParams();
            int makeMeasureSpec2 = (layoutParams == null || layoutParams.height <= 0) ? MeasureSpec.makeMeasureSpec(0, 0) : MeasureSpec.makeMeasureSpec(layoutParams.height, 1073741824);
            this.mStickiedHeader.measure(MeasureSpec.makeMeasureSpec(0, 0), MeasureSpec.makeMeasureSpec(0, 0));
            this.mStickiedHeader.measure(makeMeasureSpec, makeMeasureSpec2);
            if (this.mHeadersIgnorePadding) {
                this.mStickiedHeader.layout(getLeft(), 0, getRight(), this.mStickiedHeader.getMeasuredHeight());
            } else {
                this.mStickiedHeader.layout(getLeft() + getPaddingLeft(), 0, getRight() - getPaddingRight(), this.mStickiedHeader.getMeasuredHeight());
            }
        }
    }

    private boolean removeFixedViewInfo(View view, ArrayList<FixedViewInfo> arrayList) {
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            if (((FixedViewInfo) arrayList.get(i)).view == view) {
                arrayList.remove(i);
                detachHeader(view);
                return true;
            }
        }
        return false;
    }

    /* access modifiers changed from: private */
    public void reset() {
        this.mHeaderBottomPosition = 0;
        swapStickiedHeader(null);
        this.mCurrentHeaderId = Long.MIN_VALUE;
    }

    /* JADX WARNING: Removed duplicated region for block: B:38:0x009f  */
    /* JADX WARNING: Removed duplicated region for block: B:41:0x00b5  */
    private void scrollChanged(int i) {
        int i2;
        long j;
        int childCount;
        long j2;
        int i3 = i;
        if (this.mAdapter != null && this.mAdapter.getCount() != 0 && this.mAreHeadersSticky && getChildAt(0) != null) {
            if (this.mAdapter.getHeaderId(i3) < ((long) this.mHeaderViewInfos.size())) {
                this.mCurrentHeaderId = -1;
                this.mStickiedHeader = null;
                return;
            }
            int numColumns = getNumColumns();
            int i4 = i3 - numColumns;
            if (i4 < 0) {
                i4 = i3;
            }
            int i5 = i3 + numColumns;
            if (i5 >= this.mAdapter.getCount()) {
                i5 = i3;
            }
            if (this.mVerticalSpacing == 0) {
                j = this.mAdapter.getHeaderId(i3);
            } else {
                if (this.mVerticalSpacing < 0) {
                    this.mAdapter.getHeaderId(i3);
                    if (getChildAt(numColumns).getTop() <= 0) {
                        j2 = this.mAdapter.getHeaderId(i5);
                        i2 = i5;
                    } else {
                        j = this.mAdapter.getHeaderId(i3);
                    }
                } else {
                    int top = getChildAt(0).getTop();
                    if (top <= 0 || top >= this.mVerticalSpacing) {
                        j = this.mAdapter.getHeaderId(i3);
                    } else {
                        j2 = this.mAdapter.getHeaderId(i4);
                        i2 = i4;
                    }
                }
                j = j2;
                if (this.mCurrentHeaderId != j) {
                    swapStickiedHeader(this.mAdapter.getHeaderView(i2, this.mStickiedHeader, this));
                    measureHeader();
                    this.mCurrentHeaderId = j;
                }
                childCount = getChildCount();
                if (childCount != 0) {
                    View view = null;
                    int i6 = 99999;
                    for (int i7 = 0; i7 < childCount; i7 += numColumns) {
                        View childAt = super.getChildAt(i7);
                        int top2 = this.mClippingToPadding ? childAt.getTop() - getPaddingTop() : childAt.getTop();
                        if (top2 >= 0 && this.mAdapter.getItemId(getPositionForView(childAt)) == -1 && top2 < i6) {
                            view = childAt;
                            i6 = top2;
                        }
                    }
                    int headerHeight = getHeaderHeight();
                    if (view == null) {
                        this.mHeaderBottomPosition = headerHeight;
                        if (this.mClippingToPadding) {
                            this.mHeaderBottomPosition += getPaddingTop();
                        }
                    } else if (i3 == 0 && super.getChildAt(0).getTop() > 0 && !this.mClippingToPadding) {
                        this.mHeaderBottomPosition = 0;
                    } else if (this.mClippingToPadding) {
                        this.mHeaderBottomPosition = Math.min(view.getTop(), getPaddingTop() + headerHeight);
                        this.mHeaderBottomPosition = this.mHeaderBottomPosition < getPaddingTop() ? headerHeight + getPaddingTop() : this.mHeaderBottomPosition;
                    } else {
                        this.mHeaderBottomPosition = Math.min(view.getTop(), headerHeight);
                        if (this.mHeaderBottomPosition >= 0) {
                            headerHeight = this.mHeaderBottomPosition;
                        }
                        this.mHeaderBottomPosition = headerHeight;
                    }
                }
            }
            i2 = i3;
            if (this.mCurrentHeaderId != j) {
            }
            childCount = getChildCount();
            if (childCount != 0) {
            }
        }
    }

    private void swapStickiedHeader(View view) {
        detachHeader(this.mStickiedHeader);
        attachHeader(view);
        this.mStickiedHeader = view;
        if (this.mStickiedHeader != null) {
            if (this.mStickyHeaderBackgroundDrawable != null) {
                this.mStickiedHeader.setBackground(this.mStickyHeaderBackgroundDrawable);
            } else {
                this.mStickiedHeader.setBackgroundResource(R.drawable.sticky_header_bg);
            }
            if (getStickyHeaderIsTranscluent() && this.mStickiedHeader.getBackground() != null) {
                this.mStickiedHeader.getBackground().setAlpha(this.mStickyHeaderBackgroundAlpha);
            }
        }
    }

    private MotionEvent transformEvent(MotionEvent motionEvent, int i) {
        if (i == -2) {
            return motionEvent;
        }
        View childAt = getChildAt(i);
        MotionEvent obtain = MotionEvent.obtain(motionEvent);
        obtain.offsetLocation(0.0f, (float) (-childAt.getTop()));
        return obtain;
    }

    public void addFooterView(View view) {
        addFooterView(view, null);
    }

    public void addFooterView(View view, Object obj) {
        int size = this.mFooterViewInfos.size();
        int i = 0;
        while (i < size) {
            if (((FixedViewInfo) this.mFooterViewInfos.get(i)).view != view) {
                i++;
            } else {
                return;
            }
        }
        FixedViewInfo fixedViewInfo = new FixedViewInfo();
        fixedViewInfo.view = view;
        fixedViewInfo.data = obj;
        this.mFooterViewInfos.add(fixedViewInfo);
        attachHeader(view);
        if (this.mAdapter != null) {
            this.mAdapter.setFooter(this.mFooterViewInfos);
            this.mAdapter.notifyDataSetChanged();
        }
    }

    public void addHeaderView(View view) {
        addHeaderView(view, null);
    }

    public void addHeaderView(View view, Object obj) {
        int size = this.mHeaderViewInfos.size();
        int i = 0;
        while (i < size) {
            if (((FixedViewInfo) this.mHeaderViewInfos.get(i)).view != view) {
                i++;
            } else {
                return;
            }
        }
        FixedViewInfo fixedViewInfo = new FixedViewInfo();
        fixedViewInfo.view = view;
        fixedViewInfo.data = obj;
        this.mHeaderViewInfos.add(fixedViewInfo);
        attachHeader(view);
        if (this.mAdapter != null) {
            this.mAdapter.setHeader(this.mHeaderViewInfos);
            this.mAdapter.notifyDataSetChanged();
        }
    }

    /* access modifiers changed from: 0000 */
    public void attachHeader(View view) {
        if (view != null && isAttachedToWindow()) {
            try {
                Field declaredField = View.class.getDeclaredField("mAttachInfo");
                declaredField.setAccessible(true);
                Method declaredMethod = View.class.getDeclaredMethod("dispatchAttachedToWindow", new Class[]{Class.forName("android.view.View$AttachInfo"), Integer.TYPE});
                declaredMethod.setAccessible(true);
                declaredMethod.invoke(view, new Object[]{declaredField.get(this), Integer.valueOf(8)});
            } catch (NoSuchMethodException e) {
                throw new RuntimePlatformSupportException(e);
            } catch (ClassNotFoundException e2) {
                throw new RuntimePlatformSupportException(e2);
            } catch (IllegalArgumentException e3) {
                throw new RuntimePlatformSupportException(e3);
            } catch (IllegalAccessException e4) {
                throw new RuntimePlatformSupportException(e4);
            } catch (InvocationTargetException e5) {
                throw new RuntimePlatformSupportException(e5);
            } catch (NoSuchFieldException e6) {
                throw new RuntimePlatformSupportException(e6);
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public void detachHeader(View view) {
        if (view != null) {
            try {
                Method declaredMethod = View.class.getDeclaredMethod("dispatchDetachedFromWindow", new Class[0]);
                declaredMethod.setAccessible(true);
                declaredMethod.invoke(view, new Object[0]);
            } catch (NoSuchMethodException e) {
                throw new RuntimePlatformSupportException(e);
            } catch (IllegalArgumentException e2) {
                throw new RuntimePlatformSupportException(e2);
            } catch (IllegalAccessException e3) {
                throw new RuntimePlatformSupportException(e3);
            } catch (InvocationTargetException e4) {
                throw new RuntimePlatformSupportException(e4);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void dispatchDraw(Canvas canvas) {
        int i;
        int i2;
        int i3;
        int i4;
        int i5;
        Canvas canvas2 = canvas;
        if (VERSION.SDK_INT < 8) {
            scrollChanged(getFirstVisiblePosition());
        }
        int numColumns = getNumColumns();
        char c = 0;
        boolean z = this.mStickiedHeader != null && this.mAreHeadersSticky && this.mStickiedHeader.getVisibility() == 0;
        int headerHeight = getHeaderHeight();
        int i6 = this.mHeaderBottomPosition - headerHeight;
        if (z && this.mMaskStickyHeaderRegion) {
            if (this.mHeadersIgnorePadding) {
                this.mClippingRect.left = 0;
                this.mClippingRect.right = getWidth();
            } else {
                this.mClippingRect.left = getPaddingLeft();
                this.mClippingRect.right = getWidth() - getPaddingRight();
            }
            this.mClippingRect.top = this.mHeaderBottomPosition;
            this.mClippingRect.bottom = getHeight();
            canvas.save();
            canvas2.clipRect(this.mClippingRect);
        }
        super.dispatchDraw(canvas);
        ArrayMap arrayMap = new ArrayMap();
        int count = getAdapter() == null ? -1 : getAdapter().getCount();
        int count2 = getRealAdapter() == null ? -1 : getRealAdapter().getCount();
        int firstVisiblePosition = getFirstVisiblePosition();
        int i7 = 0;
        while (firstVisiblePosition <= getLastVisiblePosition()) {
            long itemIdAtPosition = getItemIdAtPosition(firstVisiblePosition);
            if (itemIdAtPosition == -1) {
                arrayMap.put(Integer.valueOf(i7), Integer.valueOf(0));
            } else if (itemIdAtPosition == -4) {
                arrayMap.put(Integer.valueOf(i7), Integer.valueOf(1));
            }
            firstVisiblePosition += numColumns;
            i7 += numColumns;
        }
        int i8 = 0;
        while (i8 < arrayMap.size()) {
            View childAt = getChildAt(((Integer) arrayMap.keyAt(i8)).intValue());
            try {
                View view = (View) childAt.getTag();
                if (view == null) {
                    int intValue = ((Integer) arrayMap.keyAt(i8)).intValue();
                    int firstVisiblePosition2 = getFirstVisiblePosition() + intValue;
                    String str = TAG;
                    String str2 = "view count [%d], adapter count[%d/%d], real adapter count[%d/%d]";
                    Object[] objArr = new Object[5];
                    objArr[c] = Integer.valueOf(getChildCount());
                    objArr[1] = Integer.valueOf(count);
                    objArr[2] = Integer.valueOf(getAdapter() == null ? -1 : getAdapter().getCount());
                    objArr[3] = Integer.valueOf(count2);
                    objArr[4] = Integer.valueOf(getRealAdapter() == null ? -1 : getRealAdapter().getCount());
                    Log.i(str, str2, objArr);
                    Log.w(TAG, "current[layout: %d|adapter: %d] item is %s", Integer.valueOf(intValue), Integer.valueOf(firstVisiblePosition2), getItemAtPosition(firstVisiblePosition2) == null ? "null" : "not null");
                    String simpleName = childAt.getClass().getSimpleName();
                    String simpleName2 = childAt.getTag() != null ? childAt.getTag().getClass().getSimpleName() : "null";
                    HashMap hashMap = new HashMap();
                    StringBuilder sb = new StringBuilder();
                    sb.append(simpleName);
                    sb.append("/");
                    sb.append(simpleName2);
                    hashMap.put("header_class/tag_class", sb.toString());
                    GallerySamplingStatHelper.recordErrorEvent("error_track", "sticky_grid_headers_get_tag_npe", hashMap);
                } else if (view.getVisibility() == 0) {
                    if (((Integer) arrayMap.valueAt(i8)).intValue() == 0) {
                        i5 = i6;
                        if (((long) ((HeaderFillerView) childAt).getHeaderId()) == this.mCurrentHeaderId && childAt.getTop() < 0 && this.mAreHeadersSticky) {
                            i8++;
                            i6 = i5;
                            c = 0;
                        }
                    } else {
                        i5 = i6;
                    }
                    int makeMeasureSpec = this.mHeadersIgnorePadding ? MeasureSpec.makeMeasureSpec(getWidth(), 1073741824) : MeasureSpec.makeMeasureSpec((getWidth() - getPaddingLeft()) - getPaddingRight(), 1073741824);
                    int makeMeasureSpec2 = MeasureSpec.makeMeasureSpec(0, 0);
                    view.measure(MeasureSpec.makeMeasureSpec(0, 0), MeasureSpec.makeMeasureSpec(0, 0));
                    view.measure(makeMeasureSpec, makeMeasureSpec2);
                    if (this.mHeadersIgnorePadding) {
                        view.layout(getLeft(), 0, getRight(), childAt.getHeight());
                    } else {
                        view.layout(getLeft() + getPaddingLeft(), 0, getRight() - getPaddingRight(), childAt.getHeight());
                    }
                    if (this.mHeadersIgnorePadding) {
                        this.mClippingRect.left = 0;
                        this.mClippingRect.right = getWidth();
                    } else {
                        this.mClippingRect.left = getPaddingLeft();
                        this.mClippingRect.right = getWidth() - getPaddingRight();
                    }
                    this.mClippingRect.bottom = childAt.getBottom();
                    this.mClippingRect.top = childAt.getTop();
                    canvas.save();
                    canvas2.clipRect(this.mClippingRect);
                    if (this.mHeadersIgnorePadding) {
                        canvas2.translate(0.0f, (float) childAt.getTop());
                    } else {
                        canvas2.translate((float) getPaddingLeft(), (float) childAt.getTop());
                    }
                    view.draw(canvas2);
                    canvas.restore();
                    i8++;
                    i6 = i5;
                    c = 0;
                }
                i5 = i6;
                i8++;
                i6 = i5;
                c = 0;
            } catch (Exception unused) {
                return;
            }
        }
        int i9 = i6;
        if (z && this.mMaskStickyHeaderRegion) {
            canvas.restore();
        } else if (!z) {
            return;
        }
        if (this.mStickiedHeader.getWidth() != (this.mHeadersIgnorePadding ? getWidth() : (getWidth() - getPaddingLeft()) - getPaddingRight())) {
            if (this.mHeadersIgnorePadding) {
                i2 = 1073741824;
                i3 = MeasureSpec.makeMeasureSpec(getWidth(), 1073741824);
            } else {
                i2 = 1073741824;
                i3 = MeasureSpec.makeMeasureSpec((getWidth() - getPaddingLeft()) - getPaddingRight(), 1073741824);
            }
            LayoutParams layoutParams = this.mStickiedHeader.getLayoutParams();
            if (layoutParams == null || layoutParams.height <= 0) {
                i = 0;
                i4 = MeasureSpec.makeMeasureSpec(0, 0);
            } else {
                i4 = MeasureSpec.makeMeasureSpec(layoutParams.height, i2);
                i = 0;
            }
            this.mStickiedHeader.measure(MeasureSpec.makeMeasureSpec(i, i), MeasureSpec.makeMeasureSpec(i, i));
            this.mStickiedHeader.measure(i3, i4);
            if (this.mHeadersIgnorePadding) {
                this.mStickiedHeader.layout(getLeft(), i, getRight(), this.mStickiedHeader.getHeight());
            } else {
                this.mStickiedHeader.layout(getLeft() + getPaddingLeft(), i, getRight() - getPaddingRight(), this.mStickiedHeader.getHeight());
            }
        } else {
            i = 0;
        }
        if (this.mHeadersIgnorePadding) {
            this.mClippingRect.left = i;
            this.mClippingRect.right = getWidth();
        } else {
            this.mClippingRect.left = getPaddingLeft();
            this.mClippingRect.right = getWidth() - getPaddingRight();
        }
        this.mClippingRect.bottom = i9 + headerHeight;
        if (this.mClippingToPadding) {
            this.mClippingRect.top = getPaddingTop();
        } else {
            this.mClippingRect.top = 0;
        }
        canvas.save();
        canvas2.clipRect(this.mClippingRect);
        if (this.mHeadersIgnorePadding) {
            canvas2.translate(0.0f, (float) i9);
        } else {
            canvas2.translate((float) getPaddingLeft(), (float) i9);
        }
        if (!getStickyHeaderIsTranscluent() && this.mHeaderBottomPosition != headerHeight) {
            canvas.saveLayerAlpha(0.0f, 0.0f, (float) canvas.getWidth(), (float) canvas.getHeight(), (this.mHeaderBottomPosition * 255) / headerHeight, 31);
        }
        this.mStickiedHeader.draw(canvas2);
        if (!getStickyHeaderIsTranscluent() && this.mHeaderBottomPosition != headerHeight) {
            canvas.restore();
        }
        canvas.restore();
    }

    public View getChildViewByItemIndex(int i) {
        int itemPositionByItemIndex = this.mAdapter.getItemPositionByItemIndex(i);
        if (itemPositionByItemIndex - super.getFirstVisiblePosition() < 0 || itemPositionByItemIndex > super.getLastVisiblePosition()) {
            return null;
        }
        return getChildAt(itemPositionByItemIndex - super.getFirstVisiblePosition());
    }

    public int getGroupIndexByItemIndex(int i) {
        return this.mAdapter.getGroupIndexByItemIndex(i);
    }

    public int getGroupItemStartIndex(int i) {
        return this.mAdapter.getGroupItemStartIndex(i);
    }

    public int getGroupItemsCount(int i) {
        return this.mAdapter.getCountForHeader(i);
    }

    public View getHeaderAt(int i) {
        if (i == -2) {
            return this.mStickiedHeader;
        }
        try {
            return (View) getChildAt(i).getTag();
        } catch (Exception unused) {
            return null;
        }
    }

    public int getHeaderNum() {
        return this.mAdapter.getHeaderNum();
    }

    public int getHeaderViewCount() {
        return this.mHeaderViewInfos.size();
    }

    public int getItemIndexByItemPosition(int i) {
        return this.mAdapter.translatePosition(i).mPosition;
    }

    public ListAdapter getRealAdapter() {
        return this.mRealAdapter;
    }

    public int getRequestedNumColumns() {
        return this.mRequestedNumColumns;
    }

    public View getStickiedHeader() {
        return this.mStickiedHeader;
    }

    public boolean getStickyHeaderIsTranscluent() {
        return !this.mMaskStickyHeaderRegion;
    }

    public void notifyChanged() {
        this.mAdapter.notifyDataSetChanged();
    }

    /* access modifiers changed from: protected */
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        Iterator it = this.mHeaderViewInfos.iterator();
        while (it.hasNext()) {
            attachHeader(((FixedViewInfo) it.next()).view);
        }
        Iterator it2 = this.mFooterViewInfos.iterator();
        while (it2.hasNext()) {
            attachHeader(((FixedViewInfo) it2.next()).view);
        }
        if (this.mGestureDetector == null) {
            this.mGestureDetector = new GestureDetector(getContext(), this.mGestureListener);
            this.mGestureDetector.setIsDoubleTapEnabled(false);
        }
    }

    /* access modifiers changed from: protected */
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        Iterator it = this.mHeaderViewInfos.iterator();
        while (it.hasNext()) {
            detachHeader(((FixedViewInfo) it.next()).view);
        }
        Iterator it2 = this.mFooterViewInfos.iterator();
        while (it2.hasNext()) {
            detachHeader(((FixedViewInfo) it2.next()).view);
        }
    }

    public boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        if (motionEvent.getActionMasked() == 0) {
            int findMotionHeader = findMotionHeader((float) ((int) motionEvent.getY()));
            if (!(findMotionHeader == -1 || this.mScrollState == 2)) {
                View headerAt = getHeaderAt(findMotionHeader);
                if (headerAt != null && headerAt.dispatchTouchEvent(transformEvent(motionEvent, findMotionHeader))) {
                    Log.d(TAG, "header child handled event");
                    return true;
                }
            }
        }
        return super.onInterceptTouchEvent(motionEvent);
    }

    public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
        int i2 = this.mAdapter.translatePosition(i).mPosition;
        if (i2 < 0) {
            Log.d(TAG, "position is invalid, skip");
            return;
        }
        if (this.mOnItemClickListener != null) {
            this.mOnItemClickListener.onItemClick(adapterView, view, i2, j);
        }
    }

    public boolean onItemLongClick(AdapterView<?> adapterView, View view, int i, long j) {
        int i2 = this.mAdapter.translatePosition(i).mPosition;
        if (i2 >= 0) {
            return this.mOnItemLongClickListener.onItemLongClick(adapterView, view, i2, j);
        }
        Log.d(TAG, "position is invalid, skip");
        return true;
    }

    public void onItemSelected(AdapterView<?> adapterView, View view, int i, long j) {
        int i2 = this.mAdapter.translatePosition(i).mPosition;
        if (i2 < 0) {
            Log.d(TAG, "position is invalid, skip");
        }
        this.mOnItemSelectedListener.onItemSelected(adapterView, view, i2, j);
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        measureHeader();
        int numColumns = getNumColumns();
        super.onMeasure(i, i2);
        int numColumns2 = getNumColumns();
        if (((numColumns == -1 && numColumns2 != this.mRequestedNumColumns) || (numColumns != -1 && numColumns2 != numColumns)) && this.mAdapter != null) {
            this.mAdapter.onColumnChanged();
        }
    }

    public void onNothingSelected(AdapterView<?> adapterView) {
        this.mOnItemSelectedListener.onNothingSelected(adapterView);
    }

    public void onRestoreInstanceState(Parcelable parcelable) {
        SavedState savedState = (SavedState) parcelable;
        super.onRestoreInstanceState(savedState.getSuperState());
        this.mAreHeadersSticky = savedState.areHeadersSticky;
        requestLayout();
    }

    public Parcelable onSaveInstanceState() {
        SavedState savedState = new SavedState(super.onSaveInstanceState());
        savedState.areHeadersSticky = this.mAreHeadersSticky;
        return savedState;
    }

    public void onScroll(AbsListView absListView, int i, int i2, int i3) {
        if (!(this.mScrollListener == null || this.mAdapter == null)) {
            VisibleInfo translateVisibleInfo = this.mAdapter.translateVisibleInfo(i, i2);
            this.mScrollListener.onScroll(absListView, translateVisibleInfo.mFirstPosition, translateVisibleInfo.mVisibleCount, this.mRealAdapter.getCount());
        }
        if (VERSION.SDK_INT >= 8) {
            scrollChanged(i);
        }
    }

    public void onScrollStateChanged(AbsListView absListView, int i) {
        if (this.mScrollListener != null) {
            this.mScrollListener.onScrollStateChanged(absListView, i);
        }
        Log.d(TAG, "scrollState changed %s", (Object) Integer.valueOf(i));
        this.mScrollState = i;
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        int action = motionEvent.getAction();
        boolean z = this.mHeaderChildBeingPressed;
        if (this.mHeaderChildBeingPressed) {
            View headerAt = getHeaderAt(this.mMotionHeaderPosition);
            final View childAt = this.mMotionHeaderPosition == -2 ? headerAt : getChildAt(this.mMotionHeaderPosition);
            if (action == 1 || action == 3) {
                this.mHeaderChildBeingPressed = false;
            }
            if (headerAt != null) {
                headerAt.dispatchTouchEvent(transformEvent(motionEvent, this.mMotionHeaderPosition));
                headerAt.invalidate();
                headerAt.postDelayed(new Runnable() {
                    public void run() {
                        StickyGridHeadersGridView.this.invalidate(0, childAt.getTop(), StickyGridHeadersGridView.this.getWidth(), childAt.getTop() + childAt.getHeight());
                    }
                }, (long) ViewConfiguration.getPressedStateDuration());
                invalidate(0, childAt.getTop(), getWidth(), childAt.getTop() + childAt.getHeight());
            }
        }
        switch (action & 255) {
            case 0:
                if (this.mPendingCheckForTap == null) {
                    this.mPendingCheckForTap = new CheckForHeaderTap();
                }
                postDelayed(this.mPendingCheckForTap, (long) ViewConfiguration.getTapTimeout());
                float y = (float) ((int) motionEvent.getY());
                this.mMotionY = y;
                this.mMotionHeaderPosition = findMotionHeader(y);
                if (!(this.mMotionHeaderPosition == -1 || this.mScrollState == 2)) {
                    View headerAt2 = getHeaderAt(this.mMotionHeaderPosition);
                    if (headerAt2 != null) {
                        if (headerAt2.dispatchTouchEvent(transformEvent(motionEvent, this.mMotionHeaderPosition))) {
                            this.mHeaderChildBeingPressed = true;
                            headerAt2.setPressed(true);
                        }
                        headerAt2.invalidate();
                        if (this.mMotionHeaderPosition != -2) {
                            headerAt2 = getChildAt(this.mMotionHeaderPosition);
                        }
                        invalidate(0, headerAt2.getTop(), getWidth(), headerAt2.getTop() + headerAt2.getHeight());
                    }
                    this.mTouchMode = 0;
                    return true;
                }
            case 1:
                if (this.mTouchMode == -2) {
                    this.mTouchMode = -1;
                    return true;
                } else if (!(this.mTouchMode == -1 || this.mMotionHeaderPosition == -1)) {
                    final View headerAt3 = getHeaderAt(this.mMotionHeaderPosition);
                    Log.d(TAG, "wasHeaderChildBeingPressed %s", (Object) Boolean.valueOf(z));
                    if (!z) {
                        if (headerAt3 != null) {
                            if (this.mTouchMode != 0) {
                                headerAt3.setPressed(false);
                            }
                            if (this.mPerformHeaderClick == null) {
                                this.mPerformHeaderClick = new PerformHeaderClick();
                            }
                            final PerformHeaderClick performHeaderClick = this.mPerformHeaderClick;
                            performHeaderClick.mClickMotionPosition = this.mMotionHeaderPosition;
                            performHeaderClick.rememberWindowAttachCount();
                            if (this.mTouchMode == 0 || this.mTouchMode == 1) {
                                Handler handler = getHandler();
                                if (handler != null) {
                                    handler.removeCallbacks(this.mTouchMode == 0 ? this.mPendingCheckForTap : this.mPendingCheckForLongPress);
                                }
                                if (!this.mDataChanged) {
                                    this.mTouchMode = 1;
                                    headerAt3.setPressed(true);
                                    setPressed(true);
                                    if (this.mTouchModeReset != null) {
                                        removeCallbacks(this.mTouchModeReset);
                                    }
                                    this.mTouchModeReset = new Runnable() {
                                        public void run() {
                                            StickyGridHeadersGridView.this.mMotionHeaderPosition = -1;
                                            StickyGridHeadersGridView.this.mTouchModeReset = null;
                                            StickyGridHeadersGridView.this.mTouchMode = -1;
                                            headerAt3.setPressed(false);
                                            StickyGridHeadersGridView.this.setPressed(false);
                                            headerAt3.invalidate();
                                            StickyGridHeadersGridView.this.invalidate(0, headerAt3.getTop(), StickyGridHeadersGridView.this.getWidth(), headerAt3.getHeight());
                                            if (!StickyGridHeadersGridView.this.mDataChanged) {
                                                performHeaderClick.run();
                                            }
                                        }
                                    };
                                    postDelayed(this.mTouchModeReset, (long) ViewConfiguration.getPressedStateDuration());
                                } else {
                                    this.mTouchMode = -1;
                                }
                            } else if (!this.mDataChanged) {
                                performHeaderClick.run();
                            }
                        }
                        this.mTouchMode = -1;
                        break;
                    } else {
                        this.mTouchMode = -1;
                        return true;
                    }
                }
                break;
            case 2:
                if (this.mMotionHeaderPosition != -1 && Math.abs(motionEvent.getY() - this.mMotionY) > ((float) this.mTouchSlop)) {
                    this.mTouchMode = -1;
                    View headerAt4 = getHeaderAt(this.mMotionHeaderPosition);
                    if (headerAt4 != null) {
                        headerAt4.setPressed(false);
                        headerAt4.invalidate();
                    }
                    Handler handler2 = getHandler();
                    if (handler2 != null) {
                        handler2.removeCallbacks(this.mPendingCheckForLongPress);
                    }
                    this.mMotionHeaderPosition = -1;
                    break;
                }
        }
        this.mPreScrollState = this.mScrollState;
        boolean onTouchEvent = super.onTouchEvent(motionEvent);
        this.mGestureDetector.onTouchEvent(motionEvent);
        return onTouchEvent;
    }

    public boolean performHeaderClick(View view, long j) {
        if (this.mOnHeaderClickListener == null) {
            return false;
        }
        playSoundEffect(0);
        if (view != null) {
            view.sendAccessibilityEvent(1);
        }
        this.mOnHeaderClickListener.onHeaderClick(this, view, j);
        return true;
    }

    public boolean removeFooterView(View view) {
        boolean z = false;
        if (this.mFooterViewInfos.isEmpty()) {
            return false;
        }
        if (this.mAdapter != null && removeFixedViewInfo(view, this.mFooterViewInfos)) {
            this.mAdapter.setFooter(this.mFooterViewInfos);
            this.mAdapter.notifyDataSetChanged();
            z = true;
        }
        return z;
    }

    public boolean removeHeaderView(View view) {
        boolean z = false;
        if (this.mHeaderViewInfos.isEmpty()) {
            return false;
        }
        if (this.mAdapter != null && removeFixedViewInfo(view, this.mHeaderViewInfos)) {
            this.mAdapter.setHeader(this.mHeaderViewInfos);
            this.mAdapter.notifyDataSetChanged();
            z = true;
        }
        return z;
    }

    public void setAdapter(ListAdapter listAdapter) {
        StickyGridHeadersBaseAdapter stickyGridHeadersBaseAdapter;
        if (this.mRealAdapter != listAdapter) {
            if (!(this.mAdapter == null || this.mDataSetObserver == null)) {
                this.mAdapter.unregisterDataSetObserver(this.mDataSetObserver);
            }
            if (!this.mClipToPaddingHasBeenSet) {
                this.mClippingToPadding = true;
            }
            this.mRealAdapter = listAdapter;
            if (listAdapter instanceof StickyGridHeadersBaseAdapter) {
                stickyGridHeadersBaseAdapter = (StickyGridHeadersBaseAdapter) listAdapter;
            } else {
                stickyGridHeadersBaseAdapter = listAdapter instanceof StickyGridHeadersSimpleAdapter ? new StickyGridHeadersSimpleAdapterWrapper((StickyGridHeadersSimpleAdapter) listAdapter) : new StickyGridHeadersListAdapterWrapper(listAdapter);
            }
            StickyGridHeadersBaseAdapterWrapper stickyGridHeadersBaseAdapterWrapper = new StickyGridHeadersBaseAdapterWrapper(getContext(), this, stickyGridHeadersBaseAdapter, this.mHeaderViewInfos, this.mFooterViewInfos);
            this.mAdapter = stickyGridHeadersBaseAdapterWrapper;
            this.mAdapter.registerDataSetObserver(this.mDataSetObserver);
            reset();
            super.setAdapter(this.mAdapter);
        }
    }

    public void setAreHeadersSticky(boolean z) {
        if (z != this.mAreHeadersSticky) {
            this.mAreHeadersSticky = z;
            requestLayout();
        }
    }

    public void setClipToPadding(boolean z) {
        super.setClipToPadding(z);
        this.mClippingToPadding = z;
        this.mClipToPaddingHasBeenSet = true;
    }

    public void setHeadersIgnorePadding(boolean z) {
        this.mHeadersIgnorePadding = z;
    }

    public void setHorizontalSpacing(int i) {
        super.setHorizontalSpacing(i);
        this.mHorizontalSpacing = i;
    }

    public void setNumColumns(int i) {
        super.setNumColumns(i);
        this.mRequestedNumColumns = i;
    }

    public void setOnHeaderClickListener(OnHeaderClickListener onHeaderClickListener) {
        this.mOnHeaderClickListener = onHeaderClickListener;
    }

    public void setOnHeaderLongClickListener(OnHeaderLongClickListener onHeaderLongClickListener) {
        if (!isLongClickable()) {
            setLongClickable(true);
        }
        this.mOnHeaderLongClickListener = onHeaderLongClickListener;
    }

    public void setOnItemClickListener(OnItemClickListener onItemClickListener) {
        this.mOnItemClickListener = onItemClickListener;
        super.setOnItemClickListener(new OnItemClickListener() {
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
                if (VERSION.SDK_INT >= 26 && view.isAccessibilityFocused()) {
                    StickyGridHeadersGridView.this.onItemClick(adapterView, view, i, j);
                }
            }
        });
    }

    public void setOnItemLongClickListener(OnItemLongClickListener onItemLongClickListener) {
        this.mOnItemLongClickListener = onItemLongClickListener;
        super.setOnItemLongClickListener(this);
    }

    public void setOnItemSelectedListener(OnItemSelectedListener onItemSelectedListener) {
        this.mOnItemSelectedListener = onItemSelectedListener;
        super.setOnItemSelectedListener(this);
    }

    public void setOnScrollListener(OnScrollListener onScrollListener) {
        this.mScrollListener = onScrollListener;
    }

    public void setStickyHeaderBackgroundDrawable(Drawable drawable) {
        this.mStickyHeaderBackgroundDrawable = drawable;
    }

    public void setStickyHeaderIsTranscluent(int i) {
        if (i < 0 || i > 255) {
            throw new IllegalArgumentException("The value of alpha out of range.");
        }
        this.mMaskStickyHeaderRegion = false;
        this.mStickyHeaderBackgroundAlpha = i;
    }

    public void setStickyHeaderIsTranscluent(boolean z) {
        this.mMaskStickyHeaderRegion = !z;
    }

    public void setVerticalSpacing(int i) {
        super.setVerticalSpacing(i);
        this.mVerticalSpacing = i;
    }

    public void viewToPosition(int i) {
        setSelection(Math.max(0, this.mAdapter.getItemPositionByItemIndex(i) - ((getLastVisiblePosition() - getFirstVisiblePosition()) / 3)));
    }
}
