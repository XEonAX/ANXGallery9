package com.nexstreaming.app.common.nexasset.assetpackage.db;

import com.nexstreaming.app.common.nexasset.assetpackage.InstallSourceType;
import com.nexstreaming.app.common.norm.b;
import com.nexstreaming.app.common.norm.b.a;
import com.nexstreaming.app.common.norm.b.c;
import com.nexstreaming.app.common.norm.b.d;
import com.nexstreaming.app.common.norm.b.e;
import com.nexstreaming.app.common.norm.b.g;
import java.io.File;
import java.util.Map;

public class AssetPackageRecord extends b implements com.nexstreaming.app.common.nexasset.assetpackage.b {
    public long _id;
    public Map<String, String> assetDesc;
    @g
    @e
    public String assetId;
    public int assetIdx;
    public Map<String, String> assetName;
    public String assetUrl;
    public CategoryRecord category;
    @a(a = 12)
    public long expireTime;
    @c
    @d
    public InstallSourceRecord installSource;
    @a(a = 12)
    public long installedTime;
    public String localPath;
    @a(a = 13)
    public int minVersion;
    public String packageURI;
    @a(a = 13)
    public int packageVersion;
    public String priceType;
    public SubCategoryRecord subCategory;
    public String thumbPath;
    public String thumbUrl;

    public com.nexstreaming.app.common.nexasset.assetpackage.a getAssetCategory() {
        return this.category;
    }

    public Map<String, String> getAssetDesc() {
        return this.assetDesc;
    }

    public String getAssetId() {
        return this.assetId;
    }

    public int getAssetIdx() {
        return this.assetIdx;
    }

    public Map<String, String> getAssetName() {
        return this.assetName;
    }

    public com.nexstreaming.app.common.nexasset.assetpackage.d getAssetSubCategory() {
        return this.subCategory;
    }

    public String getAssetUrl() {
        return this.assetUrl;
    }

    public long getExpireTime() {
        return this.expireTime;
    }

    public InstallSourceType getInstallSourceType() {
        if (this.installSource == null) {
            return null;
        }
        return this.installSource.installSourceType;
    }

    public long getInstalledTime() {
        return this.installedTime;
    }

    public File getLocalPath() {
        if (this.localPath == null) {
            return null;
        }
        return new File(this.localPath);
    }

    public int getMinVersion() {
        return this.minVersion;
    }

    public String getPackageURI() {
        return this.packageURI;
    }

    public int getPackageVersion() {
        return this.packageVersion;
    }

    public String getPriceType() {
        return this.priceType;
    }

    public String getThumbPath() {
        return this.thumbPath;
    }

    public String getThumbUrl() {
        return this.thumbUrl;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("AssetPackageRecord{_id=");
        sb.append(this._id);
        sb.append(", assetId='");
        sb.append(this.assetId);
        sb.append('\'');
        sb.append(", assetIdx=");
        sb.append(this.assetIdx);
        sb.append(", assetUrl='");
        sb.append(this.assetUrl);
        sb.append('\'');
        sb.append(", thumbUrl='");
        sb.append(this.thumbUrl);
        sb.append('\'');
        sb.append(", thumbPath='");
        sb.append(this.thumbPath);
        sb.append('\'');
        sb.append(", priceType='");
        sb.append(this.priceType);
        sb.append('\'');
        sb.append(", localPath='");
        sb.append(this.localPath);
        sb.append('\'');
        sb.append(", category=");
        sb.append(this.category);
        sb.append(", subCategory=");
        sb.append(this.subCategory);
        sb.append(", assetName=");
        sb.append(this.assetName);
        sb.append(", assetDesc=");
        sb.append(this.assetDesc);
        sb.append(", packageURI='");
        sb.append(this.packageURI);
        sb.append('\'');
        sb.append(", installSource=");
        sb.append(this.installSource);
        sb.append('}');
        return sb.toString();
    }
}
