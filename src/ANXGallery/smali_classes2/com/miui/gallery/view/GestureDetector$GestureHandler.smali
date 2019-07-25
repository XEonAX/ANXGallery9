.class Lcom/miui/gallery/view/GestureDetector$GestureHandler;
.super Landroid/os/Handler;
.source "GestureDetector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/view/GestureDetector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GestureHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/view/GestureDetector;


# direct methods
.method constructor <init>(Lcom/miui/gallery/view/GestureDetector;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/view/GestureDetector$GestureHandler;->this$0:Lcom/miui/gallery/view/GestureDetector;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method constructor <init>(Lcom/miui/gallery/view/GestureDetector;Landroid/os/Handler;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/view/GestureDetector$GestureHandler;->this$0:Lcom/miui/gallery/view/GestureDetector;

    invoke-virtual {p2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown message "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    iget-object p1, p0, Lcom/miui/gallery/view/GestureDetector$GestureHandler;->this$0:Lcom/miui/gallery/view/GestureDetector;

    invoke-static {p1}, Lcom/miui/gallery/view/GestureDetector;->access$300(Lcom/miui/gallery/view/GestureDetector;)Lcom/miui/gallery/view/GestureDetector$OnDoubleTapListener;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/view/GestureDetector$GestureHandler;->this$0:Lcom/miui/gallery/view/GestureDetector;

    invoke-static {p1}, Lcom/miui/gallery/view/GestureDetector;->access$400(Lcom/miui/gallery/view/GestureDetector;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/view/GestureDetector$GestureHandler;->this$0:Lcom/miui/gallery/view/GestureDetector;

    invoke-static {p1}, Lcom/miui/gallery/view/GestureDetector;->access$300(Lcom/miui/gallery/view/GestureDetector;)Lcom/miui/gallery/view/GestureDetector$OnDoubleTapListener;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/view/GestureDetector$GestureHandler;->this$0:Lcom/miui/gallery/view/GestureDetector;

    invoke-static {v0}, Lcom/miui/gallery/view/GestureDetector;->access$000(Lcom/miui/gallery/view/GestureDetector;)Landroid/view/MotionEvent;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/miui/gallery/view/GestureDetector$OnDoubleTapListener;->onSingleTapConfirmed(Landroid/view/MotionEvent;)Z

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/view/GestureDetector$GestureHandler;->this$0:Lcom/miui/gallery/view/GestureDetector;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/miui/gallery/view/GestureDetector;->access$502(Lcom/miui/gallery/view/GestureDetector;Z)Z

    goto :goto_0

    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/view/GestureDetector$GestureHandler;->this$0:Lcom/miui/gallery/view/GestureDetector;

    invoke-static {p1}, Lcom/miui/gallery/view/GestureDetector;->access$200(Lcom/miui/gallery/view/GestureDetector;)V

    goto :goto_0

    :pswitch_2
    iget-object p1, p0, Lcom/miui/gallery/view/GestureDetector$GestureHandler;->this$0:Lcom/miui/gallery/view/GestureDetector;

    invoke-static {p1}, Lcom/miui/gallery/view/GestureDetector;->access$100(Lcom/miui/gallery/view/GestureDetector;)Lcom/miui/gallery/view/GestureDetector$OnGestureListener;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/view/GestureDetector$GestureHandler;->this$0:Lcom/miui/gallery/view/GestureDetector;

    invoke-static {v0}, Lcom/miui/gallery/view/GestureDetector;->access$000(Lcom/miui/gallery/view/GestureDetector;)Landroid/view/MotionEvent;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/miui/gallery/view/GestureDetector$OnGestureListener;->onShowPress(Landroid/view/MotionEvent;)V

    :cond_1
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
