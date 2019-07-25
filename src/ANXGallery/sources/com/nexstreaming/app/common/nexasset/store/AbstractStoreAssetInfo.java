package com.nexstreaming.app.common.nexasset.store;

import java.util.Collections;
import java.util.List;
import java.util.Map;

public abstract class AbstractStoreAssetInfo implements StoreAssetInfo {
    private int minVersion;
    private int packageVersion;

    public AbstractStoreAssetInfo(int i, int i2) {
        this.minVersion = i;
        this.packageVersion = i2;
    }

    public String getAssetDescription() {
        return null;
    }

    public Map<String, String> getAssetDescriptionMap() {
        return Collections.emptyMap();
    }

    public int getAssetFilesize() {
        return 0;
    }

    public String getAssetId() {
        return null;
    }

    public int getAssetIndex() {
        return 0;
    }

    public Map<String, String> getAssetNameMap() {
        return Collections.emptyMap();
    }

    public String getAssetPackageDownloadURL() {
        return null;
    }

    public int getAssetScopeVersion() {
        return this.minVersion;
    }

    public String getAssetThumbnailURL() {
        return null;
    }

    public String getAssetThumbnailURL_L() {
        return null;
    }

    public String getAssetThumbnailURL_S() {
        return null;
    }

    public String getAssetTitle() {
        return null;
    }

    public int getAssetVersion() {
        return this.packageVersion;
    }

    public String getAssetVideoURL() {
        return null;
    }

    public String getCategoryAliasName() {
        return null;
    }

    public String getCategoryIconURL() {
        return null;
    }

    public int getCategoryIndex() {
        return 0;
    }

    public long getExpireTime() {
        return 0;
    }

    public String getPriceType() {
        return null;
    }

    public int getSubCategoryIndex() {
        return 0;
    }

    public Map<String, String> getSubCategoryNameMap() {
        return Collections.emptyMap();
    }

    public List<String> getThumbnailPaths() {
        return null;
    }

    public int getUpdateTime() {
        return 0;
    }
}
