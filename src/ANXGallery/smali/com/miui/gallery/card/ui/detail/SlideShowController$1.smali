.class Lcom/miui/gallery/card/ui/detail/SlideShowController$1;
.super Ljava/lang/Object;
.source "SlideShowController.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/card/ui/detail/SlideShowController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/card/ui/detail/SlideShowController;


# direct methods
.method constructor <init>(Lcom/miui/gallery/card/ui/detail/SlideShowController;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController$1;->this$0:Lcom/miui/gallery/card/ui/detail/SlideShowController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 3

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController$1;->this$0:Lcom/miui/gallery/card/ui/detail/SlideShowController;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/SlideShowController;->access$300(Lcom/miui/gallery/card/ui/detail/SlideShowController;)V

    goto :goto_1

    :pswitch_1
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/miui/gallery/card/ui/detail/SlideShowController$ShowItem;

    :goto_0
    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController$1;->this$0:Lcom/miui/gallery/card/ui/detail/SlideShowController;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/SlideShowController;->access$000(Lcom/miui/gallery/card/ui/detail/SlideShowController;)Lcom/miui/gallery/widget/SlideShowView;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/card/ui/detail/SlideShowController$ShowItem;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p1

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/widget/SlideShowView;->next(Landroid/graphics/Bitmap;I)V

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController$1;->this$0:Lcom/miui/gallery/card/ui/detail/SlideShowController;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/SlideShowController;->access$200(Lcom/miui/gallery/card/ui/detail/SlideShowController;)Landroid/os/Handler;

    move-result-object p1

    const/4 v0, 0x2

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController$1;->this$0:Lcom/miui/gallery/card/ui/detail/SlideShowController;

    invoke-static {v1}, Lcom/miui/gallery/card/ui/detail/SlideShowController;->access$100(Lcom/miui/gallery/card/ui/detail/SlideShowController;)I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    :cond_1
    :goto_1
    const/4 p1, 0x1

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
