package com.miui.gallery.collage.app.stitching;

import android.content.Context;
import android.content.res.Resources;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import android.widget.ImageView;
import com.miui.gallery.R;
import com.miui.gallery.collage.core.stitching.StitchingModel;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme;
import java.io.File;
import java.util.Locale;

class StitchingHolder extends ViewHolder {
    private ImageView mImageView = ((ImageView) this.itemView.findViewById(R.id.collage_item_icon));

    StitchingHolder(ViewGroup viewGroup, Context context) {
        super(LayoutInflater.from(context).inflate(R.layout.poster_icon_item, viewGroup, false));
    }

    /* access modifiers changed from: 0000 */
    public void setStitchingModel(Resources resources, StitchingModel stitchingModel, int i) {
        ImageLoader.getInstance().displayImage(Scheme.ASSETS.wrap(String.format(Locale.US, "%s%s%s%s", new Object[]{stitchingModel.relativePath, File.separator, MovieStatUtils.PAGER_PREVIEW, ".png"})), this.mImageView);
        this.mImageView.setContentDescription(this.mImageView.getResources().getString(R.string.photo_editor_talkback_effect, new Object[]{Integer.valueOf(i + 1)}));
    }
}
