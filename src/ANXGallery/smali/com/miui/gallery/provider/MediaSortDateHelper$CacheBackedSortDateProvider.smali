.class Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;
.super Ljava/lang/Object;
.source "MediaSortDateHelper.java"

# interfaces
.implements Lcom/miui/gallery/provider/MediaSortDateHelper$SortDateProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/MediaSortDateHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CacheBackedSortDateProvider"
.end annotation


# static fields
.field private static final DEFAULT_SORT_DATE:Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;


# instance fields
.field private mFeatureStatusObserver:Lcom/miui/gallery/cloudcontrol/observers/FeatureStrategyObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/cloudcontrol/observers/FeatureStrategyObserver<",
            "Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy;",
            ">;"
        }
    .end annotation
.end field

.field private mSortByModifyAlbumIds:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private mSortByModifyAlbumPaths:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;->CREATE_TIME:Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;

    sput-object v0, Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;->DEFAULT_SORT_DATE:Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;

    return-void
.end method

.method constructor <init>()V
    .locals 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Album;->getCachedSortByModifyAlbumPaths()Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;->mSortByModifyAlbumPaths:Ljava/util/Set;

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Album;->getCachedSortByModifyAlbumIds()Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/util/HashSet;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(I)V

    iput-object v1, p0, Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;->mSortByModifyAlbumIds:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;->mSortByModifyAlbumIds:Ljava/util/Set;

    invoke-static {v1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider$1;-><init>(Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;)V

    iput-object v0, p0, Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;->mFeatureStatusObserver:Lcom/miui/gallery/cloudcontrol/observers/FeatureStrategyObserver;

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object v0

    const-string v1, "album-sort-date"

    const-class v2, Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;->mFeatureStatusObserver:Lcom/miui/gallery/cloudcontrol/observers/FeatureStrategyObserver;

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->registerStrategyObserver(Ljava/lang/String;Ljava/lang/Class;Lcom/miui/gallery/cloudcontrol/Merger;Lcom/miui/gallery/cloudcontrol/observers/FeatureStrategyObserver;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy;

    if-eqz v0, :cond_1

    invoke-direct {p0, v0}, Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;->dispatchStrategy(Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy;)V

    :cond_1
    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;->dispatchStrategy(Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy;)V

    return-void
.end method

.method private dispatchStrategy(Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;->mFeatureStatusObserver:Lcom/miui/gallery/cloudcontrol/observers/FeatureStrategyObserver;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;->mFeatureStatusObserver:Lcom/miui/gallery/cloudcontrol/observers/FeatureStrategyObserver;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->unregisterStrategyObserver(Lcom/miui/gallery/cloudcontrol/observers/FeatureStrategyObserver;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;->mFeatureStatusObserver:Lcom/miui/gallery/cloudcontrol/observers/FeatureStrategyObserver;

    :cond_0
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/provider/-$$Lambda$MediaSortDateHelper$CacheBackedSortDateProvider$gWfJsekNQ1WvYAHJLuC3bACYByo;

    invoke-direct {v1, p1}, Lcom/miui/gallery/provider/-$$Lambda$MediaSortDateHelper$CacheBackedSortDateProvider$gWfJsekNQ1WvYAHJLuC3bACYByo;-><init>(Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method static synthetic lambda$dispatchStrategy$16(Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy;Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-static {p0}, Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;->updateCacheInfo(Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method private static updateCacheInfo(Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy;)V
    .locals 9

    const/4 v0, 0x0

    if-nez p0, :cond_0

    invoke-static {v0}, Lcom/miui/gallery/preference/GalleryPreferences$Album;->setCachedSortByModifyAlbumPaths(Ljava/util/Set;)V

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/util/HashSet;

    sget-object v2, Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy$SortDate;->DATE_MODIFIED:Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy$SortDate;

    invoke-virtual {p0, v2}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy;->getAlbumPathsBySortDate(Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy$SortDate;)Ljava/util/List;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-static {v1}, Lcom/miui/gallery/preference/GalleryPreferences$Album;->setCachedSortByModifyAlbumPaths(Ljava/util/Set;)V

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p0

    if-eqz p0, :cond_1

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    const-string p0, "_id"

    filled-new-array {p0}, [Ljava/lang/String;

    move-result-object v4

    sget-object p0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v0, "%s AND (%s COLLATE NOCASE IN (\'%s\'))"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "(serverType=0)"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "localFile"

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-string v7, "\', \'"

    invoke-static {v7, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v5, v6

    invoke-static {p0, v0, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    new-instance v8, Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider$2;

    invoke-direct {v8}, Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider$2;-><init>()V

    invoke-static/range {v2 .. v8}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object p0

    move-object v0, p0

    check-cast v0, Ljava/util/HashSet;

    :cond_1
    invoke-static {v0}, Lcom/miui/gallery/preference/GalleryPreferences$Album;->setCachedSortByModifyAlbumIds(Ljava/util/Set;)V

    :goto_0
    return-void
.end method


# virtual methods
.method public getAlbumIdsBySortDate(Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;->MODIFY_TIME:Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;->mSortByModifyAlbumIds:Ljava/util/Set;

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p1

    if-eqz p1, :cond_0

    new-instance p1, Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;->mSortByModifyAlbumIds:Ljava/util/Set;

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object p1

    :cond_0
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    return-object p1
.end method

.method public getAlbumPathsBySortDate(Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;->MODIFY_TIME:Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;->mSortByModifyAlbumPaths:Ljava/util/Set;

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p1

    if-eqz p1, :cond_0

    new-instance p1, Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;->mSortByModifyAlbumPaths:Ljava/util/Set;

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object p1

    :cond_0
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    return-object p1
.end method

.method public getDefaultSortDate()Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;
    .locals 1

    sget-object v0, Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;->DEFAULT_SORT_DATE:Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;

    return-object v0
.end method

.method public getSortDateByAlbumPath(Ljava/lang/String;)Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;->mSortByModifyAlbumPaths:Ljava/util/Set;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;->mSortByModifyAlbumPaths:Ljava/util/Set;

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    sget-object p1, Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;->MODIFY_TIME:Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;->DEFAULT_SORT_DATE:Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;

    :goto_0
    return-object p1

    :cond_1
    sget-object p1, Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;->DEFAULT_SORT_DATE:Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;

    return-object p1
.end method
