package com.edmodo.cropper.cropwindow.edge;

import android.graphics.RectF;
import com.edmodo.cropper.util.AspectRatioUtil;

public enum Edge {
    LEFT,
    TOP,
    RIGHT,
    BOTTOM;
    
    private float mCoordinate;

    private static float adjustBottom(float f, RectF rectF, float f2, float f3) {
        if (rectF.bottom - f < f2) {
            return rectF.bottom;
        }
        float f4 = Float.NEGATIVE_INFINITY;
        float coordinate = f <= TOP.getCoordinate() + 40.0f ? TOP.getCoordinate() + 40.0f : Float.NEGATIVE_INFINITY;
        if ((f - TOP.getCoordinate()) * f3 <= 40.0f) {
            f4 = TOP.getCoordinate() + (40.0f / f3);
        }
        return Math.min(rectF.bottom, Math.max(f, Math.max(f4, coordinate)));
    }

    private static float adjustLeft(float f, RectF rectF, float f2, float f3) {
        if (f - rectF.left < f2) {
            return rectF.left;
        }
        float f4 = Float.POSITIVE_INFINITY;
        float coordinate = f >= RIGHT.getCoordinate() - 40.0f ? RIGHT.getCoordinate() - 40.0f : Float.POSITIVE_INFINITY;
        if ((RIGHT.getCoordinate() - f) / f3 <= 40.0f) {
            f4 = RIGHT.getCoordinate() - (f3 * 40.0f);
        }
        return Math.max(rectF.left, Math.min(f, Math.min(coordinate, f4)));
    }

    private static float adjustRight(float f, RectF rectF, float f2, float f3) {
        if (rectF.right - f < f2) {
            return rectF.right;
        }
        float f4 = Float.NEGATIVE_INFINITY;
        float coordinate = f <= LEFT.getCoordinate() + 40.0f ? LEFT.getCoordinate() + 40.0f : Float.NEGATIVE_INFINITY;
        if ((f - LEFT.getCoordinate()) / f3 <= 40.0f) {
            f4 = LEFT.getCoordinate() + (f3 * 40.0f);
        }
        return Math.min(rectF.right, Math.max(f, Math.max(coordinate, f4)));
    }

    private static float adjustTop(float f, RectF rectF, float f2, float f3) {
        if (f - rectF.top < f2) {
            return rectF.top;
        }
        float f4 = Float.POSITIVE_INFINITY;
        float coordinate = f >= BOTTOM.getCoordinate() - 40.0f ? BOTTOM.getCoordinate() - 40.0f : Float.POSITIVE_INFINITY;
        if ((BOTTOM.getCoordinate() - f) * f3 <= 40.0f) {
            f4 = BOTTOM.getCoordinate() - (40.0f / f3);
        }
        return Math.max(rectF.top, Math.min(f, Math.min(coordinate, f4)));
    }

    public static float getHeight() {
        return BOTTOM.getCoordinate() - TOP.getCoordinate();
    }

    public static float getWidth() {
        return RIGHT.getCoordinate() - LEFT.getCoordinate();
    }

    private boolean isOutOfBounds(float f, float f2, float f3, float f4, RectF rectF) {
        return f < rectF.top || f2 < rectF.left || f3 > rectF.bottom || f4 > rectF.right;
    }

    public void adjustCoordinate(float f) {
        float coordinate = LEFT.getCoordinate();
        float coordinate2 = TOP.getCoordinate();
        float coordinate3 = RIGHT.getCoordinate();
        float coordinate4 = BOTTOM.getCoordinate();
        switch (this) {
            case LEFT:
                this.mCoordinate = AspectRatioUtil.calculateLeft(coordinate2, coordinate3, coordinate4, f);
                return;
            case TOP:
                this.mCoordinate = AspectRatioUtil.calculateTop(coordinate, coordinate3, coordinate4, f);
                return;
            case RIGHT:
                this.mCoordinate = AspectRatioUtil.calculateRight(coordinate, coordinate2, coordinate4, f);
                return;
            case BOTTOM:
                this.mCoordinate = AspectRatioUtil.calculateBottom(coordinate, coordinate2, coordinate3, f);
                return;
            default:
                return;
        }
    }

    public void adjustCoordinate(float f, float f2, RectF rectF, float f3, float f4) {
        switch (this) {
            case LEFT:
                this.mCoordinate = adjustLeft(f, rectF, f3, f4);
                return;
            case TOP:
                this.mCoordinate = adjustTop(f2, rectF, f3, f4);
                return;
            case RIGHT:
                this.mCoordinate = adjustRight(f, rectF, f3, f4);
                return;
            case BOTTOM:
                this.mCoordinate = adjustBottom(f2, rectF, f3, f4);
                return;
            default:
                return;
        }
    }

    public float getCoordinate() {
        return this.mCoordinate;
    }

