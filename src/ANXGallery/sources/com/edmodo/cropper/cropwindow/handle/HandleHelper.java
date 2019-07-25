package com.edmodo.cropper.cropwindow.handle;

import android.graphics.RectF;
import com.edmodo.cropper.cropwindow.edge.Edge;
import com.edmodo.cropper.cropwindow.edge.EdgePair;
import com.edmodo.cropper.util.AspectRatioUtil;

abstract class HandleHelper {
    private EdgePair mActiveEdges = new EdgePair(this.mHorizontalEdge, this.mVerticalEdge);
    private Edge mHorizontalEdge;
    private Edge mVerticalEdge;

    HandleHelper(Edge edge, Edge edge2) {
        this.mHorizontalEdge = edge;
        this.mVerticalEdge = edge2;
    }

    private float getAspectRatio(float f, float f2) {
        float coordinate = this.mVerticalEdge == Edge.LEFT ? f : Edge.LEFT.getCoordinate();
        float coordinate2 = this.mHorizontalEdge == Edge.TOP ? f2 : Edge.TOP.getCoordinate();
        if (this.mVerticalEdge != Edge.RIGHT) {
            f = Edge.RIGHT.getCoordinate();
        }
        if (this.mHorizontalEdge != Edge.BOTTOM) {
            f2 = Edge.BOTTOM.getCoordinate();
        }
        return AspectRatioUtil.calculateAspectRatio(coordinate, coordinate2, f, f2);
    }

    /* access modifiers changed from: 0000 */
    public EdgePair getActiveEdges() {
        return this.mActiveEdges;
    }

    /* access modifiers changed from: 0000 */
    public EdgePair getActiveEdges(float f, float f2, float f3) {
        if (getAspectRatio(f, f2) > f3) {
            this.mActiveEdges.primary = this.mVerticalEdge;
            this.mActiveEdges.secondary = this.mHorizontalEdge;
        } else {
            this.mActiveEdges.primary = this.mHorizontalEdge;
            this.mActiveEdges.secondary = this.mVerticalEdge;
        }
        return this.mActiveEdges;
    }

    /* access modifiers changed from: 0000 */
    public abstract void updateCropWindow(float f, float f2, float f3, RectF rectF, float f4);

    /* access modifiers changed from: 0000 */
    public void updateCropWindow(float f, float f2, RectF rectF, float f3) {
        EdgePair activeEdges = getActiveEdges();
        Edge edge = activeEdges.primary;
        Edge edge2 = activeEdges.secondary;
        if (edge != null) {
            edge.adjustCoordinate(f, f2, rectF, f3, 1.0f);
        }
        if (edge2 != null) {
            edge2.adjustCoordinate(f, f2, rectF, f3, 1.0f);
        }
    }
}
