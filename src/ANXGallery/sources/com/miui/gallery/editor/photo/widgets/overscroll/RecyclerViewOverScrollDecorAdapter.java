package com.miui.gallery.editor.photo.widgets.overscroll;

import android.graphics.Canvas;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.LayoutManager;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.support.v7.widget.StaggeredGridLayoutManager;
import android.support.v7.widget.helper.ItemTouchHelper;
import android.support.v7.widget.helper.ItemTouchHelper.Callback;
import android.view.View;
import com.miui.gallery.editor.photo.widgets.overscroll.IOverScrollInterface.IOverScrollDecoratorAdapter;
import java.util.List;

public class RecyclerViewOverScrollDecorAdapter implements IOverScrollDecoratorAdapter {
    protected final Impl mImpl;
    protected boolean mIsItemTouchInEffect;
    protected final RecyclerView mRecyclerView;

    protected interface Impl {
        boolean isInAbsoluteEnd();

        boolean isInAbsoluteStart();
    }

    protected class ImplHorizLayout implements Impl {
        protected ImplHorizLayout() {
        }

        public boolean isInAbsoluteEnd() {
            return !RecyclerViewOverScrollDecorAdapter.this.mRecyclerView.canScrollHorizontally(1);
        }

        public boolean isInAbsoluteStart() {
            return !RecyclerViewOverScrollDecorAdapter.this.mRecyclerView.canScrollHorizontally(-1);
        }
    }

    protected class ImplVerticalLayout implements Impl {
        protected ImplVerticalLayout() {
        }

        public boolean isInAbsoluteEnd() {
            return !RecyclerViewOverScrollDecorAdapter.this.mRecyclerView.canScrollVertically(1);
        }

        public boolean isInAbsoluteStart() {
            return !RecyclerViewOverScrollDecorAdapter.this.mRecyclerView.canScrollVertically(-1);
        }
    }

    private static class ItemTouchHelperCallbackWrapper extends Callback {
        final Callback mCallback;

        private ItemTouchHelperCallbackWrapper(Callback callback) {
            this.mCallback = callback;
        }

        public boolean canDropOver(RecyclerView recyclerView, ViewHolder viewHolder, ViewHolder viewHolder2) {
            return this.mCallback.canDropOver(recyclerView, viewHolder, viewHolder2);
        }

        public ViewHolder chooseDropTarget(ViewHolder viewHolder, List<ViewHolder> list, int i, int i2) {
            return this.mCallback.chooseDropTarget(viewHolder, list, i, i2);
        }

        public void clearView(RecyclerView recyclerView, ViewHolder viewHolder) {
            this.mCallback.clearView(recyclerView, viewHolder);
        }

        public int convertToAbsoluteDirection(int i, int i2) {
            return this.mCallback.convertToAbsoluteDirection(i, i2);
        }

        public long getAnimationDuration(RecyclerView recyclerView, int i, float f, float f2) {
            return this.mCallback.getAnimationDuration(recyclerView, i, f, f2);
        }

        public int getBoundingBoxMargin() {
            return this.mCallback.getBoundingBoxMargin();
        }

        public float getMoveThreshold(ViewHolder viewHolder) {
            return this.mCallback.getMoveThreshold(viewHolder);
        }

        public int getMovementFlags(RecyclerView recyclerView, ViewHolder viewHolder) {
            return this.mCallback.getMovementFlags(recyclerView, viewHolder);
        }

        public float getSwipeThreshold(ViewHolder viewHolder) {
            return this.mCallback.getSwipeThreshold(viewHolder);
        }

        public int interpolateOutOfBoundsScroll(RecyclerView recyclerView, int i, int i2, int i3, long j) {
            return this.mCallback.interpolateOutOfBoundsScroll(recyclerView, i, i2, i3, j);
        }

        public boolean isItemViewSwipeEnabled() {
            return this.mCallback.isItemViewSwipeEnabled();
        }

        public boolean isLongPressDragEnabled() {
            return this.mCallback.isLongPressDragEnabled();
        }

        public void onChildDraw(Canvas canvas, RecyclerView recyclerView, ViewHolder viewHolder, float f, float f2, int i, boolean z) {
            this.mCallback.onChildDraw(canvas, recyclerView, viewHolder, f, f2, i, z);
        }

        public void onChildDrawOver(Canvas canvas, RecyclerView recyclerView, ViewHolder viewHolder, float f, float f2, int i, boolean z) {
            this.mCallback.onChildDrawOver(canvas, recyclerView, viewHolder, f, f2, i, z);
        }

        public boolean onMove(RecyclerView recyclerView, ViewHolder viewHolder, ViewHolder viewHolder2) {
            return this.mCallback.onMove(recyclerView, viewHolder, viewHolder2);
        }

        public void onMoved(RecyclerView recyclerView, ViewHolder viewHolder, int i, ViewHolder viewHolder2, int i2, int i3, int i4) {
            this.mCallback.onMoved(recyclerView, viewHolder, i, viewHolder2, i2, i3, i4);
        }

        public void onSelectedChanged(ViewHolder viewHolder, int i) {
            this.mCallback.onSelectedChanged(viewHolder, i);
        }

        public void onSwiped(ViewHolder viewHolder, int i) {
            this.mCallback.onSwiped(viewHolder, i);
        }
    }

    public RecyclerViewOverScrollDecorAdapter(RecyclerView recyclerView) {
        this.mIsItemTouchInEffect = false;
        this.mRecyclerView = recyclerView;
        LayoutManager layoutManager = recyclerView.getLayoutManager();
        boolean z = layoutManager instanceof LinearLayoutManager;
        if (z || (layoutManager instanceof StaggeredGridLayoutManager)) {
            if ((z ? ((LinearLayoutManager) layoutManager).getOrientation() : ((StaggeredGridLayoutManager) layoutManager).getOrientation()) == 0) {
                this.mImpl = new ImplHorizLayout();
            } else {
                this.mImpl = new ImplVerticalLayout();
            }
        } else {
            throw new IllegalArgumentException("Recycler views with custom layout managers are not supported by this adapter out of the box.Try implementing and providing an explicit 'impl' parameter to the other c'tors, or otherwise create a custom adapter subclass of your own.");
        }
    }

    public RecyclerViewOverScrollDecorAdapter(RecyclerView recyclerView, Callback callback) {
        this(recyclerView);
        setUpTouchHelperCallback(callback);
    }

    public View getView() {
        return this.mRecyclerView;
    }

    public boolean isInAbsoluteEnd() {
        return !this.mIsItemTouchInEffect && this.mImpl.isInAbsoluteEnd();
    }

    public boolean isInAbsoluteStart() {
        return !this.mIsItemTouchInEffect && this.mImpl.isInAbsoluteStart();
    }

    /* access modifiers changed from: protected */
    public void setUpTouchHelperCallback(Callback callback) {
        new ItemTouchHelper(new ItemTouchHelperCallbackWrapper(callback) {
            public void onSelectedChanged(ViewHolder viewHolder, int i) {
                RecyclerViewOverScrollDecorAdapter.this.mIsItemTouchInEffect = i != 0;
                super.onSelectedChanged(viewHolder, i);
            }
        }).attachToRecyclerView(this.mRecyclerView);
    }
}
