.class Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor$1;
.super Landroid/os/Handler;
.source "SerializedAsyncTaskProcessor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;-><init>(ZI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;


# direct methods
.method constructor <init>(Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor$1;->this$0:Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor$SerializedAsyncTask;

    iget v1, p1, Landroid/os/Message;->what:I

    if-nez v1, :cond_0

    invoke-virtual {v0}, Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor$SerializedAsyncTask;->preProcess()V

    goto :goto_0

    :cond_0
    iget v1, p1, Landroid/os/Message;->what:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    invoke-virtual {v0}, Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor$SerializedAsyncTask;->postProcess()V

    :cond_1
    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    return-void
.end method
