package com.edmodo.cropper.cropwindow.handle;

import android.graphics.RectF;
import com.edmodo.cropper.cropwindow.edge.Edge;

public enum Handle {
    TOP_LEFT(new CornerHandleHelper(Edge.TOP, Edge.LEFT)),
    TOP_RIGHT(new CornerHandleHelper(Edge.TOP, Edge.RIGHT)),
    BOTTOM_LEFT(new CornerHandleHelper(Edge.BOTTOM, Edge.LEFT)),
    BOTTOM_RIGHT(new CornerHandleHelper(Edge.BOTTOM, Edge.RIGHT)),
    LEFT(new VerticalHandleHelper(Edge.LEFT)),
    TOP(new HorizontalHandleHelper(Edge.TOP)),
    RIGHT(new VerticalHandleHelper(Edge.RIGHT)),
    BOTTOM(new HorizontalHandleHelper(Edge.BOTTOM)),
    CENTER(new CenterHandleHelper());
    
    private HandleHelper mHelper;

    private Handle(HandleHelper handleHelper) {
        this.mHelper = handleHelper;
    }

    public void updateCropWindow(float f, float f2, float f3, RectF rectF, float f4) {
        this.mHelper.updateCropWindow(f, f2, f3, rectF, f4);
    }

    public void updateCropWindow(float f, float f2, RectF rectF, float f3) {
        this.mHelper.updateCropWindow(f, f2, rectF, f3);
    }
}
