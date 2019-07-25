package com.miui.gallery.collage.core.poster;

public class CollagePositionModel {
    public boolean ignoreEdgeMargin;
    public float margin;
    public String[] masks;
    public float[] position;
    public float[] radius;
    public String relativePath;
    public int size;

    public static CollagePositionModel getCollagePositionModelByImageSize(CollagePositionModel[] collagePositionModelArr, int i) {
        for (CollagePositionModel collagePositionModel : collagePositionModelArr) {
            if (collagePositionModel.size == 0 || collagePositionModel.size == i) {
                return collagePositionModel;
            }
        }
        return collagePositionModelArr[0];
    }
}
