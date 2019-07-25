package com.miui.gallery.video.editor.adapter;

import android.content.Context;
import android.text.TextUtils;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.video.editor.util.ImageLoaderUtils;
import com.miui.gallery.video.editor.util.ToolsUtil;
import com.miui.gallery.video.editor.widget.DownloadView;
import com.miui.gallery.video.editor.widget.SingleChoiceRecyclerView.SingleChoiceRecyclerViewAdapter.SingleChoiceViewHolder;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.imageaware.ImageAware;
import com.nostra13.universalimageloader.core.imageaware.ImageViewAware;

public class SmartEffectViewHolder extends SingleChoiceViewHolder {
    private static DisplayImageOptions mDisplayImageOptions = ImageLoaderUtils.mVideoEditorDisplayImageOptions;
    private Context mContext;
    private DownloadView mDownloadView;
    private ImageView mIcon;
    private TextView mNameTextView;
    private View mSelected;

    public SmartEffectViewHolder(View view) {
        super(view);
        this.mNameTextView = (TextView) view.findViewById(R.id.item_title);
        this.mIcon = (ImageView) view.findViewById(R.id.item_iv);
        this.mDownloadView = (DownloadView) view.findViewById(R.id.item_download);
        this.mSelected = view.findViewById(R.id.iv_selected);
        this.mContext = view.getContext();
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

    public void setName(int i) {
        if (i != 0) {
            this.mNameTextView.setText(i);
        }
    }

    public void setName(String str) {
        this.mNameTextView.setText(str);
    }

    public void setSelect(boolean z) {
        this.mSelected.setVisibility(z ? 0 : 4);
    }

    public void setStateImage(int i) {
        this.mDownloadView.setStateImage(i);
    }

    public void updateSelected(boolean z, boolean z2) {
        if (!z || !z2) {
            ToolsUtil.hideView(this.mSelected);
            this.mNameTextView.setTextColor(this.mContext.getResources().getColor(R.color.video_editor_item_title_normal));
        } else {
            ToolsUtil.showView(this.mSelected);
            this.mNameTextView.setTextColor(this.mContext.getResources().getColor(R.color.video_editor_tab_selected));
        }
        this.mNameTextView.setSelected(z);
    }
}
