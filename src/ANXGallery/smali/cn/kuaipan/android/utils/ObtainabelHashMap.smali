.class public Lcn/kuaipan/android/utils/ObtainabelHashMap;
.super Ljava/util/HashMap;
.source "ObtainabelHashMap.java"

# interfaces
.implements Lcn/kuaipan/android/utils/IObtainable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/HashMap<",
        "TK;TV;>;",
        "Lcn/kuaipan/android/utils/IObtainable;"
    }
.end annotation


# static fields
.field private static mPool:Lcn/kuaipan/android/utils/ObtainabelHashMap; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcn/kuaipan/android/utils/ObtainabelHashMap<",
            "**>;"
        }
    .end annotation
.end field

.field private static mPoolSize:I = 0x0

.field private static mPoolSync:Ljava/lang/Object; = null

.field private static final serialVersionUID:J = 0x482e972b8c109b80L


# instance fields
.field private next:Lcn/kuaipan/android/utils/ObtainabelHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcn/kuaipan/android/utils/ObtainabelHashMap<",
            "**>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcn/kuaipan/android/utils/ObtainabelHashMap;->mPoolSync:Ljava/lang/Object;

    const/4 v0, 0x0

    sput v0, Lcn/kuaipan/android/utils/ObtainabelHashMap;->mPoolSize:I

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    return-void
.end method

.method public static obtain()Lcn/kuaipan/android/utils/ObtainabelHashMap;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">()",
            "Lcn/kuaipan/android/utils/ObtainabelHashMap<",
            "TK;TV;>;"
        }
    .end annotation

    sget-object v0, Lcn/kuaipan/android/utils/ObtainabelHashMap;->mPoolSync:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcn/kuaipan/android/utils/ObtainabelHashMap;->mPool:Lcn/kuaipan/android/utils/ObtainabelHashMap;

    if-eqz v1, :cond_0

    sget-object v1, Lcn/kuaipan/android/utils/ObtainabelHashMap;->mPool:Lcn/kuaipan/android/utils/ObtainabelHashMap;

    iget-object v2, v1, Lcn/kuaipan/android/utils/ObtainabelHashMap;->next:Lcn/kuaipan/android/utils/ObtainabelHashMap;

    sput-object v2, Lcn/kuaipan/android/utils/ObtainabelHashMap;->mPool:Lcn/kuaipan/android/utils/ObtainabelHashMap;

    const/4 v2, 0x0

    iput-object v2, v1, Lcn/kuaipan/android/utils/ObtainabelHashMap;->next:Lcn/kuaipan/android/utils/ObtainabelHashMap;

    sget v2, Lcn/kuaipan/android/utils/ObtainabelHashMap;->mPoolSize:I

    add-int/lit8 v2, v2, -0x1

    sput v2, Lcn/kuaipan/android/utils/ObtainabelHashMap;->mPoolSize:I

    invoke-virtual {v1}, Lcn/kuaipan/android/utils/ObtainabelHashMap;->clear()V

    monitor-exit v0

    return-object v1

    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    new-instance v0, Lcn/kuaipan/android/utils/ObtainabelHashMap;

    invoke-direct {v0}, Lcn/kuaipan/android/utils/ObtainabelHashMap;-><init>()V

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
    .locals 4

    sget-object v0, Lcn/kuaipan/android/utils/ObtainabelHashMap;->mPoolSync:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget v1, Lcn/kuaipan/android/utils/ObtainabelHashMap;->mPoolSize:I

    const/16 v2, 0x1f4

    if-ge v1, v2, :cond_0

    sget v1, Lcn/kuaipan/android/utils/ObtainabelHashMap;->mPoolSize:I

    add-int/lit8 v1, v1, 0x1

    sput v1, Lcn/kuaipan/android/utils/ObtainabelHashMap;->mPoolSize:I

    sget-object v1, Lcn/kuaipan/android/utils/ObtainabelHashMap;->mPool:Lcn/kuaipan/android/utils/ObtainabelHashMap;

    iput-object v1, p0, Lcn/kuaipan/android/utils/ObtainabelHashMap;->next:Lcn/kuaipan/android/utils/ObtainabelHashMap;

    sput-object p0, Lcn/kuaipan/android/utils/ObtainabelHashMap;->mPool:Lcn/kuaipan/android/utils/ObtainabelHashMap;

    :cond_0
    invoke-virtual {p0}, Lcn/kuaipan/android/utils/ObtainabelHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    instance-of v3, v2, Lcn/kuaipan/android/utils/IObtainable;

    if-eqz v3, :cond_1

    check-cast v2, Lcn/kuaipan/android/utils/IObtainable;

    invoke-interface {v2}, Lcn/kuaipan/android/utils/IObtainable;->recycle()V

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcn/kuaipan/android/utils/ObtainabelHashMap;->clear()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
