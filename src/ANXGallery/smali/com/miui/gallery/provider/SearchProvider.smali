.class public Lcom/miui/gallery/provider/SearchProvider;
.super Landroid/content/ContentProvider;
.source "SearchProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/provider/SearchProvider$ContentResolver;
    }
.end annotation


# static fields
.field private static final sUriMatcher:Landroid/content/UriMatcher;


# instance fields
.field private mContentResolver:Lcom/miui/gallery/provider/SearchProvider$ContentResolver;

.field private mSearchHistoryManager:Lcom/miui/gallery/provider/cache/SearchHistoryManager;

.field private mSearchIconManager:Lcom/miui/gallery/provider/cache/SearchIconManager;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Landroid/content/UriMatcher;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Landroid/content/UriMatcher;-><init>(I)V

    sput-object v0, Lcom/miui/gallery/provider/SearchProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v0, Lcom/miui/gallery/provider/SearchProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.search"

    const-string v2, "history"

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/SearchProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.search"

    const-string v2, "icon"

    const/4 v3, 0x2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/provider/SearchProvider;->mSearchHistoryManager:Lcom/miui/gallery/provider/cache/SearchHistoryManager;

    iput-object v0, p0, Lcom/miui/gallery/provider/SearchProvider;->mSearchIconManager:Lcom/miui/gallery/provider/cache/SearchIconManager;

    return-void
.end method

.method static synthetic access$100()Landroid/content/UriMatcher;
    .locals 1

    sget-object v0, Lcom/miui/gallery/provider/SearchProvider;->sUriMatcher:Landroid/content/UriMatcher;

    return-object v0
.end method

