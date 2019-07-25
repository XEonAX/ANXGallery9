.class public abstract Lcom/miui/gallery/provider/GalleryContentResolver;
.super Ljava/lang/Object;
.source "GalleryContentResolver.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/provider/GalleryContentResolver$NotifyParams;
    }
.end annotation


# instance fields
.field private mDelayNums:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/miui/gallery/provider/GalleryContentResolver;->mHandler:Landroid/os/Handler;

    goto :goto_0

    :cond_0
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/miui/gallery/provider/GalleryContentResolver;->mHandler:Landroid/os/Handler;

    :goto_0
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/provider/GalleryContentResolver;->mDelayNums:Landroid/util/SparseArray;

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 5

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/miui/gallery/provider/GalleryContentResolver$NotifyParams;

    iget-object v1, v0, Lcom/miui/gallery/provider/GalleryContentResolver$NotifyParams;->uri:Landroid/net/Uri;

    iget-object v2, v0, Lcom/miui/gallery/provider/GalleryContentResolver$NotifyParams;->observer:Landroid/database/ContentObserver;

    iget-wide v3, v0, Lcom/miui/gallery/provider/GalleryContentResolver$NotifyParams;->syncReason:J

    invoke-virtual {p0, v1, v2, v3, v4}, Lcom/miui/gallery/provider/GalleryContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;J)V

    iget-object v1, p0, Lcom/miui/gallery/provider/GalleryContentResolver;->mDelayNums:Landroid/util/SparseArray;

    iget p1, p1, Landroid/os/Message;->what:I

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, p1, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    const-string p1, "GalleryContentResolver"

    const-string v1, "delay notify %s %s"

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    iget-object v0, v0, Lcom/miui/gallery/provider/GalleryContentResolver$NotifyParams;->uri:Landroid/net/Uri;

    invoke-static {p1, v1, v3, v0}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return v2
.end method

.method protected abstract matchUri(Landroid/net/Uri;)Ljava/lang/Object;
.end method

.method public final notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;J)V
    .locals 0

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/miui/gallery/provider/GalleryContentResolver;->notifyInternal(Landroid/net/Uri;Landroid/database/ContentObserver;J)V

    return-void
.end method

.method public final notifyChangeDelay(Landroid/net/Uri;Landroid/database/ContentObserver;J)V
    .locals 3

    invoke-virtual {p0, p1}, Lcom/miui/gallery/provider/GalleryContentResolver;->matchUri(Landroid/net/Uri;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/provider/GalleryContentResolver;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeMessages(I)V

    new-instance v1, Lcom/miui/gallery/provider/GalleryContentResolver$NotifyParams;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/miui/gallery/provider/GalleryContentResolver$NotifyParams;-><init>(Lcom/miui/gallery/provider/GalleryContentResolver;Lcom/miui/gallery/provider/GalleryContentResolver$1;)V

    iput-object p1, v1, Lcom/miui/gallery/provider/GalleryContentResolver$NotifyParams;->uri:Landroid/net/Uri;

    iput-object p2, v1, Lcom/miui/gallery/provider/GalleryContentResolver$NotifyParams;->observer:Landroid/database/ContentObserver;

    iput-wide p3, v1, Lcom/miui/gallery/provider/GalleryContentResolver$NotifyParams;->syncReason:J

    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryContentResolver;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/provider/GalleryContentResolver;->mDelayNums:Landroid/util/SparseArray;

    const/4 p3, 0x0

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    invoke-virtual {p2, v0, p4}, Landroid/util/SparseArray;->get(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    add-int/lit8 p2, p2, 0x1

    const/16 p4, 0x64

    if-le p2, p4, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/provider/GalleryContentResolver;->mHandler:Landroid/os/Handler;

    invoke-virtual {p2, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    const/4 p2, 0x0

    goto :goto_0

    :cond_0
    iget-object p3, p0, Lcom/miui/gallery/provider/GalleryContentResolver;->mHandler:Landroid/os/Handler;

    const-wide/16 v1, 0x3e8

    invoke-virtual {p3, p1, v1, v2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryContentResolver;->mDelayNums:Landroid/util/SparseArray;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p1, v0, p2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-void
.end method

.method protected abstract notifyInternal(Landroid/net/Uri;Landroid/database/ContentObserver;J)V
.end method
