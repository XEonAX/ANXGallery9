.class public abstract Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter;
.super Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated;
.source "BaseMediaSyncStateAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter$SyncStateRunnable;
    }
.end annotation


# static fields
.field private static volatile sIsGalleryCloudSyncable:Z

.field private static volatile sIsLoginAccount:Z

.field private static sUpdateRunnable:Ljava/lang/Runnable;


# instance fields
.field protected mShowScene:Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;

.field protected mSyncStateDisplayOptions:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    sget-object v0, Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;->SCENE_NONE:Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter;-><init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;)V
    .locals 1

    const/4 v0, 0x7

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter;-><init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter;->mShowScene:Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;

    iput p3, p0, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter;->mSyncStateDisplayOptions:I

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter;->updateGalleryCloudSyncableState()V

    return-void
.end method

.method static synthetic access$000()Z
    .locals 1

    sget-boolean v0, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter;->sIsLoginAccount:Z

    return v0
.end method

.method static synthetic access$002(Z)Z
    .locals 0

    sput-boolean p0, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter;->sIsLoginAccount:Z

    return p0
.end method

.method static synthetic access$100()Z
    .locals 1

    sget-boolean v0, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter;->sIsGalleryCloudSyncable:Z

    return v0
.end method

.method static synthetic access$102(Z)Z
    .locals 0

    sput-boolean p0, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter;->sIsGalleryCloudSyncable:Z

    return p0
.end method


# virtual methods
.method protected getSyncStateInternal(I)I
    .locals 1

    sget-boolean v0, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter;->sIsGalleryCloudSyncable:Z

    if-nez v0, :cond_1

    sget-boolean v0, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter;->sIsLoginAccount:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x3

    if-ne p1, v0, :cond_0

    const/4 p1, 0x4

    goto :goto_0

    :cond_0
    const p1, 0x7fffffff

    :cond_1
    :goto_0
    return p1
.end method

.method public updateGalleryCloudSyncableState()V
    .locals 4

    sget-object v0, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter;->sUpdateRunnable:Ljava/lang/Runnable;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter$SyncStateRunnable;

    invoke-direct {v0, p0}, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter$SyncStateRunnable;-><init>(Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter;)V

    sput-object v0, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter;->sUpdateRunnable:Ljava/lang/Runnable;

    :cond_0
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter;->sUpdateRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter;->sUpdateRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/internal/CompatHandler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
