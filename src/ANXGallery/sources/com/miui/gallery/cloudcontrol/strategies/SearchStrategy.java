package com.miui.gallery.cloudcontrol.strategies;

import com.google.gson.annotations.SerializedName;
import com.miui.gallery.cloudcontrol.CloudControlManager;
import com.miui.gallery.cloudcontrol.FeatureProfile.Status;

public class SearchStrategy extends BaseStrategy {
    @SerializedName("search-data")
    private String mAIAlbum = Status.UNAVAILABLE.getValue();
    private boolean mAIAlbumEnabled = false;
    @SerializedName("search-box")
    private String mSearchBar = Status.UNAVAILABLE.getValue();
    private boolean mSearchBarEnabled = false;

    public SearchStrategy(boolean z, boolean z2) {
        this.mSearchBarEnabled = z;
        this.mAIAlbumEnabled = z2;
    }

    public static SearchStrategy createDefault() {
        boolean z = CloudControlManager.getInstance().queryFeatureStatus("search") == Status.ENABLE;
        return new SearchStrategy(z, z);
    }

    public void doAdditionalProcessing() {
        this.mAIAlbumEnabled = Status.ENABLE.getValue().equalsIgnoreCase(this.mAIAlbum);
        this.mSearchBarEnabled = this.mAIAlbumEnabled && Status.ENABLE.getValue().equalsIgnoreCase(this.mSearchBar);
    }

    public boolean isAIAlbumEnabled() {
        return this.mAIAlbumEnabled;
    }

    public boolean isSearchBarEnabled() {
        return this.mSearchBarEnabled;
    }
}
