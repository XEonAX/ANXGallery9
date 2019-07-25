package com.edmodo.cropper.cropwindow.handle;

import android.graphics.RectF;
import com.edmodo.cropper.cropwindow.edge.Edge;

class CenterHandleHelper extends HandleHelper {
    CenterHandleHelper() {
        super(null, null);
    }

    /* access modifiers changed from: 0000 */
    public void updateCropWindow(float f, float f2, float f3, RectF rectF, float f4) {
        updateCropWindow(f, f2, rectF, f4);
    }

    /* access modifiers changed from: 0000 */
    public void updateCropWindow(float f, float f2, RectF rectF, float f3) {
        float coordinate = Edge.LEFT.getCoordinate();
        float coordinate2 = Edge.TOP.getCoordinate();
        float coordinate3 = f - ((coordinate + Edge.RIGHT.getCoordinate()) / 2.0f);
        float coordinate4 = f2 - ((coordinate2 + Edge.BOTTOM.getCoordinate()) / 2.0f);
        Edge.LEFT.offset(coordinate3);
        Edge.TOP.offset(coordinate4);
        Edge.RIGHT.offset(coordinate3);
        Edge.BOTTOM.offset(coordinate4);
        if (Edge.LEFT.isOutsideMargin(rectF, f3)) {
            Edge.RIGHT.offset(Edge.LEFT.snapToRect(rectF));
        } else if (Edge.RIGHT.isOutsideMargin(rectF, f3)) {
            Edge.LEFT.offset(Edge.RIGHT.snapToRect(rectF));
        }
        if (Edge.TOP.isOutsideMargin(rectF, f3)) {
            Edge.BOTTOM.offset(Edge.TOP.snapToRect(rectF));
        } else if (Edge.BOTTOM.isOutsideMargin(rectF, f3)) {
            Edge.TOP.offset(Edge.BOTTOM.snapToRect(rectF));
        }
    }
}
