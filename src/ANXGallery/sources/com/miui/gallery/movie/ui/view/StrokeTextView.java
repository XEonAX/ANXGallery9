package com.miui.gallery.movie.ui.view;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint.Style;
import android.text.TextPaint;
import android.util.AttributeSet;
import android.view.ViewGroup.LayoutParams;
import android.widget.TextView;
import com.miui.gallery.R;

public class StrokeTextView extends TextView {
    private TextView mOutlineTextView = null;

    public StrokeTextView(Context context) {
        super(context);
        this.mOutlineTextView = new TextView(context);
        init();
    }

    public StrokeTextView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mOutlineTextView = new TextView(context, attributeSet);
        init();
    }

    public StrokeTextView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mOutlineTextView = new TextView(context, attributeSet, i);
        init();
    }

    public void init() {
        TextPaint paint = this.mOutlineTextView.getPaint();
        paint.setStrokeWidth(2.0f);
        paint.setStyle(Style.STROKE);
        this.mOutlineTextView.setTextColor(getResources().getColor(R.color.movie_time_shader));
        this.mOutlineTextView.setGravity(getGravity());
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        this.mOutlineTextView.draw(canvas);
        super.onDraw(canvas);
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        super.onLayout(z, i, i2, i3, i4);
        this.mOutlineTextView.layout(i, i2, i3, i4);
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        super.onMeasure(i, i2);
        CharSequence text = this.mOutlineTextView.getText();
        if (text == null || !text.equals(getText())) {
            this.mOutlineTextView.setText(getText());
        }
        this.mOutlineTextView.measure(i, i2);
    }

    public void setLayoutParams(LayoutParams layoutParams) {
        super.setLayoutParams(layoutParams);
        this.mOutlineTextView.setLayoutParams(layoutParams);
    }
}
