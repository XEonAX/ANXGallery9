package com.miui.gallery.editor.photo.core;

import android.os.Parcel;
import android.os.Parcelable;

public abstract class Metadata implements Parcelable, Comparable<Metadata> {
    public final String name;
    public final int priority;

    protected Metadata(Parcel parcel) {
        this.name = parcel.readString();
        this.priority = parcel.readInt();
    }

    public Metadata(short s, String str) {
        this.name = str;
        this.priority = s;
    }

    public int compareTo(Metadata metadata) {
        return this.priority - metadata.priority;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(this.name);
        parcel.writeInt(this.priority);
    }
}
