package com.miui.gallery.cloudcontrol.strategies;

import android.text.TextUtils;
import com.google.gson.annotations.SerializedName;
import com.miui.gallery.util.MiscUtil;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AlbumSortDateStrategy extends BaseStrategy {
    @SerializedName("albums")
    private List<AlbumSortDate> mAlbums;
    private transient Map<String, AlbumSortDate> mSortDateMap;

    public static class AlbumSortDate {
        @SerializedName("album_path")
        private String mAlbumPath;
        @SerializedName("sort_date")
        private String mSortDate;

        public String getAlbumPath() {
            return this.mAlbumPath;
        }

        public String getSortDate() {
            return this.mSortDate;
        }

        public boolean isValid() {
            return !TextUtils.isEmpty(this.mSortDate) && !TextUtils.isEmpty(this.mAlbumPath);
        }
    }

    public enum SortDate {
        DATE_MODIFIED("dateModified"),
        DATE_CREATED("dateCreated");
        
        private String value;

        private SortDate(String str) {
            this.value = str;
        }

        public static SortDate fromValue(String str) {
            SortDate[] values;
            for (SortDate sortDate : values()) {
                if (sortDate.value.equals(str)) {
                    return sortDate;
                }
            }
            return DATE_CREATED;
        }
    }

    public void doAdditionalProcessing() {
        this.mSortDateMap = new HashMap();
        if (MiscUtil.isValid(this.mAlbums)) {
            for (AlbumSortDate albumSortDate : this.mAlbums) {
                if (albumSortDate != null && albumSortDate.isValid()) {
                    this.mSortDateMap.put(albumSortDate.getAlbumPath().toLowerCase(), albumSortDate);
                }
            }
        }
    }

    public List<String> getAlbumPathsBySortDate(SortDate sortDate) {
        ArrayList arrayList = new ArrayList();
        if (MiscUtil.isValid(this.mAlbums)) {
            for (AlbumSortDate albumSortDate : this.mAlbums) {
                if (sortDate == SortDate.fromValue(albumSortDate.getSortDate())) {
                    arrayList.add(albumSortDate.getAlbumPath());
                }
            }
        }
        return arrayList;
    }
}
