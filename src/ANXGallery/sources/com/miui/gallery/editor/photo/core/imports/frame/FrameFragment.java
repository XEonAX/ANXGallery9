package com.miui.gallery.editor.photo.core.imports.frame;

import android.graphics.Bitmap;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.RenderData;
import com.miui.gallery.editor.photo.core.common.fragment.AbstractFrameFragment;
import java.util.ArrayList;
import java.util.List;

public class FrameFragment extends AbstractFrameFragment {
    private FrameEditorView mFrameEditorView;
    private String mSimpleString;

    public void clear() {
    }

    public int getUnSupportStringRes() {
        return R.string.frame_not_support_image_ratio;
    }

    public boolean isEmpty() {
        return this.mFrameEditorView.isEmpty();
    }

    public boolean isSupportBitmap(Bitmap bitmap) {
        float height = ((float) bitmap.getHeight()) / ((float) bitmap.getWidth());
        if (height < 1.0f) {
            height = 1.0f / height;
        }
        return height <= 3.0f;
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        ViewGroup viewGroup2 = (ViewGroup) layoutInflater.inflate(R.layout.editor_view_frame, viewGroup, false);
        this.mFrameEditorView = (FrameEditorView) viewGroup2.findViewById(R.id.frame_editor);
        this.mFrameEditorView.setBitmap(getBitmap());
        return viewGroup2;
    }

    /* access modifiers changed from: protected */
    public RenderData onExport() {
        return new FrameRenderData(this.mFrameEditorView.export());
    }

    /* access modifiers changed from: protected */
    public List<String> onSample() {
        ArrayList arrayList = new ArrayList();
        arrayList.add(this.mSimpleString);
        return arrayList;
    }

    public void setRatio(float f, String str) {
        this.mSimpleString = str;
        if (this.mFrameEditorView != null) {
            this.mFrameEditorView.setRatio(f);
        }
    }

    public void setScaleProgress(float f) {
        if (this.mFrameEditorView != null) {
            this.mFrameEditorView.setScaleProgress(f);
        }
    }
}
