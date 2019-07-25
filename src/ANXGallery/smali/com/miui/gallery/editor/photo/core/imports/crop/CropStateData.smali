.class Lcom/miui/gallery/editor/photo/core/imports/crop/CropStateData;
.super Lcom/miui/gallery/editor/photo/core/RenderData;
.source "CropStateData.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/core/common/model/IPositionChangeData;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/miui/gallery/editor/photo/core/imports/crop/CropStateData;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final mEntry:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ParcelableCropEntry;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropStateData$1;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/crop/CropStateData$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropStateData;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/RenderData;-><init>(Landroid/os/Parcel;)V

    const-class v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ParcelableCropEntry;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ParcelableCropEntry;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropStateData;->mEntry:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ParcelableCropEntry;

    return-void
.end method

.method constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ParcelableCropEntry;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/RenderData;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropStateData;->mEntry:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ParcelableCropEntry;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public refreshTargetAreaPosition(Landroid/graphics/RectF;Landroid/graphics/RectF;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropStateData;->mEntry:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ParcelableCropEntry;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ParcelableCropEntry;->refreshTargetAreaPosition(Landroid/graphics/RectF;Landroid/graphics/RectF;)V

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/RenderData;->writeToParcel(Landroid/os/Parcel;I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropStateData;->mEntry:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ParcelableCropEntry;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    return-void
.end method
