package com.miui.gallery.video.editor.adapter;

import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.ui.SimpleRecyclerView.Adapter;
import com.miui.gallery.video.editor.model.MenuFragmentData;
import java.util.List;

public class VideoNavAdapter extends Adapter<VideoNavHolder> {
    private List<MenuFragmentData> mNavigatorData;

    public VideoNavAdapter(List<MenuFragmentData> list) {
        this.mNavigatorData = list;
    }

    public int getItemCount() {
        return this.mNavigatorData.size();
    }

    public void onBindViewHolder(VideoNavHolder videoNavHolder, int i) {
        super.onBindViewHolder(videoNavHolder, i);
        videoNavHolder.bind((MenuFragmentData) this.mNavigatorData.get(i));
    }

    public VideoNavHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        return new VideoNavHolder(getInflater().inflate(R.layout.common_editor_navigator_item, viewGroup, false));
    }
}
