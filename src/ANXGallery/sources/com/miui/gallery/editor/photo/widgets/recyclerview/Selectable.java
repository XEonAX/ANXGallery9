package com.miui.gallery.editor.photo.widgets.recyclerview;

import android.graphics.Canvas;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.ShapeDrawable;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.State;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.View;
import com.miui.gallery.util.Log;

public interface Selectable {

    public static final class Delegator implements Selectable {
        private RecyclerView mParent;
        private int mSelection;
        private Selector mSelector;

        public Delegator() {
            this(-1);
        }

        public Delegator(int i) {
            this(i, null);
        }

        public Delegator(int i, Selector selector) {
            this.mSelection = i;
            this.mSelector = selector;
            if (selector != null) {
                selector.mAdapter = this;
            }
        }

        public int getSelection() {
            return this.mSelection;
        }

        public void onAttachedToRecyclerView(RecyclerView recyclerView) {
            if (this.mParent == null) {
                if (this.mSelector != null) {
                    recyclerView.addItemDecoration(this.mSelector);
                    if (this.mSelector.mRequireLayer && recyclerView.getLayerType() == 0) {
                        recyclerView.setLayerType(2, null);
                    }
                }
                this.mParent = recyclerView;
                return;
            }
            throw new IllegalStateException("already attach to a recycler view");
        }

        public void onBindViewHolder(ViewHolder viewHolder, int i) {
            if (viewHolder.itemView != null) {
                boolean z = false;
                viewHolder.itemView.setActivated(i == this.mSelection);
                View view = viewHolder.itemView;
                if (i == this.mSelection) {
                    z = true;
                }
                view.setSelected(z);
            }
        }

        public void onDetachedFromRecyclerView(RecyclerView recyclerView) {
            if (this.mParent == recyclerView) {
                if (this.mSelector != null) {
                    recyclerView.removeItemDecoration(this.mSelector);
                }
                this.mParent = null;
                return;
            }
            Log.w("Selectable.Delegator", "not the attached parent view .");
        }

        /* JADX WARNING: Removed duplicated region for block: B:14:0x002e  */
        /* JADX WARNING: Removed duplicated region for block: B:21:0x0048  */
        public void setSelection(int i) {
            int i2;
            if (this.mSelection != i) {
                boolean z = false;
                if (this.mSelection != -1) {
                    ViewHolder findViewHolderForAdapterPosition = this.mParent.findViewHolderForAdapterPosition(this.mSelection);
                    if (findViewHolderForAdapterPosition == null || findViewHolderForAdapterPosition.itemView == null) {
                        i2 = this.mSelection;
                        z = true;
                        this.mSelection = i;
                        if (i != -1) {
                            ViewHolder findViewHolderForAdapterPosition2 = this.mParent.findViewHolderForAdapterPosition(i);
                            if (!(findViewHolderForAdapterPosition2 == null || findViewHolderForAdapterPosition2.itemView == null)) {
                                findViewHolderForAdapterPosition2.itemView.setActivated(true);
                                findViewHolderForAdapterPosition2.itemView.setSelected(true);
                            }
                        }
                        if (this.mSelector != null) {
                            this.mParent.invalidate();
                        }
                        if (z && i2 != -1) {
                            this.mParent.getAdapter().notifyItemChanged(i2);
                        }
                    }
                    findViewHolderForAdapterPosition.itemView.setActivated(false);
                    findViewHolderForAdapterPosition.itemView.setSelected(false);
                }
                i2 = 1;
                this.mSelection = i;
                if (i != -1) {
                }
                if (this.mSelector != null) {
                }
                this.mParent.getAdapter().notifyItemChanged(i2);
            }
        }
    }

    public static class Selector extends ItemDecoration {
        Selectable mAdapter;
        boolean mRequireLayer;
        private Drawable mSelector;

        public Selector(int i) {
            this(createMaskDrawable(i));
            this.mRequireLayer = true;
        }

        public Selector(Drawable drawable) {
            this.mSelector = drawable;
        }

        private static Drawable createMaskDrawable(int i) {
            ShapeDrawable shapeDrawable = new ShapeDrawable();
            shapeDrawable.getPaint().setXfermode(new PorterDuffXfermode(Mode.SRC_ATOP));
            shapeDrawable.getPaint().setColor(i);
            return shapeDrawable;
        }

        public void onDrawOver(Canvas canvas, RecyclerView recyclerView, State state) {
            super.onDrawOver(canvas, recyclerView, state);
            ViewHolder findViewHolderForAdapterPosition = recyclerView.findViewHolderForAdapterPosition(this.mAdapter.getSelection());
            if (findViewHolderForAdapterPosition != null && findViewHolderForAdapterPosition.itemView != null) {
                View view = findViewHolderForAdapterPosition.itemView;
                int save = canvas.save();
                canvas.clipRect(view.getLeft(), view.getTop(), view.getRight(), view.getBottom());
                this.mSelector.setBounds(view.getLeft(), view.getTop(), view.getRight(), view.getBottom());
                this.mSelector.draw(canvas);
                canvas.restoreToCount(save);
            }
        }
    }

    int getSelection();
}
