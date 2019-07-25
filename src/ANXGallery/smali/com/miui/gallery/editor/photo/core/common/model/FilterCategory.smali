.class public abstract Lcom/miui/gallery/editor/photo/core/common/model/FilterCategory;
.super Lcom/miui/gallery/editor/photo/core/Metadata;
.source "FilterCategory.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field public highlighColor:I

.field public subHighlighColor:I

.field public subItemSize:I


# direct methods
.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/Metadata;-><init>(Landroid/os/Parcel;)V

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/common/model/FilterCategory;->highlighColor:I

    return-void
.end method

.method public constructor <init>(SLjava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/Metadata;-><init>(SLjava/lang/String;)V

    iput p3, p0, Lcom/miui/gallery/editor/photo/core/common/model/FilterCategory;->highlighColor:I

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public abstract getDownloadPercent()F
.end method

.method public abstract getDownloadState()I
.end method

.method public abstract getFilterCategory()I
.end method

.method public abstract getFilterDatas()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/miui/gallery/editor/photo/core/common/model/FilterData;",
            ">;"
        }
    .end annotation
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/Metadata;->writeToParcel(Landroid/os/Parcel;I)V

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/common/model/FilterCategory;->highlighColor:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
