package com.miui.gallery.editor.photo.app.remover;

import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.common.model.RemoverData;

class RemoverItemHolder extends ViewHolder {
    private ImageView mIconView;
    private TextView mLabelView;

    public RemoverItemHolder(View view) {
        super(view);
        this.mLabelView = (TextView) view.findViewById(R.id.labelView);
        this.mIconView = (ImageView) view.findViewById(R.id.iconView);
    }

    /* access modifiers changed from: 0000 */
    public void bind(RemoverData removerData) {
        this.mIconView.setImageResource(removerData.mIcon);
        this.mLabelView.setText(removerData.name);
    }
}
