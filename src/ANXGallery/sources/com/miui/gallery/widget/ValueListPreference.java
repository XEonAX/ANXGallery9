package com.miui.gallery.widget;

import android.content.Context;
import android.preference.ListPreference;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.miui.gallery.R;

public class ValueListPreference extends ListPreference {
    private int mShowWhichAsValue = 0;

    public ValueListPreference(Context context) {
        super(context);
    }

    public ValueListPreference(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    private CharSequence getRealValue() {
        switch (this.mShowWhichAsValue) {
            case 0:
                return getEntry();
            case 1:
                return getValue();
            default:
                return null;
        }
    }

    /* access modifiers changed from: protected */
    public void onBindView(View view) {
        super.onBindView(view);
        TextView textView = (TextView) view.findViewById(R.id.value_right);
        if (textView != null) {
            CharSequence realValue = getRealValue();
            if (!TextUtils.isEmpty(realValue)) {
                textView.setText(String.valueOf(realValue));
                textView.setVisibility(0);
                return;
            }
            textView.setVisibility(8);
        }
    }

    /* access modifiers changed from: protected */
    public View onCreateView(ViewGroup viewGroup) {
        return LayoutInflater.from(getContext()).inflate(R.layout.preference_value_list, viewGroup, false);
    }

    public void setWhichAsValue(int i) {
        this.mShowWhichAsValue = i;
        notifyChanged();
    }
}
