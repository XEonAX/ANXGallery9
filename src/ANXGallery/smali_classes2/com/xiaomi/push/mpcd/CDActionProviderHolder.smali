.class public Lcom/xiaomi/push/mpcd/CDActionProviderHolder;
.super Ljava/lang/Object;
.source "CDActionProviderHolder.java"


# static fields
.field private static volatile sInstance:Lcom/xiaomi/push/mpcd/CDActionProviderHolder;


# instance fields
.field private mCDActionProvider:Lcom/xiaomi/push/mpcd/CDActionProvider;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/xiaomi/push/mpcd/CDActionProviderHolder;
    .locals 2

    sget-object v0, Lcom/xiaomi/push/mpcd/CDActionProviderHolder;->sInstance:Lcom/xiaomi/push/mpcd/CDActionProviderHolder;

    if-nez v0, :cond_1

    const-class v0, Lcom/xiaomi/push/mpcd/CDActionProviderHolder;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/xiaomi/push/mpcd/CDActionProviderHolder;->sInstance:Lcom/xiaomi/push/mpcd/CDActionProviderHolder;

    if-nez v1, :cond_0

    new-instance v1, Lcom/xiaomi/push/mpcd/CDActionProviderHolder;

    invoke-direct {v1}, Lcom/xiaomi/push/mpcd/CDActionProviderHolder;-><init>()V

    sput-object v1, Lcom/xiaomi/push/mpcd/CDActionProviderHolder;->sInstance:Lcom/xiaomi/push/mpcd/CDActionProviderHolder;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_1
    :goto_0
    sget-object v0, Lcom/xiaomi/push/mpcd/CDActionProviderHolder;->sInstance:Lcom/xiaomi/push/mpcd/CDActionProviderHolder;

    return-object v0
.end method


# virtual methods
.method public getCDActionProvider()Lcom/xiaomi/push/mpcd/CDActionProvider;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/mpcd/CDActionProviderHolder;->mCDActionProvider:Lcom/xiaomi/push/mpcd/CDActionProvider;

    return-object v0
.end method

.method public setCDActionProvider(Lcom/xiaomi/push/mpcd/CDActionProvider;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/push/mpcd/CDActionProviderHolder;->mCDActionProvider:Lcom/xiaomi/push/mpcd/CDActionProvider;

    return-void
.end method
