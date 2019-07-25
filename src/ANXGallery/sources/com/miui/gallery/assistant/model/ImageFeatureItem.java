package com.miui.gallery.assistant.model;

public interface ImageFeatureItem {
    ImageFeature getImageFeature();

    long getMediaId();

    String getMediaSha1();

    void setImageFeature(ImageFeature imageFeature);
}
