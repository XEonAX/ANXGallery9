.class public Lcom/xiaomi/push/service/awake/AwakeUploadHelper;
.super Ljava/lang/Object;
.source "AwakeUploadHelper.java"


# direct methods
.method static synthetic access$000(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lcom/xiaomi/push/service/awake/AwakeUploadHelper;->doUploadData(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;)V

    return-void
.end method

.method private static doLast(Landroid/content/Context;Ljava/util/HashMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-static {p0}, Lcom/xiaomi/push/service/awake/module/AwakeManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/awake/module/AwakeManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/push/service/awake/module/AwakeManager;->getSendDataIml()Lcom/xiaomi/push/service/awake/module/IProcessData;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0, p0, p1}, Lcom/xiaomi/push/service/awake/module/IProcessData;->shouldDoLast(Landroid/content/Context;Ljava/util/HashMap;)V

    :cond_0
    return-void
.end method

.method private static doUploadData(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;)V
    .locals 2

    if-eqz p0, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_2

    :cond_0
    :try_start_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "awake_info"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "event_type"

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "description"

    invoke-virtual {v0, p1, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p0}, Lcom/xiaomi/push/service/awake/module/AwakeManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/awake/module/AwakeManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/xiaomi/push/service/awake/module/AwakeManager;->getOnLineCmd()I

    move-result p1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-static {p0, v0}, Lcom/xiaomi/push/service/awake/AwakeUploadHelper;->sendResponseDirectly(Landroid/content/Context;Ljava/util/HashMap;)V

    invoke-static {p0, v0}, Lcom/xiaomi/push/service/awake/AwakeUploadHelper;->sendResultByTinyData(Landroid/content/Context;Ljava/util/HashMap;)V

    goto :goto_0

    :pswitch_1
    invoke-static {p0, v0}, Lcom/xiaomi/push/service/awake/AwakeUploadHelper;->sendResultByTinyData(Landroid/content/Context;Ljava/util/HashMap;)V

    goto :goto_0

    :pswitch_2
    invoke-static {p0, v0}, Lcom/xiaomi/push/service/awake/AwakeUploadHelper;->sendResponseDirectly(Landroid/content/Context;Ljava/util/HashMap;)V

    :goto_0
    invoke-static {p0, v0}, Lcom/xiaomi/push/service/awake/AwakeUploadHelper;->doLast(Landroid/content/Context;Ljava/util/HashMap;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    :goto_1
    return-void

    :cond_1
    :goto_2
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static sendResponseDirectly(Landroid/content/Context;Ljava/util/HashMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-static {p0}, Lcom/xiaomi/push/service/awake/module/AwakeManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/awake/module/AwakeManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/push/service/awake/module/AwakeManager;->getSendDataIml()Lcom/xiaomi/push/service/awake/module/IProcessData;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0, p0, p1}, Lcom/xiaomi/push/service/awake/module/IProcessData;->sendDirectly(Landroid/content/Context;Ljava/util/HashMap;)V

    :cond_0
    return-void
.end method

.method private static sendResultByTinyData(Landroid/content/Context;Ljava/util/HashMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-static {p0}, Lcom/xiaomi/push/service/awake/module/AwakeManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/awake/module/AwakeManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/push/service/awake/module/AwakeManager;->getSendDataIml()Lcom/xiaomi/push/service/awake/module/IProcessData;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0, p0, p1}, Lcom/xiaomi/push/service/awake/module/IProcessData;->sendByTinyData(Landroid/content/Context;Ljava/util/HashMap;)V

    :cond_0
    return-void
.end method

.method public static uploadData(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;)V
    .locals 2

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;

    move-result-object v0

    new-instance v1, Lcom/xiaomi/push/service/awake/AwakeUploadHelper$1;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/xiaomi/push/service/awake/AwakeUploadHelper$1;-><init>(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->addOneShootJob(Ljava/lang/Runnable;)V

    return-void
.end method
