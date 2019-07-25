.class Lcom/xiaomi/push/service/MIPushNotificationHelper$DownloadOnlinePicTask;
.super Ljava/lang/Object;
.source "MIPushNotificationHelper.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/service/MIPushNotificationHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DownloadOnlinePicTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private isSizeLimited:Z

.field private picUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/xiaomi/push/service/MIPushNotificationHelper$DownloadOnlinePicTask;->context:Landroid/content/Context;

    iput-object p1, p0, Lcom/xiaomi/push/service/MIPushNotificationHelper$DownloadOnlinePicTask;->picUrl:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/xiaomi/push/service/MIPushNotificationHelper$DownloadOnlinePicTask;->isSizeLimited:Z

    return-void
.end method


# virtual methods
.method public call()Landroid/graphics/Bitmap;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lcom/xiaomi/push/service/MIPushNotificationHelper$DownloadOnlinePicTask;->picUrl:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/xiaomi/push/service/MIPushNotificationHelper$DownloadOnlinePicTask;->picUrl:Ljava/lang/String;

    const-string v2, "http"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/push/service/MIPushNotificationHelper$DownloadOnlinePicTask;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/xiaomi/push/service/MIPushNotificationHelper$DownloadOnlinePicTask;->picUrl:Ljava/lang/String;

    iget-boolean v3, p0, Lcom/xiaomi/push/service/MIPushNotificationHelper$DownloadOnlinePicTask;->isSizeLimited:Z

    invoke-static {v0, v2, v3}, Lcom/xiaomi/push/service/NotificationIconHelper;->getIconFromUrl(Landroid/content/Context;Ljava/lang/String;Z)Lcom/xiaomi/push/service/NotificationIconHelper$GetIconResult;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/xiaomi/push/service/NotificationIconHelper$GetIconResult;->bitmap:Landroid/graphics/Bitmap;

    move-object v1, v0

    goto :goto_0

    :cond_0
    const-string v0, "Failed get online picture/icon resource"

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/xiaomi/push/service/MIPushNotificationHelper$DownloadOnlinePicTask;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/xiaomi/push/service/MIPushNotificationHelper$DownloadOnlinePicTask;->picUrl:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/xiaomi/push/service/NotificationIconHelper;->getIconFromUri(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    if-nez v1, :cond_3

    const-string v0, "Failed get online picture/icon resource"

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    const-string v0, "Failed get online picture/icon resource cause picUrl is empty"

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    :cond_3
    :goto_0
    return-object v1
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/xiaomi/push/service/MIPushNotificationHelper$DownloadOnlinePicTask;->call()Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method
