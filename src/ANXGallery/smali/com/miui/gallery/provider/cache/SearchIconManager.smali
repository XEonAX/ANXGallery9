.class public Lcom/miui/gallery/provider/cache/SearchIconManager;
.super Ljava/lang/Object;
.source "SearchIconManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/provider/cache/SearchIconManager$PeopleCoverIconLoader;,
        Lcom/miui/gallery/provider/cache/SearchIconManager$AlbumCoverIconLoader;,
        Lcom/miui/gallery/provider/cache/SearchIconManager$LocalImageIconLoader;,
        Lcom/miui/gallery/provider/cache/SearchIconManager$LocalImageFaceLoader;
    }
.end annotation


# static fields
.field private static final sIconURIMatcher:Landroid/content/UriMatcher;


# instance fields
.field private final mContentObserver:Landroid/database/ContentObserver;

.field private final mIconCache:Lcom/google/common/cache/Cache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/Cache<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/provider/cache/SearchIconItem;",
            ">;"
        }
    .end annotation
.end field

.field private final mObserveUris:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field private final mQueryFactory:Lcom/miui/gallery/provider/cache/CacheItem$QueryFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/provider/cache/CacheItem$QueryFactory<",
            "Lcom/miui/gallery/provider/cache/SearchIconItem;",
            ">;"
        }
    .end annotation
.end field

