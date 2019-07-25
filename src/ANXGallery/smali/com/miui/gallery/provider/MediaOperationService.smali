.class public Lcom/miui/gallery/provider/MediaOperationService;
.super Landroid/app/IntentService;
.source "MediaOperationService.java"


# static fields
.field public static EXTRA_ARGUMENT:Ljava/lang/String; = "argument"

.field public static EXTRA_BUNDLE:Ljava/lang/String; = "bundle"

.field public static EXTRA_METHOD:Ljava/lang/String; = "method"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const-string v0, "MediaOperationService"

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 6

    const-string v0, "MediaOperationService"

    const-string v1, "On start handling intent %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/miui/gallery/provider/MediaOperationService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/NotificationHelper;->getEmptyNotification(Landroid/content/Context;)Landroid/app/Notification;

    move-result-object v0

    const/4 v1, 0x5

    invoke-virtual {p0, v1, v0}, Lcom/miui/gallery/provider/MediaOperationService;->startForeground(ILandroid/app/Notification;)V

    const/4 v0, 0x1

    :try_start_0
    invoke-virtual {p0}, Lcom/miui/gallery/provider/MediaOperationService;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/provider/GalleryContract;->AUTHORITY_URI:Landroid/net/Uri;

    sget-object v3, Lcom/miui/gallery/provider/MediaOperationService;->EXTRA_METHOD:Ljava/lang/String;

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/miui/gallery/provider/MediaOperationService;->EXTRA_ARGUMENT:Ljava/lang/String;

    invoke-virtual {p1, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lcom/miui/gallery/provider/MediaOperationService;->EXTRA_BUNDLE:Ljava/lang/String;

    invoke-virtual {p1, v5}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v5

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/content/ContentResolver;->call(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "MediaOperationService"

    const-string v3, "Done handling intent %s, result %s"

    invoke-static {v2, v3, p1, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    :try_start_1
    const-string v1, "MediaOperationService"

    const-string v2, "Error occurred while executing intent %s"

    invoke-static {v1, v2, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    invoke-virtual {p0, v0}, Lcom/miui/gallery/provider/MediaOperationService;->stopForeground(Z)V

    return-void

    :goto_1
    invoke-virtual {p0, v0}, Lcom/miui/gallery/provider/MediaOperationService;->stopForeground(Z)V

    throw p1
.end method
