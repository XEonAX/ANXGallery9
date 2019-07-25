package com.miui.gallery.editor.photo.screen.doodle;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.View;
import com.miui.gallery.editor.photo.app.doodle.DoodlePaintItem;
import com.miui.gallery.editor.photo.app.doodle.DoodlePaintItem.PaintType;
import java.util.List;

public class ScreenDoodlePaintView extends View {
    private Rect mBasePaintRect = new Rect();
    private int mCurrentPaintIndex = 1;
    private List<DoodlePaintItem> mDoodlePaintItemList;

    public ScreenDoodlePaintView(Context context) {
        super(context);
        init();
    }

    public ScreenDoodlePaintView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init();
    }

    public ScreenDoodlePaintView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init();
    }

    private void init() {
        this.mDoodlePaintItemList = DoodlePaintItem.getList(getResources());
    }

    private void setPaintLocation(int i, int i2) {
        this.mBasePaintRect.set(0, 0, i, i2);
        for (int i3 = 0; i3 < this.mDoodlePaintItemList.size(); i3++) {
            DoodlePaintItem doodlePaintItem = (DoodlePaintItem) this.mDoodlePaintItemList.get(i3);
            doodlePaintItem.setBounds(this.mBasePaintRect);
            doodlePaintItem.setSelect(true);
            doodlePaintItem.setBigSize((int) (((float) i) - getResources().getDisplayMetrics().density));
        }
    }

    public PaintType getPaintType() {
        return ((DoodlePaintItem) this.mDoodlePaintItemList.get(this.mCurrentPaintIndex)).paintType;
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        ((DoodlePaintItem) this.mDoodlePaintItemList.get(this.mCurrentPaintIndex)).draw(canvas);
    }

    /* access modifiers changed from: protected */
    public void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        setPaintLocation(i, i2);
    }

    public void setPaintColor(int i) {
        for (int i2 = 0; i2 < this.mDoodlePaintItemList.size(); i2++) {
            ((DoodlePaintItem) this.mDoodlePaintItemList.get(i2)).setCurrentColor(i);
        }
    }

    public void setPaintType(PaintType paintType) {
        if (paintType != null) {
            switch (paintType) {
                case HEAVY:
                    this.mCurrentPaintIndex++;
                    this.mCurrentPaintIndex %= this.mDoodlePaintItemList.size();
                    break;
                case LIGHT:
                    this.mCurrentPaintIndex += 2;
                    this.mCurrentPaintIndex %= this.mDoodlePaintItemList.size();
                    break;
            }
        }
    }

    public void transSize() {
        this.mCurrentPaintIndex = (this.mCurrentPaintIndex + 1) % this.mDoodlePaintItemList.size();
        invalidate();
    }
}
