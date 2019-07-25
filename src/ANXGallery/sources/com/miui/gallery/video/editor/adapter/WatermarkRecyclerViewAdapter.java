package com.miui.gallery.video.editor.adapter;

import android.content.Context;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.video.editor.TextStyle;
import com.miui.gallery.video.editor.widget.SingleChoiceRecyclerView.SingleChoiceRecyclerViewAdapter;
import java.util.List;

public class WatermarkRecyclerViewAdapter extends SingleChoiceRecyclerViewAdapter<WaterMarkHolder> {
    private LayoutInflater mLayoutInflater;
    private List<TextStyle> mTextStyles;

    public WatermarkRecyclerViewAdapter(Context context, List<TextStyle> list) {
        this.mLayoutInflater = LayoutInflater.from(context);
        this.mTextStyles = list;
    }

    public int getItemCount() {
        if (this.mTextStyles != null) {
            return this.mTextStyles.size();
        }
        return 0;
    }

    public int getItemViewType(int i) {
        return 0;
    }

    public TextStyle getTextStyle(int i) {
        if (this.mTextStyles == null || i >= this.mTextStyles.size()) {
            return null;
        }
        return (TextStyle) this.mTextStyles.get(i);
    }

    public void onBindView(WaterMarkHolder waterMarkHolder, int i) {
        TextStyle textStyle = (TextStyle) this.mTextStyles.get(i);
        boolean z = false;
        waterMarkHolder.updateSelected(getSelectedItemPosition() == i, textStyle.isDownloaded());
        if (TextUtils.isEmpty(textStyle.getIconUrl())) {
            waterMarkHolder.setIcon(textStyle.getIconResId());
        } else {
            waterMarkHolder.setIcon(textStyle.getIconUrl());
        }
        if (textStyle.isLocal() && getSelectedItemPosition() == i) {
            z = true;
        }
        waterMarkHolder.updateTextEditable(z);
        waterMarkHolder.setStateImage(textStyle.getDownloadState());
    }

    public void onBindViewHolder(WaterMarkHolder waterMarkHolder, int i, List<Object> list) {
        if (list.isEmpty()) {
            onBindViewHolder(waterMarkHolder, i);
            return;
        }
        TextStyle textStyle = (TextStyle) this.mTextStyles.get(i);
        boolean z = true;
        waterMarkHolder.updateTextEditable(textStyle.isLocal() && getSelectedItemPosition() == i);
        if (getSelectedItemPosition() != i) {
            z = false;
        }
        waterMarkHolder.updateSelected(z, textStyle.isDownloaded());
        waterMarkHolder.setStateImage(textStyle.getDownloadState());
        if (textStyle.isDownloadSuccess()) {
            textStyle.setDownloadState(17);
        }
    }

    public WaterMarkHolder onCreateSingleChoiceViewHolder(ViewGroup viewGroup, int i) {
        return new WaterMarkHolder(this.mLayoutInflater.inflate(R.layout.video_editor_text_download_item, viewGroup, false));
    }
}
