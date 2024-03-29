.class public Lcom/miui/gallery/editor/photo/core/imports/filter/FilterBeautify;
.super Lcom/miui/gallery/editor/photo/core/common/model/BeautifyData;
.source "FilterBeautify.java"


# static fields
.field private static BEAUTIFY_ITEM_PRIORITY:S = 0xas

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/miui/gallery/editor/photo/core/imports/filter/FilterBeautify;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mId:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterBeautify$1;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterBeautify$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterBeautify;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;I)V
    .locals 1

    sget-short v0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterBeautify;->BEAUTIFY_ITEM_PRIORITY:S

    invoke-direct {p0, v0, p2, p3}, Lcom/miui/gallery/editor/photo/core/common/model/BeautifyData;-><init>(SLjava/lang/String;I)V

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterBeautify;->mId:I

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/common/model/BeautifyData;-><init>(Landroid/os/Parcel;)V

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterBeautify;->mId:I

    return-void
.end method

.method private getTablePath()Ljava/lang/String;
    .locals 3

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterBeautify;->mId:I

    packed-switch v0, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "not table for this id: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterBeautify;->mId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    const-string v0, "filter/onekey/scene.png"

    return-object v0

    :pswitch_1
    const-string v0, "filter/onekey/food.png"

    return-object v0

    :pswitch_2
    const-string v0, "filter/onekey/portrait.png"

    return-object v0

    :pswitch_3
    const-string v0, "filter/onekey/auto.png"

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public instantiate()Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterBeautify;->mId:I

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/EmptyGPUImageFilter;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/EmptyGPUImageFilter;-><init>()V

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/miui/filtersdk/filter/base/ColorLookupFilter;

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterBeautify;->getTablePath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/filtersdk/filter/base/ColorLookupFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;->isDegreeAdjustSupported()Z

    move-result v1

    if-eqz v1, :cond_1

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;->setDegree(I)V

    :cond_1
    :goto_0
    return-object v0
.end method

.method public isPortraitBeauty()Z
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterBeautify;->mId:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/common/model/BeautifyData;->writeToParcel(Landroid/os/Parcel;I)V

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterBeautify;->mId:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
