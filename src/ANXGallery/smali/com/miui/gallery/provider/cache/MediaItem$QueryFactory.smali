.class public Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory;
.super Ljava/lang/Object;
.source "MediaItem.java"

# interfaces
.implements Lcom/miui/gallery/provider/cache/CacheItem$QueryFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cache/MediaItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "QueryFactory"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$SizeFilter;,
        Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$LocationFilter;,
        Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$AlbumServerIdFilter;,
        Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$MineTypeFilter;,
        Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$AliasCreateDateFilter;,
        Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$ServerIdFilter;,
        Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$ServerTagFilter;,
        Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$SyncStateFilter;,
        Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$Sha1Filter;,
        Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$LocalFileFilter;,
        Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$ThumbnailFilter;,
        Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$LocalFlagFilter;,
        Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TypeFilter;,
        Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$AlbumFilter;,
        Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$IdFilter;,
        Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TitleFilter;,
        Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$SizeComparator;,
        Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TitleComparator;,
        Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TimeComparator;,
        Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$SortTimeComparator;,
        Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$DateModifiedComparator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/provider/cache/CacheItem$QueryFactory<",
        "Lcom/miui/gallery/provider/cache/MediaItem;",
        ">;"
    }
.end annotation


# static fields
.field private static final COLUMN_MAPPER:Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;

.field private static IS_FAVORITE_FILTER:Lcom/miui/gallery/provider/cache/Filter$CompareFilter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/provider/cache/Filter$CompareFilter<",
            "Lcom/miui/gallery/provider/cache/MediaItem;",
            ">;"
        }
    .end annotation
.end field

.field private static NOT_HIDDEN_FILTER:Lcom/miui/gallery/provider/cache/Filter$CompareFilter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/provider/cache/Filter$CompareFilter<",
            "Lcom/miui/gallery/provider/cache/MediaItem;",
            ">;"
        }
    .end annotation
.end field

.field private static final SHA1_MERGER:Lcom/miui/gallery/provider/cache/CacheItem$Merger;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/provider/cache/CacheItem$Merger<",
            "Lcom/miui/gallery/provider/cache/MediaItem;",
            ">;"
        }
    .end annotation
.end field

