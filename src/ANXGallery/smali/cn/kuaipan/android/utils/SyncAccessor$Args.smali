.class public Lcn/kuaipan/android/utils/SyncAccessor$Args;
.super Ljava/lang/Object;
.source "SyncAccessor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/kuaipan/android/utils/SyncAccessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Args"
.end annotation


# static fields
.field private static mPool:Lcn/kuaipan/android/utils/SyncAccessor$Args;

.field private static mPoolSize:I

.field private static mPoolSync:Ljava/lang/Object;


# instance fields
.field public err:Ljava/lang/RuntimeException;

.field public volatile handled:Z

.field private next:Lcn/kuaipan/android/utils/SyncAccessor$Args;

.field public params:[Ljava/lang/Object;

.field public result:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcn/kuaipan/android/utils/SyncAccessor$Args;->mPoolSync:Ljava/lang/Object;

    const/4 v0, 0x0

    sput v0, Lcn/kuaipan/android/utils/SyncAccessor$Args;->mPoolSize:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcn/kuaipan/android/utils/SyncAccessor$Args;->handled:Z

    return-void
.end method

.method private clearForRecycle()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcn/kuaipan/android/utils/SyncAccessor$Args;->params:[Ljava/lang/Object;

    iput-object v0, p0, Lcn/kuaipan/android/utils/SyncAccessor$Args;->result:Ljava/lang/Object;

    iput-object v0, p0, Lcn/kuaipan/android/utils/SyncAccessor$Args;->err:Ljava/lang/RuntimeException;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcn/kuaipan/android/utils/SyncAccessor$Args;->handled:Z

    return-void
.end method

.method public static obtain()Lcn/kuaipan/android/utils/SyncAccessor$Args;
    .locals 3

    sget-object v0, Lcn/kuaipan/android/utils/SyncAccessor$Args;->mPoolSync:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcn/kuaipan/android/utils/SyncAccessor$Args;->mPool:Lcn/kuaipan/android/utils/SyncAccessor$Args;

    if-eqz v1, :cond_0

    sget-object v1, Lcn/kuaipan/android/utils/SyncAccessor$Args;->mPool:Lcn/kuaipan/android/utils/SyncAccessor$Args;

    iget-object v2, v1, Lcn/kuaipan/android/utils/SyncAccessor$Args;->next:Lcn/kuaipan/android/utils/SyncAccessor$Args;

    sput-object v2, Lcn/kuaipan/android/utils/SyncAccessor$Args;->mPool:Lcn/kuaipan/android/utils/SyncAccessor$Args;

    const/4 v2, 0x0

    iput-object v2, v1, Lcn/kuaipan/android/utils/SyncAccessor$Args;->next:Lcn/kuaipan/android/utils/SyncAccessor$Args;

    monitor-exit v0

    return-object v1

    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    new-instance v0, Lcn/kuaipan/android/utils/SyncAccessor$Args;

    invoke-direct {v0}, Lcn/kuaipan/android/utils/SyncAccessor$Args;-><init>()V

    return-object v0

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method


# virtual methods
.method public recycle()V
    .locals 3

    sget-object v0, Lcn/kuaipan/android/utils/SyncAccessor$Args;->mPoolSync:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget v1, Lcn/kuaipan/android/utils/SyncAccessor$Args;->mPoolSize:I

    const/16 v2, 0xa

    if-ge v1, v2, :cond_0

    invoke-direct {p0}, Lcn/kuaipan/android/utils/SyncAccessor$Args;->clearForRecycle()V

    sget-object v1, Lcn/kuaipan/android/utils/SyncAccessor$Args;->mPool:Lcn/kuaipan/android/utils/SyncAccessor$Args;

    iput-object v1, p0, Lcn/kuaipan/android/utils/SyncAccessor$Args;->next:Lcn/kuaipan/android/utils/SyncAccessor$Args;

    sput-object p0, Lcn/kuaipan/android/utils/SyncAccessor$Args;->mPool:Lcn/kuaipan/android/utils/SyncAccessor$Args;

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
