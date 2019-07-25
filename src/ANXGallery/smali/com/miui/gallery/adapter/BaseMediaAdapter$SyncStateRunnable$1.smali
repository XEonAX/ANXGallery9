.class Lcom/miui/gallery/adapter/BaseMediaAdapter$SyncStateRunnable$1;
.super Ljava/lang/Object;
.source "BaseMediaAdapter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/adapter/BaseMediaAdapter$SyncStateRunnable;->notifyStateChanged()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/adapter/BaseMediaAdapter$SyncStateRunnable;


# direct methods
.method constructor <init>(Lcom/miui/gallery/adapter/BaseMediaAdapter$SyncStateRunnable;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/adapter/BaseMediaAdapter$SyncStateRunnable$1;->this$0:Lcom/miui/gallery/adapter/BaseMediaAdapter$SyncStateRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseMediaAdapter$SyncStateRunnable$1;->this$0:Lcom/miui/gallery/adapter/BaseMediaAdapter$SyncStateRunnable;

    invoke-static {v0}, Lcom/miui/gallery/adapter/BaseMediaAdapter$SyncStateRunnable;->access$200(Lcom/miui/gallery/adapter/BaseMediaAdapter$SyncStateRunnable;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/adapter/BaseMediaAdapter;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/BaseMediaAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method
