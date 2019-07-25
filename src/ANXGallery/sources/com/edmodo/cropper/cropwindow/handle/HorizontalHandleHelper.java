package com.edmodo.cropper.cropwindow.handle;

import android.graphics.RectF;
import com.edmodo.cropper.cropwindow.edge.Edge;
import com.edmodo.cropper.util.AspectRatioUtil;

class HorizontalHandleHelper extends HandleHelper {
    private Edge mEdge;

    HorizontalHandleHelper(Edge edge) {
        super(edge, null);
        this.mEdge = edge;
    }

    /* access modifiers changed from: 0000 */
    public void updateCropWindow(float f, float f2, float f3, RectF rectF, float f4) {
        this.mEdge.adjustCoordinate(f, f2, rectF, f4, f3);
        float coordinate = Edge.LEFT.getCoordinate();
        float calculateWidth = (AspectRatioUtil.calculateWidth(Edge.getHeight(), f3) - Edge.getWidth()) / 2.0f;
        float coordinate2 = Edge.RIGHT.getCoordinate() + calculateWidth;
        Edge.LEFT.setCoordinate(coordinate - calculateWidth);
        Edge.RIGHT.setCoordinate(coordinate2);
        if (Edge.LEFT.isOutsideMargin(rectF, f4) && !this.mEdge.isNewRectangleOutOfBounds(Edge.LEFT, rectF, f3)) {
            Edge.RIGHT.offset(-Edge.LEFT.snapToRect(rectF));
            this.mEdge.adjustCoordinate(f3);
        }
        if (Edge.RIGHT.isOutsideMargin(rectF, f4) && !this.mEdge.isNewRectangleOutOfBounds(Edge.RIGHT, rectF, f3)) {
            Edge.LEFT.offset(-Edge.RIGHT.snapToRect(rectF));
            this.mEdge.adjustCoordinate(f3);
        }
    }
}
