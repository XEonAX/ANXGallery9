.class public abstract Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;
.super Lcom/miui/gallery/editor/photo/core/common/model/MosaicData;
.source "MosaicGLEntity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity$TYPE;
    }
.end annotation


# instance fields
.field public final type:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity$TYPE;


# direct methods
.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/common/model/MosaicData;-><init>(Landroid/os/Parcel;)V

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity$TYPE;->values()[Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity$TYPE;

    move-result-object v0

    aget-object p1, v0, p1

    :goto_0
    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;->type:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity$TYPE;

    return-void
.end method

.method public constructor <init>(SLjava/lang/String;Ljava/lang/String;Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity$TYPE;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/editor/photo/core/common/model/MosaicData;-><init>(SLjava/lang/String;Ljava/lang/String;)V

    iput-object p4, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;->type:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity$TYPE;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/common/model/MosaicData;->writeToParcel(Landroid/os/Parcel;I)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;->type:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity$TYPE;

    if-nez p2, :cond_0

    const/4 p2, -0x1

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;->type:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity$TYPE;

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity$TYPE;->ordinal()I

    move-result p2

    :goto_0
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
