.class public Lcn/kuaipan/android/http/NetCacheManager;
.super Ljava/lang/Object;
.source "NetCacheManager.java"


# static fields
.field private static final sCaches:Lcn/kuaipan/android/utils/TwoKeyHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcn/kuaipan/android/utils/TwoKeyHashMap<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/String;",
            "Lcn/kuaipan/android/http/NetCacheManager;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mDirName:Ljava/lang/String;

.field private final mExternal:Z

.field private mFolderPath:Ljava/lang/String;

.field private mLatestId:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcn/kuaipan/android/utils/TwoKeyHashMap;

    invoke-direct {v0}, Lcn/kuaipan/android/utils/TwoKeyHashMap;-><init>()V

    sput-object v0, Lcn/kuaipan/android/http/NetCacheManager;->sCaches:Lcn/kuaipan/android/utils/TwoKeyHashMap;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;ZLjava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcn/kuaipan/android/http/NetCacheManager;->mLatestId:I

    if-eqz p1, :cond_1

    iput-object p1, p0, Lcn/kuaipan/android/http/NetCacheManager;->mContext:Landroid/content/Context;

    iput-boolean p2, p0, Lcn/kuaipan/android/http/NetCacheManager;->mExternal:Z

    iput-object p3, p0, Lcn/kuaipan/android/http/NetCacheManager;->mDirName:Ljava/lang/String;

    invoke-static {p1, p3, p2}, Lcn/kuaipan/android/utils/FileUtils;->getCacheDir(Landroid/content/Context;Ljava/lang/String;Z)Ljava/io/File;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcn/kuaipan/android/http/NetCacheManager;->mFolderPath:Ljava/lang/String;

    new-instance p2, Lcn/kuaipan/android/http/NetCacheManager$1;

    invoke-direct {p2, p0, p1}, Lcn/kuaipan/android/http/NetCacheManager$1;-><init>(Lcn/kuaipan/android/http/NetCacheManager;Ljava/io/File;)V

    invoke-virtual {p2}, Lcn/kuaipan/android/http/NetCacheManager$1;->start()V

    :cond_0
    return-void

    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Context can\'t be null."

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;Z)Lcn/kuaipan/android/http/NetCacheManager;
    .locals 2

    const-class v0, Lcn/kuaipan/android/http/NetCacheManager;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    invoke-static {p0, p1, v1}, Lcn/kuaipan/android/http/NetCacheManager;->getInstance(Landroid/content/Context;ZLjava/lang/String;)Lcn/kuaipan/android/http/NetCacheManager;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;ZLjava/lang/String;)Lcn/kuaipan/android/http/NetCacheManager;
    .locals 3

    const-class v0, Lcn/kuaipan/android/http/NetCacheManager;

    monitor-enter v0

    :try_start_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string p2, "net_cache"

    :cond_0
    sget-object v1, Lcn/kuaipan/android/http/NetCacheManager;->sCaches:Lcn/kuaipan/android/utils/TwoKeyHashMap;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v2, p2}, Lcn/kuaipan/android/utils/TwoKeyHashMap;->get(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcn/kuaipan/android/http/NetCacheManager;

    if-nez v1, :cond_1

    new-instance v1, Lcn/kuaipan/android/http/NetCacheManager;

    invoke-direct {v1, p0, p1, p2}, Lcn/kuaipan/android/http/NetCacheManager;-><init>(Landroid/content/Context;ZLjava/lang/String;)V

    sget-object p0, Lcn/kuaipan/android/http/NetCacheManager;->sCaches:Lcn/kuaipan/android/utils/TwoKeyHashMap;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1, p2, v1}, Lcn/kuaipan/android/utils/TwoKeyHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private getNextCache()Ljava/io/File;
    .locals 4

    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcn/kuaipan/android/http/NetCacheManager;->mLatestId:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Lcn/kuaipan/android/http/NetCacheManager;->mLatestId:I

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v2, "%08d.tmp"

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v1, v3

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcn/kuaipan/android/http/NetCacheManager;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcn/kuaipan/android/http/NetCacheManager;->mDirName:Ljava/lang/String;

    iget-boolean v3, p0, Lcn/kuaipan/android/http/NetCacheManager;->mExternal:Z

    invoke-static {v1, v2, v3}, Lcn/kuaipan/android/utils/FileUtils;->getCacheDir(Landroid/content/Context;Ljava/lang/String;Z)Ljava/io/File;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcn/kuaipan/android/http/NetCacheManager;->mFolderPath:Ljava/lang/String;

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v2

    :cond_0
    new-instance v0, Lcn/kuaipan/android/exception/KscRuntimeException;

    const v1, 0x7a124

    invoke-direct {v0, v1}, Lcn/kuaipan/android/exception/KscRuntimeException;-><init>(I)V

    throw v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method


# virtual methods
.method public assignCache()Ljava/io/File;
    .locals 2

    :cond_0
    invoke-direct {p0}, Lcn/kuaipan/android/http/NetCacheManager;->getNextCache()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->deleteOnExit()V

    return-object v0
.end method

.method public releaseCache(Ljava/io/File;)V
    .locals 2

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcn/kuaipan/android/http/NetCacheManager;->mFolderPath:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    return-void

    :cond_1
    :goto_0
    return-void
.end method
