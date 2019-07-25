.class public Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;
.super Ljava/lang/Object;
.source "nexOverlayImage.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;,
        Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$runTimeMakeBitMap;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "nexOverlayImage"

.field public static final kOverlayType_Asset:I = 0x6

.field public static final kOverlayType_ResourceImage:I = 0x1

.field public static final kOverlayType_RunTimeImage:I = 0x4

.field public static final kOverlayType_SolidColorImage:I = 0x5

.field public static final kOverlayType_UserImage:I = 0x2

.field public static final kOverlayType_UserVideo:I = 0x3

.field private static sOverlayImageItems:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private anchorPoint:I

.field private cachedOverlayAsset:Lcom/nexstreaming/app/common/nexasset/overlay/OverlayAsset;

.field private mAssetManager:Z

.field private mBitmapHeight:I

.field private mBitmapInSample:I

.field private mBitmapPath:Ljava/lang/String;

.field private mBitmapWidth:I

.field private mHeight:I

.field private mId:Ljava/lang/String;

.field private mMakeBitMap:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$runTimeMakeBitMap;

.field public mRecommandDuration:I

.field protected mResourceId:I

.field private mSolidColor:I

.field private mType:I

.field protected mUpdate:Z

.field private mUpdateInfo:Z

.field private mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

.field private mWidth:I


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapInSample:I

    const/4 v0, 0x4

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->anchorPoint:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mUpdate:Z

    const/4 v1, -0x1

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mRecommandDuration:I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mId:Ljava/lang/String;

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mResourceId:I

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mMakeBitMap:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$runTimeMakeBitMap;

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapPath:Ljava/lang/String;

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mUpdateInfo:Z

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mWidth:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapWidth:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mHeight:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapHeight:I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mSolidColor:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapInSample:I

    const/4 v1, 0x4

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->anchorPoint:I

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mUpdate:Z

    const/4 v2, -0x1

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mRecommandDuration:I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mId:Ljava/lang/String;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mResourceId:I

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mMakeBitMap:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$runTimeMakeBitMap;

    const/16 v1, 0x20

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mWidth:I

    const/16 v2, 0x12

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mHeight:I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapPath:Ljava/lang/String;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapWidth:I

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapHeight:I

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mSolidColor:I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mUpdateInfo:Z

    return-void
.end method

