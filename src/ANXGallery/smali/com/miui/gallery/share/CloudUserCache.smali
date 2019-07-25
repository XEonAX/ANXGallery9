.class public abstract Lcom/miui/gallery/share/CloudUserCache;
.super Lcom/miui/gallery/share/DBCache;
.source "CloudUserCache.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/share/DBCache<",
        "Ljava/lang/String;",
        "Ljava/util/List<",
        "Lcom/miui/gallery/share/CloudUserCacheEntry;",
        ">;>;"
    }
.end annotation


# static fields
.field private static final EMPTY_ENTRY_LIST:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/share/CloudUserCacheEntry;",
            ">;"
        }
    .end annotation
.end field

.field private static final sOwnerUserCache:Lcom/miui/gallery/share/CloudUserCache;

.field private static final sSharerUserCache:Lcom/miui/gallery/share/CloudUserCache;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/share/CloudUserCache;->EMPTY_ENTRY_LIST:Ljava/util/List;

    new-instance v0, Lcom/miui/gallery/share/CloudUserCache$1;

    invoke-direct {v0}, Lcom/miui/gallery/share/CloudUserCache$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/share/CloudUserCache;->sOwnerUserCache:Lcom/miui/gallery/share/CloudUserCache;

    new-instance v0, Lcom/miui/gallery/share/CloudUserCache$2;

    invoke-direct {v0}, Lcom/miui/gallery/share/CloudUserCache$2;-><init>()V

    sput-object v0, Lcom/miui/gallery/share/CloudUserCache;->sSharerUserCache:Lcom/miui/gallery/share/CloudUserCache;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/share/DBCache;-><init>()V

    return-void
.end method

.method public static getOwnerUserCache()Lcom/miui/gallery/share/CloudUserCache;
    .locals 1

    sget-object v0, Lcom/miui/gallery/share/CloudUserCache;->sOwnerUserCache:Lcom/miui/gallery/share/CloudUserCache;

    return-object v0
.end method

.method public static getSharerUserCache()Lcom/miui/gallery/share/CloudUserCache;
    .locals 1

    sget-object v0, Lcom/miui/gallery/share/CloudUserCache;->sSharerUserCache:Lcom/miui/gallery/share/CloudUserCache;

    return-object v0
.end method


# virtual methods
.method public getCloudUserListByAlbumId(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/miui/gallery/share/CloudUserCacheEntry;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/share/CloudUserCache;->getCache()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_0

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/miui/gallery/share/CloudUserCache;->EMPTY_ENTRY_LIST:Ljava/util/List;

    :goto_0
    return-object p1
.end method

.method protected abstract getProjection()[Ljava/lang/String;
.end method

.method protected abstract getSelection()Ljava/lang/String;
.end method

.method protected abstract getSelectionArgs()[Ljava/lang/String;
.end method

.method protected loadInBackground()Ljava/util/Map;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/share/CloudUserCacheEntry;",
            ">;>;"
        }
    .end annotation

    invoke-static {}, Lcom/google/common/collect/Maps;->newHashMap()Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/share/CloudUserCache;->queryInBackground()Landroid/database/Cursor;

    move-result-object v1

    if-eqz v1, :cond_4

    const/4 v2, 0x0

    move-object v3, v2

    :cond_0
    :goto_0
    :try_start_0
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-virtual {p0, v1}, Lcom/miui/gallery/share/CloudUserCache;->newKey(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_1

    goto :goto_0

    :cond_1
    invoke-static {v2, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_2

    invoke-virtual {p0, v1}, Lcom/miui/gallery/share/CloudUserCache;->newValue(Landroid/database/Cursor;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v3, v2

    move-object v2, v4

    :cond_2
    if-eqz v3, :cond_0

    invoke-virtual {p0, v1}, Lcom/miui/gallery/share/CloudUserCache;->newValueElement(Landroid/database/Cursor;)Lcom/miui/gallery/share/CloudUserCacheEntry;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_3
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    goto :goto_1

    :catchall_0
    move-exception v0

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    throw v0

    :cond_4
    :goto_1
    return-object v0
.end method

.method protected bridge synthetic newKey(Landroid/database/Cursor;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/share/CloudUserCache;->newKey(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected newKey(Landroid/database/Cursor;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic newValue(Landroid/database/Cursor;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/share/CloudUserCache;->newValue(Landroid/database/Cursor;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method protected newValue(Landroid/database/Cursor;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")",
            "Ljava/util/List<",
            "Lcom/miui/gallery/share/CloudUserCacheEntry;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object p1

    return-object p1
.end method

.method protected abstract newValueElement(Landroid/database/Cursor;)Lcom/miui/gallery/share/CloudUserCacheEntry;
.end method

.method protected queryInBackground()Landroid/database/Cursor;
    .locals 7

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/share/CloudUserCache;->getUri()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {p0}, Lcom/miui/gallery/share/CloudUserCache;->getProjection()[Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/miui/gallery/share/CloudUserCache;->getSelection()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/miui/gallery/share/CloudUserCache;->getSelectionArgs()[Ljava/lang/String;

    move-result-object v5

    const-string v6, "albumId"

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public abstract syncFromServer(Ljava/lang/String;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Ljava/lang/Void;",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation
.end method
