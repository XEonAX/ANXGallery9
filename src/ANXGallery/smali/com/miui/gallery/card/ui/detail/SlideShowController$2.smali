.class Lcom/miui/gallery/card/ui/detail/SlideShowController$2;
.super Ljava/lang/Object;
.source "SlideShowController.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/FutureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/card/ui/detail/SlideShowController;->loadNextBitmap()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/FutureListener<",
        "Lcom/miui/gallery/card/ui/detail/SlideShowController$ShowItem;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/card/ui/detail/SlideShowController;


# direct methods
.method constructor <init>(Lcom/miui/gallery/card/ui/detail/SlideShowController;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController$2;->this$0:Lcom/miui/gallery/card/ui/detail/SlideShowController;

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
            "Lcom/miui/gallery/card/ui/detail/SlideShowController$ShowItem;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/Future;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/Future;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/card/ui/detail/SlideShowController$ShowItem;

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController$2;->this$0:Lcom/miui/gallery/card/ui/detail/SlideShowController;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/SlideShowController;->access$200(Lcom/miui/gallery/card/ui/detail/SlideShowController;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    :cond_0
    return-void
.end method
