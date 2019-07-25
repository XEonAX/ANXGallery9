.class Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter$SyncStateRunnable;
.super Ljava/lang/Object;
.source "BaseMediaSyncStateAdapter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SyncStateRunnable"
.end annotation


# instance fields
.field private final mAdapterRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter$SyncStateRunnable;->mAdapterRef:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter$SyncStateRunnable;)Ljava/lang/ref/WeakReference;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter$SyncStateRunnable;->mAdapterRef:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method private notifyStateChanged()V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter$SyncStateRunnable$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter$SyncStateRunnable$1;-><init>(Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter$SyncStateRunnable;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter$SyncStateRunnable;->mAdapterRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter;

    if-eqz v0, :cond_1

    iget-object v0, v0, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/SyncUtil;->existXiaomiAccount(Landroid/content/Context;)Z

    move-result v1

    invoke-static {v1}, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter;->access$002(Z)Z

    const/4 v1, 0x0

    invoke-static {}, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter;->access$000()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-static {v0}, Lcom/miui/gallery/util/SyncUtil;->isGalleryCloudSyncable(Landroid/content/Context;)Z

    move-result v1

    :cond_0
    invoke-static {}, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter;->access$100()Z

    move-result v0

    if-eq v0, v1, :cond_1

    invoke-static {v1}, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter;->access$102(Z)Z

    invoke-direct {p0}, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter$SyncStateRunnable;->notifyStateChanged()V

    :cond_1
    return-void
.end method
