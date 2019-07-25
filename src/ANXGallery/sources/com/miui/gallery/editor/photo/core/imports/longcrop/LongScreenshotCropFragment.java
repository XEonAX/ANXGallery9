package com.miui.gallery.editor.photo.core.imports.longcrop;

import android.graphics.Bitmap;
import android.graphics.RectF;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ProgressBar;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.RenderData;
import com.miui.gallery.editor.photo.core.common.fragment.AbstractLongCropFragment;
import com.miui.gallery.editor.photo.core.imports.longcrop.LongScreenshotCropEditorView.Entry;
import java.util.Arrays;
import java.util.List;

public class LongScreenshotCropFragment extends AbstractLongCropFragment {
    private LongScreenshotCropEditorView mEditorView;
    private Bitmap mOrigin;
    private ProgressBar mProgressBar;

    private RectF getClipRatioRectByPreData(List<RenderData> list) {
        RectF rectF = new RectF();
        rectF.set(0.0f, 0.0f, 1.0f, 1.0f);
        for (RenderData renderData : list) {
            if (renderData instanceof CropRenderData) {
                Entry entry = ((CropRenderData) renderData).mEntry;
                float height = rectF.height();
                float f = rectF.top;
                rectF.top = (entry.mTopRatio * height) + f;
                rectF.bottom = f + (height * entry.mBottomRatio);
            }
        }
        return rectF;
    }

    private void validateBitmap() {
        if (getBitmap() == null || this.mOrigin == null) {
            this.mProgressBar.setVisibility(0);
            this.mEditorView.setVisibility(4);
            return;
        }
        this.mProgressBar.setVisibility(8);
        this.mEditorView.setVisibility(0);
    }

    public void clear() {
    }

    public boolean isEmpty() {
        return this.mEditorView.isEmpty();
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.long_screenshot_crop_editor_fragment, viewGroup, false);
    }

    public void onDestroyView() {
        super.onDestroyView();
        this.mOrigin = null;
    }

    /* access modifiers changed from: protected */
    public RenderData onExport() {
        return new CropRenderData(this.mEditorView.export());
    }

    /* access modifiers changed from: protected */
    public List<String> onSample() {
        Entry export = this.mEditorView.export();
        if (Math.round(export.mBottomRatio) * Math.round(export.mTopRatio) == 0) {
            return Arrays.asList(new String[]{"long_crop"});
        }
        return null;
    }

    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        this.mEditorView = (LongScreenshotCropEditorView) view.findViewById(R.id.editor_view);
        this.mProgressBar = (ProgressBar) view.findViewById(R.id.progress_view);
        if (getBitmap() != null) {
            this.mEditorView.setBitmap(getBitmap());
        }
        validateBitmap();
    }

    public void setBitmap(Bitmap bitmap) {
        super.setBitmap(bitmap);
        if (getView() != null) {
            this.mEditorView.setBitmap(bitmap);
            validateBitmap();
        }
    }

    public void setOriginBitmap(Bitmap bitmap, List<RenderData> list) {
        if (bitmap != null) {
            this.mOrigin = bitmap;
            RectF clipRatioRectByPreData = getClipRatioRectByPreData(list);
            if (getView() != null) {
                this.mEditorView.setOriginalBitmap(bitmap, clipRatioRectByPreData.top, clipRatioRectByPreData.bottom);
                validateBitmap();
            }
        }
    }
}