.field private static SHOW_IN_HOMEPAGE_FILTER:Lcom/miui/gallery/provider/cache/Filter$CompareFilter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/provider/cache/Filter$CompareFilter<",
            "Lcom/miui/gallery/provider/cache/MediaItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$1;

    invoke-direct {v0}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory;->SHA1_MERGER:Lcom/miui/gallery/provider/cache/CacheItem$Merger;

    new-instance v0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$2;

    const/4 v1, 0x0

    const/16 v2, 0x18

    invoke-direct {v0, v2, v1, v1}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$2;-><init>(ILcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory;->SHOW_IN_HOMEPAGE_FILTER:Lcom/miui/gallery/provider/cache/Filter$CompareFilter;

    new-instance v0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$3;

    const/16 v2, 0x1b

    invoke-direct {v0, v2, v1, v1}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$3;-><init>(ILcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory;->NOT_HIDDEN_FILTER:Lcom/miui/gallery/provider/cache/Filter$CompareFilter;

    new-instance v0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$4;

    const/16 v2, 0x21

    invoke-direct {v0, v2, v1, v1}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$4;-><init>(ILcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory;->IS_FAVORITE_FILTER:Lcom/miui/gallery/provider/cache/Filter$CompareFilter;

    new-instance v0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$5;

    invoke-direct {v0}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$5;-><init>()V

    sput-object v0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory;->COLUMN_MAPPER:Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getComparator(IZ)Ljava/util/Comparator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IZ)",
            "Ljava/util/Comparator<",
            "Lcom/miui/gallery/provider/cache/MediaItem;",
            ">;"
        }
    .end annotation

    const/16 v0, 0x12

    if-ne p1, v0, :cond_0

    new-instance p1, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TimeComparator;

    invoke-direct {p1, p2}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TimeComparator;-><init>(Z)V

    return-object p1

    :cond_0
    const/4 v0, 0x7

    if-ne p1, v0, :cond_1

    new-instance p1, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TitleComparator;

    invoke-direct {p1, p2}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TitleComparator;-><init>(Z)V

    return-object p1

    :cond_1
    const/16 v0, 0xa

    if-ne p1, v0, :cond_2

    new-instance p1, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$SizeComparator;

    invoke-direct {p1, p2}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$SizeComparator;-><init>(Z)V

    return-object p1

    :cond_2
    const/16 v0, 0x1e

    if-ne p1, v0, :cond_3

    new-instance p1, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$DateModifiedComparator;

    invoke-direct {p1, p2}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$DateModifiedComparator;-><init>(Z)V

    return-object p1

    :cond_3
    const/16 v0, 0x24

    if-ne p1, v0, :cond_4

    new-instance p1, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$SortTimeComparator;

    invoke-direct {p1, p2}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$SortTimeComparator;-><init>(Z)V

    return-object p1

    :cond_4
    const/4 p1, 0x0

    return-object p1
.end method

.method public getFilter(ILcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)Lcom/miui/gallery/provider/cache/Filter$CompareFilter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/miui/gallery/provider/cache/Filter$Comparator;",
            "Ljava/lang/String;",
            ")",
            "Lcom/miui/gallery/provider/cache/Filter$CompareFilter<",
            "Lcom/miui/gallery/provider/cache/MediaItem;",
            ">;"
        }
    .end annotation

    const/16 v0, 0x18

    if-ne p1, v0, :cond_0

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory;->SHOW_IN_HOMEPAGE_FILTER:Lcom/miui/gallery/provider/cache/Filter$CompareFilter;

    return-object p1

    :cond_0
    if-nez p1, :cond_1

    new-instance p1, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$IdFilter;

    invoke-direct {p1, p2, p3}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$IdFilter;-><init>(Lcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V

    return-object p1

    :cond_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_2

    new-instance p1, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$AlbumFilter;

    invoke-direct {p1, p2, p3}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$AlbumFilter;-><init>(Lcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V

    return-object p1

    :cond_2
    const/4 v0, 0x6

    if-ne p1, v0, :cond_3

    new-instance p1, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TypeFilter;

    invoke-direct {p1, p2, p3}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TypeFilter;-><init>(Lcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V

    return-object p1

    :cond_3
    const/4 v0, 0x1

    if-ne p1, v0, :cond_4

    new-instance p1, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$Sha1Filter;

    invoke-direct {p1, p2, p3}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$Sha1Filter;-><init>(Lcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V

    return-object p1

    :cond_4
    const/16 v0, 0x14

    if-ne p1, v0, :cond_5

    new-instance p1, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$SyncStateFilter;

    invoke-direct {p1, p2, p3}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$SyncStateFilter;-><init>(Lcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V

    return-object p1

    :cond_5
    const/4 v0, 0x7

    if-ne p1, v0, :cond_6

    new-instance p1, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TitleFilter;

    invoke-direct {p1, p2, p3}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TitleFilter;-><init>(Lcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V

    return-object p1

    :cond_6
    const/4 v0, 0x5

    if-ne p1, v0, :cond_7

    new-instance p1, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$LocalFileFilter;

    invoke-direct {p1, p2, p3}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$LocalFileFilter;-><init>(Lcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V

    return-object p1

    :cond_7
    const/4 v0, 0x4

    if-ne p1, v0, :cond_8

    new-instance p1, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$ThumbnailFilter;

    invoke-direct {p1, p2, p3}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$ThumbnailFilter;-><init>(Lcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V

    return-object p1

    :cond_8
    const/16 v0, 0x1a

    if-ne p1, v0, :cond_9

    new-instance p1, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$LocalFlagFilter;

    invoke-direct {p1, p2, p3}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$LocalFlagFilter;-><init>(Lcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V

    return-object p1

    :cond_9
    const/16 v0, 0x1b

    if-ne p1, v0, :cond_a

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory;->NOT_HIDDEN_FILTER:Lcom/miui/gallery/provider/cache/Filter$CompareFilter;

    return-object p1

    :cond_a
    const/16 v0, 0x1c

    if-ne p1, v0, :cond_b

    new-instance p1, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$ServerTagFilter;

    invoke-direct {p1, p2, p3}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$ServerTagFilter;-><init>(Lcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V

    return-object p1

    :cond_b
    const/16 v0, 0x1d

    if-ne p1, v0, :cond_c

    new-instance p1, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$ServerIdFilter;

    invoke-direct {p1, p2, p3}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$ServerIdFilter;-><init>(Lcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V

    return-object p1

    :cond_c
    const/16 v0, 0x13

    if-ne p1, v0, :cond_d

    new-instance p1, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$AliasCreateDateFilter;

    invoke-direct {p1, p2, p3}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$AliasCreateDateFilter;-><init>(Lcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V

    return-object p1

    :cond_d
    const/16 v0, 0x21

    if-ne p1, v0, :cond_e

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory;->IS_FAVORITE_FILTER:Lcom/miui/gallery/provider/cache/Filter$CompareFilter;

    return-object p1

    :cond_e
    const/16 v0, 0xb

    if-ne p1, v0, :cond_f

    new-instance p1, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$MineTypeFilter;

    invoke-direct {p1, p2, p3}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$MineTypeFilter;-><init>(Lcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V

    return-object p1

    :cond_f
    const/16 v0, 0x22

    if-ne p1, v0, :cond_10

    new-instance p1, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$AlbumServerIdFilter;

    invoke-direct {p1, p2, p3}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$AlbumServerIdFilter;-><init>(Lcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V

    return-object p1

    :cond_10
    const/16 v0, 0xc

    if-ne p1, v0, :cond_11

    new-instance p1, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$LocationFilter;

    invoke-direct {p1, p2, p3}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$LocationFilter;-><init>(Lcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V

    return-object p1

    :cond_11
    const/16 v0, 0xa

    if-ne p1, v0, :cond_12

    new-instance p1, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$SizeFilter;

    invoke-direct {p1, p2, p3}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$SizeFilter;-><init>(Lcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V

    return-object p1

    :cond_12
    const/16 v0, 0x20

    if-ne p1, v0, :cond_13

    new-instance p1, Lcom/miui/gallery/provider/cache/MediaItem$AliasClearThumbnailFilter;

    invoke-direct {p1, p2, p3}, Lcom/miui/gallery/provider/cache/MediaItem$AliasClearThumbnailFilter;-><init>(Lcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V

    return-object p1

    :cond_13
    sget-object p1, Lcom/miui/gallery/provider/cache/Filter;->NOT_SUPPORTED_FILTER:Lcom/miui/gallery/provider/cache/Filter$CompareFilter;

    return-object p1
.end method

.method public getMapper()Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;
    .locals 1

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory;->COLUMN_MAPPER:Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;

    return-object v0
.end method

.method public getMerger(I)Lcom/miui/gallery/provider/cache/CacheItem$Merger;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/miui/gallery/provider/cache/CacheItem$Merger<",
            "Lcom/miui/gallery/provider/cache/MediaItem;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory;->SHA1_MERGER:Lcom/miui/gallery/provider/cache/CacheItem$Merger;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method
