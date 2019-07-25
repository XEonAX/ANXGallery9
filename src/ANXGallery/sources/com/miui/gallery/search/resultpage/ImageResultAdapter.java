package com.miui.gallery.search.resultpage;

import android.content.Context;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.util.GalleryDateUtils;
import com.tonicartos.widget.stickygridheaders.StickyGridHeadersBaseAdapter;

public class ImageResultAdapter extends ImageResultSimpleAdapter implements StickyGridHeadersBaseAdapter {
    /* access modifiers changed from: private */
    public OnHeaderItemClickedListener mHeaderClickListener;

    public interface OnHeaderItemClickedListener {
        void onHeaderItemClicked(int i);
    }

    public ImageResultAdapter(Context context) {
        super(context);
    }

    public int getCountForHeader(int i) {
        if (getResultCursor() == null) {
            return 0;
        }
        return getResultCursor().getChildrenCount(i);
    }

    public View getDividerView(int i, View view, ViewGroup viewGroup) {
        return null;
    }

    public int getGroupCreateDate(int i) {
        return getResultCursor().getGroupCreateDate(i);
    }

    public long getGroupCreateTime(int i) {
        return getResultCursor().getGroupCreateTime(i);
    }

    public String getGroupRankValue(int i) {
        String groupRankValue = getResultCursor().getGroupRankValue(i);
        return (!TextUtils.isEmpty(groupRankValue) || getGroupCreateTime(i) <= 0) ? groupRankValue : GalleryDateUtils.formatRelativeDate(getGroupCreateTime(i));
    }

    public String getGroupTitle(int i) {
        return getResultCursor().getGroupTitle(i);
    }

    public View getHeaderView(final int i, View view, ViewGroup viewGroup) {
        if (view == null) {
            view = LayoutInflater.from(this.mContext).inflate(R.layout.search_image_result_header_item, viewGroup, false);
        }
        ((ImageResultHeaderItem) view).bindData(getGroupRankValue(i), getGroupTitle(i), getGroupCreateTime(i) >= 0, R.drawable.arrow_right, new OnClickListener() {
            public void onClick(View view) {
                if (ImageResultAdapter.this.mHeaderClickListener != null) {
                    ImageResultAdapter.this.mHeaderClickListener.onHeaderItemClicked(i);
                }
            }
        });
        return view;
    }

    public int getNumHeaders() {
        if (getResultCursor() == null) {
            return 0;
        }
        return getResultCursor().getGroupCount();
    }

    public void setHeaderClickListener(OnHeaderItemClickedListener onHeaderItemClickedListener) {
        this.mHeaderClickListener = onHeaderItemClickedListener;
    }

    public boolean shouldDrawDivider() {
        return false;
    }
}
