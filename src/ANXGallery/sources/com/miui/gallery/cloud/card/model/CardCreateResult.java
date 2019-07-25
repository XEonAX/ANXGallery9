package com.miui.gallery.cloud.card.model;

import com.google.gson.annotations.SerializedName;

public class CardCreateResult {
    @SerializedName("duplicate")
    private boolean duplicate;
    @SerializedName("galleryCard")
    private CardInfo galleryCard;

    public CardInfo getGalleryCard() {
        return this.galleryCard;
    }

    public boolean isDuplicate() {
        return this.duplicate;
    }
}
