package com.miui.gallery.model;

public class FavoriteInfo {
    private boolean mIsFavorite;
    private boolean mIsFavoriteUsable;

    public boolean isFavorite() {
        return this.mIsFavorite;
    }

    public boolean isFavoriteUsable() {
        return this.mIsFavoriteUsable;
    }

    public void setFavorite(boolean z) {
        this.mIsFavorite = z;
    }

    public void setFavoriteUsable(boolean z) {
        this.mIsFavoriteUsable = z;
    }
}
