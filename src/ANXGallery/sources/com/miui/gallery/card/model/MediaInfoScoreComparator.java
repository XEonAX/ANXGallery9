package com.miui.gallery.card.model;

import java.util.Comparator;

public class MediaInfoScoreComparator implements Comparator<MediaInfo> {
    public int compare(MediaInfo mediaInfo, MediaInfo mediaInfo2) {
        return -Double.compare(mediaInfo.getScore(), mediaInfo2.getScore());
    }
}
