package com.miui.gallery.video.editor.adapter;

import android.text.TextUtils;
import android.view.View;
import android.widget.ImageView;
import com.miui.gallery.R;
import com.miui.gallery.video.editor.util.ImageLoaderUtils;
import com.miui.gallery.video.editor.util.ToolsUtil;
import com.miui.gallery.video.editor.widget.DownloadView;
import com.miui.gallery.video.editor.widget.SingleChoiceRecyclerView.SingleChoiceRecyclerViewAdapter.SingleChoiceViewHolder;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.imageaware.ImageAware;
import com.nostra13.universalimageloader.core.imageaware.ImageViewAware;

public class WaterMarkHolder extends SingleChoiceViewHolder {
    private static DisplayImageOptions mDisplayImageOptions = ImageLoaderUtils.mVideoEditorDisplayImageOptions;
    private DownloadView mDownloadView;
    private ImageView mIcon;
    private View mSelectBackground;
    private View mSelected;
    private ImageView mTextEditable;

    public WaterMarkHolder(View view) {
        super(view);
        this.mIcon = (ImageView) view.findViewById(R.id.video_editor_text_image);
        this.mDownloadView = (DownloadView) view.findViewById(R.id.item_download);
        this.mSelected = view.findViewById(R.id.selector);
        this.mTextEditable = (ImageView) view.findViewById(R.id.video_editor_edit);
        this.mSelectBackground = view.findViewById(R.id.select_edit_background);
        this.mDownloadView.setBackground(ToolsUtil.isRTLDirection() ? view.getResources().getDrawable(R.drawable.video_editor_icon_watermark_download_start) : view.getResources().getDrawable(R.drawable.video_editor_icon_watermark_download));
    }

    public void setIcon(int i) {
        if (i != 0) {
            this.mIcon.setImageResource(i);
        }
    }

    public void setIcon(String str) {
        if (!TextUtils.isEmpty(str)) {
            ImageLoader.getInstance().displayImage(str, (ImageAware) new ImageViewAware(this.mIcon), mDisplayImageOptions);
        }
    }

    public void setSelect(boolean z) {
    }

    public void setStateImage(int i) {
        this.mDownloadView.setStateImage(i);
    }

    public void updateSelected(boolean z, boolean z2) {
        if (!z || !z2) {
            ToolsUtil.hideView(this.mSelected);
        } else {
            ToolsUtil.showView(this.mSelected);
        }
    }

    public void updateTextEditable(boolean z) {
        if (z) {
            ToolsUtil.showView(this.mTextEditable);
            ToolsUtil.showView(this.mSelectBackground);
            return;
        }
        ToolsUtil.hideView(this.mTextEditable);
        ToolsUtil.hideView(this.mSelectBackground);
    }
}
