package uk.co.senab.photoview.scrollerproxy;

import android.content.Context;
import android.os.Build.VERSION;
import android.view.animation.Interpolator;

public abstract class ScrollerProxy {
    public static ScrollerProxy getScroller(Context context) {
        return VERSION.SDK_INT < 9 ? new PreGingerScroller(context) : VERSION.SDK_INT < 14 ? new GingerScroller(context) : new IcsScroller(context);
    }

    public static ScrollerProxy getScroller(Context context, Interpolator interpolator) {
        return VERSION.SDK_INT < 9 ? new PreGingerScroller(context, interpolator) : VERSION.SDK_INT < 14 ? new GingerScroller(context, interpolator) : new IcsScroller(context, interpolator);
    }

    public abstract boolean computeScrollOffset();

    public abstract void fling(int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9, int i10);

    public abstract void forceFinished(boolean z);

    public abstract int getCurrX();

    public abstract int getCurrY();

    public abstract boolean isFinished();

    public abstract void startScroll(int i, int i2, int i3, int i4, int i5);
}
