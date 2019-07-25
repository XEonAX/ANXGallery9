package com.miui.gallery.adapter;

import com.miui.gallery.R;
import com.miui.gallery.adapter.PhotoPageAdapter.OnPreviewedListener;
import com.miui.gallery.model.ImageLoadParams;
import com.miui.gallery.ui.PhotoPageFragmentBase.PhotoPageInteractionListener;
import com.miui.gallery.ui.PhotoPageItem;
import com.miui.gallery.util.photoview.ItemViewInfo;

public class BurstPhotoPageAdapter extends PhotoPageAdapter {
    public BurstPhotoPageAdapter(int i, ImageLoadParams imageLoadParams, ItemViewInfo itemViewInfo, OnPreviewedListener onPreviewedListener, PhotoPageInteractionListener photoPageInteractionListener) {
        super(i, imageLoadParams, itemViewInfo, onPreviewedListener, photoPageInteractionListener);
    }

    /* access modifiers changed from: protected */
    public int getLayoutId(int i) {
        return R.layout.photo_page_burst_item;
    }

    /* access modifiers changed from: protected */
    public int getViewType(int i) {
        return 4;
    }

    /* access modifiers changed from: protected */
    public int getViewTypeCount() {
        return super.getViewTypeCount() + 1;
    }

    /* access modifiers changed from: protected */
    public boolean isTypeMatch(Object obj, int i) {
        boolean z = false;
        if (!isItemValidate(obj)) {
            return false;
        }
        if (((Integer) ((PhotoPageItem) obj).getTag(R.id.tag_view_type)).intValue() == 4) {
            z = true;
        }
        return z;
    }
}
