.class Lcom/xiaomi/metoknlp/g;
.super Landroid/os/Handler;
.source "MetokApplication.java"


# instance fields
.field final synthetic X:Lcom/xiaomi/metoknlp/MetokApplication;


# direct methods
.method public constructor <init>(Lcom/xiaomi/metoknlp/MetokApplication;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/metoknlp/g;->X:Lcom/xiaomi/metoknlp/MetokApplication;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 0

    iget p1, p1, Landroid/os/Message;->what:I

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-static {}, Lcom/xiaomi/metoknlp/a;->g()Lcom/xiaomi/metoknlp/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/xiaomi/metoknlp/a;->update()V

    goto :goto_0

    :pswitch_1
    iget-object p1, p0, Lcom/xiaomi/metoknlp/g;->X:Lcom/xiaomi/metoknlp/MetokApplication;

    invoke-static {p1}, Lcom/xiaomi/metoknlp/MetokApplication;->access$100(Lcom/xiaomi/metoknlp/MetokApplication;)V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x65
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
