package com.miui.gallery.widget.recyclerview;

import android.content.Context;
import android.os.Build.VERSION;
import android.support.v4.view.GestureDetectorCompat;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.SimpleOnItemTouchListener;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.MotionEvent;
import android.view.View;
import java.lang.ref.WeakReference;

abstract class ClickItemTouchListener extends SimpleOnItemTouchListener {
    private final GestureDetectorHelper mGestureDetector;

    private interface GestureDetectorHelper {
        boolean onTouchEvent(MotionEvent motionEvent);
    }

    private class ItemClickGestureDetector implements GestureDetectorHelper {
        private GestureDetectorCompat mGestureDetectorCompat;
        private final ItemClickGestureListener mGestureListener;

        public ItemClickGestureDetector(Context context, ItemClickGestureListener itemClickGestureListener) {
            this.mGestureDetectorCompat = new GestureDetectorCompat(context, itemClickGestureListener);
            this.mGestureListener = itemClickGestureListener;
        }

        /* JADX WARNING: Code restructure failed: missing block: B:3:0x000e, code lost:
            if (r1 != 3) goto L_0x001b;
         */
        public boolean onTouchEvent(MotionEvent motionEvent) {
            boolean onTouchEvent = this.mGestureDetectorCompat.onTouchEvent(motionEvent);
            int actionMasked = motionEvent.getActionMasked();
            if (actionMasked == 1) {
                this.mGestureListener.dispatchSingleTapUpIfNeeded(motionEvent);
            }
            this.mGestureListener.dispatchResetPressState(motionEvent);
            return onTouchEvent;
        }
    }

    private class ItemClickGestureListener extends SimpleOnGestureListener {
        private final RecyclerView mHostView;
        private boolean mIsTapUpConsumed;
        private WeakReference<View> mPressedViewRef;

        public ItemClickGestureListener(RecyclerView recyclerView) {
            this.mHostView = recyclerView;
        }

        private void resetPressState() {
            if (this.mPressedViewRef != null) {
                View view = (View) this.mPressedViewRef.get();
                if (view != null) {
                    view.setPressed(false);
                    this.mHostView.getChildViewHolder(view).setIsRecyclable(true);
                    this.mPressedViewRef.clear();
                }
                this.mPressedViewRef = null;
            }
        }

        public void dispatchResetPressState(MotionEvent motionEvent) {
            resetPressState();
        }

        public void dispatchSingleTapUpIfNeeded(MotionEvent motionEvent) {
            if (!this.mIsTapUpConsumed) {
                onSingleTapUp(motionEvent);
            }
        }

        public boolean onDown(MotionEvent motionEvent) {
            this.mIsTapUpConsumed = false;
            return this.mHostView.findChildViewUnder(motionEvent.getX(), motionEvent.getY()) != null;
        }

        public void onLongPress(MotionEvent motionEvent) {
            if (ClickItemTouchListener.isAttachedToWindow(this.mHostView)) {
                View findChildViewUnder = this.mHostView.findChildViewUnder(motionEvent.getX(), motionEvent.getY());
                if (findChildViewUnder != null) {
                    int childAdapterPosition = this.mHostView.getChildAdapterPosition(findChildViewUnder);
                    if (childAdapterPosition != -1 && ClickItemTouchListener.this.performItemLongClick(this.mHostView, findChildViewUnder, childAdapterPosition, this.mHostView.getAdapter().getItemId(childAdapterPosition), motionEvent.getX() - (((float) findChildViewUnder.getLeft()) + findChildViewUnder.getTranslationX()), motionEvent.getY() - (((float) findChildViewUnder.getTop()) + findChildViewUnder.getTranslationY()))) {
                        this.mIsTapUpConsumed = true;
                    }
                }
            }
        }

        public boolean onScroll(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            if (!this.mIsTapUpConsumed) {
                this.mIsTapUpConsumed = true;
            }
            resetPressState();
            return false;
        }

        public void onShowPress(MotionEvent motionEvent) {
            resetPressState();
            View findChildViewUnder = this.mHostView.findChildViewUnder(motionEvent.getX(), motionEvent.getY());
            if (findChildViewUnder != null) {
                findChildViewUnder.setPressed(true);
                this.mHostView.getChildViewHolder(findChildViewUnder).setIsRecyclable(false);
                this.mPressedViewRef = new WeakReference<>(findChildViewUnder);
            }
        }

        public boolean onSingleTapUp(MotionEvent motionEvent) {
            View findChildViewUnder = this.mHostView.findChildViewUnder(motionEvent.getX(), motionEvent.getY());
            boolean z = false;
            if (findChildViewUnder == null) {
                return false;
            }
            int childPosition = this.mHostView.getChildPosition(findChildViewUnder);
            long itemId = this.mHostView.getAdapter().getItemId(childPosition);
            float x = motionEvent.getX() - (((float) findChildViewUnder.getLeft()) + findChildViewUnder.getTranslationX());
            float y = motionEvent.getY() - (((float) findChildViewUnder.getTop()) + findChildViewUnder.getTranslationY());
            if (childPosition != -1 && ClickItemTouchListener.this.performItemClick(this.mHostView, findChildViewUnder, childPosition, itemId, x, y)) {
                z = true;
            }
            if (z) {
                this.mIsTapUpConsumed = true;
            }
            return z;
        }
    }

    ClickItemTouchListener(RecyclerView recyclerView) {
        this.mGestureDetector = new ItemClickGestureDetector(recyclerView.getContext(), new ItemClickGestureListener(recyclerView));
    }

    private boolean hasAdapter(RecyclerView recyclerView) {
        return recyclerView.getAdapter() != null;
    }

    static boolean isAttachedToWindow(RecyclerView recyclerView) {
        if (VERSION.SDK_INT >= 19) {
            return recyclerView.isAttachedToWindow();
        }
        return recyclerView.getHandler() != null;
    }

    public boolean onInterceptTouchEvent(RecyclerView recyclerView, MotionEvent motionEvent) {
        if (!isAttachedToWindow(recyclerView) || !hasAdapter(recyclerView)) {
            return false;
        }
        this.mGestureDetector.onTouchEvent(motionEvent);
        return false;
    }

    public void onTouchEvent(RecyclerView recyclerView, MotionEvent motionEvent) {
    }

    /* access modifiers changed from: 0000 */
    public abstract boolean performItemClick(RecyclerView recyclerView, View view, int i, long j, float f, float f2);

    /* access modifiers changed from: 0000 */
    public abstract boolean performItemLongClick(RecyclerView recyclerView, View view, int i, long j, float f, float f2);
}
