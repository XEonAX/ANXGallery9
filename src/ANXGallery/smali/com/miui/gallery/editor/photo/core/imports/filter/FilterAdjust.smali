.class public Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust;
.super Lcom/miui/gallery/editor/photo/core/common/model/AdjustData;
.source "FilterAdjust.java"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mId:I

.field private mIsMid:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust$1;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(ISLjava/lang/String;IZ)V
    .locals 0

    invoke-direct {p0, p2, p3, p4}, Lcom/miui/gallery/editor/photo/core/common/model/AdjustData;-><init>(SLjava/lang/String;I)V

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust;->mId:I

    iput-boolean p5, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust;->mIsMid:Z

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/common/model/AdjustData;-><init>(Landroid/os/Parcel;)V

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust;->mId:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust;->mIsMid:Z

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getMax()I
    .locals 1

    const/16 v0, 0x64

    return v0
.end method

.method public getMin()I
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust;->mIsMid:Z

    if-eqz v0, :cond_0

    const/16 v0, -0x64

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public instantiate()Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;
    .locals 3

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust;->progress:I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust;->getMin()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust;->getMax()I

    move-result v1

    mul-int v0, v0, v1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust;->getMax()I

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust;->getMin()I

    move-result v2

    sub-int/2addr v1, v2

    div-int/2addr v0, v1

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust;->mId:I

    packed-switch v1, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "not support adjust id: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust;->mId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageVignetteFilter;

    invoke-direct {v1, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageVignetteFilter;-><init>(I)V

    return-object v1

    :pswitch_1
    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;

    invoke-direct {v1, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;-><init>(I)V

    return-object v1

    :pswitch_2
    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSaturationFilter;

    invoke-direct {v1, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSaturationFilter;-><init>(I)V

    return-object v1

    :pswitch_3
    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUContrastFilter;

    invoke-direct {v1, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUContrastFilter;-><init>(I)V

    return-object v1

    :pswitch_4
    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUBrightnessFilter;

    invoke-direct {v1, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUBrightnessFilter;-><init>(I)V

    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public isMid()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust;->mIsMid:Z

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/common/model/AdjustData;->writeToParcel(Landroid/os/Parcel;I)V

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust;->mId:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget-boolean p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust;->mIsMid:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    return-void
.end method
