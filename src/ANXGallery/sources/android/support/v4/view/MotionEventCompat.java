package android.support.v4.view;

import android.view.MotionEvent;

public final class MotionEventCompat {
    public static boolean isFromSource(MotionEvent motionEvent, int i) {
        return (motionEvent.getSource() & i) == i;
    }
}
