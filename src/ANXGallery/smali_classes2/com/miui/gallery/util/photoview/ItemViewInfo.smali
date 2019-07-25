.class public Lcom/miui/gallery/util/photoview/ItemViewInfo;
.super Ljava/lang/Object;
.source "ItemViewInfo.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/miui/gallery/util/photoview/ItemViewInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mAdapterPos:I

.field private mHeight:I

.field private mWidth:I

.field private mX:I

.field private mY:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/util/photoview/ItemViewInfo$1;

    invoke-direct {v0}, Lcom/miui/gallery/util/photoview/ItemViewInfo$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/util/photoview/ItemViewInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(IIIII)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/miui/gallery/util/photoview/ItemViewInfo;->mAdapterPos:I

    iput p2, p0, Lcom/miui/gallery/util/photoview/ItemViewInfo;->mX:I

    iput p3, p0, Lcom/miui/gallery/util/photoview/ItemViewInfo;->mY:I

    iput p4, p0, Lcom/miui/gallery/util/photoview/ItemViewInfo;->mWidth:I

    iput p5, p0, Lcom/miui/gallery/util/photoview/ItemViewInfo;->mHeight:I

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/util/photoview/ItemViewInfo;->mAdapterPos:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/util/photoview/ItemViewInfo;->mX:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/util/photoview/ItemViewInfo;->mY:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/util/photoview/ItemViewInfo;->mWidth:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/util/photoview/ItemViewInfo;->mHeight:I

    return-void
.end method

.method public static getImageInfo(IILandroid/view/View;I)Lcom/miui/gallery/util/photoview/ItemViewInfo;
    .locals 7

    if-nez p2, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    new-instance v6, Lcom/miui/gallery/util/photoview/ItemViewInfo;

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v4

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result v5

    move-object v0, v6

    move v1, p3

    move v2, p0

    move v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/util/photoview/ItemViewInfo;-><init>(IIIII)V

    return-object v6
.end method

.method public static getImageInfo(Landroid/view/View;I)Lcom/miui/gallery/util/photoview/ItemViewInfo;
    .locals 8

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const/4 v0, 0x2

    new-array v0, v0, [I

    invoke-virtual {p0, v0}, Landroid/view/View;->getLocationInWindow([I)V

    new-instance v7, Lcom/miui/gallery/util/photoview/ItemViewInfo;

    const/4 v1, 0x0

    aget v3, v0, v1

    const/4 v1, 0x1

    aget v4, v0, v1

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v5

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v6

    move-object v1, v7

    move v2, p1

    invoke-direct/range {v1 .. v6}, Lcom/miui/gallery/util/photoview/ItemViewInfo;-><init>(IIIII)V

    return-object v7
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getHeight()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/util/photoview/ItemViewInfo;->mHeight:I

    return v0
.end method

.method public getPosition()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/util/photoview/ItemViewInfo;->mAdapterPos:I

    return v0
.end method

.method public getWidth()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/util/photoview/ItemViewInfo;->mWidth:I

    return v0
.end method

.method public getX()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/util/photoview/ItemViewInfo;->mX:I

    return v0
.end method

.method public getY()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/util/photoview/ItemViewInfo;->mY:I

    return v0
.end method

.method public isLocationValid()Z
    .locals 2

    iget v0, p0, Lcom/miui/gallery/util/photoview/ItemViewInfo;->mX:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/miui/gallery/util/photoview/ItemViewInfo;->mY:I

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mPos: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/miui/gallery/util/photoview/ItemViewInfo;->mAdapterPos:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " mX: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/miui/gallery/util/photoview/ItemViewInfo;->mX:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " mY: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/miui/gallery/util/photoview/ItemViewInfo;->mY:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " mWidth: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/miui/gallery/util/photoview/ItemViewInfo;->mWidth:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " mHeight: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/miui/gallery/util/photoview/ItemViewInfo;->mHeight:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    iget p2, p0, Lcom/miui/gallery/util/photoview/ItemViewInfo;->mAdapterPos:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget p2, p0, Lcom/miui/gallery/util/photoview/ItemViewInfo;->mX:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget p2, p0, Lcom/miui/gallery/util/photoview/ItemViewInfo;->mY:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget p2, p0, Lcom/miui/gallery/util/photoview/ItemViewInfo;->mWidth:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget p2, p0, Lcom/miui/gallery/util/photoview/ItemViewInfo;->mHeight:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
