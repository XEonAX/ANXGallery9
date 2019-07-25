.class public Lcom/miui/gallery/util/SafeBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SafeBroadcastReceiver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/util/SafeBroadcastReceiver$WeakReceiver;
    }
.end annotation


# instance fields
.field private mWeakReceiverRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/miui/gallery/util/SafeBroadcastReceiver$WeakReceiver;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/miui/gallery/util/SafeBroadcastReceiver$WeakReceiver;)V
    .locals 1

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/miui/gallery/util/SafeBroadcastReceiver;->mWeakReceiverRef:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/SafeBroadcastReceiver;->mWeakReceiverRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/util/SafeBroadcastReceiver$WeakReceiver;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1, p2}, Lcom/miui/gallery/util/SafeBroadcastReceiver$WeakReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V

    :cond_0
    return-void
.end method
