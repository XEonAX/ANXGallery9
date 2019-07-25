.class public Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;
.super Ljava/lang/Object;
.source "VideoFrameProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/video/VideoFrameProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ThumbListInfo"
.end annotation


# instance fields
.field private mDuration:J

.field private mHeight:I

.field private mPath:Ljava/lang/String;

.field private mThumbList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private mWidth:I


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/lang/String;IIJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/graphics/Bitmap;",
            ">;",
            "Ljava/lang/String;",
            "IIJ)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;->mThumbList:Ljava/util/List;

    iput-object p2, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;->mPath:Ljava/lang/String;

    iput p3, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;->mWidth:I

    iput p4, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;->mHeight:I

    iput-wide p5, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;->mDuration:J

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1

    if-ne p0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    instance-of v0, p1, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;

    if-nez v0, :cond_1

    const/4 p1, 0x0

    return p1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;->mPath:Ljava/lang/String;

    check-cast p1, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;

    iget-object p1, p1, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;->mPath:Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    return p1
.end method

.method public getDuration()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;->mDuration:J

    return-wide v0
.end method

.method public getHeight()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;->mHeight:I

    return v0
.end method

.method public getThumbList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;->mThumbList:Ljava/util/List;

    return-object v0
.end method

.method public getWidth()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;->mWidth:I

    return v0
.end method

.method public hashCode()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;->mPath:Ljava/lang/String;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;->mPath:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_0
    return v0
.end method
