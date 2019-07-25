.class public Lcom/xiaomi/push/mpcd/CDEntrance;
.super Ljava/lang/Object;
.source "CDEntrance.java"


# direct methods
.method private static getIntentFilter()Landroid/content/IntentFilter;
    .locals 2

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.PACKAGE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.PACKAGE_DATA_CLEARED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.PACKAGE_REPLACED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.PACKAGE_RESTARTED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "package"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    return-object v0
.end method

.method private static getIntentHandler()Lcom/xiaomi/push/mpcd/IntentHandler;
    .locals 1

    new-instance v0, Lcom/xiaomi/push/mpcd/CDEntrance$1;

    invoke-direct {v0}, Lcom/xiaomi/push/mpcd/CDEntrance$1;-><init>()V

    return-object v0
.end method

.method public static start(Landroid/content/Context;)V
    .locals 2

    invoke-static {p0}, Lcom/xiaomi/push/mpcd/JobController;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/mpcd/JobController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/push/mpcd/JobController;->schedulerJob()V

    :try_start_0
    new-instance v0, Lcom/xiaomi/push/mpcd/receivers/BroadcastActionsReceiver;

    invoke-static {}, Lcom/xiaomi/push/mpcd/CDEntrance;->getIntentHandler()Lcom/xiaomi/push/mpcd/IntentHandler;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/xiaomi/push/mpcd/receivers/BroadcastActionsReceiver;-><init>(Lcom/xiaomi/push/mpcd/IntentHandler;)V

    invoke-static {}, Lcom/xiaomi/push/mpcd/CDEntrance;->getIntentFilter()Landroid/content/IntentFilter;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method
