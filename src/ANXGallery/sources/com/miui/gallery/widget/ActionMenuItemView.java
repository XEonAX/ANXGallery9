package com.miui.gallery.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.widget.Button;
import com.miui.gallery.R;

public class ActionMenuItemView extends Button {
    public ActionMenuItemView(Context context) {
        this(context, null, 0);
    }

    public ActionMenuItemView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public ActionMenuItemView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.ActionMenuItemView, i, 0);
        setTitle(obtainStyledAttributes.getText(1));
        setIcon(obtainStyledAttributes.getDrawable(0));
        obtainStyledAttributes.recycle();
    }

    public void setIcon(Drawable drawable) {
        if (getCompoundDrawables()[1] != drawable) {
            setCompoundDrawablesWithIntrinsicBounds(null, drawable, null, null);
        }
    }

    public void setTitle(CharSequence charSequence) {
        setText(charSequence);
    }
}
