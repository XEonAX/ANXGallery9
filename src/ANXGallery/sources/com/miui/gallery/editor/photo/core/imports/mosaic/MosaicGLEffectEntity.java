package com.miui.gallery.editor.photo.core.imports.mosaic;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.miui.gallery.editor.photo.core.imports.mosaic.shader.GLMosaicBlurShaderImp;
import com.miui.gallery.editor.photo.core.imports.mosaic.shader.GLMosaicShader;
import com.miui.gallery.editor.photo.core.imports.mosaic.shader.GLMosaicTriangleShader;
import com.miui.gallery.editor.photo.core.imports.mosaic.shader.GLTextureSizeShader;

class MosaicGLEffectEntity extends MosaicGLEntity {
    public static final Creator<MosaicGLEffectEntity> CREATOR = new Creator<MosaicGLEffectEntity>() {
        public MosaicGLEffectEntity createFromParcel(Parcel parcel) {
            return new MosaicGLEffectEntity(parcel);
        }

        public MosaicGLEffectEntity[] newArray(int i) {
            return new MosaicGLEffectEntity[i];
        }
    };
    private final String mEffectType;

    protected MosaicGLEffectEntity(Parcel parcel) {
        super(parcel);
        this.mEffectType = parcel.readString();
    }

    MosaicGLEffectEntity(short s, String str, String str2, String str3) {
        super(s, str, str2, TYPE.EFFECT);
        this.mEffectType = str3;
    }

    public int describeContents() {
        return 0;
    }

    /* access modifiers changed from: 0000 */
    public GLTextureSizeShader generateSpecificShader(int i, int i2, int i3, int i4) {
        if ("NORMAL".equals(this.mEffectType)) {
            return new GLMosaicShader(i, i2);
        }
        if ("BLUR".equals(this.mEffectType)) {
            return new GLMosaicBlurShaderImp(i, i2, i3, i4);
        }
        if ("TRIANGLE".equals(this.mEffectType)) {
            return new GLMosaicTriangleShader(i, i2);
        }
        return null;
    }

    public void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeString(this.mEffectType);
    }
}