.method private notifyChange(Landroid/net/Uri;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/provider/SearchProvider;->mContentResolver:Lcom/miui/gallery/provider/SearchProvider$ContentResolver;

    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    invoke-virtual {v0, p1, v1, v2, v3}, Lcom/miui/gallery/provider/SearchProvider$ContentResolver;->notifyInternal(Landroid/net/Uri;Landroid/database/ContentObserver;J)V

    return-void
.end method

.method private registerNotifyUri(Landroid/database/Cursor;I)V
    .locals 1

    const/4 v0, 0x1

    if-eq p2, v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/provider/SearchProvider;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    sget-object v0, Lcom/miui/gallery/search/SearchContract$History;->URI:Landroid/net/Uri;

    invoke-interface {p1, p2, v0}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    :goto_0
    return-void
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 2

    sget-object v0, Lcom/miui/gallery/provider/SearchProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v0, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/provider/SearchProvider;->mSearchHistoryManager:Lcom/miui/gallery/provider/cache/SearchHistoryManager;

    invoke-virtual {v0, p2, p3}, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->delete(Ljava/lang/String;[Ljava/lang/String;)I

    move-result p2

    :goto_0
    if-lez p2, :cond_1

    invoke-direct {p0, p1}, Lcom/miui/gallery/provider/SearchProvider;->notifyChange(Landroid/net/Uri;)V

    :cond_1
    return p2
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 5

    sget-object v0, Lcom/miui/gallery/provider/SearchProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v0, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    const-wide/16 v1, -0x1

    const/4 v3, 0x1

    if-eq v0, v3, :cond_0

    move-wide v3, v1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/provider/SearchProvider;->mSearchHistoryManager:Lcom/miui/gallery/provider/cache/SearchHistoryManager;

    invoke-virtual {v0, v1, v2, p2}, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->insert(JLandroid/content/ContentValues;)J

    move-result-wide v3

    :goto_0
    cmp-long p2, v3, v1

    if-eqz p2, :cond_1

    invoke-direct {p0, p1}, Lcom/miui/gallery/provider/SearchProvider;->notifyChange(Landroid/net/Uri;)V

    :cond_1
    cmp-long p2, v3, v1

    if-eqz p2, :cond_2

    invoke-static {p1, v3, v4}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object p1

    goto :goto_1

    :cond_2
    const/4 p1, 0x0

    :goto_1
    return-object p1
.end method

.method public onCreate()Z
    .locals 2

    new-instance v0, Lcom/miui/gallery/provider/cache/SearchHistoryManager;

    invoke-direct {v0}, Lcom/miui/gallery/provider/cache/SearchHistoryManager;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/provider/SearchProvider;->mSearchHistoryManager:Lcom/miui/gallery/provider/cache/SearchHistoryManager;

    new-instance v0, Lcom/miui/gallery/provider/cache/SearchIconManager;

    invoke-direct {v0}, Lcom/miui/gallery/provider/cache/SearchIconManager;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/provider/SearchProvider;->mSearchIconManager:Lcom/miui/gallery/provider/cache/SearchIconManager;

    new-instance v0, Lcom/miui/gallery/provider/SearchProvider$ContentResolver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/provider/SearchProvider$ContentResolver;-><init>(Lcom/miui/gallery/provider/SearchProvider;Lcom/miui/gallery/provider/SearchProvider$1;)V

    iput-object v0, p0, Lcom/miui/gallery/provider/SearchProvider;->mContentResolver:Lcom/miui/gallery/provider/SearchProvider$ContentResolver;

    const/4 v0, 0x1

    return v0
.end method

.method public onLowMemory()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/provider/SearchProvider;->mSearchHistoryManager:Lcom/miui/gallery/provider/cache/SearchHistoryManager;

    invoke-virtual {v0}, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->releaseCache()V

    iget-object v0, p0, Lcom/miui/gallery/provider/SearchProvider;->mSearchIconManager:Lcom/miui/gallery/provider/cache/SearchIconManager;

    invoke-virtual {v0}, Lcom/miui/gallery/provider/cache/SearchIconManager;->releaseCache()V

    return-void
.end method

.method public onTrimMemory(I)V
    .locals 1

    const/4 v0, 0x5

    if-lt p1, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/provider/SearchProvider;->mSearchHistoryManager:Lcom/miui/gallery/provider/cache/SearchHistoryManager;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->releaseCache()V

    iget-object p1, p0, Lcom/miui/gallery/provider/SearchProvider;->mSearchIconManager:Lcom/miui/gallery/provider/cache/SearchIconManager;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/cache/SearchIconManager;->releaseCache()V

    :cond_0
    return-void
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 8

    sget-object v0, Lcom/miui/gallery/provider/SearchProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v0, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_2

    :pswitch_0
    const-string p3, "icon_uri"

    invoke-virtual {p1, p3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    const-string p4, "use_disk_cache"

    const/4 p5, 0x0

    invoke-virtual {p1, p4, p5}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result p4

    if-nez p4, :cond_1

    const-string v0, "cache_to_disk"

    invoke-virtual {p1, v0, p5}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    const-string v1, "high_accuracy"

    invoke-virtual {p1, v1, p5}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result p1

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p5

    if-nez p5, :cond_4

    new-instance p5, Landroid/os/Bundle;

    invoke-direct {p5}, Landroid/os/Bundle;-><init>()V

    const-string v1, "use_disk_cache"

    invoke-virtual {p5, v1, p4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string p4, "cache_to_disk"

    invoke-virtual {p5, p4, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string p4, "high_accuracy"

    invoke-virtual {p5, p4, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/SearchProvider;->mSearchIconManager:Lcom/miui/gallery/provider/cache/SearchIconManager;

    invoke-static {p3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p3

    invoke-virtual {p1, p3, p2, p5}, Lcom/miui/gallery/provider/cache/SearchIconManager;->query(Landroid/net/Uri;[Ljava/lang/String;Landroid/os/Bundle;)Landroid/database/Cursor;

    move-result-object p1

    goto :goto_3

    :pswitch_1
    new-instance v7, Landroid/os/Bundle;

    invoke-direct {v7}, Landroid/os/Bundle;-><init>()V

    const-string v1, "query_limit"

    invoke-virtual {p1, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    const-string v1, "query_limit"

    invoke-virtual {p1, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const-string v2, "query_limit"

    invoke-virtual {v7, v2, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    :cond_2
    const-string v1, "query_text"

    invoke-virtual {p1, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "query_text"

    const-string v2, "query_text"

    invoke-virtual {p1, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v7, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    iget-object v1, p0, Lcom/miui/gallery/provider/SearchProvider;->mSearchHistoryManager:Lcom/miui/gallery/provider/cache/SearchHistoryManager;

    const/4 v6, 0x0

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v1 .. v7}, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->query([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/database/Cursor;

    move-result-object p1

    if-eqz p1, :cond_5

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/provider/SearchProvider;->registerNotifyUri(Landroid/database/Cursor;I)V

    goto :goto_3

    :cond_4
    :goto_2
    const/4 p1, 0x0

    :cond_5
    :goto_3
    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 2

    sget-object v0, Lcom/miui/gallery/provider/SearchProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v0, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/provider/SearchProvider;->mSearchHistoryManager:Lcom/miui/gallery/provider/cache/SearchHistoryManager;

    invoke-virtual {v0, p3, p4, p2}, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->update(Ljava/lang/String;[Ljava/lang/String;Landroid/content/ContentValues;)I

    move-result p2

    :goto_0
    if-lez p2, :cond_1

    invoke-direct {p0, p1}, Lcom/miui/gallery/provider/SearchProvider;->notifyChange(Landroid/net/Uri;)V

    :cond_1
    return p2
.end method
