package com.edmodo.cropper.cropwindow.handle;

import android.graphics.RectF;
import com.edmodo.cropper.cropwindow.edge.Edge;
import com.edmodo.cropper.util.AspectRatioUtil;

class VerticalHandleHelper extends HandleHelper {
    private Edge mEdge;

    VerticalHandleHelper(Edge edge) {
        super(null, edge);
        this.mEdge = edge;
    }

    /* access modifiers changed from: 0000 */
    public void updateCropWindow(float f, float f2, float f3, RectF rectF, float f4) {
        this.mEdge.adjustCoordinate(f, f2, rectF, f4, f3);
        float coordinate = Edge.TOP.getCoordinate();
        float calculateHeight = (AspectRatioUtil.calculateHeight(Edge.getWidth(), f3) - Edge.getHeight()) / 2.0f;
        float coordinate2 = Edge.BOTTOM.getCoordinate() + calculateHeight;
        Edge.TOP.setCoordinate(coordinate - calculateHeight);
        Edge.BOTTOM.setCoordinate(coordinate2);
        if (Edge.TOP.isOutsideMargin(rectF, f4) && !this.mEdge.isNewRectangleOutOfBounds(Edge.TOP, rectF, f3)) {
            Edge.BOTTOM.offset(-Edge.TOP.snapToRect(rectF));
            this.mEdge.adjustCoordinate(f3);
        }
        if (Edge.BOTTOM.isOutsideMargin(rectF, f4) && !this.mEdge.isNewRectangleOutOfBounds(Edge.BOTTOM, rectF, f3)) {
            Edge.TOP.offset(-Edge.BOTTOM.snapToRect(rectF));
            this.mEdge.adjustCoordinate(f3);
        }
    }
}
