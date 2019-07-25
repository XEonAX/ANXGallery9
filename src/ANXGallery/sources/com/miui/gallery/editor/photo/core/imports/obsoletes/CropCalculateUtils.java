package com.miui.gallery.editor.photo.core.imports.obsoletes;

import android.graphics.RectF;
import com.miui.gallery.util.Log;
import java.util.List;

public class CropCalculateUtils {
    private static float doRound(float f) {
        return ((float) Math.round(f * 100.0f)) / 100.0f;
    }

    public static void doRound(RectF rectF) {
        rectF.left = doRound(rectF.left);
        rectF.top = doRound(rectF.top);
        rectF.right = doRound(rectF.right);
        rectF.bottom = doRound(rectF.bottom);
    }

    public static void doRound(float[] fArr) {
        for (int i = 0; i < fArr.length; i++) {
            fArr[i] = doRound(fArr[i]);
        }
    }

    public static float[] getIntersection(float[] fArr, float[] fArr2, float[] fArr3, float[] fArr4) {
        float[] fArr5 = fArr;
        float[] fArr6 = fArr2;
        float[] fArr7 = fArr3;
        float[] fArr8 = fArr4;
        float f = fArr5[0];
        boolean z = true;
        float f2 = fArr5[1];
        float f3 = fArr6[0];
        float f4 = fArr6[1];
        float f5 = fArr7[0];
        float f6 = fArr7[1];
        float f7 = fArr8[0];
        float f8 = fArr8[1];
        float f9 = f - f3;
        boolean z2 = f9 == 0.0f;
        float f10 = f5 - f7;
        boolean z3 = f10 == 0.0f;
        float f11 = Float.MAX_VALUE;
        float f12 = !z2 ? (f2 - f4) / f9 : Float.MAX_VALUE;
        if (!z3) {
            f11 = (f6 - f8) / f10;
        }
        if (f12 == f11) {
            if (z2) {
            }
            z = false;
            if (z) {
                if (isAtSameSide(fArr7, fArr8, fArr6)) {
                    return fArr6;
                }
                if (isAtSameSide(fArr7, fArr8, fArr5)) {
                    return fArr5;
                }
            }
            return null;
        }
        if (!z2) {
            if (z3) {
                if (f12 != 0.0f) {
                    f2 = (f12 * (f5 - f3)) + f4;
                }
                f = f5;
            } else if (f12 == 0.0f) {
                f = ((f2 - f8) / f11) + f7;
            } else if (f11 == 0.0f) {
                f = ((f6 - f4) / f12) + f3;
            } else {
                f = ((((f12 * f3) - (f7 * f11)) + f8) - f4) / (f12 - f11);
                f2 = (f12 * (f - f3)) + f4;
            }
            return new float[]{f, f2};
        } else if (f11 != 0.0f) {
            f2 = (f11 * (f - f7)) + f8;
            return new float[]{f, f2};
        }
        f2 = f6;
        return new float[]{f, f2};
    }

    public static float[] getRectIntersection(List<float[]> list, float[] fArr, float[] fArr2) {
        int i = 0;
        while (i < list.size()) {
            i++;
            float[] segmentIntersection = getSegmentIntersection((float[]) list.get(i), (float[]) list.get(i % list.size()), fArr, fArr2);
            if (segmentIntersection != null) {
                return segmentIntersection;
            }
        }
        Log.d("CropCalculateUtils", "can not find intersection");
        return fArr2;
    }

    private static float[] getSegmentIntersection(float[] fArr, float[] fArr2, float[] fArr3, float[] fArr4) {
        float[] intersection = getIntersection(fArr, fArr2, fArr3, fArr4);
        if (intersection == null || !isOnSegment(fArr, fArr2, intersection) || !isAtSameSide(fArr3, fArr4, intersection)) {
            return null;
        }
        return intersection;
    }

    public static boolean isAtSameSide(float[] fArr, float[] fArr2, float[] fArr3) {
        boolean z = false;
        float f = fArr[0];
        float f2 = fArr[1];
        float f3 = fArr2[0];
        float f4 = fArr2[1];
        float f5 = fArr3[0];
        float f6 = fArr3[1];
        if (f3 == f5 && f4 == f6) {
            return true;
        }
        float f7 = f3 - f;
        if (f7 == 0.0f) {
            if ((f6 - f4) * (f4 - f2) > 0.0f) {
                z = true;
            }
            return z;
        }
        float f8 = f4 - f2;
        if (f8 == 0.0f) {
            if ((f5 - f3) * f7 > 0.0f) {
                z = true;
            }
            return z;
        }
        if ((f6 - f4) * f8 > 0.0f && (f5 - f3) * f7 > 0.0f) {
            z = true;
        }
        return z;
    }

    public static boolean isOnSegment(float[] fArr, float[] fArr2, float[] fArr3) {
        float f = fArr[0];
        float f2 = fArr[1];
        float f3 = fArr2[0];
        float f4 = fArr2[1];
        float f5 = fArr3[0];
        float f6 = fArr3[1];
        return f5 >= Math.min(f, f3) && f5 <= Math.max(f, f3) && f6 >= Math.min(f2, f4) && f6 <= Math.max(f2, f4);
    }

    public static boolean isParallel(float[] fArr, float[] fArr2, float[] fArr3, float[] fArr4) {
        float f = fArr[0];
        float f2 = fArr[1];
        float f3 = fArr2[0];
        float f4 = fArr2[1];
        return ((fArr3[0] - fArr4[0]) * (f2 - f4)) - ((f - f3) * (fArr3[1] - fArr4[1])) == 0.0f;
    }
}
