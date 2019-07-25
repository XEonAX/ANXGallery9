.class public abstract Lcom/miui/gallery/editor/photo/core/common/model/FilterData;
.super Lcom/miui/gallery/editor/photo/core/common/model/RenderMetaData;
.source "FilterData.java"


# instance fields
.field public final icon:I

.field public progress:I


# direct methods
.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/common/model/RenderMetaData;-><init>(Landroid/os/Parcel;)V

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;->icon:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;->progress:I

    return-void
.end method

.method public constructor <init>(SLjava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/common/model/RenderMetaData;-><init>(SLjava/lang/String;)V

    iput p3, p0, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;->icon:I

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    check-cast p1, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;->name:Ljava/lang/String;

    iget-object v2, p1, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;->priority:I

    iget p1, p1, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;->priority:I

    if-ne v1, p1, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;->priority:I

    add-int/2addr v0, v1

    return v0
.end method

.method public abstract isNone()Z
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/common/model/RenderMetaData;->writeToParcel(Landroid/os/Parcel;I)V

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;->icon:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;->progress:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
