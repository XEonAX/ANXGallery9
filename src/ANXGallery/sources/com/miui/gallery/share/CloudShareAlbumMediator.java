package com.miui.gallery.share;

import com.google.common.collect.Lists;
import java.util.ArrayList;

public class CloudShareAlbumMediator {
    private static final CloudShareAlbumMediator sSingleton = new CloudShareAlbumMediator();
    private final ArrayList<OnShareAlbumExitedListener> mListeners = Lists.newArrayList();

    public interface OnShareAlbumExitedListener {
    }

    public static CloudShareAlbumMediator getInstance() {
        return sSingleton;
    }

    public void addListener(OnShareAlbumExitedListener onShareAlbumExitedListener) {
        if (onShareAlbumExitedListener != null) {
            this.mListeners.add(onShareAlbumExitedListener);
        }
    }

    public void removeListener(OnShareAlbumExitedListener onShareAlbumExitedListener) {
        if (onShareAlbumExitedListener != null) {
            this.mListeners.remove(onShareAlbumExitedListener);
        }
    }
}
