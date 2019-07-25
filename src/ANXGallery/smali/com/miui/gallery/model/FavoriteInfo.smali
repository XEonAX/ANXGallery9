.class public Lcom/miui/gallery/model/FavoriteInfo;
.super Ljava/lang/Object;
.source "FavoriteInfo.java"


# instance fields
.field private mIsFavorite:Z

.field private mIsFavoriteUsable:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isFavorite()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/model/FavoriteInfo;->mIsFavorite:Z

    return v0
.end method

.method public isFavoriteUsable()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/model/FavoriteInfo;->mIsFavoriteUsable:Z

    return v0
.end method

.method public setFavorite(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/model/FavoriteInfo;->mIsFavorite:Z

    return-void
.end method

.method public setFavoriteUsable(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/model/FavoriteInfo;->mIsFavoriteUsable:Z

    return-void
.end method
