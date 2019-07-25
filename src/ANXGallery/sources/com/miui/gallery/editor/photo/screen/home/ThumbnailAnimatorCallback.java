package com.miui.gallery.editor.photo.screen.home;

public interface ThumbnailAnimatorCallback {
    int[] getThumbnailRect();

    int getThumbnailStartLeft();

    int getThumbnailStartTop();

    void onAnimationStart();

    void onAnimationUpdate(float f);

    void onPrepareAnimatorStart();
}
