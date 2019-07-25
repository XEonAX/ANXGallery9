.class public Lcom/miui/gallery/movie/entity/MovieShareData;
.super Ljava/lang/Object;
.source "MovieShareData.java"


# instance fields
.field private mIsShortVideo:Z

.field private mLongVideoPath:Ljava/lang/String;

.field private mShortVideoPath:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getVideoPath()Ljava/lang/String;
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/movie/entity/MovieShareData;->mIsShortVideo:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/movie/entity/MovieShareData;->mShortVideoPath:Ljava/lang/String;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/movie/entity/MovieShareData;->mLongVideoPath:Ljava/lang/String;

    :goto_0
    return-object v0
.end method

.method public reset(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/movie/entity/MovieShareData;->mIsShortVideo:Z

    const-string p1, ""

    iput-object p1, p0, Lcom/miui/gallery/movie/entity/MovieShareData;->mShortVideoPath:Ljava/lang/String;

    const-string p1, ""

    iput-object p1, p0, Lcom/miui/gallery/movie/entity/MovieShareData;->mLongVideoPath:Ljava/lang/String;

    return-void
.end method

.method public setShortVideo(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/movie/entity/MovieShareData;->mIsShortVideo:Z

    return-void
.end method

.method public setVideoPath(Ljava/lang/String;Z)V
    .locals 0

    iput-boolean p2, p0, Lcom/miui/gallery/movie/entity/MovieShareData;->mIsShortVideo:Z

    if-eqz p2, :cond_0

    iput-object p1, p0, Lcom/miui/gallery/movie/entity/MovieShareData;->mShortVideoPath:Ljava/lang/String;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/miui/gallery/movie/entity/MovieShareData;->mLongVideoPath:Ljava/lang/String;

    :goto_0
    return-void
.end method
