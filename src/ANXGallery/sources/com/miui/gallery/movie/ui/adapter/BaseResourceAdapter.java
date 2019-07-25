package com.miui.gallery.movie.ui.adapter;

import android.content.Context;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.movie.entity.MovieResource;
import com.miui.gallery.movie.ui.adapter.BaseAdapter.BaseHolder;
import com.miui.gallery.movie.utils.ImageLoaderUtils;
import com.miui.gallery.ui.DownloadView;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.imageaware.ImageAware;
import com.nostra13.universalimageloader.core.imageaware.ImageViewAware;

public class BaseResourceAdapter<T extends MovieResource> extends BaseAdapter<T> {
    /* access modifiers changed from: private */
    public int[] mPlaceColors = {R.drawable.movie_image_place_1, R.drawable.movie_image_place_2, R.drawable.movie_image_place_3, R.drawable.movie_image_place_4, R.drawable.movie_image_place_5, R.drawable.movie_image_place_6};

    public class BaseResourceHolder extends BaseHolder {
        public DownloadView mDownloadView;
        protected ImageAware mImageAware = new ImageViewAware(this.mImageView);
        protected ImageView mImageView;
        protected TextView mTitle;

        public BaseResourceHolder(View view) {
            super(view);
            this.mTitle = (TextView) view.findViewById(R.id.item_title);
            this.mImageView = (ImageView) view.findViewById(R.id.item_iv);
            this.mDownloadView = (DownloadView) view.findViewById(R.id.item_download);
        }

        public void bindView(int i) {
            MovieResource movieResource = (MovieResource) BaseResourceAdapter.this.getItemData(i);
            if (movieResource.isPackageAssets) {
                this.mTitle.setText(movieResource.stringId);
                this.mImageView.setImageResource(movieResource.imageId);
                ImageLoader.getInstance().cancelDisplayTask(this.mImageView);
            } else {
                ImageLoader.getInstance().displayImage(movieResource.icon, this.mImageAware, ImageLoaderUtils.getNormalDisplayImageOptionsBuilder().showImageOnLoading(BaseResourceAdapter.this.mPlaceColors[i % BaseResourceAdapter.this.mPlaceColors.length]).build());
                int nameId = movieResource.getNameId();
                if (nameId != 0) {
                    this.mTitle.setText(nameId);
                } else {
                    this.mTitle.setText(movieResource.label);
                }
            }
            int downloadState = movieResource.getDownloadState();
            this.mDownloadView.setStateImage(downloadState);
            if (downloadState == 0) {
                movieResource.downloadState = 17;
            }
        }

        public void bindView(int i, Object obj) {
            super.bindView(i, obj);
            MovieResource movieResource = (MovieResource) BaseResourceAdapter.this.getItemData(i);
            int downloadState = movieResource.getDownloadState();
            this.mDownloadView.setStateImage(downloadState);
            if (downloadState == 0) {
                this.mDownloadView.postDelayed(new Runnable() {
                    public final void run() {
                        MovieResource.this.downloadState = 17;
                    }
                }, 1000);
            }
        }
    }

    public BaseResourceAdapter(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public BaseResourceHolder getHolder(View view) {
        return new BaseResourceHolder<>(view);
    }

    /* access modifiers changed from: protected */
    public int getLayoutId() {
        return R.layout.movie_layout_template_item;
    }
}
