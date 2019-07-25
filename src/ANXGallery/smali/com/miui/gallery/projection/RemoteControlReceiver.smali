.class public Lcom/miui/gallery/projection/RemoteControlReceiver;
.super Landroid/content/BroadcastReceiver;
.source "RemoteControlReceiver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/projection/RemoteControlReceiver$RemoteControlListener;
    }
.end annotation


# instance fields
.field private mListener:Lcom/miui/gallery/projection/RemoteControlReceiver$RemoteControlListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    const-string p1, "RemoteControlReceiver"

    const-string v0, "onReceive broadcast"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string v0, "miui.intent.action.REMOTE_CONTROL"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const-string p1, "android.intent.extra.KEY_EVENT"

    invoke-virtual {p2, p1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/view/KeyEvent;

    if-eqz p1, :cond_1

    const/16 p2, 0x19

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    if-ne p2, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/projection/RemoteControlReceiver;->mListener:Lcom/miui/gallery/projection/RemoteControlReceiver$RemoteControlListener;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/projection/RemoteControlReceiver;->mListener:Lcom/miui/gallery/projection/RemoteControlReceiver$RemoteControlListener;

    const/4 p2, 0x0

    invoke-interface {p1, p2}, Lcom/miui/gallery/projection/RemoteControlReceiver$RemoteControlListener;->onRemoteControl(Z)V

    goto :goto_0

    :cond_0
    const/16 p2, 0x18

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result p1

    if-ne p2, p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/projection/RemoteControlReceiver;->mListener:Lcom/miui/gallery/projection/RemoteControlReceiver$RemoteControlListener;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/projection/RemoteControlReceiver;->mListener:Lcom/miui/gallery/projection/RemoteControlReceiver$RemoteControlListener;

    const/4 p2, 0x1

    invoke-interface {p1, p2}, Lcom/miui/gallery/projection/RemoteControlReceiver$RemoteControlListener;->onRemoteControl(Z)V

    :cond_1
    :goto_0
    return-void
.end method

.method public setListener(Lcom/miui/gallery/projection/RemoteControlReceiver$RemoteControlListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/projection/RemoteControlReceiver;->mListener:Lcom/miui/gallery/projection/RemoteControlReceiver$RemoteControlListener;

    return-void
.end method
