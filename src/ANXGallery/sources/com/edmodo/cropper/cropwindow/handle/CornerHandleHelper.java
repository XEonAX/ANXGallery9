package com.edmodo.cropper.cropwindow.handle;

import android.graphics.RectF;
import com.edmodo.cropper.cropwindow.edge.Edge;
import com.edmodo.cropper.cropwindow.edge.EdgePair;

class CornerHandleHelper extends HandleHelper {
    CornerHandleHelper(Edge edge, Edge edge2) {
        super(edge, edge2);
    }

    /* access modifiers changed from: 0000 */
    public void updateCropWindow(float f, float f2, float f3, RectF rectF, float f4) {
        EdgePair activeEdges = getActiveEdges(f, f2, f3);
        Edge edge = activeEdges.primary;
        Edge edge2 = activeEdges.secondary;
        edge.adjustCoordinate(f, f2, rectF, f4, f3);
        edge2.adjustCoordinate(f3);
        if (edge2.isOutsideMargin(rectF, f4)) {
            edge2.snapToRect(rectF);
            edge.adjustCoordinate(f3);
        }
    }
}
