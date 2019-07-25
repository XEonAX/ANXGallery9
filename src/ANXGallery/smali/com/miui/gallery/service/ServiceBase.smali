.class public abstract Lcom/miui/gallery/service/ServiceBase;
.super Landroid/app/Service;
.source "ServiceBase.java"


# static fields
.field protected static TAG:Ljava/lang/String; = "ServiceBase"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method


# virtual methods
.method protected abstract getNotification()Landroid/app/Notification;
.end method

.method protected abstract getNotificationId()I
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public onCreate()V
    .locals 2

    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    sget-object v0, Lcom/miui/gallery/service/ServiceBase;->TAG:Ljava/lang/String;

    const-string v1, "start foreground service"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/service/ServiceBase;->getNotificationId()I

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/service/ServiceBase;->getNotification()Landroid/app/Notification;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/service/ServiceBase;->startForeground(ILandroid/app/Notification;)V

    :cond_0
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    sget-object v0, Lcom/miui/gallery/service/ServiceBase;->TAG:Ljava/lang/String;

    const-string v1, "start foreground service"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/service/ServiceBase;->getNotificationId()I

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/service/ServiceBase;->getNotification()Landroid/app/Notification;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/service/ServiceBase;->startForeground(ILandroid/app/Notification;)V

    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result p1

    return p1
.end method
