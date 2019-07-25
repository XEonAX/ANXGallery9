package com.miui.gallery.editor.photo.core.imports.miuibeauty;

import com.miui.filtersdk.beauty.BeautyParameterType;
import com.miui.gallery.editor.photo.core.Metadata;

public class MiuiBeautifyData extends Metadata {
    private BeautyParameterType mParameterType;

    public MiuiBeautifyData(short s, String str, BeautyParameterType beautyParameterType) {
        super(s, str);
        this.mParameterType = beautyParameterType;
    }
}