    public boolean isNewRectangleOutOfBounds(Edge edge, RectF rectF, float f) {
        float snapOffset = edge.snapOffset(rectF);
        switch (this) {
            case LEFT:
                if (edge.equals(TOP)) {
                    float f2 = rectF.top;
                    float coordinate = BOTTOM.getCoordinate() - snapOffset;
                    float coordinate2 = RIGHT.getCoordinate();
                    return isOutOfBounds(f2, AspectRatioUtil.calculateLeft(f2, coordinate2, coordinate, f), coordinate, coordinate2, rectF);
                } else if (edge.equals(BOTTOM)) {
                    float f3 = rectF.bottom;
                    float coordinate3 = TOP.getCoordinate() - snapOffset;
                    float coordinate4 = RIGHT.getCoordinate();
                    return isOutOfBounds(coordinate3, AspectRatioUtil.calculateLeft(coordinate3, coordinate4, f3, f), f3, coordinate4, rectF);
                }
                break;
            case TOP:
                if (edge.equals(LEFT)) {
                    float f4 = rectF.left;
                    float coordinate5 = RIGHT.getCoordinate() - snapOffset;
                    float coordinate6 = BOTTOM.getCoordinate();
                    return isOutOfBounds(AspectRatioUtil.calculateTop(f4, coordinate5, coordinate6, f), f4, coordinate6, coordinate5, rectF);
                } else if (edge.equals(RIGHT)) {
                    float f5 = rectF.right;
                    float coordinate7 = LEFT.getCoordinate() - snapOffset;
                    float coordinate8 = BOTTOM.getCoordinate();
                    return isOutOfBounds(AspectRatioUtil.calculateTop(coordinate7, f5, coordinate8, f), coordinate7, coordinate8, f5, rectF);
                }
                break;
            case RIGHT:
                if (edge.equals(TOP)) {
                    float f6 = rectF.top;
                    float coordinate9 = BOTTOM.getCoordinate() - snapOffset;
                    float coordinate10 = LEFT.getCoordinate();
                    return isOutOfBounds(f6, coordinate10, coordinate9, AspectRatioUtil.calculateRight(coordinate10, f6, coordinate9, f), rectF);
                } else if (edge.equals(BOTTOM)) {
                    float f7 = rectF.bottom;
                    float coordinate11 = TOP.getCoordinate() - snapOffset;
                    float coordinate12 = LEFT.getCoordinate();
                    return isOutOfBounds(coordinate11, coordinate12, f7, AspectRatioUtil.calculateRight(coordinate12, coordinate11, f7, f), rectF);
                }
                break;
            case BOTTOM:
                if (edge.equals(LEFT)) {
                    float f8 = rectF.left;
                    float coordinate13 = RIGHT.getCoordinate() - snapOffset;
                    float coordinate14 = TOP.getCoordinate();
                    return isOutOfBounds(coordinate14, f8, AspectRatioUtil.calculateBottom(f8, coordinate14, coordinate13, f), coordinate13, rectF);
                } else if (edge.equals(RIGHT)) {
                    float f9 = rectF.right;
                    float coordinate15 = LEFT.getCoordinate() - snapOffset;
                    float coordinate16 = TOP.getCoordinate();
                    return isOutOfBounds(coordinate16, coordinate15, AspectRatioUtil.calculateBottom(coordinate15, coordinate16, f9, f), f9, rectF);
                }
                break;
        }
        return true;
    }

    public boolean isOutsideMargin(RectF rectF, float f) {
        switch (this) {
            case LEFT:
                if (this.mCoordinate - rectF.left >= f) {
                    return false;
                }
                break;
            case TOP:
                if (this.mCoordinate - rectF.top >= f) {
                    return false;
                }
                break;
            case RIGHT:
                if (rectF.right - this.mCoordinate >= f) {
                    return false;
                }
                break;
            default:
                if (rectF.bottom - this.mCoordinate >= f) {
                    return false;
                }
                break;
        }
        return true;
    }

    public void offset(float f) {
        this.mCoordinate += f;
    }

    public void setCoordinate(float f) {
        this.mCoordinate = f;
    }

    public float snapOffset(RectF rectF) {
        float f;
        float f2 = this.mCoordinate;
        switch (this) {
            case LEFT:
                f = rectF.left;
                break;
            case TOP:
                f = rectF.top;
                break;
            case RIGHT:
                f = rectF.right;
                break;
            default:
                f = rectF.bottom;
                break;
        }
        return f - f2;
    }

    public float snapToRect(RectF rectF) {
        float f = this.mCoordinate;
        switch (this) {
            case LEFT:
                this.mCoordinate = rectF.left;
                break;
            case TOP:
                this.mCoordinate = rectF.top;
                break;
            case RIGHT:
                this.mCoordinate = rectF.right;
                break;
            case BOTTOM:
                this.mCoordinate = rectF.bottom;
                break;
        }
        return this.mCoordinate - f;
    }
}
