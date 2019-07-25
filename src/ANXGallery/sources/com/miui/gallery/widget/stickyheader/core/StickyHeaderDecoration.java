package com.miui.gallery.widget.stickyheader.core;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.LayoutParams;
import android.support.v7.widget.RecyclerView.SimpleOnItemTouchListener;
import android.support.v7.widget.RecyclerView.State;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.util.LongSparseArray;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ImageView.ScaleType;
import com.miui.gallery.util.Log;
import com.miui.gallery.widget.recyclerview.transition.TransitionalItem;
import com.miui.gallery.widget.recyclerview.transition.TransitionalView;
import com.miui.gallery.widget.stickyheader.core.HeaderViewHolder;
import java.lang.ref.WeakReference;
import java.util.LinkedList;
import java.util.List;

final class StickyHeaderDecoration<VH extends HeaderViewHolder> extends ItemDecoration implements TransitionalView {
    private StickyHeaderAdapter<VH> mHeaderAdapter;
    private LongSparseArray<Rect> mHeaderBounds = new LongSparseArray<>();
    private StickyHeaderLayoutManager<VH> mHeaderLayoutManager;
    private StickyHeaderRecycler<VH> mHeaderRecycler;
    private StickyHeaderRender<VH> mHeaderRender;
    private WeakReference<RecyclerView> mHost;
    private HeaderItemClickHelper mItemClickHelper;
    private Rect mTempRect1 = new Rect();
    private Rect mTempRect2 = new Rect();
    private Rect mTempRect3 = new Rect();
    private int mVisibility = 0;

    private static class HeaderMotionEventDispatch extends SimpleOnItemTouchListener {
        /* access modifiers changed from: private */
        public boolean mEnqueuingFakeEvent;
        private StickyHeaderDecoration mHeaderDecoration;
        private boolean mInterceptEvent;
        private WeakReference<HeaderViewHolder> mTouchHeader;
        private WeakReference<View> mTouchTarget;

        public HeaderMotionEventDispatch(StickyHeaderDecoration stickyHeaderDecoration) {
            this.mHeaderDecoration = stickyHeaderDecoration;
        }

        private void clearTouchTargets() {
            if (this.mTouchHeader != null) {
                this.mTouchHeader.clear();
                this.mTouchHeader = null;
            }
            if (this.mTouchTarget != null) {
                this.mTouchTarget.clear();
                this.mTouchTarget = null;
            }
        }

        private void enqueueFakeEvent(final RecyclerView recyclerView) {
            recyclerView.getHandler().postAtFrontOfQueue(new Runnable() {
                public void run() {
                    HeaderMotionEventDispatch.this.mEnqueuingFakeEvent = true;
                    long uptimeMillis = SystemClock.uptimeMillis();
                    MotionEvent obtain = MotionEvent.obtain(uptimeMillis, uptimeMillis, 3, 0.0f, 0.0f, 0);
                    obtain.setSource(4098);
                    recyclerView.onTouchEvent(obtain);
                    obtain.recycle();
                    HeaderMotionEventDispatch.this.mEnqueuingFakeEvent = false;
                }
            });
        }

        private View findTouchTarget(HeaderViewHolder headerViewHolder, float f, float f2) {
            if (headerViewHolder.itemView instanceof ViewGroup) {
                float[] transformTouchPoint = transformTouchPoint(headerViewHolder, f, f2);
                ViewGroup viewGroup = (ViewGroup) headerViewHolder.itemView;
                int childCount = viewGroup.getChildCount();
                for (int i = 0; i < childCount; i++) {
                    View childAt = viewGroup.getChildAt(i);
                    if (isValidTouchTarget(childAt) && isPointInView(childAt, transformTouchPoint[0], transformTouchPoint[1])) {
                        return childAt;
                    }
                }
            }
            return null;
        }

        private HeaderViewHolder getTouchHeader() {
            if (this.mTouchHeader == null) {
                return null;
            }
            return (HeaderViewHolder) this.mTouchHeader.get();
        }

        private View getTouchTarget() {
            if (this.mTouchTarget == null) {
                return null;
            }
            return (View) this.mTouchTarget.get();
        }

