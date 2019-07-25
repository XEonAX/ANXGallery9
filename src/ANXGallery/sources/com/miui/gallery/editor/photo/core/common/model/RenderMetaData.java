package com.miui.gallery.editor.photo.core.common.model;

import android.os.Parcel;
import com.miui.gallery.editor.photo.core.Metadata;
import com.miui.gallery.editor.photo.core.imports.filter.Renderable;

public abstract class RenderMetaData extends Metadata implements Renderable {
    protected RenderMetaData(Parcel parcel) {
        super(parcel);
    }

    public RenderMetaData(short s, String str) {
        super(s, str);
    }
}
