package com.miui.gallery.editor.photo.screen.core;

import android.annotation.SuppressLint;
import android.graphics.Bitmap;
import com.miui.gallery.editor.photo.core.RenderData;
import com.miui.gallery.editor.photo.core.imports.longcrop.LongScreenshotCropEditorView.Entry;
import com.miui.gallery.editor.photo.screen.crop.ScreenCropEntry;
import java.util.HashMap;

@SuppressLint({"ParcelCreator"})
public class ScreenRenderData extends RenderData {
    public ScreenDrawEntry mDrawEntry;
    public Entry mLongCropEntry;
    ScreenCropEntry mScreenCropEntry;

    public ScreenRenderData(ScreenDrawEntry screenDrawEntry, ScreenCropEntry screenCropEntry) {
        this.mDrawEntry = screenDrawEntry;
        this.mScreenCropEntry = screenCropEntry;
    }

    public Bitmap apply(Bitmap bitmap) {
        Bitmap apply = this.mDrawEntry.apply(bitmap);
        return this.mScreenCropEntry != null ? this.mScreenCropEntry.apply(apply) : this.mLongCropEntry != null ? this.mLongCropEntry.apply(apply) : apply;
    }

    public void putStat(HashMap<String, String> hashMap) {
        hashMap.put("cropChanged", this.mScreenCropEntry == null ? "false" : "true");
        if (this.mLongCropEntry != null) {
            hashMap.put("longCropChanged", this.mLongCropEntry.isModified() ? "true" : "false");
        }
        this.mDrawEntry.putStat(hashMap);
    }

    public void setLongCropEntry(Entry entry) {
        this.mLongCropEntry = entry;
    }
}
