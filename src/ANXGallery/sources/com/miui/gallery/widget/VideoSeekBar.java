package com.miui.gallery.widget;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.NinePatchDrawable;
import android.util.AttributeSet;
import android.widget.SeekBar;

public class VideoSeekBar extends SeekBar {
    public VideoSeekBar(Context context) {
        super(context);
    }

    public VideoSeekBar(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public VideoSeekBar(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    public void setProgressDrawable(Drawable drawable) {
        boolean z;
        Drawable drawable2;
        if (drawable instanceof LayerDrawable) {
            LayerDrawable layerDrawable = (LayerDrawable) drawable;
            int numberOfLayers = layerDrawable.getNumberOfLayers();
            Drawable[] drawableArr = new Drawable[numberOfLayers];
            int i = 0;
            boolean z2 = false;
            while (i < numberOfLayers) {
                int id = layerDrawable.getId(i);
                Drawable drawable3 = layerDrawable.getDrawable(i);
                if ((id == 16908301 || id == 16908303) && (drawable3 instanceof NinePatchDrawable)) {
                    drawable2 = new LevelNinePathDrawable((NinePatchDrawable) drawable3);
                    z = true;
                } else {
                    z = z2;
                    drawable2 = drawable3;
                }
                drawableArr[i] = drawable2;
                i++;
                z2 = z;
            }
            if (z2) {
                r10 = new LayerDrawable(drawableArr);
                for (int i2 = 0; i2 < numberOfLayers; i2++) {
                    r10.setId(i2, layerDrawable.getId(i2));
                }
                drawable = r10;
            }
        }
        super.setProgressDrawable(drawable);
    }
}
