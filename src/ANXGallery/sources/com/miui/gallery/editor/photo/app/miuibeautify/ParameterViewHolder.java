package com.miui.gallery.editor.photo.app.miuibeautify;

import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.View;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.imports.miuibeauty.MiuiBeautifyData;

class ParameterViewHolder extends ViewHolder {
    private TextView mTextView;

    public ParameterViewHolder(View view) {
        super(view);
        this.mTextView = (TextView) view.findViewById(R.id.label);
    }

    /* access modifiers changed from: 0000 */
    public void bind(int i, MiuiBeautifyData miuiBeautifyData) {
        this.mTextView.setCompoundDrawablesWithIntrinsicBounds(0, i, 0, 0);
        this.mTextView.setText(miuiBeautifyData.name);
    }
}
