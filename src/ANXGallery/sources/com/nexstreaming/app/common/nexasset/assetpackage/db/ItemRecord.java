package com.nexstreaming.app.common.nexasset.assetpackage.db;

import com.nexstreaming.app.common.nexasset.assetpackage.ItemCategory;
import com.nexstreaming.app.common.nexasset.assetpackage.ItemType;
import com.nexstreaming.app.common.nexasset.assetpackage.f;
import com.nexstreaming.app.common.norm.b;
import com.nexstreaming.app.common.norm.b.c;
import com.nexstreaming.app.common.norm.b.d;
import com.nexstreaming.app.common.norm.b.e;
import com.nexstreaming.app.common.norm.b.g;
import java.util.Collections;
import java.util.Map;

public class ItemRecord extends b implements f {
    public long _id;
    @c
    @d
    public AssetPackageRecord assetPackageRecord;
    public String filePath;
    public boolean hidden;
    public String iconPath;
    public ItemCategory itemCategory;
    @g
    @e
    public String itemId;
    public ItemType itemType;
    public Map<String, String> label;
    public String packageURI;
    public String sampleText;
    public String thumbPath;

    public com.nexstreaming.app.common.nexasset.assetpackage.b getAssetPackage() {
        return this.assetPackageRecord;
    }

    public ItemCategory getCategory() {
        return this.itemCategory;
    }

    public String getFilePath() {
        return this.filePath;
    }

    public String getIconPath() {
        return this.iconPath;
    }

    public String getId() {
        return this.itemId;
    }

    public Map<String, String> getLabel() {
        return (this.label == null || this.label.isEmpty()) ? Collections.singletonMap("en", this.itemId) : this.label;
    }

    public String getPackageURI() {
        return this.packageURI;
    }

    public String getSampleText() {
        return this.sampleText;
    }

    public String getThumbPath() {
        return this.thumbPath;
    }

    public ItemType getType() {
        return this.itemType;
    }

    public boolean isHidden() {
        return this.hidden;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("ItemRecord{_id=");
        sb.append(this._id);
        sb.append(", itemId='");
        sb.append(this.itemId);
        sb.append('\'');
        sb.append(", packageURI='");
        sb.append(this.packageURI);
        sb.append('\'');
        sb.append(", filePath='");
        sb.append(this.filePath);
        sb.append('\'');
        sb.append(", iconPath='");
        sb.append(this.iconPath);
        sb.append('\'');
        sb.append(", thumbPath='");
        sb.append(this.thumbPath);
        sb.append('\'');
        sb.append(", label=");
        sb.append(this.label);
        sb.append(", itemType=");
        sb.append(this.itemType);
        sb.append(", itemCategory=");
        sb.append(this.itemCategory);
        sb.append(", assetPackageRecord=");
        sb.append(this.assetPackageRecord);
        sb.append('}');
        return sb.toString();
    }
}
