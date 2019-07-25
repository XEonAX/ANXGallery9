package com.edmodo.cropper.util;

import android.graphics.PointF;
import com.edmodo.cropper.cropwindow.handle.Handle;

public class HandleUtil {
    /* JADX WARNING: Code restructure failed: missing block: B:13:0x0039, code lost:
        r8.x = r0;
        r8.y = r1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:14:0x003d, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:8:0x0024, code lost:
        r0 = r1;
     */
    public static void getOffset(Handle handle, float f, float f2, float f3, float f4, float f5, float f6, PointF pointF) {
        float f7;
        float f8;
        float f9 = 0.0f;
        switch (handle) {
            case TOP_LEFT:
                f9 = f3 - f;
                f7 = f4 - f2;
                break;
            case TOP_RIGHT:
                f9 = f5 - f;
                f7 = f4 - f2;
                break;
            case BOTTOM_LEFT:
                f9 = f3 - f;
                f7 = f6 - f2;
                break;
            case BOTTOM_RIGHT:
                f9 = f5 - f;
                f7 = f6 - f2;
                break;
            case LEFT:
                f8 = f3 - f;
                break;
            case TOP:
                f7 = f4 - f2;
                break;
            case RIGHT:
                f8 = f5 - f;
                break;
            case BOTTOM:
                f7 = f6 - f2;
                break;
            case CENTER:
                f9 = ((f5 + f3) / 2.0f) - f;
                f7 = ((f4 + f6) / 2.0f) - f2;
                break;
            default:
                f7 = 0.0f;
                break;
        }
    }

    public static Handle getPressedHandle(float f, float f2, float f3, float f4, float f5, float f6, float f7) {
        float f8;
        Handle handle;
        float f9 = f;
        float f10 = f2;
        float f11 = f5;
        float f12 = f6;
        float calculateDistance = MathUtil.calculateDistance(f, f2, f3, f4);
        if (calculateDistance < Float.POSITIVE_INFINITY) {
            handle = Handle.TOP_LEFT;
            f8 = f4;
        } else {
            f8 = f4;
            handle = null;
            calculateDistance = Float.POSITIVE_INFINITY;
        }
        float calculateDistance2 = MathUtil.calculateDistance(f, f2, f11, f8);
        if (calculateDistance2 < calculateDistance) {
            handle = Handle.TOP_RIGHT;
            float f13 = f3;
            calculateDistance = calculateDistance2;
        } else {
            float f14 = f3;
        }
        float calculateDistance3 = MathUtil.calculateDistance(f, f2, f3, f12);
        if (calculateDistance3 < calculateDistance) {
            handle = Handle.BOTTOM_LEFT;
            calculateDistance = calculateDistance3;
        }
        float calculateDistance4 = MathUtil.calculateDistance(f, f2, f11, f12);
        if (calculateDistance4 < calculateDistance) {
            handle = Handle.BOTTOM_RIGHT;
            calculateDistance = calculateDistance4;
        }
        if (calculateDistance <= f7) {
            return handle;
        }
        if (isInHorizontalTargetZone(f, f2, f3, f5, f4, f7)) {
            return Handle.TOP;
        }
        if (isInHorizontalTargetZone(f, f2, f3, f5, f6, f7)) {
            return Handle.BOTTOM;
        }
        if (isInVerticalTargetZone(f, f2, f3, f4, f6, f7)) {
            return Handle.LEFT;
        }
        if (isInVerticalTargetZone(f, f2, f5, f4, f6, f7)) {
            return Handle.RIGHT;
        }
        if (isWithinBounds(f, f2, f3, f4, f5, f6)) {
            return Handle.CENTER;
        }
        return null;
    }

    private static boolean isInHorizontalTargetZone(float f, float f2, float f3, float f4, float f5, float f6) {
        return f > f3 && f < f4 && Math.abs(f2 - f5) <= f6;
    }

    private static boolean isInVerticalTargetZone(float f, float f2, float f3, float f4, float f5, float f6) {
        return Math.abs(f - f3) <= f6 && f2 > f4 && f2 < f5;
    }

    private static boolean isWithinBounds(float f, float f2, float f3, float f4, float f5, float f6) {
        return f >= f3 && f <= f5 && f2 >= f4 && f2 <= f6;
    }
}
