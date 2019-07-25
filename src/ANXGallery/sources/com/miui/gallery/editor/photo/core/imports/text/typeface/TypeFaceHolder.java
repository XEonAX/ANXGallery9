package com.miui.gallery.editor.photo.core.imports.text.typeface;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.ui.SingleChoiceRecyclerView.SingleChoiceRecyclerViewAdapter.SingleChoiceViewHolder;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.assist.FailReason;
import com.nostra13.universalimageloader.core.assist.ImageScaleType;
import com.nostra13.universalimageloader.core.imageaware.ImageAware;
import com.nostra13.universalimageloader.core.imageaware.ImageViewAware;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;

class TypeFaceHolder extends SingleChoiceViewHolder {
    private static DisplayImageOptions sDisplayImageOptions = new Builder().considerExifParams(true).resetViewBeforeLoading(false).imageScaleType(ImageScaleType.IN_SAMPLE_INT).cacheInMemory(true).cacheOnDisk(true).cacheBigPhoto(false).bitmapConfig(Config.ARGB_8888).build();
    private DownloadView mDownloadView;
    private ImageAware mImageAware = new ImageViewAware(this.mNameImage);
    private ImageLoadingProcess mImageLoadingProcess;
    private ImageView mIvCheck;
    private ImageView mNameImage;
    private TextView mNameText;
    private int mSelectedColor;

    static class ImageLoadingProcess implements ImageLoadingListener {
        private DownloadView mDownloadView;
        private TextStyle mTextStyle;

        public ImageLoadingProcess(TextStyle textStyle, DownloadView downloadView) {
            this.mTextStyle = textStyle;
            this.mDownloadView = downloadView;
        }

        public void onLoadingCancelled(String str, View view) {
        }

        public void onLoadingComplete(String str, View view, Bitmap bitmap) {
            if (this.mTextStyle.isLocal()) {
                this.mDownloadView.setVisibility(8);
            } else if (this.mTextStyle.isExtra()) {
                ((ImageView) view).setImageBitmap(bitmap);
                this.mDownloadView.setStateImage(this.mTextStyle.getState());
                this.mDownloadView.setText(this.mTextStyle.getFontSize());
            }
        }

        public void onLoadingFailed(String str, View view, FailReason failReason) {
            this.mDownloadView.setVisibility(8);
        }

        public void onLoadingStarted(String str, View view) {
        }
    }

    public TypeFaceHolder(View view) {
        super(view);
        this.mNameText = (TextView) view.findViewById(R.id.tv_font_item_name);
        this.mNameImage = (ImageView) view.findViewById(R.id.iv_font_item_name);
        this.mDownloadView = (DownloadView) view.findViewById(R.id.download_view);
        this.mIvCheck = (ImageView) view.findViewById(R.id.font_item_check);
        this.mSelectedColor = view.getResources().getColor(R.color.text_edit_dialog_tab_menu_text_color_pressed);
    }

    public void bind(TextStyle textStyle, boolean z) {
        int i = 0;
        if (textStyle.isLocal()) {
            this.mNameText.setText(textStyle.getDefaultNameResId());
            this.mNameImage.setVisibility(8);
            this.mNameText.setVisibility(0);
            this.mDownloadView.setVisibility(8);
            this.mNameText.setSelected(z);
            this.mIvCheck.setSelected(z);
            return;
        }
        this.mNameImage.setVisibility(0);
        this.mNameText.setVisibility(8);
        if (this.mImageLoadingProcess == null) {
            this.mImageLoadingProcess = new ImageLoadingProcess(textStyle, this.mDownloadView);
        }
        ImageLoader.getInstance().displayImage(textStyle.getIconUrl(), this.mImageAware, sDisplayImageOptions, (ImageLoadingListener) this.mImageLoadingProcess);
        ImageView imageView = this.mNameImage;
        if (z) {
            i = this.mSelectedColor;
        }
        imageView.setColorFilter(i);
        this.mIvCheck.setSelected(z);
    }

    public void setSelect(boolean z) {
    }
}
