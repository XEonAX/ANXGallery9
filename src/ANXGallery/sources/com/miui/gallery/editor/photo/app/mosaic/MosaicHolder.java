package com.miui.gallery.editor.photo.app.mosaic;

import android.content.Context;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import android.widget.ImageView;
import com.miui.gallery.R;
import com.nostra13.universalimageloader.core.ImageLoader;

class MosaicHolder extends ViewHolder {
    private ImageView mImageView = ((ImageView) this.itemView.findViewById(R.id.img));

    MosaicHolder(Context context, ViewGroup viewGroup) {
        super(LayoutInflater.from(context).inflate(R.layout.mosaic_menu_item, viewGroup, false));
    }

    /* access modifiers changed from: 0000 */
    public void setIconPath(String str, int i) {
        ImageLoader.getInstance().displayImage(str, this.mImageView);
        this.mImageView.setContentDescription(this.mImageView.getResources().getString(R.string.photo_editor_talkback_effect, new Object[]{Integer.valueOf(i + 1)}));
    }
}
