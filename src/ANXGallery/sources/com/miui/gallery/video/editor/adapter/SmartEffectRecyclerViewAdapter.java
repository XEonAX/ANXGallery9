package com.miui.gallery.video.editor.adapter;

import android.content.Context;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.util.BuildUtil;
import com.miui.gallery.video.editor.SmartEffect;
import com.miui.gallery.video.editor.widget.SingleChoiceRecyclerView.SingleChoiceRecyclerViewAdapter;
import java.util.List;

public class SmartEffectRecyclerViewAdapter extends SingleChoiceRecyclerViewAdapter<SmartEffectViewHolder> {
    private int mFirstMarginLeft = 0;
    private LayoutInflater mLayoutInflater;
    private List<SmartEffect> smartEffectList;

    public SmartEffectRecyclerViewAdapter(Context context, List<SmartEffect> list) {
        this.mLayoutInflater = LayoutInflater.from(context);
        this.smartEffectList = list;
        this.mFirstMarginLeft = context.getResources().getDimensionPixelSize(R.dimen.video_editor_text_item_margin_left);
    }

    public int getItemCount() {
        if (this.smartEffectList != null) {
            return this.smartEffectList.size();
        }
        return 0;
    }

    public int getItemViewType(int i) {
        return 1;
    }

    public SmartEffect getSmartEffect(int i) {
        if (this.smartEffectList == null || i >= this.smartEffectList.size()) {
            return null;
        }
        return (SmartEffect) this.smartEffectList.get(i);
    }

    public void onBindView(SmartEffectViewHolder smartEffectViewHolder, int i) {
        boolean z = false;
        smartEffectViewHolder.setMarginLeft(i == 0 ? this.mFirstMarginLeft : 0);
        SmartEffect smartEffect = (SmartEffect) this.smartEffectList.get(i);
        if (smartEffect.getNameResId() != 0) {
            smartEffectViewHolder.setName(smartEffect.getNameResId());
        } else if (BuildUtil.isInternational()) {
            smartEffectViewHolder.setName(smartEffect.getEnName());
        } else {
            smartEffectViewHolder.setName(smartEffect.getLabel());
        }
        if (getSelectedItemPosition() == i) {
            z = true;
        }
        smartEffectViewHolder.updateSelected(z, smartEffect.isDownloaded());
        if (TextUtils.isEmpty(smartEffect.getIconUrl())) {
            smartEffectViewHolder.setIcon(smartEffect.getIconResId());
        } else {
            smartEffectViewHolder.setIcon(smartEffect.getIconUrl());
        }
        smartEffectViewHolder.setStateImage(smartEffect.getDownloadState());
    }

    public void onBindViewHolder(SmartEffectViewHolder smartEffectViewHolder, int i, List<Object> list) {
        if (list.isEmpty()) {
            onBindViewHolder(smartEffectViewHolder, i);
            return;
        }
        SmartEffect smartEffect = (SmartEffect) this.smartEffectList.get(i);
        smartEffectViewHolder.setStateImage(smartEffect.getDownloadState());
        smartEffectViewHolder.updateSelected(getSelectedItemPosition() == i, smartEffect.isDownloaded());
        if (smartEffect.isDownloadSuccess()) {
            smartEffect.setDownloadState(17);
        }
    }

    public SmartEffectViewHolder onCreateSingleChoiceViewHolder(ViewGroup viewGroup, int i) {
        return new SmartEffectViewHolder(this.mLayoutInflater.inflate(R.layout.video_editor_smart_effect_download_item, viewGroup, false));
    }
}
