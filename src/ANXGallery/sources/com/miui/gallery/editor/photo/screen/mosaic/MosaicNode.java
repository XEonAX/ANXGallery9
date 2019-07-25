package com.miui.gallery.editor.photo.screen.mosaic;

import android.graphics.PointF;
import android.graphics.Shader;
import com.miui.gallery.editor.photo.core.common.model.BaseDrawNode;

public abstract class MosaicNode extends BaseDrawNode {
    protected PointF mEndPoint = new PointF();
    private boolean mIsInit = false;
    protected PointF mStartPoint = new PointF();

    public MosaicNode() {
        init();
    }

    /* access modifiers changed from: protected */
    public abstract void init();

    /* access modifiers changed from: protected */
    public abstract void onReceivePosition(float f, float f2, boolean z);

    public void receivePosition(float f, float f2) {
        if (!this.mIsInit) {
            this.mStartPoint.set(f, f2);
            this.mIsInit = true;
            onReceivePosition(f, f2, true);
            return;
        }
        this.mEndPoint.set(f, f2);
        onReceivePosition(f, f2, false);
    }

    public abstract void setPaintSize(float f);

    public abstract void setShader(Shader shader);
}
