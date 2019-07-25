package com.miui.gallery.editor.photo.core.imports.text.typeface;

import android.graphics.Typeface;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.imports.text.TextFontConfig;
import com.miui.gallery.editor.photo.core.imports.text.model.FontBean;
import java.io.File;
import java.text.DecimalFormat;

public class TextStyle extends FontBean implements Parcelable, Comparable<TextStyle> {
    public static final Creator<TextStyle> CREATOR = new Creator<TextStyle>() {
        public TextStyle createFromParcel(Parcel parcel) {
            return new TextStyle(parcel);
        }

        public TextStyle[] newArray(int i) {
            return new TextStyle[i];
        }
    };
    private int defaultNameResId = R.string.photo_editor_font_default;
    private int state = 19;
    private Typeface typeFace;

    public TextStyle() {
    }

    protected TextStyle(Parcel parcel) {
        this.defaultNameResId = parcel.readInt();
        this.state = parcel.readInt();
    }

    private String getDownloadSrcPath() {
        StringBuilder sb = new StringBuilder();
        sb.append(TextFontConfig.FONT_PATH);
        sb.append(File.separator);
        sb.append(this.id);
        return sb.toString();
    }

    public static TextStyle getLocalTextStyle() {
        TextStyle textStyle = new TextStyle();
        textStyle.state = 17;
        textStyle.type = "type_local";
        textStyle.defaultNameResId = R.string.photo_editor_font_default;
        textStyle.typeFace = Typeface.DEFAULT;
        return textStyle;
    }

    public int compareTo(TextStyle textStyle) {
        return this.extraInfo.index - textStyle.extraInfo.index;
    }

    public int describeContents() {
        return 0;
    }

    public int getDefaultNameResId() {
        return this.defaultNameResId;
    }

    public String getDownloadFilePath() {
        StringBuilder sb = new StringBuilder();
        sb.append(getDownloadSrcPath());
        sb.append(".zip");
        return sb.toString();
    }

    public String getFilePath() {
        StringBuilder sb = new StringBuilder();
        sb.append(getDownloadSrcPath());
        sb.append(".ttf");
        return sb.toString();
    }

    public String getFontSize() {
        DecimalFormat decimalFormat = new DecimalFormat(".0");
        StringBuilder sb = new StringBuilder();
        sb.append(decimalFormat.format((double) (((float) this.size) / 1000000.0f)));
        sb.append("M");
        return sb.toString();
    }

    public String getIconUrl() {
        return this.icon;
    }

    public String getName() {
        return this.text;
    }

    public int getState() {
        return this.state;
    }

    public Typeface getTypeFace() {
        return this.typeFace;
    }

    public boolean isDownloadSuccess() {
        return this.state == 0;
    }

    public boolean isDownloaded() {
        return this.state == 17;
    }

    public boolean isDownloading() {
        return this.state == 18;
    }

    public boolean isExtra() {
        return "type_extra".equals(this.type);
    }

    public boolean isLocal() {
        return "type_local".equals(this.type);
    }

    public boolean isNeedDownload() {
        return this.state == 19 || this.state == 20;
    }

    public void setState(int i) {
        this.state = i;
    }

    public void setTypeFace(Typeface typeface) {
        this.typeFace = typeface;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.defaultNameResId);
        parcel.writeInt(this.state);
    }
}
