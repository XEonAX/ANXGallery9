package com.miui.gallery.video.editor.adapter;

import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.video.editor.model.MenuFragmentData;

public class VideoNavHolder extends ViewHolder {
    private ImageView mImageView;
    private TextView mView;

    public VideoNavHolder(View view) {
        super(view);
        this.mView = (TextView) view.findViewById(R.id.label);
        this.mImageView = (ImageView) view.findViewById(R.id.img_nav);
    }

    /* access modifiers changed from: 0000 */
    public void bind(MenuFragmentData menuFragmentData) {
        this.mView.setText(menuFragmentData.nameId);
        this.mImageView.setImageResource(menuFragmentData.iconId);
    }
}