        private boolean isPointInView(View view, float f, float f2) {
            return f > ((float) view.getLeft()) && f < ((float) view.getRight()) && f2 > ((float) view.getTop()) && f2 < ((float) view.getBottom());
        }

        private boolean isValidTouchTarget(View view) {
            return view.getVisibility() == 0 && view.isClickable();
        }

        private void setPressed(RecyclerView recyclerView, View view, boolean z) {
            view.setPressed(z);
            recyclerView.invalidate();
        }

        private float[] transformTouchPoint(HeaderViewHolder headerViewHolder, float f, float f2) {
            float[] fArr = {f, f2};
            Rect headerBoundsInLayout = this.mHeaderDecoration.getHeaderBoundsInLayout(headerViewHolder.getHeaderId());
            if (headerBoundsInLayout != null) {
                fArr[0] = f - ((float) headerBoundsInLayout.left);
                fArr[1] = f2 - ((float) headerBoundsInLayout.top);
            }
            return fArr;
        }

        /* access modifiers changed from: 0000 */
        /* JADX WARNING: Removed duplicated region for block: B:29:0x008b  */
        public boolean handleTouchEvent(RecyclerView recyclerView, MotionEvent motionEvent) {
            boolean z;
            View touchTarget;
            int actionMasked = motionEvent.getActionMasked();
            if (actionMasked == 0) {
                clearTouchTargets();
                HeaderViewHolder findHeaderUnder = this.mHeaderDecoration.findHeaderUnder(motionEvent.getX(), motionEvent.getY());
                if (findHeaderUnder != null) {
                    this.mTouchHeader = new WeakReference<>(findHeaderUnder);
                    View findTouchTarget = findTouchTarget(findHeaderUnder, motionEvent.getX(), motionEvent.getY());
                    if (findTouchTarget != null) {
                        this.mTouchTarget = new WeakReference<>(findTouchTarget);
                    }
                }
            }
            if (!(actionMasked == 3 || getTouchHeader() == null || getTouchTarget() == null)) {
                HeaderViewHolder findHeaderUnder2 = this.mHeaderDecoration.findHeaderUnder(motionEvent.getX(), motionEvent.getY());
                if (findHeaderUnder2 != null && getTouchHeader() == findHeaderUnder2) {
                    View findTouchTarget2 = findTouchTarget(findHeaderUnder2, motionEvent.getX(), motionEvent.getY());
                    if (getTouchTarget() == findTouchTarget2) {
                        if (actionMasked == 0) {
                            setPressed(recyclerView, findTouchTarget2, true);
                        }
                        if (actionMasked == 1) {
                            setPressed(recyclerView, findTouchTarget2, false);
                            findTouchTarget2.performClick();
                            recyclerView.playSoundEffect(0);
                        }
                        z = true;
                        if (!z || actionMasked == 1) {
                            touchTarget = getTouchTarget();
                            if (touchTarget != null) {
                                setPressed(recyclerView, touchTarget, false);
                            }
                            clearTouchTargets();
                        }
                        return z;
                    }
                }
            }
            z = false;
            touchTarget = getTouchTarget();
            if (touchTarget != null) {
            }
            clearTouchTargets();
            return z;
        }

        public boolean onInterceptTouchEvent(RecyclerView recyclerView, MotionEvent motionEvent) {
            if (this.mEnqueuingFakeEvent) {
                return this.mInterceptEvent;
            }
            handleTouchEvent(recyclerView, motionEvent);
            if (motionEvent.getActionMasked() == 0) {
                HeaderViewHolder touchHeader = getTouchHeader();
                this.mInterceptEvent = touchHeader != null && touchHeader.isStickyHeader();
                if (this.mInterceptEvent) {
                    enqueueFakeEvent(recyclerView);
                }
            }
            return this.mInterceptEvent;
        }

        public void onTouchEvent(RecyclerView recyclerView, MotionEvent motionEvent) {
            handleTouchEvent(recyclerView, motionEvent);
        }
    }

