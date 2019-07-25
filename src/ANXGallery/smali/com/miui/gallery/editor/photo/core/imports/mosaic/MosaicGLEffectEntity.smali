.class Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEffectEntity;
.super Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;
.source "MosaicGLEffectEntity.java"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEffectEntity;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mEffectType:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEffectEntity$1;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEffectEntity$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEffectEntity;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;-><init>(Landroid/os/Parcel;)V

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEffectEntity;->mEffectType:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(SLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity$TYPE;->EFFECT:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity$TYPE;

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;-><init>(SLjava/lang/String;Ljava/lang/String;Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity$TYPE;)V

    iput-object p4, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEffectEntity;->mEffectType:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method generateSpecificShader(IIII)Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTextureSizeShader;
    .locals 2

    const-string v0, "NORMAL"

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEffectEntity;->mEffectType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance p3, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLMosaicShader;

    invoke-direct {p3, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLMosaicShader;-><init>(II)V

    goto :goto_0

    :cond_0
    const-string v0, "BLUR"

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEffectEntity;->mEffectType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLMosaicBlurShaderImp;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLMosaicBlurShaderImp;-><init>(IIII)V

    move-object p3, v0

    goto :goto_0

    :cond_1
    const-string p3, "TRIANGLE"

    iget-object p4, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEffectEntity;->mEffectType:Ljava/lang/String;

    invoke-virtual {p3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_2

    new-instance p3, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLMosaicTriangleShader;

    invoke-direct {p3, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLMosaicTriangleShader;-><init>(II)V

    goto :goto_0

    :cond_2
    const/4 p3, 0x0

    :goto_0
    return-object p3
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;->writeToParcel(Landroid/os/Parcel;I)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEffectEntity;->mEffectType:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method
