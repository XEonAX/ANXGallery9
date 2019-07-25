.class public Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;
.super Lcom/miui/gallery/editor/photo/core/common/model/FilterData;
.source "FilterItem.java"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;",
            ">;"
        }
    .end annotation
.end field

.field private static FILTER_ITEM_PRIORITY:S = 0xas


# instance fields
.field private mDefault:I

.field private mIsFilePath:Z

.field private mIsSkyTransfer:Z

.field private mTablePath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem$1;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 3

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;-><init>(Landroid/os/Parcel;)V

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->mTablePath:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->mDefault:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->mIsFilePath:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result p1

    if-eqz p1, :cond_1

    const/4 v1, 0x1

    :cond_1
    iput-boolean v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->mIsSkyTransfer:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 1

    sget-short v0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->FILTER_ITEM_PRIORITY:S

    invoke-direct {p0, v0, p1, p2}, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;-><init>(SLjava/lang/String;I)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;II)V
    .locals 1

    sget-short v0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->FILTER_ITEM_PRIORITY:S

    invoke-direct {p0, v0, p2, p3}, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;-><init>(SLjava/lang/String;I)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->mTablePath:Ljava/lang/String;

    iput p4, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->mDefault:I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->getDefault()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->progress:I

    return-void
.end method

.method public constructor <init>(ZLjava/lang/String;I)V
    .locals 1

    sget-short v0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->FILTER_ITEM_PRIORITY:S

    invoke-direct {p0, v0, p2, p3}, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;-><init>(SLjava/lang/String;I)V

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->mIsSkyTransfer:Z

    return-void
.end method

.method public constructor <init>(ZLjava/lang/String;Ljava/lang/String;II)V
    .locals 0

    invoke-direct {p0, p2, p3, p4, p5}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->mIsSkyTransfer:Z

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getDefault()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->mDefault:I

    return v0
.end method

.method public getSkyPath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->mTablePath:Ljava/lang/String;

    return-object v0
.end method

.method public instantiate()Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->mTablePath:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/EmptyGPUImageFilter;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/EmptyGPUImageFilter;-><init>()V

    return-object v0

    :cond_0
    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->mIsFilePath:Z

    if-eqz v0, :cond_1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PathLUTFilter;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->mTablePath:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PathLUTFilter;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    new-instance v0, Lcom/miui/filtersdk/filter/base/ColorLookupFilter;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->mTablePath:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/miui/filtersdk/filter/base/ColorLookupFilter;-><init>(Ljava/lang/String;)V

    :goto_0
    invoke-virtual {v0}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;->isDegreeAdjustSupported()Z

    move-result v1

    if-eqz v1, :cond_2

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->progress:I

    invoke-virtual {v0, v1}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;->setDegree(I)V

    :cond_2
    return-object v0
.end method

.method public isNone()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->mTablePath:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    return v0
.end method

.method public isSkyTransfer()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->mIsSkyTransfer:Z

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;->writeToParcel(Landroid/os/Parcel;I)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->mTablePath:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->mDefault:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget-boolean p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->mIsFilePath:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    iget-boolean p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->mIsSkyTransfer:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    return-void
.end method
