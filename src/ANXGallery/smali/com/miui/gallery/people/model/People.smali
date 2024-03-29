.class public Lcom/miui/gallery/people/model/People;
.super Ljava/lang/Object;
.source "People.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/miui/gallery/people/model/People;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mCoverFaceRect:Landroid/graphics/RectF;

.field private mCoverImageId:J

.field private mCoverPath:Ljava/lang/String;

.field private mCoverType:Lcom/miui/gallery/sdk/download/DownloadType;

.field private mFaceCount:I

.field private mId:J

.field private mName:Ljava/lang/String;

.field private mRelationText:Ljava/lang/String;

.field private mRelationType:I

.field private mServerId:Ljava/lang/String;

.field private mVisibilityType:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/people/model/People$1;

    invoke-direct {v0}, Lcom/miui/gallery/people/model/People$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/people/model/People;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getCoverFaceRect()Landroid/graphics/RectF;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/people/model/People;->mCoverFaceRect:Landroid/graphics/RectF;

    return-object v0
.end method

.method public getCoverImageId()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/people/model/People;->mCoverImageId:J

    return-wide v0
.end method

.method public getCoverPath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/people/model/People;->mCoverPath:Ljava/lang/String;

    return-object v0
.end method

.method public getCoverType()Lcom/miui/gallery/sdk/download/DownloadType;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/people/model/People;->mCoverType:Lcom/miui/gallery/sdk/download/DownloadType;

    return-object v0
.end method

.method public getFaceCount()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/people/model/People;->mFaceCount:I

    return v0
.end method

.method public getId()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/people/model/People;->mId:J

    return-wide v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/people/model/People;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getRelationType()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/people/model/People;->mRelationType:I

    return v0
.end method

.method public readFromParcel(Landroid/os/Parcel;)V
    .locals 2

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/people/model/People;->mId:J

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/people/model/People;->mServerId:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/people/model/People;->mName:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/people/model/People;->mRelationType:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/people/model/People;->mRelationText:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/people/model/People;->mCoverImageId:J

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/people/model/People;->mCoverPath:Ljava/lang/String;

    const-class v0, Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/sdk/download/DownloadType;

    iput-object v0, p0, Lcom/miui/gallery/people/model/People;->mCoverType:Lcom/miui/gallery/sdk/download/DownloadType;

    const-class v0, Landroid/graphics/RectF;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/graphics/RectF;

    iput-object v0, p0, Lcom/miui/gallery/people/model/People;->mCoverFaceRect:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/people/model/People;->mFaceCount:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/people/model/People;->mVisibilityType:I

    return-void
.end method

.method public setCoverFaceRect(Landroid/graphics/RectF;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/people/model/People;->mCoverFaceRect:Landroid/graphics/RectF;

    return-void
.end method

.method public setCoverImageId(J)V
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/people/model/People;->mCoverImageId:J

    return-void
.end method

.method public setCoverPath(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/people/model/People;->mCoverPath:Ljava/lang/String;

    return-void
.end method

.method public setCoverType(Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/people/model/People;->mCoverType:Lcom/miui/gallery/sdk/download/DownloadType;

    return-void
.end method

.method public setFaceCount(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/people/model/People;->mFaceCount:I

    return-void
.end method

.method public setId(J)V
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/people/model/People;->mId:J

    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/people/model/People;->mName:Ljava/lang/String;

    return-void
.end method

.method public setRelationText(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/people/model/People;->mRelationText:Ljava/lang/String;

    return-void
.end method

.method public setRelationType(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/people/model/People;->mRelationType:I

    return-void
.end method

.method public setServerId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/people/model/People;->mServerId:Ljava/lang/String;

    return-void
.end method

.method public setVisibilityType(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/people/model/People;->mVisibilityType:I

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/people/model/People;->mId:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    iget-object v0, p0, Lcom/miui/gallery/people/model/People;->mServerId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/people/model/People;->mName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget v0, p0, Lcom/miui/gallery/people/model/People;->mRelationType:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget-object v0, p0, Lcom/miui/gallery/people/model/People;->mRelationText:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-wide v0, p0, Lcom/miui/gallery/people/model/People;->mCoverImageId:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    iget-object v0, p0, Lcom/miui/gallery/people/model/People;->mCoverPath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/people/model/People;->mCoverType:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    iget-object v0, p0, Lcom/miui/gallery/people/model/People;->mCoverFaceRect:Landroid/graphics/RectF;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    iget p2, p0, Lcom/miui/gallery/people/model/People;->mFaceCount:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget p2, p0, Lcom/miui/gallery/people/model/People;->mVisibilityType:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
