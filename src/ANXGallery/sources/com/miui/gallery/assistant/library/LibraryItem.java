package com.miui.gallery.assistant.library;

import android.content.Context;
import android.text.TextUtils;
import com.google.gson.annotations.SerializedName;
import com.miui.gallery.GalleryApp;
import java.io.File;

public class LibraryItem {
    @SerializedName("extraInfo")
    private String mExtraInfo;
    @SerializedName("id")
    private long mId;
    private transient boolean mIsLoaded = false;
    private transient boolean mIsLocal = false;
    @SerializedName("text")
    private String mName;
    @SerializedName("parentId")
    private long mParentId;
    @SerializedName("sha1Base16")
    private String mSha1;
    @SerializedName("type")
    private String mType;

    public String getExtraInfo() {
        return this.mExtraInfo;
    }

    public long getId() {
        return this.mId;
    }

    public String getName() {
        return this.mName;
    }

    public long getParentId() {
        return this.mParentId;
    }

    public String getSha1() {
        return this.mSha1;
    }

    public String getTargetPath(Context context) {
        StringBuilder sb = new StringBuilder();
        sb.append(LibraryUtils.getLibraryDirPath(context));
        sb.append(File.separator);
        sb.append(this.mName);
        return sb.toString();
    }

    public boolean isExist() {
        return isLocal() || LibraryUtils.isLibraryItemExist(GalleryApp.sGetAndroidContext(), this);
    }

    public boolean isLoaded() {
        return this.mIsLoaded;
    }

    public boolean isLocal() {
        return this.mIsLocal;
    }

    public boolean isTypeSo() {
        return TextUtils.equals(this.mType, "so");
    }

    public void setLoaded(boolean z) {
        this.mIsLoaded = z;
    }
}
