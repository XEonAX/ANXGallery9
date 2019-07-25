package com.miui.gallery.card;

import com.google.gson.annotations.SerializedName;
import java.util.List;

public class CardSyncInfo {
    @SerializedName("description")
    private String description;
    @SerializedName("duplicateKey")
    private String duplicateKey;
    @SerializedName("extraInfo")
    private String extraInfo;
    @SerializedName("mediaInfo")
    private MediaInfoBean mediaInfo;
    @SerializedName("name")
    private String name;
    @SerializedName("scenarioId")
    private int scenarioId;
    @SerializedName("sortTime")
    private long sortTime;
    @SerializedName("status")
    private String status;

    public static final class Builder {
        /* access modifiers changed from: private */
        public List<Long> allMediaList;
        /* access modifiers changed from: private */
        public List<Long> coverMediaList;
        /* access modifiers changed from: private */
        public String description;
        /* access modifiers changed from: private */
        public String duplicateKey;
        /* access modifiers changed from: private */
        public String extraInfo;
        /* access modifiers changed from: private */
        public List<Long> mediaList;
        /* access modifiers changed from: private */
        public String name;
        /* access modifiers changed from: private */
        public int scenarioId;
        /* access modifiers changed from: private */
        public long sortTime;
        /* access modifiers changed from: private */
        public String status;

        private Builder() {
        }

        public CardSyncInfo build() {
            return new CardSyncInfo(this);
        }

        public Builder setAllMediaList(List<Long> list) {
            this.allMediaList = list;
            return this;
        }

        public Builder setCoverMediaList(List<Long> list) {
            this.coverMediaList = list;
            return this;
        }

        public Builder setDescription(String str) {
            this.description = str;
            return this;
        }

        public Builder setDuplicateKey(String str) {
            this.duplicateKey = str;
            return this;
        }

        public Builder setExtraInfo(String str) {
            this.extraInfo = str;
            return this;
        }

        public Builder setMediaList(List<Long> list) {
            this.mediaList = list;
            return this;
        }

        public Builder setName(String str) {
            this.name = str;
            return this;
        }

        public Builder setScenarioId(int i) {
            this.scenarioId = i;
            return this;
        }

        public Builder setSortTime(long j) {
            this.sortTime = j;
            return this;
        }

        public Builder setStatus(String str) {
            this.status = str;
            return this;
        }
    }

    public static class MediaInfoBean {
        @SerializedName("allMediaList")
        private final List<Long> allMediaList;
        @SerializedName("coverMediaList")
        private final List<Long> coverMediaList;
        @SerializedName("mediaList")
        private final List<Long> mediaList;

        public MediaInfoBean(List<Long> list, List<Long> list2, List<Long> list3) {
            this.coverMediaList = list;
            this.mediaList = list2;
            this.allMediaList = list3;
        }
    }

    private CardSyncInfo(Builder builder) {
        setScenarioId(builder.scenarioId);
        setName(builder.name);
        setDescription(builder.description);
        setStatus(builder.status);
        setDuplicateKey(builder.duplicateKey);
        setMediaInfo(new MediaInfoBean(builder.coverMediaList, builder.mediaList, builder.allMediaList));
        setExtraInfo(builder.extraInfo);
        setSortTime(builder.sortTime);
    }

    public static Builder newBuilder() {
        return new Builder();
    }

    public void setDescription(String str) {
        this.description = str;
    }

    public void setDuplicateKey(String str) {
        this.duplicateKey = str;
    }

    public void setExtraInfo(String str) {
        this.extraInfo = str;
    }

    public void setMediaInfo(MediaInfoBean mediaInfoBean) {
        this.mediaInfo = mediaInfoBean;
    }

    public void setName(String str) {
        this.name = str;
    }

    public void setScenarioId(int i) {
        this.scenarioId = i;
    }

    public void setSortTime(long j) {
        this.sortTime = j;
    }

    public void setStatus(String str) {
        this.status = str;
    }
}