    private static class HeaderTransitionalItem implements TransitionalItem {
        private final Drawable mDrawable;
        private final RectF mFrame;

        public HeaderTransitionalItem(RectF rectF, Drawable drawable) {
            this.mFrame = rectF;
            this.mDrawable = drawable;
        }

        public Drawable getTransitDrawable() {
            return this.mDrawable;
        }

        public RectF getTransitFrame() {
            return this.mFrame;
        }

        public long getTransitId() {
            return 0;
        }

        public String getTransitPath() {
            return null;
        }

        public ScaleType getTransitScaleType() {
            return ScaleType.FIT_XY;
        }
    }

    StickyHeaderDecoration(RecyclerView recyclerView) {
        this.mItemClickHelper = new HeaderItemClickHelper(recyclerView.getContext(), this);
        recyclerView.addOnItemTouchListener(this.mItemClickHelper);
        recyclerView.addOnItemTouchListener(new HeaderMotionEventDispatch(this));
        this.mHost = new WeakReference<>(recyclerView);
    }

    private static Drawable createHeaderDrawable(View view, Rect rect) {
        Bitmap createBitmap = Bitmap.createBitmap(rect.width(), rect.height(), Config.ARGB_8888);
        view.draw(new Canvas(createBitmap));
        return new BitmapDrawable(createBitmap);
    }

    private boolean dispatchOnPreDraw(VH vh) {
        if (!(vh.itemView instanceof ViewGroup)) {
            return false;
        }
        ViewGroup viewGroup = (ViewGroup) vh.itemView;
        int childCount = viewGroup.getChildCount();
        boolean z = false;
        for (int i = 0; i < childCount; i++) {
            ViewTreeObserver viewTreeObserver = viewGroup.getChildAt(i).getViewTreeObserver();
            if (viewTreeObserver != null) {
                z &= viewTreeObserver.dispatchOnPreDraw();
            }
        }
        return z;
    }

    private void drawHeader(RecyclerView recyclerView, Canvas canvas) {
        boolean z = false;
        for (int i = 0; i < this.mHeaderBounds.size(); i++) {
            long keyAt = this.mHeaderBounds.keyAt(i);
            HeaderViewHolder layoutHeader = this.mHeaderRecycler.getLayoutHeader(keyAt);
            if (layoutHeader == null) {
                Log.e("StickyHeaderDecoration", "header %s hasn't laidout", (Object) Long.valueOf(keyAt));
            } else {
                boolean z2 = true;
                boolean z3 = layoutHeader.itemView.getVisibility() == 0;
                if (!dispatchOnPreDraw(layoutHeader) && z3) {
                    z2 = false;
                }
                if (!z2) {
                    this.mHeaderRender.draw(recyclerView, canvas, layoutHeader, (Rect) this.mHeaderBounds.get(keyAt));
                } else {
                    z |= z3;
                }
            }
        }
        if (z) {
            Log.d("StickyHeaderDecoration", "reschedule drawing");
            recyclerView.invalidate();
        }
    }

    private View findFirstItemNoBorderingWithHeader(RecyclerView recyclerView, VH vh, Rect rect) {
        int childCount = recyclerView.getChildCount();
        int itemCount = recyclerView.getAdapter().getItemCount();
        if (childCount < 1 || itemCount < 1) {
            Log.w("StickyHeaderDecoration", "find next header: child num %d, or data num %d is illegal", Integer.valueOf(childCount), Integer.valueOf(itemCount));
            return null;
        }
        for (int i = 0; i < childCount; i++) {
            View childAt = recyclerView.getChildAt(i);
            if (recyclerView.getChildAdapterPosition(childAt) != -1 && !isItemBorderingWithHeader(recyclerView, childAt, vh, rect)) {
                return childAt;
            }
        }
        return null;
    }

