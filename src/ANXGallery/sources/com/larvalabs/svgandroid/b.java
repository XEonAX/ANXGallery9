package com.larvalabs.svgandroid;

import android.graphics.Picture;
import android.graphics.RectF;
import android.graphics.drawable.PictureDrawable;
import com.nexstreaming.app.common.drawable.a;
import java.util.Set;

/* compiled from: SVG */
public class b {
    private final Set<Integer> a;
    private Picture b;
    private RectF c;
    private RectF d = null;

    b(Picture picture, RectF rectF, Set<Integer> set) {
        this.b = picture;
        this.c = rectF;
        this.a = set;
    }

    public PictureDrawable a() {
        return new a(this.b);
    }

    /* access modifiers changed from: 0000 */
    public void a(RectF rectF) {
        this.d = rectF;
    }

    public Picture b() {
        return this.b;
    }
}
