package com.miui.gallery.widget.recyclerview.transition;

import android.graphics.Canvas;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.State;
import com.miui.gallery.util.Log;
import java.util.Collections;
import java.util.List;

class TransitionDecoration extends ItemDecoration {
    private List<DecorItem> mDecorItems;
    private float mProgress;

    TransitionDecoration() {
    }

    private void drawItems(Canvas canvas) {
        if (this.mDecorItems != null) {
            for (DecorItem onDraw : this.mDecorItems) {
                onDraw.onDraw(canvas, this.mProgress);
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public List<DecorItem> getDecorItems() {
        if (this.mDecorItems != null) {
            return Collections.unmodifiableList(this.mDecorItems);
        }
        return null;
    }

    public void onDraw(Canvas canvas, RecyclerView recyclerView, State state) {
        super.onDraw(canvas, recyclerView, state);
    }

    public void onDrawOver(Canvas canvas, RecyclerView recyclerView, State state) {
        super.onDrawOver(canvas, recyclerView, state);
        drawItems(canvas);
    }

    public void updateItems(RecyclerView recyclerView, List<DecorItem> list) {
        this.mDecorItems = list;
        recyclerView.invalidate();
    }

    public void updateProgress(RecyclerView recyclerView, float f) {
        if (this.mDecorItems == null || this.mDecorItems.isEmpty()) {
            Log.e("TransitionDecoration", "mDecorItems is empty");
            return;
        }
        float min = Math.min(1.0f, Math.max(f, 0.0f));
        if (Float.compare(this.mProgress, min) != 0) {
            this.mProgress = min;
            Log.d("TransitionDecoration", "update progress %s", (Object) Float.valueOf(this.mProgress));
            recyclerView.invalidate();
        }
    }
}
