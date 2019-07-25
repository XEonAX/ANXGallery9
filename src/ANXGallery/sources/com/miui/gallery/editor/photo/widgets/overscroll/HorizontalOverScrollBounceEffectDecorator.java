package com.miui.gallery.editor.photo.widgets.overscroll;

import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.helper.ItemTouchHelper.Callback;
import android.view.MotionEvent;
import android.view.View;
import com.miui.gallery.editor.photo.widgets.overscroll.IOverScrollInterface.IOverScrollDecoratorAdapter;

public class HorizontalOverScrollBounceEffectDecorator extends OverScrollBounceEffectDecoratorBase {

    protected static class AnimationAttributesHorizontal extends AnimationAttributes {
        public AnimationAttributesHorizontal() {
            this.mProperty = View.TRANSLATION_X;
        }

        /* access modifiers changed from: protected */
        public void init(View view) {
            this.mAbsOffset = view.getTranslationX();
            this.mMaxOffset = (float) view.getWidth();
        }
    }

    protected static class MotionAttributesHorizontal extends MotionAttributes {
        protected MotionAttributesHorizontal() {
        }

        public boolean init(View view, MotionEvent motionEvent) {
            boolean z = false;
            if (motionEvent.getHistorySize() == 0) {
                return false;
            }
            float x = motionEvent.getX(0) - motionEvent.getHistoricalX(0, 0);
            if (Math.abs(x) < Math.abs(motionEvent.getY(0) - motionEvent.getHistoricalY(0, 0))) {
                return false;
            }
            this.mAbsOffset = view.getTranslationX();
            this.mDeltaOffset = x;
            if (this.mDeltaOffset > 0.0f) {
                z = true;
            }
            this.mDir = z;
            return true;
        }
    }

    public HorizontalOverScrollBounceEffectDecorator(IOverScrollDecoratorAdapter iOverScrollDecoratorAdapter) {
        this(iOverScrollDecoratorAdapter, 3.0f, 1.0f, -2.0f);
    }

    public HorizontalOverScrollBounceEffectDecorator(IOverScrollDecoratorAdapter iOverScrollDecoratorAdapter, float f, float f2, float f3) {
        super(iOverScrollDecoratorAdapter, f3, f, f2);
    }

    public static void setOverScrollEffect(RecyclerView recyclerView) {
        new HorizontalOverScrollBounceEffectDecorator(new RecyclerViewOverScrollDecorAdapter(recyclerView));
    }

    public static void setOverScrollEffect(RecyclerView recyclerView, Callback callback) {
        new HorizontalOverScrollBounceEffectDecorator(new RecyclerViewOverScrollDecorAdapter(recyclerView, callback));
    }

    /* access modifiers changed from: protected */
    public AnimationAttributes createAnimationAttributes() {
        return new AnimationAttributesHorizontal();
    }

    /* access modifiers changed from: protected */
    public MotionAttributes createMotionAttributes() {
        return new MotionAttributesHorizontal();
    }

    /* access modifiers changed from: protected */
    public void translateView(View view, float f) {
        view.setTranslationX(f);
    }

    /* access modifiers changed from: protected */
    public void translateViewAndEvent(View view, float f, MotionEvent motionEvent) {
        view.setTranslationX(f);
        motionEvent.offsetLocation(f - motionEvent.getX(0), 0.0f);
    }
}
