package com.miui.gallery.collage.app.layout;

import android.content.Context;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import android.widget.ImageView;
import com.miui.gallery.R;
import com.miui.gallery.collage.core.layout.LayoutModel;

class LayoutHolder extends ViewHolder {
    private ImageView mImageView = ((ImageView) this.itemView.findViewById(R.id.collage_item_icon));
    private LayoutPreviewDrawable mLayoutPreviewDrawable;

    LayoutHolder(ViewGroup viewGroup, Context context) {
        super(LayoutInflater.from(context).inflate(R.layout.layout_icon_item, viewGroup, false));
        this.mLayoutPreviewDrawable = new LayoutPreviewDrawable(context.getResources());
    }

    /* access modifiers changed from: 0000 */
    public void setLayoutModel(LayoutModel layoutModel, int i) {
        this.mLayoutPreviewDrawable.setLayoutModel(layoutModel);
        this.mImageView.setImageDrawable(this.mLayoutPreviewDrawable);
        this.mImageView.setContentDescription(this.mImageView.getResources().getString(R.string.photo_editor_talkback_effect, new Object[]{Integer.valueOf(i + 1)}));
    }
}
