.class Lcom/miui/gallery/ui/SlideShowFragment$1;
.super Landroid/os/Handler;
.source "SlideShowFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/SlideShowFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/SlideShowFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/SlideShowFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/SlideShowFragment$1;->this$0:Lcom/miui/gallery/ui/SlideShowFragment;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/miui/gallery/adapter/SlideShowAdapter$ShowItem;

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/ui/SlideShowFragment$1;->this$0:Lcom/miui/gallery/ui/SlideShowFragment;

    invoke-static {v0, p1}, Lcom/miui/gallery/ui/SlideShowFragment;->access$000(Lcom/miui/gallery/ui/SlideShowFragment;Lcom/miui/gallery/adapter/SlideShowAdapter$ShowItem;)V

    goto :goto_1

    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/ui/SlideShowFragment$1;->this$0:Lcom/miui/gallery/ui/SlideShowFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/SlideShowFragment;->access$100(Lcom/miui/gallery/ui/SlideShowFragment;)V

    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