    private void initHeaderBounds(Rect rect, RecyclerView recyclerView, VH vh, View view, boolean z) {
        this.mHeaderLayoutManager.getHeaderBounds(rect, vh.itemView, view);
        if (z) {
            View findFirstItemNoBorderingWithHeader = findFirstItemNoBorderingWithHeader(recyclerView, vh, rect);
            if (findFirstItemNoBorderingWithHeader != null) {
                int childAdapterPosition = recyclerView.getChildAdapterPosition(findFirstItemNoBorderingWithHeader);
                if (this.mHeaderLayoutManager.needOffsetForHeader(recyclerView.getChildViewHolder(findFirstItemNoBorderingWithHeader))) {
                    HeaderViewHolder headerView = this.mHeaderRecycler.getHeaderView(recyclerView, this.mHeaderAdapter.getHeaderIndex(childAdapterPosition));
                    if (headerView != null) {
                        this.mHeaderLayoutManager.getHeaderBounds(this.mTempRect1, headerView.itemView, findFirstItemNoBorderingWithHeader);
                        StickyHeaderUtil.extractMargins(headerView.itemView, this.mTempRect2);
                        StickyHeaderUtil.extractMargins(vh.itemView, this.mTempRect3);
                        int i = rect.bottom + this.mTempRect3.bottom;
                        int i2 = this.mTempRect1.top - this.mTempRect2.top;
                        if (i2 < i) {
                            rect.offset(0, i2 - i);
                        }
                    }
                }
            }
        }
    }

    private void invalidate() {
        if (this.mHost.get() != null) {
            ((RecyclerView) this.mHost.get()).invalidate();
        }
    }

    private boolean isItemBorderingWithHeader(RecyclerView recyclerView, View view, VH vh, Rect rect) {
        int childAdapterPosition = recyclerView.getChildAdapterPosition(view);
        boolean z = false;
        if (childAdapterPosition == -1 || this.mHeaderAdapter.getHeaderIndex(childAdapterPosition) != vh.getHeaderIndex()) {
            return false;
        }
        LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
        StickyHeaderUtil.extractMargins(vh.itemView, this.mTempRect1);
        if (view.getTop() - layoutParams.topMargin <= rect.bottom + this.mTempRect1.bottom) {
            z = true;
        }
        return z;
    }

    private boolean isReady() {
        if (this.mHeaderAdapter == null) {
            Log.w("StickyHeaderDecoration", "sticky header adapter mustn't be null");
            return false;
        } else if (this.mHeaderLayoutManager == null) {
            Log.w("StickyHeaderDecoration", "sticky header layout mustn't be null");
            return false;
        } else if (this.mHeaderRecycler == null) {
            Log.w("StickyHeaderDecoration", "sticky header recycler mustn't be null");
            return false;
        } else {
            if (this.mHeaderRender == null) {
                this.mHeaderRender = new DefaultStickyHeaderRender();
            }
            return true;
        }
    }

