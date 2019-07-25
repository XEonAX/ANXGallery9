package com.miui.gallery.editor.photo.app.text;

import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.View;
import android.widget.ImageView;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.common.model.TextData;
import com.nostra13.universalimageloader.core.ImageLoader;

class TextBubbleHolder extends ViewHolder {
    private ImageView mImageView;

    TextBubbleHolder(View view) {
        super(view);
        this.mImageView = (ImageView) view.findViewById(R.id.img);
    }

    public void bind(TextData textData, int i) {
        ImageLoader.getInstance().displayImage(textData.iconPath, this.mImageView);
        this.mImageView.setContentDescription(this.mImageView.getResources().getString(R.string.photo_editor_talkback_effect, new Object[]{Integer.valueOf(i + 1)}));
    }
}
