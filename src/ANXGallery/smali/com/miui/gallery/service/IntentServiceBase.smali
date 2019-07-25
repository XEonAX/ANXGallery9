.class public abstract Lcom/miui/gallery/service/IntentServiceBase;
.super Landroid/app/IntentService;
.source "IntentServiceBase.java"


# static fields
.field protected static TAG:Ljava/lang/String; = "ServiceBase"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    sget-object v0, Lcom/miui/gallery/service/IntentServiceBase;->TAG:Ljava/lang/String;

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected abstract getNotification()Landroid/app/Notification;
.end method

.method protected abstract getNotificationId()I
.end method

.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 1

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x1a

    if-lt p1, v0, :cond_0

    sget-object p1, Lcom/miui/gallery/service/IntentServiceBase;->TAG:Ljava/lang/String;

    const-string v0, "start foreground service"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/service/IntentServiceBase;->getNotificationId()I

    move-result p1

    invoke-virtual {p0}, Lcom/miui/gallery/service/IntentServiceBase;->getNotification()Landroid/app/Notification;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/service/IntentServiceBase;->startForeground(ILandroid/app/Notification;)V

    :cond_0
    return-void
.end method