    private void layoutHeader(RecyclerView recyclerView) {
        int childCount = recyclerView.getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = recyclerView.getChildAt(i);
            int childAdapterPosition = recyclerView.getChildAdapterPosition(childAt);
            ViewHolder childViewHolder = recyclerView.getChildViewHolder(childAt);
            int adapterPosition = childViewHolder.getAdapterPosition();
            if (!(childViewHolder == null || adapterPosition == -1)) {
                boolean hasStickyHeader = this.mHeaderLayoutManager.hasStickyHeader(this.mHeaderRecycler, childViewHolder);
                if (hasStickyHeader || this.mHeaderLayoutManager.hasDifferentHeader(adapterPosition, adapterPosition - 1)) {
                    int headerIndex = this.mHeaderAdapter.getHeaderIndex(childAdapterPosition);
                    if (StickyHeaderUtil.isValidHeaderIndex(headerIndex)) {
                        HeaderViewHolder headerView = this.mHeaderRecycler.getHeaderView(recyclerView, headerIndex);
                        if (headerView != null) {
                            Rect rect = (Rect) this.mHeaderBounds.get(headerView.getHeaderId());
                            if (rect == null) {
                                rect = new Rect();
                                this.mHeaderBounds.put(headerView.getHeaderId(), rect);
                            }
                            initHeaderBounds(rect, recyclerView, headerView, childAt, hasStickyHeader);
                            headerView.mIsStickyHeader = hasStickyHeader;
                        }
                    }
                }
            }
        }
    }

    private boolean notifyDataChanged() {
        if (this.mHost.get() == null) {
            return false;
        }
        ((RecyclerView) this.mHost.get()).invalidateItemDecorations();
        return true;
    }

    private void recycleHeader(RecyclerView recyclerView) {
        LongSparseArray clone = this.mHeaderBounds.clone();
        this.mHeaderBounds.clear();
        LongSparseArray longSparseArray = new LongSparseArray();
        int childCount = recyclerView.getChildCount();
        for (int i = 0; i < childCount; i++) {
            int childAdapterPosition = recyclerView.getChildAdapterPosition(recyclerView.getChildAt(i));
            if (childAdapterPosition != -1) {
                int headerIndex = this.mHeaderAdapter.getHeaderIndex(childAdapterPosition);
                if (StickyHeaderUtil.isValidHeaderIndex(headerIndex)) {
                    long headerId = this.mHeaderAdapter.getHeaderId(headerIndex);
                    if (StickyHeaderUtil.isValidHeaderId(headerId)) {
                        longSparseArray.put(headerId, Integer.valueOf(headerIndex));
                        Rect rect = (Rect) clone.get(headerId);
                        if (rect != null) {
                            this.mHeaderBounds.put(headerId, rect);
                        }
                    }
                }
            }
        }
        LongSparseArray layoutHeaders = this.mHeaderRecycler.getLayoutHeaders();
        for (int i2 = 0; i2 < layoutHeaders.size(); i2++) {
            long keyAt = layoutHeaders.keyAt(i2);
            if (longSparseArray.get(keyAt) == null) {
                this.mHeaderRecycler.recycleHeader((HeaderViewHolder) layoutHeaders.get(keyAt));
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public VH findHeaderUnder(float f, float f2) {
        for (int i = 0; i < this.mHeaderBounds.size(); i++) {
            long keyAt = this.mHeaderBounds.keyAt(i);
            if (((Rect) this.mHeaderBounds.get(keyAt)).contains(Math.round(f), Math.round(f2))) {
                return this.mHeaderRecycler.getLayoutHeader(keyAt);
            }
        }
        return null;
    }

    /* access modifiers changed from: 0000 */
    public StickyHeaderAdapter<VH> getHeaderAdapter() {
        return this.mHeaderAdapter;
    }

    /* access modifiers changed from: 0000 */
    public Rect getHeaderBoundsInLayout(long j) {
        return (Rect) this.mHeaderBounds.get(j);
    }

    /* access modifiers changed from: 0000 */
    public StickyHeaderLayoutManager<VH> getHeaderLayoutManager() {
        return this.mHeaderLayoutManager;
    }

    /* access modifiers changed from: 0000 */
    public StickyHeaderRender<VH> getHeaderRender() {
        return this.mHeaderRender;
    }

    /* access modifiers changed from: 0000 */
    public int getHeaderVisibility() {
        return this.mVisibility;
    }

    public void getItemOffsets(Rect rect, View view, RecyclerView recyclerView, State state) {
        if (this.mVisibility == 8 || !isReady()) {
            return;
        }
        if (this.mHeaderAdapter.getHeaderCount() <= 0) {
            Log.w("StickyHeaderDecoration", "getItemOffsets: header count is invalid");
            return;
        }
        ViewHolder childViewHolder = recyclerView.getChildViewHolder(view);
        if (childViewHolder == null || childViewHolder.getAdapterPosition() == -1) {
            Log.e("StickyHeaderDecoration", "view holder is null or adapter position is invalid");
            return;
        }
        if (this.mHeaderLayoutManager.needOffsetForHeader(childViewHolder)) {
            int adapterPosition = childViewHolder.getAdapterPosition();
            int headerIndex = this.mHeaderAdapter.getHeaderIndex(adapterPosition);
            if (!StickyHeaderUtil.isValidHeaderIndex(headerIndex)) {
                Log.w("StickyHeaderDecoration", "header index of position %d is invalid", Integer.valueOf(adapterPosition));
                return;
            }
            HeaderViewHolder headerView = this.mHeaderRecycler.getHeaderView(recyclerView, headerIndex);
            if (headerView == null) {
                Log.w("StickyHeaderDecoration", "generate header view for %d failed", Integer.valueOf(headerIndex));
            } else {
                StickyHeaderUtil.extractMargins(headerView.itemView, this.mTempRect1);
                rect.top = headerView.itemView.getHeight() + this.mTempRect1.top + this.mTempRect1.bottom;
            }
        }
    }

    public List<TransitionalItem> getTransitionalItems() {
        LinkedList linkedList = new LinkedList();
        if (this.mVisibility != 8) {
            recycleHeader(this.mHeaderLayoutManager.mRecyclerView);
            layoutHeader(this.mHeaderLayoutManager.mRecyclerView);
            for (int i = 0; i < this.mHeaderBounds.size(); i++) {
                long keyAt = this.mHeaderBounds.keyAt(i);
                HeaderViewHolder layoutHeader = this.mHeaderRecycler.getLayoutHeader(keyAt);
                if (layoutHeader == null) {
                    Log.e("StickyHeaderDecoration", "header %s hasn't laidout", (Object) Long.valueOf(keyAt));
                } else {
                    Rect rect = (Rect) this.mHeaderBounds.get(keyAt);
                    linkedList.add(new HeaderTransitionalItem(new RectF(rect), createHeaderDrawable(layoutHeader.itemView, rect)));
                }
            }
        }
        return linkedList;
    }

    public void onDraw(Canvas canvas, RecyclerView recyclerView, State state) {
        if (this.mVisibility == 0) {
            super.onDraw(canvas, recyclerView, state);
        }
    }

    public void onDrawOver(Canvas canvas, RecyclerView recyclerView, State state) {
        if (this.mVisibility != 8 && isReady()) {
            int childCount = recyclerView.getChildCount();
            int itemCount = recyclerView.getAdapter().getItemCount();
            if (childCount < 1 || itemCount < 1) {
                Log.w("StickyHeaderDecoration", "draw over: child num %d, or data num %d is illegal", Integer.valueOf(childCount), Integer.valueOf(itemCount));
                return;
            }
            recycleHeader(recyclerView);
            layoutHeader(recyclerView);
            if (this.mVisibility == 0) {
                super.onDrawOver(canvas, recyclerView, state);
                drawHeader(recyclerView, canvas);
            }
        }
    }

    public void setHeaderClickListener(HeaderClickListener headerClickListener) {
        this.mItemClickHelper.setHeaderClickListener(headerClickListener);
    }

    /* access modifiers changed from: 0000 */
    public void setHeaderVisibility(RecyclerView recyclerView, int i) {
        if (this.mVisibility != i) {
            if (this.mVisibility == 8 || i == 8) {
                recyclerView.requestLayout();
            } else {
                recyclerView.invalidate();
            }
            this.mVisibility = i;
        }
    }

    /* access modifiers changed from: 0000 */
    public void setStickyHeaderAdapter(StickyHeaderAdapter<VH> stickyHeaderAdapter) {
        this.mHeaderAdapter = stickyHeaderAdapter;
        this.mHeaderRecycler = new StickyHeaderRecycler<>(this.mHeaderAdapter);
        if (this.mHeaderLayoutManager != null) {
            this.mHeaderLayoutManager.setStickyHeaderAdapter(stickyHeaderAdapter);
            notifyDataChanged();
        }
    }

    /* access modifiers changed from: 0000 */
    public void setStickyHeaderLayoutManager(StickyHeaderLayoutManager<VH> stickyHeaderLayoutManager) {
        this.mHeaderLayoutManager = stickyHeaderLayoutManager;
        if (this.mHeaderLayoutManager != null) {
            this.mHeaderLayoutManager.setStickyHeaderAdapter(this.mHeaderAdapter);
        }
        if (this.mHeaderAdapter != null) {
            notifyDataChanged();
        }
    }

    /* access modifiers changed from: 0000 */
    public void setStickyHeaderRender(StickyHeaderRender<VH> stickyHeaderRender) {
        this.mHeaderRender = stickyHeaderRender;
        invalidate();
    }
}