.field private final mTracingPrinter:Landroid/util/Printer;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Landroid/content/UriMatcher;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Landroid/content/UriMatcher;-><init>(I)V

    sput-object v0, Lcom/miui/gallery/provider/cache/SearchIconManager;->sIconURIMatcher:Landroid/content/UriMatcher;

    sget-object v0, Lcom/miui/gallery/provider/cache/SearchIconManager;->sIconURIMatcher:Landroid/content/UriMatcher;

    const-string v1, "people"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/cache/SearchIconManager;->sIconURIMatcher:Landroid/content/UriMatcher;

    const-string v1, "album"

    const/4 v3, 0x2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/cache/SearchIconManager;->sIconURIMatcher:Landroid/content/UriMatcher;

    const-string v1, "image"

    const/4 v3, 0x3

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/SearchIconManager;->mObserveUris:Ljava/util/List;

    sget-object v0, Lcom/miui/gallery/provider/cache/-$$Lambda$SearchIconManager$PEl6-aDORk8dmNf2-lAWaQ8oqI8;->INSTANCE:Lcom/miui/gallery/provider/cache/-$$Lambda$SearchIconManager$PEl6-aDORk8dmNf2-lAWaQ8oqI8;

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/SearchIconManager;->mTracingPrinter:Landroid/util/Printer;

    new-instance v0, Lcom/miui/gallery/provider/cache/SearchIconItem$QueryFactory;

    invoke-direct {v0}, Lcom/miui/gallery/provider/cache/SearchIconItem$QueryFactory;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/SearchIconManager;->mQueryFactory:Lcom/miui/gallery/provider/cache/CacheItem$QueryFactory;

    invoke-static {}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader;->getInstance()Lcom/miui/gallery/search/core/display/icon/IconImageLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader;->getMemoryCache()Lcom/google/common/cache/Cache;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/SearchIconManager;->mIconCache:Lcom/google/common/cache/Cache;

    new-instance v0, Lcom/miui/gallery/provider/cache/SearchIconManager$1;

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/provider/cache/SearchIconManager$1;-><init>(Lcom/miui/gallery/provider/cache/SearchIconManager;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/SearchIconManager;->mContentObserver:Landroid/database/ContentObserver;

    return-void
.end method

.method static synthetic access$100(Landroid/net/Uri;Ljava/lang/String;JLandroid/net/Uri;)Lcom/miui/gallery/provider/cache/SearchIconItem;
    .locals 0

    invoke-static {p0, p1, p2, p3, p4}, Lcom/miui/gallery/provider/cache/SearchIconManager;->createIconItem(Landroid/net/Uri;Ljava/lang/String;JLandroid/net/Uri;)Lcom/miui/gallery/provider/cache/SearchIconItem;

    move-result-object p0

    return-object p0
.end method

.method private static createIconItem(Landroid/net/Uri;Ljava/lang/String;JLandroid/net/Uri;)Lcom/miui/gallery/provider/cache/SearchIconItem;
    .locals 1

    new-instance v0, Lcom/miui/gallery/provider/cache/SearchIconItem;

    invoke-direct {v0}, Lcom/miui/gallery/provider/cache/SearchIconItem;-><init>()V

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, v0, Lcom/miui/gallery/provider/cache/SearchIconItem;->iconUri:Ljava/lang/String;

    iput-object p1, v0, Lcom/miui/gallery/provider/cache/SearchIconItem;->filePath:Ljava/lang/String;

    invoke-static {p2, p3}, Lcom/miui/gallery/provider/cache/SearchIconManager;->getDownloadUri(J)Ljava/lang/String;

    move-result-object p0

    iput-object p0, v0, Lcom/miui/gallery/provider/cache/SearchIconItem;->downloadUri:Ljava/lang/String;

    iput-object p4, v0, Lcom/miui/gallery/provider/cache/SearchIconItem;->notifyUri:Landroid/net/Uri;

    return-object v0
.end method

.method private getContentResolver()Landroid/content/ContentResolver;
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/provider/cache/SearchIconManager;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    return-object v0
.end method

.method private getContext()Landroid/content/Context;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method private static getDownloadUri(J)Ljava/lang/String;
    .locals 0

    invoke-static {p0, p1}, Lcom/miui/gallery/util/uil/CloudUriAdapter;->getDownloadUri(J)Landroid/net/Uri;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method static synthetic lambda$new$17(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method private observerUri(Landroid/net/Uri;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/SearchIconManager;->mObserveUris:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/provider/cache/SearchIconManager;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/miui/gallery/provider/cache/SearchIconManager;->mContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/SearchIconManager;->mObserveUris:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method private onIconQueried(Ljava/lang/String;Lcom/miui/gallery/provider/cache/SearchIconItem;Z)V
    .locals 1

    if-eqz p2, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/SearchIconManager;->mIconCache:Lcom/google/common/cache/Cache;

    invoke-interface {v0, p1, p2}, Lcom/google/common/cache/Cache;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    if-eqz p3, :cond_0

    invoke-static {}, Lcom/miui/gallery/provider/cache/SearchIconDiskCache;->getInstance()Lcom/miui/gallery/provider/cache/SearchIconDiskCache;

    move-result-object p3

    invoke-virtual {p3, p1, p2}, Lcom/miui/gallery/provider/cache/SearchIconDiskCache;->putIcon(Ljava/lang/String;Lcom/miui/gallery/provider/cache/SearchIconItem;)Z

    :cond_0
    iget-object p1, p2, Lcom/miui/gallery/provider/cache/SearchIconItem;->notifyUri:Landroid/net/Uri;

    if-eqz p1, :cond_1

    iget-object p1, p2, Lcom/miui/gallery/provider/cache/SearchIconItem;->notifyUri:Landroid/net/Uri;

    invoke-direct {p0, p1}, Lcom/miui/gallery/provider/cache/SearchIconManager;->observerUri(Landroid/net/Uri;)V

    :cond_1
    return-void
.end method

.method private queryIcon(Landroid/net/Uri;Z)Lcom/miui/gallery/provider/cache/SearchIconItem;
    .locals 1

    sget-object v0, Lcom/miui/gallery/provider/cache/SearchIconManager;->sIconURIMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v0, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    const/4 p1, 0x0

    goto :goto_0

    :pswitch_0
    const-string v0, "faceId"

    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/provider/cache/SearchIconManager;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/provider/cache/SearchIconManager$LocalImageFaceLoader;->queryIcon(Landroid/net/Uri;Landroid/content/Context;)Lcom/miui/gallery/provider/cache/SearchIconItem;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/provider/cache/SearchIconManager;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/provider/cache/SearchIconManager$LocalImageIconLoader;->queryIcon(Landroid/net/Uri;ZLandroid/content/ContentResolver;)Lcom/miui/gallery/provider/cache/SearchIconItem;

    move-result-object p1

    goto :goto_0

    :pswitch_1
    invoke-direct {p0}, Lcom/miui/gallery/provider/cache/SearchIconManager;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/provider/cache/SearchIconManager$AlbumCoverIconLoader;->queryIcon(Landroid/net/Uri;Landroid/content/ContentResolver;)Lcom/miui/gallery/provider/cache/SearchIconItem;

    move-result-object p1

    goto :goto_0

    :pswitch_2
    invoke-direct {p0}, Lcom/miui/gallery/provider/cache/SearchIconManager;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/provider/cache/SearchIconManager$PeopleCoverIconLoader;->access$000(Landroid/net/Uri;Landroid/content/ContentResolver;)Lcom/miui/gallery/provider/cache/SearchIconItem;

    move-result-object p1

    :goto_0
    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public query(Landroid/net/Uri;[Ljava/lang/String;Landroid/os/Bundle;)Landroid/database/Cursor;
    .locals 8

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SearchIconManager-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtimeNanos()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "query"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/logger/TimingTracing;->beginTracing(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v3, 0x0

    if-eqz p3, :cond_2

    const-string v4, "use_disk_cache"

    invoke-virtual {p3, v4, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v5, "cache_to_disk"

    invoke-virtual {p3, v5, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_0

    :cond_0
    const/4 v5, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v5, 0x1

    :goto_1
    const-string v6, "high_accuracy"

    invoke-virtual {p3, v6, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p3

    goto :goto_2

    :cond_2
    const/4 p3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_2
    iget-object v6, p0, Lcom/miui/gallery/provider/cache/SearchIconManager;->mIconCache:Lcom/google/common/cache/Cache;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/google/common/cache/Cache;->getIfPresent(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/miui/gallery/provider/cache/SearchIconItem;

    const-string v7, "query from memory cache"

    invoke-static {v0, v7}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    if-nez v6, :cond_4

    if-eqz v4, :cond_4

    invoke-static {}, Lcom/miui/gallery/provider/cache/SearchIconDiskCache;->getInstance()Lcom/miui/gallery/provider/cache/SearchIconDiskCache;

    move-result-object v4

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Lcom/miui/gallery/provider/cache/SearchIconDiskCache;->getIcon(Ljava/lang/String;)Lcom/miui/gallery/provider/cache/SearchIconItem;

    move-result-object v6

    if-eqz v6, :cond_3

    const/4 v3, 0x1

    :cond_3
    const-string v4, "query from disk blob cache"

    invoke-static {v0, v4}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4
    if-nez v6, :cond_5

    invoke-direct {p0, p1, p3}, Lcom/miui/gallery/provider/cache/SearchIconManager;->queryIcon(Landroid/net/Uri;Z)Lcom/miui/gallery/provider/cache/SearchIconItem;

    move-result-object v6

    const-string p3, "query from database"

    invoke-static {v0, p3}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1, v6, v5}, Lcom/miui/gallery/provider/cache/SearchIconManager;->onIconQueried(Ljava/lang/String;Lcom/miui/gallery/provider/cache/SearchIconItem;Z)V

    const-string p1, "dispatch query result"

    invoke-static {v0, p1}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    if-eqz v6, :cond_6

    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_6
    new-instance p1, Lcom/miui/gallery/provider/cache/RawCursor;

    iget-object p3, p0, Lcom/miui/gallery/provider/cache/SearchIconManager;->mQueryFactory:Lcom/miui/gallery/provider/cache/CacheItem$QueryFactory;

    invoke-interface {p3}, Lcom/miui/gallery/provider/cache/CacheItem$QueryFactory;->getMapper()Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;

    move-result-object p3

    invoke-direct {p1, v1, p2, p3}, Lcom/miui/gallery/provider/cache/RawCursor;-><init>(Ljava/util/List;[Ljava/lang/String;Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;)V

    if-eqz v3, :cond_7

    new-instance p2, Landroid/os/Bundle;

    invoke-direct {p2}, Landroid/os/Bundle;-><init>()V

    const-string p3, "from_unreliable_cache"

    invoke-virtual {p2, p3, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    move-object p3, p1

    check-cast p3, Landroid/database/AbstractCursor;

    invoke-virtual {p3, p2}, Landroid/database/AbstractCursor;->setExtras(Landroid/os/Bundle;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_7
    iget-object p2, p0, Lcom/miui/gallery/provider/cache/SearchIconManager;->mTracingPrinter:Landroid/util/Printer;

    invoke-static {v0, p2}, Lcom/miui/gallery/util/logger/TimingTracing;->stopTracing(Ljava/lang/String;Landroid/util/Printer;)J

    return-object p1

    :catchall_0
    move-exception p1

    iget-object p2, p0, Lcom/miui/gallery/provider/cache/SearchIconManager;->mTracingPrinter:Landroid/util/Printer;

    invoke-static {v0, p2}, Lcom/miui/gallery/util/logger/TimingTracing;->stopTracing(Ljava/lang/String;Landroid/util/Printer;)J

    throw p1
.end method

.method public releaseCache()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/SearchIconManager;->mIconCache:Lcom/google/common/cache/Cache;

    invoke-interface {v0}, Lcom/google/common/cache/Cache;->invalidateAll()V

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/SearchIconManager;->mIconCache:Lcom/google/common/cache/Cache;

    invoke-interface {v0}, Lcom/google/common/cache/Cache;->cleanUp()V

    invoke-direct {p0}, Lcom/miui/gallery/provider/cache/SearchIconManager;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/SearchIconManager;->mContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/SearchIconManager;->mObserveUris:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    return-void
.end method
