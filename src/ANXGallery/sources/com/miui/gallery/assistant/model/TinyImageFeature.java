package com.miui.gallery.assistant.model;

import android.database.Cursor;
import com.miui.gallery.dao.base.Entity;

public class TinyImageFeature implements Comparable<TinyImageFeature> {
    public static final String[] PROJECTION = {"imageId", "score", "clusterGroupId", "iqaExpo", "iqaNois", "iqaBlur", "iqaBlueType", "imageDatetime"};
    public static final String[] PROJECTION_GROUP = {"imageId"};
    private final long mClusterGroupId;
    private long mImageDateTime;
    private final long mImageId;
    private boolean mIsPoorImage;
    private final double mScore;

    public TinyImageFeature(Cursor cursor) {
        Cursor cursor2 = cursor;
        this.mImageId = Entity.getLong(cursor2, "imageId");
        this.mScore = Entity.getDoubleDefault(cursor2, "score", 0.0d);
        this.mClusterGroupId = Entity.getLongDefault(cursor2, "clusterGroupId", 0);
        double doubleDefault = Entity.getDoubleDefault(cursor2, "iqaExpo", 0.0d);
        this.mIsPoorImage = (Entity.getDoubleDefault(cursor2, "iqaBlur", 0.0d) < 82.0d && ((double) Entity.getIntDefault(cursor2, "iqaBlueType", -1)) == 0.0d) || Entity.getDoubleDefault(cursor2, "iqaNois", 0.0d) < 79.4d || doubleDefault < 62.3d;
        this.mImageDateTime = Entity.getLongDefault(cursor2, "imageDatetime", 0);
    }

    public int compareTo(TinyImageFeature tinyImageFeature) {
        double score = getScore();
        double score2 = tinyImageFeature.getScore();
        if (isPoorImage() && !tinyImageFeature.isPoorImage()) {
            return 1;
        }
        if ((isPoorImage() || !tinyImageFeature.isPoorImage()) && score <= score2) {
            return score < score2 ? 1 : 0;
        }
        return -1;
    }

    public long getClusterGroupId() {
        return this.mClusterGroupId;
    }

    public long getImageDateTime() {
        return this.mImageDateTime;
    }

    public long getImageId() {
        return this.mImageId;
    }

    public double getScore() {
        return this.mScore;
    }

    public boolean isPoorImage() {
        return this.mIsPoorImage;
    }
}
