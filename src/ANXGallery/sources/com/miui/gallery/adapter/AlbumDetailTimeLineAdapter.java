package com.miui.gallery.adapter;

import android.content.Context;
import android.database.Cursor;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.adapter.SyncStateDisplay.DisplayScene;
import com.miui.gallery.ui.AlbumDetailGridHeaderItem;
import com.miui.gallery.util.GalleryDateUtils;
import com.miui.gallery.util.MiscUtil;
import com.tonicartos.widget.stickygridheaders.StickyGridHeadersBaseAdapter;

public class AlbumDetailTimeLineAdapter extends AlbumDetailSimpleAdapter implements StickyGridHeadersBaseAdapter {
    public AlbumDetailTimeLineAdapter(Context context) {
        super(context);
    }

    public AlbumDetailTimeLineAdapter(Context context, DisplayScene displayScene) {
        super(context, displayScene);
    }

    public int getCountForHeader(int i) {
        if (MiscUtil.isValid(this.mGroupItemCount)) {
            return ((Integer) this.mGroupItemCount.get(i)).intValue();
        }
        return 0;
    }

    public View getDividerView(int i, View view, ViewGroup viewGroup) {
        return null;
    }

    public View getHeaderView(int i, View view, ViewGroup viewGroup) {
        if (view == null) {
            view = LayoutInflater.from(this.mContext).inflate(R.layout.album_detail_grid_header_item, viewGroup, false);
        }
        String str = null;
        if (MiscUtil.isValid(this.mGroupStartLocations) && MiscUtil.isValid(this.mGroupStartPos)) {
            str = (String) this.mGroupStartLocations.get(i);
            i = ((Integer) this.mGroupStartPos.get(i)).intValue();
        }
        ((AlbumDetailGridHeaderItem) view).bindData(GalleryDateUtils.formatRelativeDate(((Cursor) getItem(i)).getLong(17)), str);
        return view;
    }

    public int getNumHeaders() {
        if (MiscUtil.isValid(this.mGroupItemCount)) {
            return this.mGroupItemCount.size();
        }
        return 0;
    }

    public boolean shouldDrawDivider() {
        return false;
    }
}
