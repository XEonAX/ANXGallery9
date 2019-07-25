package com.miui.gallery.editor.photo.app.crop;

import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.View;
import android.widget.ImageView;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.common.model.CropData;

class ItemHolder extends ViewHolder {
    private ImageView mView;

    ItemHolder(View view) {
        super(view);
        this.mView = (ImageView) view.findViewById(R.id.icon);
    }

    /* access modifiers changed from: 0000 */
    public void bind(CropData cropData) {
        this.mView.setImageResource(cropData.icon);
        this.mView.setContentDescription(this.mView.getResources().getString(cropData.talkbackName));
    }
}
