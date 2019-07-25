.class public Lcom/miui/gallery/provider/MediaSortDateHelper;
.super Ljava/lang/Object;
.source "MediaSortDateHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;,
        Lcom/miui/gallery/provider/MediaSortDateHelper$SingletonHolder;,
        Lcom/miui/gallery/provider/MediaSortDateHelper$SortDateProvider;,
        Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;
    }
.end annotation


# direct methods
.method static synthetic access$000()Lcom/miui/gallery/provider/MediaSortDateHelper$SortDateProvider;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/provider/MediaSortDateHelper;->createSortDateProvider()Lcom/miui/gallery/provider/MediaSortDateHelper$SortDateProvider;

    move-result-object v0

    return-object v0
.end method

.method private static createSortDateProvider()Lcom/miui/gallery/provider/MediaSortDateHelper$SortDateProvider;
    .locals 1

    new-instance v0, Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;

    invoke-direct {v0}, Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;-><init>()V

    return-object v0
.end method

.method public static getSortDateProvider()Lcom/miui/gallery/provider/MediaSortDateHelper$SortDateProvider;
    .locals 1

    sget-object v0, Lcom/miui/gallery/provider/MediaSortDateHelper$SingletonHolder;->INSTANCE:Lcom/miui/gallery/provider/MediaSortDateHelper$SortDateProvider;

    return-object v0
.end method
