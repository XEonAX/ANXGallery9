package com.miui.gallery.editor.photo.core.imports.text;

import com.miui.gallery.editor.photo.core.common.model.TextData;
import com.miui.gallery.editor.photo.core.imports.text.dialog.BaseDialogModel;
import com.miui.gallery.editor.photo.core.imports.text.watermark.WatermarkInfo;

public class TextConfig extends TextData {
    private BaseDialogModel mBaseDialogModel;
    private WatermarkInfo mWatermarkInfo;

    TextConfig(short s, WatermarkInfo watermarkInfo) {
        super(s, watermarkInfo.name, watermarkInfo.icon);
        this.mWatermarkInfo = watermarkInfo;
    }

    TextConfig(short s, String str, BaseDialogModel baseDialogModel) {
        super(s, str, baseDialogModel.dialogSmallIconPath, baseDialogModel.backgroundColor);
        this.mBaseDialogModel = baseDialogModel;
    }

    public BaseDialogModel getBaseDialogModel() {
        return this.mBaseDialogModel;
    }

    public WatermarkInfo getWatermarkInfo() {
        return this.mWatermarkInfo;
    }

    public boolean isWatermark() {
        return this.mWatermarkInfo != null;
    }
}
