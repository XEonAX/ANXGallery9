.class public abstract Lcom/miui/gallery/editor/photo/core/common/model/AdjustData;
.super Lcom/miui/gallery/editor/photo/core/common/model/RenderMetaData;
.source "AdjustData.java"


# instance fields
.field public final icon:I

.field public progress:I


# direct methods
.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/common/model/RenderMetaData;-><init>(Landroid/os/Parcel;)V

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/common/model/AdjustData;->icon:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/common/model/AdjustData;->progress:I

    return-void
.end method

.method public constructor <init>(SLjava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/common/model/RenderMetaData;-><init>(SLjava/lang/String;)V

    iput p3, p0, Lcom/miui/gallery/editor/photo/core/common/model/AdjustData;->icon:I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/common/model/AdjustData;->getMin()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/common/model/AdjustData;->progress:I

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public abstract getMax()I
.end method

.method public abstract getMin()I
.end method

.method public abstract isMid()Z
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/common/model/RenderMetaData;->writeToParcel(Landroid/os/Parcel;I)V

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/common/model/AdjustData;->icon:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/common/model/AdjustData;->progress:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
