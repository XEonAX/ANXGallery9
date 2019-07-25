package uk.co.senab.photoview.gestures;

import android.content.Context;
import android.os.Build.VERSION;

public final class VersionedGestureDetector {
    public static GestureDetector newInstance(Context context, OnGestureListener onGestureListener) {
        int i = VERSION.SDK_INT;
        GestureDetector gestureDetector = i < 5 ? new CupcakeGestureDetector(context) : i < 8 ? new EclairGestureDetector(context) : new FroyoGestureDetector(context);
        gestureDetector.setOnGestureListener(onGestureListener);
        return gestureDetector;
    }
}
