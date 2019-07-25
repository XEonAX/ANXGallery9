.class Lcom/miui/gallery/ui/SlideShowFragment$3;
.super Ljava/lang/Object;
.source "SlideShowFragment.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/FutureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/SlideShowFragment;->loadNextBitmap()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/FutureListener<",
        "Lcom/miui/gallery/adapter/SlideShowAdapter$ShowItem;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/SlideShowFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/SlideShowFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/SlideShowFragment$3;->this$0:Lcom/miui/gallery/ui/SlideShowFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFutureDone(Lcom/miui/gallery/threadpool/Future;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/threadpool/Future<",
            "Lcom/miui/gallery/adapter/SlideShowAdapter$ShowItem;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/Future;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/SlideShowFragment$3;->this$0:Lcom/miui/gallery/ui/SlideShowFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/SlideShowFragment;->access$300(Lcom/miui/gallery/ui/SlideShowFragment;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x2

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/Future;->get()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    :cond_0
    return-void
.end method
