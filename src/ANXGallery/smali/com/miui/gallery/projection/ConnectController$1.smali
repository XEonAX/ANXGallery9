.class Lcom/miui/gallery/projection/ConnectController$1;
.super Landroid/os/Handler;
.source "ConnectController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/projection/ConnectController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/projection/ConnectController;


# direct methods
.method constructor <init>(Lcom/miui/gallery/projection/ConnectController;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/projection/ConnectController$1;->this$0:Lcom/miui/gallery/projection/ConnectController;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController$1;->this$0:Lcom/miui/gallery/projection/ConnectController;

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/miui/gallery/projection/ConnectController;->access$100(Lcom/miui/gallery/projection/ConnectController;Ljava/lang/String;)V

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController$1;->this$0:Lcom/miui/gallery/projection/ConnectController;

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/miui/gallery/projection/ConnectController;->access$000(Lcom/miui/gallery/projection/ConnectController;Ljava/lang/String;)V

    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x64
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
