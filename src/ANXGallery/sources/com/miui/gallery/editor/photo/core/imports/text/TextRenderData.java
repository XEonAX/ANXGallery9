package com.miui.gallery.editor.photo.core.imports.text;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.miui.gallery.editor.photo.core.RenderData;
import com.miui.gallery.editor.photo.core.imports.text.TextEditorView.TextEntry;

class TextRenderData extends RenderData {
    public static final Creator<TextRenderData> CREATOR = new Creator<TextRenderData>() {
        public TextRenderData createFromParcel(Parcel parcel) {
            return new TextRenderData(parcel);
        }

        public TextRenderData[] newArray(int i) {
            return new TextRenderData[i];
        }
    };
    TextEntry mTextEntry;

    protected TextRenderData(Parcel parcel) {
        super(parcel);
        this.mTextEntry = (TextEntry) parcel.readParcelable(TextEntry.class.getClassLoader());
    }

    TextRenderData(TextEntry textEntry) {
        this.mTextEntry = textEntry;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeParcelable(this.mTextEntry, i);
    }
}
