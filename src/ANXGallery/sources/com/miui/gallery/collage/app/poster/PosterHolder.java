package com.miui.gallery.collage.app.poster;

import android.content.Context;
import android.content.res.Resources;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import android.widget.ImageView;
import com.miui.gallery.R;
import com.miui.gallery.collage.core.poster.PosterModel;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme;
import java.io.File;
import java.util.Locale;

class PosterHolder extends ViewHolder {
    private ImageView mImageView = ((ImageView) this.itemView.findViewById(R.id.collage_item_icon));

    PosterHolder(ViewGroup viewGroup, Context context) {
        super(LayoutInflater.from(context).inflate(R.layout.poster_icon_item, viewGroup, false));
    }

    /* access modifiers changed from: 0000 */
    public void setPosterModel(Resources resources, PosterModel posterModel, int i, int i2) {
        ImageLoader.getInstance().displayImage(Scheme.ASSETS.wrap(String.format(Locale.US, "%s%s%s%d%s", new Object[]{posterModel.relativePath, File.separator, "preview_", Integer.valueOf(i), ".png"})), this.mImageView);
        this.mImageView.setContentDescription(this.mImageView.getResources().getString(R.string.photo_editor_talkback_effect, new Object[]{Integer.valueOf(i2 + 1)}));
    }
}
