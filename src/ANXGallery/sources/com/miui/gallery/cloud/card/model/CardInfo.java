package com.miui.gallery.cloud.card.model;

import android.text.TextUtils;
import com.google.gson.annotations.SerializedName;
import java.util.List;

public class CardInfo {
    @SerializedName("description")
    private String mDescription;
    @SerializedName("extraInfo")
    private String mExtraInfo;
    @SerializedName("appCreate")
    private boolean mIsAppCreate;
    @SerializedName("isTop")
    private boolean mIsTop;
    @SerializedName("mediaInfo")
    private MediaInfoBean mMediaInfo;
    @SerializedName("operationInfo")
    private OperationInfo mOperationInfo;
    @SerializedName("cardId")
    private String mServerId;
    @SerializedName("sortTime")
    private long mSortTime;
    @SerializedName("status")
    private String mStatus;
    @SerializedName("tag")
    private long mTag;
    @SerializedName("name")
    private String mTitle;
    @SerializedName("updateTime")
    private long mUpdateTime;
    @SerializedName("validEndDate")
    private long mValidEndDate;
    @SerializedName("validStartDate")
    private long mValidStartDate;
    @SerializedName("scenarioId")
    private int scenarioId;

    public static class MediaInfoBean {
        @SerializedName("allMediaList")
        private List<Long> allMediaList;
        @SerializedName("coverMediaList")
        private List<Long> coverMediaList;
        @SerializedName("mediaList")
        private List<Long> mediaList;

        public List<Long> getAllMediaList() {
            return this.allMediaList;
        }

        public List<Long> getCoverMediaList() {
            return this.coverMediaList;
        }

        public List<Long> getMediaList() {
            return this.mediaList;
        }
    }

    public static class OperationInfo {
        @SerializedName("backgroundUrl")
        private String backgroundUrl;
        @SerializedName("iconUrl")
        private String iconUrl;
        @SerializedName("url")
        private String url;

        public String getBackgroundUrl() {
            return this.backgroundUrl;
        }

        public String getIconUrl() {
            return this.iconUrl;
        }

        public String getUrl() {
            return this.url;
        }
    }

    public String getDescription() {
        return this.mDescription;
    }

    public String getExtraInfo() {
        return this.mExtraInfo;
    }

    public MediaInfoBean getMediaInfo() {
        return this.mMediaInfo;
    }

    public OperationInfo getOperationInfo() {
        return this.mOperationInfo;
    }

    public int getScenarioId() {
        return this.scenarioId;
    }

    public String getServerId() {
        return this.mServerId;
    }

    public long getSortTime() {
        return this.mSortTime;
    }

    public long getTag() {
        return this.mTag;
    }

    public String getTitle() {
        return this.mTitle;
    }

    public long getUpdateTime() {
        return this.mUpdateTime;
    }

    public long getValidEndDate() {
        return this.mValidEndDate;
    }

    public long getValidStartDate() {
        return this.mValidStartDate;
    }

    public boolean isAppCreate() {
        return this.mIsAppCreate;
    }

    public boolean isStatusDelete() {
        return TextUtils.equals("deleted", this.mStatus);
    }

    public boolean isTop() {
        return this.mIsTop;
    }
}
