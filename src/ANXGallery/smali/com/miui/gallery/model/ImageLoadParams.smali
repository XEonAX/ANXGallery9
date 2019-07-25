.class public Lcom/miui/gallery/model/ImageLoadParams;
.super Ljava/lang/Object;
.source "ImageLoadParams.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/miui/gallery/model/ImageLoadParams;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mDisplayOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

.field private mFileLength:J

.field private mFilePath:Ljava/lang/String;

.field private mFromCamera:Z

.field private mFromFace:Z

.field private mInitPosition:I

.field private mKey:J

.field private mMimeType:Ljava/lang/String;

.field private mRegionRect:Landroid/graphics/RectF;

.field private mSecretKey:[B

.field private mTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/model/ImageLoadParams$1;

    invoke-direct {v0}, Lcom/miui/gallery/model/ImageLoadParams$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/model/ImageLoadParams;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(JLjava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ILjava/lang/String;J)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/miui/gallery/model/ImageLoadParams;->mKey:J

    iput-object p3, p0, Lcom/miui/gallery/model/ImageLoadParams;->mFilePath:Ljava/lang/String;

    iput-object p4, p0, Lcom/miui/gallery/model/ImageLoadParams;->mTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    iput-object p5, p0, Lcom/miui/gallery/model/ImageLoadParams;->mRegionRect:Landroid/graphics/RectF;

    iput p6, p0, Lcom/miui/gallery/model/ImageLoadParams;->mInitPosition:I

    iput-object p7, p0, Lcom/miui/gallery/model/ImageLoadParams;->mMimeType:Ljava/lang/String;

    iput-wide p8, p0, Lcom/miui/gallery/model/ImageLoadParams;->mFileLength:J

    return-void
.end method

.method public constructor <init>(JLjava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ILjava/lang/String;ZJ)V
    .locals 10

    move-object v0, p0

    move-wide v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move/from16 v6, p6

    move-object/from16 v7, p7

    move-wide/from16 v8, p9

    invoke-direct/range {v0 .. v9}, Lcom/miui/gallery/model/ImageLoadParams;-><init>(JLjava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ILjava/lang/String;J)V

    move/from16 v1, p8

    iput-boolean v1, v0, Lcom/miui/gallery/model/ImageLoadParams;->mFromFace:Z

    return-void
.end method

.method public constructor <init>(JLjava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ILjava/lang/String;[BJ)V
    .locals 10

    move-object v0, p0

    move-wide v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move/from16 v6, p6

    move-object/from16 v7, p7

    move-wide/from16 v8, p9

    invoke-direct/range {v0 .. v9}, Lcom/miui/gallery/model/ImageLoadParams;-><init>(JLjava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ILjava/lang/String;J)V

    move-object/from16 v1, p8

    iput-object v1, v0, Lcom/miui/gallery/model/ImageLoadParams;->mSecretKey:[B

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/model/ImageLoadParams;->mKey:J

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/model/ImageLoadParams;->mFilePath:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    iput-object v0, p0, Lcom/miui/gallery/model/ImageLoadParams;->mTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    const-class v0, Landroid/graphics/RectF;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/graphics/RectF;

    iput-object v0, p0, Lcom/miui/gallery/model/ImageLoadParams;->mRegionRect:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/model/ImageLoadParams;->mInitPosition:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/model/ImageLoadParams;->mMimeType:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-lez v0, :cond_0

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/miui/gallery/model/ImageLoadParams;->mSecretKey:[B

    iget-object v0, p0, Lcom/miui/gallery/model/ImageLoadParams;->mSecretKey:[B

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readByteArray([B)V

    :cond_0
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/miui/gallery/model/ImageLoadParams;->mFromFace:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-ne v0, v2, :cond_2

    const/4 v1, 0x1

    :cond_2
    iput-boolean v1, p0, Lcom/miui/gallery/model/ImageLoadParams;->mFromCamera:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/model/ImageLoadParams;->mFileLength:J

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    if-eqz p1, :cond_0

    instance-of v0, p1, Lcom/miui/gallery/model/ImageLoadParams;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/model/ImageLoadParams;->getKey()J

    move-result-wide v0

    check-cast p1, Lcom/miui/gallery/model/ImageLoadParams;

    invoke-virtual {p1}, Lcom/miui/gallery/model/ImageLoadParams;->getKey()J

    move-result-wide v2

    cmp-long p1, v0, v2

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public getDisplayImageOptions()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/ImageLoadParams;->mDisplayOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-object v0
.end method

.method public getFileLength()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/model/ImageLoadParams;->mFileLength:J

    return-wide v0
.end method

.method public getKey()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/model/ImageLoadParams;->mKey:J

    return-wide v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/ImageLoadParams;->mFilePath:Ljava/lang/String;

    return-object v0
.end method

.method public getPos()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/model/ImageLoadParams;->mInitPosition:I

    return v0
.end method

.method public getRegionRectF()Landroid/graphics/RectF;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/ImageLoadParams;->mRegionRect:Landroid/graphics/RectF;

    return-object v0
.end method

.method public getSecretKey()[B
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/ImageLoadParams;->mSecretKey:[B

    return-object v0
.end method

.method public getTargetSize()Lcom/nostra13/universalimageloader/core/assist/ImageSize;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/ImageLoadParams;->mTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    new-instance v0, Ljava/lang/Long;

    invoke-virtual {p0}, Lcom/miui/gallery/model/ImageLoadParams;->getKey()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/lang/Long;-><init>(J)V

    invoke-virtual {v0}, Ljava/lang/Long;->hashCode()I

    move-result v0

    return v0
.end method

.method public isFromFace()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/model/ImageLoadParams;->mFromFace:Z

    return v0
.end method

.method public isGif()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/ImageLoadParams;->mMimeType:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/util/FileMimeUtil;->isGifFromMimeType(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSecret()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/ImageLoadParams;->mSecretKey:[B

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/model/ImageLoadParams;->mSecretKey:[B

    array-length v0, v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isVideo()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/ImageLoadParams;->mMimeType:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/util/FileMimeUtil;->isVideoFromMimeType(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public match(Lcom/miui/gallery/model/BaseDataItem;I)Z
    .locals 5

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-nez p1, :cond_1

    iget p1, p0, Lcom/miui/gallery/model/ImageLoadParams;->mInitPosition:I

    if-ne p2, p1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0

    :cond_1
    iget-wide v2, p0, Lcom/miui/gallery/model/ImageLoadParams;->mKey:J

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getKey()J

    move-result-wide p1

    cmp-long v4, v2, p1

    if-nez v4, :cond_2

    const/4 v0, 0x1

    :cond_2
    return v0
.end method

.method public setDisplayImageOptions(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/model/ImageLoadParams;->mDisplayOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-void
.end method

.method public setFromCamera(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/model/ImageLoadParams;->mFromCamera:Z

    return-void
.end method

.method public setPath(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/model/ImageLoadParams;->mFilePath:Ljava/lang/String;

    return-void
.end method

.method public updatePosition(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/model/ImageLoadParams;->mInitPosition:I

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/model/ImageLoadParams;->mKey:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    iget-object v0, p0, Lcom/miui/gallery/model/ImageLoadParams;->mFilePath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/model/ImageLoadParams;->mTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    iget-object v0, p0, Lcom/miui/gallery/model/ImageLoadParams;->mRegionRect:Landroid/graphics/RectF;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    iget p2, p0, Lcom/miui/gallery/model/ImageLoadParams;->mInitPosition:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget-object p2, p0, Lcom/miui/gallery/model/ImageLoadParams;->mMimeType:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/miui/gallery/model/ImageLoadParams;->mSecretKey:[B

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/model/ImageLoadParams;->mSecretKey:[B

    array-length p2, p2

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget-object p2, p0, Lcom/miui/gallery/model/ImageLoadParams;->mSecretKey:[B

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/model/ImageLoadParams;->mSecretKey:[B

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByteArray([B)V

    :cond_1
    iget-boolean p2, p0, Lcom/miui/gallery/model/ImageLoadParams;->mFromFace:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget-boolean p2, p0, Lcom/miui/gallery/model/ImageLoadParams;->mFromCamera:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget-wide v0, p0, Lcom/miui/gallery/model/ImageLoadParams;->mFileLength:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    return-void
.end method
