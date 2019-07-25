package com.miui.gallery.picker;

import android.app.Activity;
import android.database.Cursor;
import android.graphics.RectF;
import android.net.Uri;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.model.ImageLoadParams;
import com.miui.gallery.picker.helper.CursorUtils;
import com.miui.gallery.picker.helper.Picker;
import com.miui.gallery.util.IntentUtil;
import com.miui.gallery.util.photoview.ItemViewInfo;
import com.miui.security.CrossUserCompatActivity;
import com.tonicartos.widget.stickygridheaders.StickyGridHeadersGridView;
import java.util.ArrayList;
import java.util.Locale;

public abstract class PickerFragment extends PickerCompatFragment {
    protected Picker mPicker;

    public final void attach(Picker picker) {
        this.mPicker = picker;
    }

    /* access modifiers changed from: protected */
    public long getFileLength(Cursor cursor) {
        return CursorUtils.getFileLength(cursor);
    }

    /* access modifiers changed from: protected */
    public OnItemClickListener getGridViewOnItemClickListener() {
        return new OnItemClickListener() {
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
                Activity activity = PickerFragment.this.getActivity();
                if (activity != null) {
                    if (activity == null || !(activity instanceof CrossUserCompatActivity) || !((CrossUserCompatActivity) activity).isCrossUserPick()) {
                        Cursor cursor = (Cursor) ((StickyGridHeadersGridView) adapterView).getRealAdapter().getItem(i);
                        if (!PickerFragment.this.onPhotoItemClick(cursor)) {
                            ArrayList arrayList = new ArrayList(1);
                            arrayList.add(ItemViewInfo.getImageInfo(view, 0));
                            ImageLoadParams imageLoadParams = new ImageLoadParams(PickerFragment.this.getKey(cursor), PickerFragment.this.getLocalPath(cursor), ThumbConfig.get().sMicroTargetSize, (RectF) null, 0, CursorUtils.getMimeType(cursor), PickerFragment.this.isPreviewFace(), PickerFragment.this.getFileLength(cursor));
                            Uri previewUri = PickerFragment.this.getPreviewUri();
                            String previewSelection = PickerFragment.this.getPreviewSelection(cursor);
                            IntentUtil.gotoPhotoPageFromPicker(activity, previewUri, previewSelection, PickerFragment.this.getPreviewSelectionArgs(cursor), PickerFragment.this.getPreviewOrder(), imageLoadParams, arrayList, !PickerFragment.this.supportFoldBurstItems());
                        }
                    }
                }
            }
        };
    }

    /* access modifiers changed from: protected */
    public long getKey(Cursor cursor) {
        return CursorUtils.getId(cursor);
    }

    /* access modifiers changed from: protected */
    public String getLocalPath(Cursor cursor) {
        return CursorUtils.getMicroPath(cursor);
    }

    public final Picker getPicker() {
        return this.mPicker;
    }

    /* access modifiers changed from: protected */
    public String getPreviewOrder() {
        return null;
    }

    /* access modifiers changed from: protected */
    public String getPreviewSelection(Cursor cursor) {
        return String.format(Locale.US, "_id = %d", new Object[]{Long.valueOf(CursorUtils.getId(cursor))});
    }

    /* access modifiers changed from: protected */
    public String[] getPreviewSelectionArgs(Cursor cursor) {
        return null;
    }

    /* access modifiers changed from: protected */
    public Uri getPreviewUri() {
        return getUri();
    }

    /* access modifiers changed from: protected */
    public abstract Uri getUri();

    /* access modifiers changed from: protected */
    public boolean isPreviewFace() {
        return false;
    }

    /* access modifiers changed from: protected */
    public abstract boolean onPhotoItemClick(Cursor cursor);

    /* access modifiers changed from: protected */
    public abstract boolean supportFoldBurstItems();
}
