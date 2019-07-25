package com.miui.gallery.cloudcontrol.strategies;

import com.google.gson.annotations.SerializedName;

public class CloudGuideStrategy extends BaseStrategy {
    @SerializedName("life_before_slimmed")
    private long mLifeBeforeSlimmed;
    @SerializedName("slim_immediately_size")
    private long mSlimImmediatelySize;
    @SerializedName("strict_strategy_low_space_percentage")
    private long mStrictStrategyLowSpacePercentage;
    @SerializedName("strict_strategy_media_size_percentage")
    private long mStrictStrategyMediaSizePercentage;
    @SerializedName("strict_strategy_media_size_when_low_space")
    private long mStrictStrategyMediaSizeWhenLowSpace;
    @SerializedName("weak_strategy_image_count")
    private long mWeakStrategyImageCount;
    @SerializedName("weak_strategy_low_space_percentage")
    private long mWeakStrategyLowSpacePercentage;
    @SerializedName("weak_strategy_media_size")
    private long mWeakStrategyMediaSize;
    @SerializedName("weak_strategy_video_count")
    private long mWeakStrategyVideoCount;

    public void doAdditionalProcessing() {
        this.mLifeBeforeSlimmed *= 86400000;
        this.mSlimImmediatelySize *= 1048576;
        this.mWeakStrategyMediaSize *= 1048576;
        this.mStrictStrategyMediaSizeWhenLowSpace *= 1048576;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("CloudGuideStrategy{mLifeBeforeSlimmed=");
        sb.append(this.mLifeBeforeSlimmed);
        sb.append(", mSlimImmediatelySize=");
        sb.append(this.mSlimImmediatelySize);
        sb.append(", mWeakStrategyVideoCount=");
        sb.append(this.mWeakStrategyVideoCount);
        sb.append(", mWeakStrategyImageCount=");
        sb.append(this.mWeakStrategyImageCount);
        sb.append(", mWeakStrategyMediaSize=");
        sb.append(this.mWeakStrategyMediaSize);
        sb.append(", mWeakStrategyLowSpacePercentage=");
        sb.append(this.mWeakStrategyLowSpacePercentage);
        sb.append(", mStrictStrategyMediaSizePercentage=");
        sb.append(this.mStrictStrategyMediaSizePercentage);
        sb.append(", mStrictStrategyLowSpacePercentage=");
        sb.append(this.mStrictStrategyLowSpacePercentage);
        sb.append(", mStrictStrategyMediaSizeWhenLowSpace=");
        sb.append(this.mStrictStrategyMediaSizeWhenLowSpace);
        sb.append('}');
        return sb.toString();
    }
}
