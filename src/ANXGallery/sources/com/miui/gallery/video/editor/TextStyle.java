package com.miui.gallery.video.editor;

import com.miui.gallery.video.editor.model.LocalResource;
import com.miui.gallery.video.editor.model.VideoEditorBaseModel;
import com.miui.gallery.video.editor.model.WaterMarkLocalResource;
import com.miui.gallery.video.editor.util.ToolsUtil;

public class TextStyle extends VideoEditorBaseModel {
    private int mAssetId;
    private String mAssetName;
    private int mIconResId;
    private String mTemplateId;

    public TextStyle(int i, String str) {
        this.mIconResId = i;
        this.mType = str;
        this.mExtra = "ve_type_extra".equals(str);
        if (!this.mExtra) {
            this.mDownloadState = 17;
        }
    }

    public TextStyle(LocalResource localResource) {
        if (localResource != null) {
            this.mID = localResource.id;
            this.mNameKey = localResource.nameKey;
            this.mLabel = localResource.label;
            this.mIconResId = localResource.imageId;
            this.mIconUrl = localResource.icon;
            this.mType = localResource.type;
            this.mExtra = "ve_type_extra".equals(localResource.type);
            this.mIsTemplate = this.mExtra;
            if (localResource instanceof WaterMarkLocalResource) {
                WaterMarkLocalResource waterMarkLocalResource = (WaterMarkLocalResource) localResource;
                this.mAssetId = ToolsUtil.parseIntFromStr(waterMarkLocalResource.assetId);
                this.mAssetName = waterMarkLocalResource.assetName;
            }
            if (!this.mExtra) {
                this.mDownloadState = 17;
            }
            this.mLabel = localResource.label;
        }
    }

    public int getAssetId() {
        return this.mAssetId;
    }

    public String getAssetName() {
        return this.mAssetName;
    }

    public int getIconResId() {
        return this.mIconResId;
    }

    public String getTemplateId() {
        return this.mTemplateId;
    }

    public void setTemplateId(String str) {
        this.mTemplateId = str;
    }
}