.method constructor <init>(Ljava/lang/String;IILcom/nexstreaming/nexeditorsdk/nexOverlayImage$runTimeMakeBitMap;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapInSample:I

    const/4 v1, 0x4

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->anchorPoint:I

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mUpdate:Z

    const/4 v2, -0x1

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mRecommandDuration:I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mId:Ljava/lang/String;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mResourceId:I

    iput-object p4, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mMakeBitMap:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$runTimeMakeBitMap;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapPath:Ljava/lang/String;

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mWidth:I

    iput p3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mHeight:I

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mUpdateInfo:Z

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mWidth:I

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapWidth:I

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mHeight:I

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapHeight:I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mSolidColor:I

    return-void
.end method

.method constructor <init>(Ljava/lang/String;IILjava/lang/String;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapInSample:I

    const/4 v1, 0x4

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->anchorPoint:I

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mUpdate:Z

    const/4 v2, -0x1

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mRecommandDuration:I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mId:Ljava/lang/String;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mResourceId:I

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mMakeBitMap:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$runTimeMakeBitMap;

    iput-object p4, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapPath:Ljava/lang/String;

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mWidth:I

    iput p3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mHeight:I

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mUpdateInfo:Z

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mWidth:I

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapWidth:I

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mHeight:I

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapHeight:I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mSolidColor:I

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->initSample()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;I)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapInSample:I

    const/4 v1, 0x4

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->anchorPoint:I

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mUpdate:Z

    const/4 v2, -0x1

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mRecommandDuration:I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mId:Ljava/lang/String;

    iput p3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mResourceId:I

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mUpdateInfo:Z

    new-instance p1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {p1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    iput-boolean v0, p1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    iget p3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mResourceId:I

    invoke-static {p2, p3, p1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    iget p2, p1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mWidth:I

    iget p1, p1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mHeight:I

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mMakeBitMap:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$runTimeMakeBitMap;

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapPath:Ljava/lang/String;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapWidth:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapHeight:I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mSolidColor:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/nexClip;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapInSample:I

    const/4 v1, 0x4

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->anchorPoint:I

    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mUpdate:Z

    const/4 v3, -0x1

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mRecommandDuration:I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mId:Ljava/lang/String;

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mResourceId:I

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mMakeBitMap:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$runTimeMakeBitMap;

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapWidth:I

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapHeight:I

    invoke-virtual {p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v3

    if-ne v3, v1, :cond_0

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    invoke-direct {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    invoke-virtual {p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->hasAudio()Z

    move-result v1

    invoke-static {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;->access$002(Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;Z)Z

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    invoke-virtual {p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->hasVideo()Z

    move-result v1

    invoke-static {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;->access$102(Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;Z)Z

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    invoke-virtual {p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRealPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;->access$202(Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;Ljava/lang/String;)Ljava/lang/String;

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    invoke-virtual {p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTotalTime()I

    move-result v1

    invoke-static {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;->access$302(Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;I)I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    invoke-virtual {p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v1

    invoke-static {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;->access$402(Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;I)I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    invoke-virtual {p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result p2

    invoke-static {v0, p2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;->access$502(Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;I)I

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mSolidColor:I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapPath:Ljava/lang/String;

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v1

    if-ne v1, v0, :cond_2

    invoke-virtual {p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->isSolid()Z

    move-result v0

    if-eqz v0, :cond_1

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    invoke-virtual {p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getSolidColor()I

    move-result p2

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mSolidColor:I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapPath:Ljava/lang/String;

    goto :goto_0

    :cond_1
    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mSolidColor:I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    invoke-virtual {p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRealPath()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapPath:Ljava/lang/String;

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->initSample()V

    :goto_0
    return-void

    :cond_2
    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mSolidColor:I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapPath:Ljava/lang/String;

    new-instance p1, Lcom/nexstreaming/nexeditorsdk/exception/nexSDKException;

    const-string p2, "Audio not supported!"

    invoke-direct {p1, p2}, Lcom/nexstreaming/nexeditorsdk/exception/nexSDKException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$runTimeMakeBitMap;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapInSample:I

    const/4 v0, 0x4

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->anchorPoint:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mUpdate:Z

    const/4 v1, -0x1

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mRecommandDuration:I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mId:Ljava/lang/String;

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mResourceId:I

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mMakeBitMap:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$runTimeMakeBitMap;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapPath:Ljava/lang/String;

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapWidth:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapHeight:I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mSolidColor:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapInSample:I

    const/4 v1, 0x4

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->anchorPoint:I

    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mUpdate:Z

    const/4 v3, -0x1

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mRecommandDuration:I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mId:Ljava/lang/String;

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mResourceId:I

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mMakeBitMap:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$runTimeMakeBitMap;

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapPath:Ljava/lang/String;

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mUpdateInfo:Z

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mWidth:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapWidth:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mHeight:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapHeight:I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mSolidColor:I

    invoke-static {p2}, Lcom/nexstreaming/app/common/util/FileType;->fromFile(Ljava/lang/String;)Lcom/nexstreaming/app/common/util/FileType;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/nexstreaming/app/common/util/FileType;->isImage()Z

    move-result v0

    if-eqz v0, :cond_0

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapPath:Ljava/lang/String;

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->initSample()V

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapPath:Ljava/lang/String;

    invoke-static {p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getSupportedClip(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object p1

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result p2

    if-ne p2, v1, :cond_1

    new-instance p2, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    invoke-direct {p2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;-><init>()V

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->hasAudio()Z

    move-result v0

    invoke-static {p2, v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;->access$002(Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;Z)Z

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->hasVideo()Z

    move-result v0

    invoke-static {p2, v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;->access$102(Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;Z)Z

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRealPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;->access$202(Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;Ljava/lang/String;)Ljava/lang/String;

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTotalTime()I

    move-result v0

    invoke-static {p2, v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;->access$302(Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;I)I

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v0

    invoke-static {p2, v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;->access$402(Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;I)I

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result p1

    invoke-static {p2, p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;->access$502(Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;I)I

    :goto_0
    return-void

    :cond_1
    new-instance p1, Lcom/nexstreaming/nexeditorsdk/exception/ClipIsNotVideoException;

    invoke-direct {p1}, Lcom/nexstreaming/nexeditorsdk/exception/ClipIsNotVideoException;-><init>()V

    throw p1

    :cond_2
    new-instance p1, Lcom/nexstreaming/nexeditorsdk/exception/ClipIsNotVideoException;

    invoke-direct {p1}, Lcom/nexstreaming/nexeditorsdk/exception/ClipIsNotVideoException;-><init>()V

    throw p1
.end method

.method constructor <init>(Ljava/lang/String;Z)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapInSample:I

    const/4 v0, 0x4

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->anchorPoint:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mUpdate:Z

    const/4 v1, -0x1

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mRecommandDuration:I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mId:Ljava/lang/String;

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mResourceId:I

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mMakeBitMap:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$runTimeMakeBitMap;

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapPath:Ljava/lang/String;

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mUpdateInfo:Z

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mWidth:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapWidth:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mHeight:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapHeight:I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mSolidColor:I

    iput-boolean p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mAssetManager:Z

    return-void
.end method

.method static allClearRegisterOverlayImage()V
    .locals 1

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->sOverlayImageItems:Ljava/util/Map;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->sOverlayImageItems:Ljava/util/Map;

    :cond_0
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->sOverlayImageItems:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    return-void
.end method

.method private calculateInSampleSize(Landroid/graphics/BitmapFactory$Options;II)I
    .locals 1

    iget v0, p1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iget p1, p1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-gt v0, p3, :cond_1

    if-le p1, p2, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    goto :goto_1

    :cond_1
    :goto_0
    int-to-float v0, v0

    int-to-float p3, p3

    div-float/2addr v0, p3

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result p3

    int-to-float p1, p1

    int-to-float p2, p2

    div-float/2addr p1, p2

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    if-ge p3, p1, :cond_2

    move p1, p3

    :cond_2
    :goto_1
    return p1
.end method

.method protected static clone(Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;)Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;
    .locals 2

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;->clone(Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;)Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    move-result-object v0

    iput-object v0, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    :cond_0
    iget-object p0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mId:Ljava/lang/String;

    iput-object p0, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mId:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    goto :goto_0

    :catch_1
    move-exception p0

    move-object v1, v0

    :goto_0
    invoke-virtual {p0}, Ljava/lang/CloneNotSupportedException;->printStackTrace()V

    :goto_1
    return-object v1
.end method

.method private decodeSampledBitmapFromFile(Ljava/lang/String;II)Landroid/graphics/Bitmap;
    .locals 2

    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapInSample:I

    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    const/4 v1, 0x0

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    invoke-static {p1, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p1

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    if-eq v0, p2, :cond_1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    if-eq v0, p3, :cond_1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-float v0, v0

    int-to-float p3, p3

    div-float/2addr v0, p3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p3

    int-to-float p3, p3

    int-to-float p2, p2

    div-float/2addr p3, p2

    cmpl-float p2, p3, v0

    if-lez p2, :cond_0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p2

    int-to-float p2, p2

    mul-float p2, p2, p3

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    int-to-float v0, v0

    mul-float p3, p3, v0

    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    move-result p3

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p2

    int-to-float p2, p2

    mul-float p2, p2, v0

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p3

    int-to-float p3, p3

    mul-float v0, v0, p3

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result p3

    :goto_0
    const/4 v0, 0x1

    invoke-static {p1, p2, p3, v0}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1

    :cond_1
    return-object p1

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method

.method static getOverlayImage(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;
    .locals 1

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->sOverlayImageItems:Ljava/util/Map;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->sOverlayImageItems:Ljava/util/Map;

    :cond_0
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->sOverlayImageItems:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    return-object p0
.end method

.method private getSolidRect()Landroid/graphics/Bitmap;
    .locals 4

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mSolidColor:I

    const/16 v1, 0x240

    new-array v1, v1, [I

    const/4 v2, 0x0

    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_0

    aput v0, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/16 v2, 0x20

    const/16 v3, 0x12

    invoke-static {v1, v2, v3, v0}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method private getType()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mType:I

    if-nez v0, :cond_5

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mAssetManager:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x6

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mType:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mType:I

    return v0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mMakeBitMap:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$runTimeMakeBitMap;

    if-eqz v0, :cond_1

    const/4 v0, 0x4

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mType:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mType:I

    return v0

    :cond_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    if-eqz v0, :cond_2

    const/4 v0, 0x3

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mType:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mType:I

    return v0

    :cond_2
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mResourceId:I

    if-eqz v0, :cond_3

    const/4 v0, 0x1

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mType:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mType:I

    return v0

    :cond_3
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mSolidColor:I

    if-eqz v0, :cond_4

    const/4 v0, 0x5

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mType:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mType:I

    return v0

    :cond_4
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapPath:Ljava/lang/String;

    if-eqz v0, :cond_5

    const/4 v0, 0x2

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mType:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mType:I

    return v0

    :cond_5
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mType:I

    return v0
.end method

.method private initSample()V
    .locals 5

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapPath:Ljava/lang/String;

    if-eqz v0, :cond_1

    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapPath:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    const/16 v3, 0x2d0

    const/16 v4, 0x500

    if-le v1, v2, :cond_0

    goto :goto_0

    :cond_0
    const/16 v3, 0x500

    const/16 v4, 0x2d0

    :goto_0
    invoke-direct {p0, v0, v3, v4}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->calculateInSampleSize(Landroid/graphics/BitmapFactory$Options;II)I

    move-result v1

    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapInSample:I

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapPath:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mWidth:I

    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mHeight:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mWidth:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapWidth:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mHeight:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapHeight:I

    :cond_1
    return-void
.end method

.method static registerOverlayImage(Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;)Z
    .locals 2

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->sOverlayImageItems:Ljava/util/Map;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->sOverlayImageItems:Ljava/util/Map;

    :cond_0
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->sOverlayImageItems:Ljava/util/Map;

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p0, 0x0

    return p0

    :cond_1
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->sOverlayImageItems:Ljava/util/Map;

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p0, 0x1

    return p0
.end method

.method static unregisterOverlayImage(Ljava/lang/String;)Z
    .locals 1

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->sOverlayImageItems:Ljava/util/Map;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->sOverlayImageItems:Ljava/util/Map;

    :cond_0
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->sOverlayImageItems:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p0, 0x1

    return p0
.end method

.method private updateInfo()V
    .locals 3

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mUpdateInfo:Z

    if-nez v0, :cond_2

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getType()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v2, 0x3

    if-eq v0, v2, :cond_0

    packed-switch v0, :pswitch_data_0

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getUserBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mWidth:I

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mHeight:I

    goto :goto_0

    :pswitch_0
    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getUserBitmap()Landroid/graphics/Bitmap;

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->cachedOverlayAsset:Lcom/nexstreaming/app/common/nexasset/overlay/OverlayAsset;

    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/overlay/OverlayAsset;->getIntrinsicWidth()I

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mWidth:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->cachedOverlayAsset:Lcom/nexstreaming/app/common/nexasset/overlay/OverlayAsset;

    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/overlay/OverlayAsset;->getIntrinsicHeight()I

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mHeight:I

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;->access$400(Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;)I

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mWidth:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;->access$500(Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;)I

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mHeight:I

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mUpdateInfo:Z

    :cond_1
    :goto_0
    :pswitch_1
    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mUpdateInfo:Z

    :cond_2
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x5
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public getAnchorPoint()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->anchorPoint:I

    return v0
.end method

.method getBound(Landroid/graphics/Rect;)V
    .locals 1

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->updateInfo()V

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mWidth:I

    div-int/lit8 v0, v0, 0x2

    rsub-int/lit8 v0, v0, 0x0

    iput v0, p1, Landroid/graphics/Rect;->left:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mHeight:I

    div-int/lit8 v0, v0, 0x2

    rsub-int/lit8 v0, v0, 0x0

    iput v0, p1, Landroid/graphics/Rect;->top:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mWidth:I

    div-int/lit8 v0, v0, 0x2

    add-int/lit8 v0, v0, 0x0

    iput v0, p1, Landroid/graphics/Rect;->right:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mHeight:I

    div-int/lit8 v0, v0, 0x2

    add-int/lit8 v0, v0, 0x0

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    return-void
.end method

.method public getDefaultDuration()I
    .locals 3

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mRecommandDuration:I

    if-gez v0, :cond_1

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getType()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x6

    if-eq v0, v2, :cond_0

    goto :goto_0

    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getOverlayAssetBitmap()Lcom/nexstreaming/app/common/nexasset/overlay/OverlayAsset;

    move-result-object v0

    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/overlay/OverlayAsset;->getDefaultDuration()I

    move-result v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :goto_0
    const/4 v0, 0x0

    :goto_1
    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mRecommandDuration:I

    :cond_1
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mRecommandDuration:I

    return v0
.end method

.method public getHeight()I
    .locals 1

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->updateInfo()V

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mHeight:I

    return v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mId:Ljava/lang/String;

    return-object v0
.end method

.method getOverlayAssetBitmap()Lcom/nexstreaming/app/common/nexasset/overlay/OverlayAsset;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mAssetManager:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->cachedOverlayAsset:Lcom/nexstreaming/app/common/nexasset/overlay/OverlayAsset;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mId:Ljava/lang/String;

    invoke-static {v0}, Lcom/nexstreaming/app/common/nexasset/overlay/OverlayAssetFactory;->forItem(Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/overlay/OverlayAsset;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->cachedOverlayAsset:Lcom/nexstreaming/app/common/nexasset/overlay/OverlayAsset;

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->cachedOverlayAsset:Lcom/nexstreaming/app/common/nexasset/overlay/OverlayAsset;

    return-object v0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public getResourceId()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mResourceId:I

    return v0
.end method

.method protected getUserBitmap()Landroid/graphics/Bitmap;
    .locals 3

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getType()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    packed-switch v0, :pswitch_data_0

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapWidth:I

    if-nez v0, :cond_0

    const/16 v0, 0x500

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapWidth:I

    :cond_0
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapHeight:I

    if-nez v0, :cond_1

    const/16 v0, 0x2d0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapHeight:I

    :cond_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapPath:Ljava/lang/String;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapWidth:I

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapHeight:I

    invoke-direct {p0, v0, v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->decodeSampledBitmapFromFile(Ljava/lang/String;II)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_1

    :pswitch_0
    :try_start_0
    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getOverlayAssetBitmap()Lcom/nexstreaming/app/common/nexasset/overlay/OverlayAsset;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    :pswitch_1
    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getSolidRect()Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_1

    :pswitch_2
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mMakeBitMap:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$runTimeMakeBitMap;

    invoke-interface {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$runTimeMakeBitMap;->makeBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_1

    :goto_0
    :pswitch_3
    const/4 v0, 0x0

    goto :goto_1

    :cond_2
    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->a()Lcom/nexstreaming/kminternal/kinemaster/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->b()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mResourceId:I

    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    :goto_1
    return-object v0

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected getUserBitmapID()Ljava/lang/String;
    .locals 2

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getType()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mMakeBitMap:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$runTimeMakeBitMap;

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mMakeBitMap:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$runTimeMakeBitMap;

    invoke-interface {v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$runTimeMakeBitMap;->getBitmapID()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapPath:Ljava/lang/String;

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapPath:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mId:Ljava/lang/String;

    return-object v0
.end method

.method public getVideoClipInfo()Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mVideoClipInfo:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    return-object v0
.end method

.method public getWidth()I
    .locals 1

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->updateInfo()V

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mWidth:I

    return v0
.end method

.method isAniMate()Z
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mMakeBitMap:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$runTimeMakeBitMap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mMakeBitMap:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$runTimeMakeBitMap;

    invoke-interface {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$runTimeMakeBitMap;->isAniMate()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method isAssetManager()Z
    .locals 2

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getType()I

    move-result v0

    const/4 v1, 0x6

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method isUpdated()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mUpdate:Z

    return v0
.end method

.method isVideo()Z
    .locals 2

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getType()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public releaseBitmap()V
    .locals 0

    return-void
.end method

.method public resizeBitmap(II)V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapWidth:I

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapHeight:I

    :cond_0
    return-void
.end method

.method public setAnchorPoint(I)V
    .locals 0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->anchorPoint:I

    return-void
.end method

.method public setCrop(II)V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapWidth:I

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mBitmapHeight:I

    :cond_0
    return-void
.end method
