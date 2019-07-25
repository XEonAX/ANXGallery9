package com.miui.gallery.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.widget.TextView;
import com.miui.gallery.R;

public class EndTopCornerTextView extends TextView {
    private int mCornerMargin;
    private Paint mCornerPaint;
    private CharSequence mCornerText;
    private Rect mTemp1;
    private Rect mTemp2;

    public EndTopCornerTextView(Context context) {
        this(context, null);
    }

    public EndTopCornerTextView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public EndTopCornerTextView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mTemp1 = new Rect();
        this.mTemp2 = new Rect();
        init(context, attributeSet, i);
    }

    private void init(Context context, AttributeSet attributeSet, int i) {
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.EndTopCornerTextView, i, 0);
        this.mCornerPaint = new Paint();
        this.mCornerPaint.setAntiAlias(true);
        this.mCornerPaint.setColor(obtainStyledAttributes.getColor(2, getCurrentTextColor()));
        this.mCornerPaint.setTextSize((float) obtainStyledAttributes.getDimensionPixelSize(3, (int) (getTextSize() / 2.0f)));
        this.mCornerMargin = obtainStyledAttributes.getDimensionPixelSize(0, 0);
        setCornerText(obtainStyledAttributes.getText(1));
        obtainStyledAttributes.recycle();
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        CharSequence text = getText();
        if (!TextUtils.isEmpty(text) && !TextUtils.isEmpty(this.mCornerText)) {
            getPaint().getTextBounds(text.toString(), 0, text.length(), this.mTemp1);
            this.mCornerPaint.getTextBounds(this.mCornerText.toString(), 0, this.mCornerText.length(), this.mTemp2);
            if (getLayoutDirection() == 0) {
                canvas.drawText(this.mCornerText.toString(), (float) (getPaddingLeft() + this.mTemp1.width() + this.mCornerMargin), (float) (getPaddingTop() + getBaseline() + this.mTemp1.top + this.mTemp2.height()), this.mCornerPaint);
            } else {
                canvas.drawText(this.mCornerText.toString(), (float) ((getPaddingLeft() - this.mCornerMargin) - this.mTemp2.width()), (float) (getPaddingTop() + getBaseline() + this.mTemp1.top + this.mTemp2.height()), this.mCornerPaint);
            }
        }
    }

    public void setCornerText(CharSequence charSequence) {
        this.mCornerText = charSequence;
        if (!TextUtils.isEmpty(this.mCornerText)) {
            int max = Math.max(getPaddingEnd(), Math.round(this.mCornerPaint.measureText(this.mCornerText.toString())) + this.mCornerMargin);
            setPadding(max, getPaddingTop(), max, getPaddingBottom());
        }
        invalidate();
    }
}
