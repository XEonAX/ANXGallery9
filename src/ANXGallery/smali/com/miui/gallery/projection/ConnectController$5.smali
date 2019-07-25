.class Lcom/miui/gallery/projection/ConnectController$5;
.super Ljava/lang/Object;
.source "ConnectController.java"

# interfaces
.implements Lcom/milink/api/v1/MilinkClientManagerDelegate;


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

    iput-object p1, p0, Lcom/miui/gallery/projection/ConnectController$5;->this$0:Lcom/miui/gallery/projection/ConnectController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private remoteDisconnected()V
    .locals 2

    const-string v0, "ConnectController"

    const-string v1, "do remoteDisconnected"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController$5;->this$0:Lcom/miui/gallery/projection/ConnectController;

    invoke-static {v0}, Lcom/miui/gallery/projection/ConnectController;->access$600(Lcom/miui/gallery/projection/ConnectController;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController$5;->this$0:Lcom/miui/gallery/projection/ConnectController;

    invoke-static {v0}, Lcom/miui/gallery/projection/ConnectController;->access$1500(Lcom/miui/gallery/projection/ConnectController;)V

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController$5;->this$0:Lcom/miui/gallery/projection/ConnectController;

    invoke-static {v0}, Lcom/miui/gallery/projection/ConnectController;->access$1600(Lcom/miui/gallery/projection/ConnectController;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public onClose()V
    .locals 2

    const-string v0, "ConnectController"

    const-string v1, "service closed"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onConnected()V
    .locals 3

    const-string v0, "ConnectController"

    const-string v1, "connect is responded ok"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController$5;->this$0:Lcom/miui/gallery/projection/ConnectController;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/projection/ConnectController;->access$602(Lcom/miui/gallery/projection/ConnectController;Z)Z

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController$5;->this$0:Lcom/miui/gallery/projection/ConnectController;

    iget-object v2, p0, Lcom/miui/gallery/projection/ConnectController$5;->this$0:Lcom/miui/gallery/projection/ConnectController;

    invoke-static {v2}, Lcom/miui/gallery/projection/ConnectController;->access$800(Lcom/miui/gallery/projection/ConnectController;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/miui/gallery/projection/ConnectController;->access$702(Lcom/miui/gallery/projection/ConnectController;Ljava/lang/String;)Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController$5;->this$0:Lcom/miui/gallery/projection/ConnectController;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/miui/gallery/projection/ConnectController;->access$802(Lcom/miui/gallery/projection/ConnectController;Ljava/lang/String;)Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController$5;->this$0:Lcom/miui/gallery/projection/ConnectController;

    invoke-static {v0, v1}, Lcom/miui/gallery/projection/ConnectController;->access$902(Lcom/miui/gallery/projection/ConnectController;Z)Z

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController$5;->this$0:Lcom/miui/gallery/projection/ConnectController;

    invoke-static {v0}, Lcom/miui/gallery/projection/ConnectController;->access$1000(Lcom/miui/gallery/projection/ConnectController;)Lcom/milink/api/v1/MilinkClientManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/milink/api/v1/MilinkClientManager;->startShow()Lcom/milink/api/v1/type/ReturnCode;

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController$5;->this$0:Lcom/miui/gallery/projection/ConnectController;

    invoke-static {v0}, Lcom/miui/gallery/projection/ConnectController;->access$1100(Lcom/miui/gallery/projection/ConnectController;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "ConnectController"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "==the to show photo is: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/miui/gallery/projection/ConnectController$5;->this$0:Lcom/miui/gallery/projection/ConnectController;

    invoke-static {v2}, Lcom/miui/gallery/projection/ConnectController;->access$1100(Lcom/miui/gallery/projection/ConnectController;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController$5;->this$0:Lcom/miui/gallery/projection/ConnectController;

    iget-object v1, p0, Lcom/miui/gallery/projection/ConnectController$5;->this$0:Lcom/miui/gallery/projection/ConnectController;

    invoke-static {v1}, Lcom/miui/gallery/projection/ConnectController;->access$1100(Lcom/miui/gallery/projection/ConnectController;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/projection/ConnectController$5;->this$0:Lcom/miui/gallery/projection/ConnectController;

    invoke-static {v2}, Lcom/miui/gallery/projection/ConnectController;->access$1200(Lcom/miui/gallery/projection/ConnectController;)I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/projection/ConnectController;->access$1300(Lcom/miui/gallery/projection/ConnectController;Ljava/lang/String;I)I

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController$5;->this$0:Lcom/miui/gallery/projection/ConnectController;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/projection/ConnectController;->access$1400(Lcom/miui/gallery/projection/ConnectController;I)V

    return-void
.end method

.method public onConnectedFailed(Lcom/milink/api/v1/type/ErrorCode;)V
    .locals 1

    const-string p1, "ConnectController"

    const-string v0, "connect is responded failed -1"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/projection/ConnectController$5;->this$0:Lcom/miui/gallery/projection/ConnectController;

    invoke-static {p1}, Lcom/miui/gallery/projection/ConnectController;->access$1500(Lcom/miui/gallery/projection/ConnectController;)V

    iget-object p1, p0, Lcom/miui/gallery/projection/ConnectController$5;->this$0:Lcom/miui/gallery/projection/ConnectController;

    const/4 v0, -0x1

    invoke-static {p1, v0}, Lcom/miui/gallery/projection/ConnectController;->access$1400(Lcom/miui/gallery/projection/ConnectController;I)V

    return-void
.end method

.method public onDeviceFound(Ljava/lang/String;Ljava/lang/String;Lcom/milink/api/v1/type/DeviceType;)V
    .locals 1

    sget-object v0, Lcom/milink/api/v1/type/DeviceType;->TV:Lcom/milink/api/v1/type/DeviceType;

    if-eq p3, v0, :cond_0

    return-void

    :cond_0
    const-string p3, "ConnectController"

    const-string v0, "service onDeviceFound"

    invoke-static {p3, v0}, Lcom/miui/gallery/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p3, p0, Lcom/miui/gallery/projection/ConnectController$5;->this$0:Lcom/miui/gallery/projection/ConnectController;

    invoke-static {p3}, Lcom/miui/gallery/projection/ConnectController;->access$400(Lcom/miui/gallery/projection/ConnectController;)Ljava/util/HashMap;

    move-result-object p3

    invoke-virtual {p3, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lcom/miui/gallery/projection/ConnectController$5;->this$0:Lcom/miui/gallery/projection/ConnectController;

    invoke-static {p1}, Lcom/miui/gallery/projection/ConnectController;->access$500(Lcom/miui/gallery/projection/ConnectController;)Landroid/os/Handler;

    move-result-object p1

    const/16 p3, 0x64

    invoke-static {p1, p3, p2}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    return-void
.end method

.method public onDeviceLost(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController$5;->this$0:Lcom/miui/gallery/projection/ConnectController;

    invoke-static {v0}, Lcom/miui/gallery/projection/ConnectController;->access$400(Lcom/miui/gallery/projection/ConnectController;)Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/projection/ConnectController$5;->this$0:Lcom/miui/gallery/projection/ConnectController;

    invoke-static {v2}, Lcom/miui/gallery/projection/ConnectController;->access$400(Lcom/miui/gallery/projection/ConnectController;)Ljava/util/HashMap;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/projection/ConnectController$5;->this$0:Lcom/miui/gallery/projection/ConnectController;

    invoke-static {p1}, Lcom/miui/gallery/projection/ConnectController;->access$400(Lcom/miui/gallery/projection/ConnectController;)Ljava/util/HashMap;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lcom/miui/gallery/projection/ConnectController$5;->this$0:Lcom/miui/gallery/projection/ConnectController;

    invoke-static {p1}, Lcom/miui/gallery/projection/ConnectController;->access$500(Lcom/miui/gallery/projection/ConnectController;)Landroid/os/Handler;

    move-result-object p1

    const/16 v0, 0x65

    invoke-static {p1, v0, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    :cond_2
    return-void
.end method

.method public onDisconnected()V
    .locals 2

    const-string v0, "ConnectController"

    const-string v1, "remote show is dispeared, but connected."

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/projection/ConnectController$5;->remoteDisconnected()V

    return-void
.end method

.method public onLoading()V
    .locals 2

    const-string v0, "ConnectController"

    const-string v1, "loading..."

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController$5;->this$0:Lcom/miui/gallery/projection/ConnectController;

    invoke-static {v0}, Lcom/miui/gallery/projection/ConnectController;->access$1700(Lcom/miui/gallery/projection/ConnectController;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/projection/ConnectController$MediaPlayListener;

    invoke-interface {v1}, Lcom/miui/gallery/projection/ConnectController$MediaPlayListener;->onLoading()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onNextAudio(Z)V
    .locals 3

    const-string v0, "ConnectController"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onRequestNextItem: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onOpen()V
    .locals 2

    const-string v0, "ConnectController"

    const-string v1, "service openned"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController$5;->this$0:Lcom/miui/gallery/projection/ConnectController;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/projection/ConnectController;->queryDevices(Z)V

    return-void
.end method

.method public onPaused()V
    .locals 2

    const-string v0, "ConnectController"

    const-string v1, "paused"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController$5;->this$0:Lcom/miui/gallery/projection/ConnectController;

    invoke-static {v0}, Lcom/miui/gallery/projection/ConnectController;->access$1700(Lcom/miui/gallery/projection/ConnectController;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/projection/ConnectController$MediaPlayListener;

    invoke-interface {v1}, Lcom/miui/gallery/projection/ConnectController$MediaPlayListener;->onPaused()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onPlaying()V
    .locals 2

    const-string v0, "ConnectController"

    const-string v1, "playing..."

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController$5;->this$0:Lcom/miui/gallery/projection/ConnectController;

    invoke-static {v0}, Lcom/miui/gallery/projection/ConnectController;->access$1700(Lcom/miui/gallery/projection/ConnectController;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/projection/ConnectController$MediaPlayListener;

    invoke-interface {v1}, Lcom/miui/gallery/projection/ConnectController$MediaPlayListener;->onPlaying()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onPrevAudio(Z)V
    .locals 3

    const-string v0, "ConnectController"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onRequestPrevItem: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onStopped()V
    .locals 2

    const-string v0, "ConnectController"

    const-string v1, "stopped"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController$5;->this$0:Lcom/miui/gallery/projection/ConnectController;

    invoke-static {v0}, Lcom/miui/gallery/projection/ConnectController;->access$1700(Lcom/miui/gallery/projection/ConnectController;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/projection/ConnectController$MediaPlayListener;

    invoke-interface {v1}, Lcom/miui/gallery/projection/ConnectController$MediaPlayListener;->onStopped()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onVolume(I)V
    .locals 0

    return-void
.end method
