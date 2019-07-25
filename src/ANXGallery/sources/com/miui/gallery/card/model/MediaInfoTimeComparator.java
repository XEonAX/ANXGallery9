package com.miui.gallery.card.model;

import java.util.Comparator;

public class MediaInfoTimeComparator implements Comparator<MediaInfo> {
    public int compare(MediaInfo mediaInfo, MediaInfo mediaInfo2) {
        return -Double.compare((double) mediaInfo.getCreateTime(), (double) mediaInfo2.getCreateTime());
    }
}
