.class public final Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;
.super Ljava/lang/Object;
.source "BabyAlbumRecommendationFinder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "RecommendationDatas"
.end annotation


# instance fields
.field public ids:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public peopleLocalId:Ljava/lang/String;

.field public peopleServerId:Ljava/lang/String;

.field public totalFaceCountInFaceAlbum:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getRecommendationSize()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;->ids:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;->ids:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public hasNewRecommendation()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;->ids:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/baby/BabyAlbumRecommendationFinder$RecommendationDatas;->ids:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
