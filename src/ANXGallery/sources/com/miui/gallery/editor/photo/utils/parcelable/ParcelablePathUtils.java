package com.miui.gallery.editor.photo.utils.parcelable;

import android.graphics.Path;
import android.graphics.PointF;
import java.util.List;

public class ParcelablePathUtils {
    public static Path getPathFromPointList(List<PointF> list) {
        Path path = new Path();
        PointF pointF = null;
        for (PointF pointF2 : list) {
            float f = pointF2.x;
            float f2 = pointF2.y;
            if (pointF == null) {
                path.moveTo(f, f2);
            } else {
                path.quadTo(pointF.x, pointF.y, (pointF.x + f) / 2.0f, (pointF.y + f2) / 2.0f);
            }
            pointF = pointF2;
        }
        return path;
    }
}
