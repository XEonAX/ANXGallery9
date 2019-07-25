.class public Lcom/xiaomi/push/service/clientReport/PushClientReportManager;
.super Ljava/lang/Object;
.source "PushClientReportManager.java"


# static fields
.field private static volatile sInstance:Lcom/xiaomi/push/service/clientReport/PushClientReportManager;


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->mContext:Landroid/content/Context;

    return-void
.end method

.method private collectData(Lcom/xiaomi/clientreport/data/BaseClientReport;)V
    .locals 1

    instance-of v0, p1, Lcom/xiaomi/clientreport/data/PerfClientReport;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->mContext:Landroid/content/Context;

    check-cast p1, Lcom/xiaomi/clientreport/data/PerfClientReport;

    invoke-static {v0, p1}, Lcom/xiaomi/clientreport/manager/ClientReportClient;->reportPerf(Landroid/content/Context;Lcom/xiaomi/clientreport/data/PerfClientReport;)V

    goto :goto_0

    :cond_0
    instance-of v0, p1, Lcom/xiaomi/clientreport/data/EventClientReport;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->mContext:Landroid/content/Context;

    check-cast p1, Lcom/xiaomi/clientreport/data/EventClientReport;

    invoke-static {v0, p1}, Lcom/xiaomi/clientreport/manager/ClientReportClient;->reportEvent(Landroid/content/Context;Lcom/xiaomi/clientreport/data/EventClientReport;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/clientReport/PushClientReportManager;
    .locals 2

    sget-object v0, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->sInstance:Lcom/xiaomi/push/service/clientReport/PushClientReportManager;

    if-nez v0, :cond_1

    const-class v0, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->sInstance:Lcom/xiaomi/push/service/clientReport/PushClientReportManager;

    if-nez v1, :cond_0

    new-instance v1, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;

    invoke-direct {v1, p0}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->sInstance:Lcom/xiaomi/push/service/clientReport/PushClientReportManager;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_1
    :goto_0
    sget-object p0, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->sInstance:Lcom/xiaomi/push/service/clientReport/PushClientReportManager;

    return-object p0
.end method


# virtual methods
.method public reportEvent(Ljava/lang/String;Landroid/content/Intent;ILjava/lang/String;)V
    .locals 9

    if-nez p2, :cond_0

    return-void

    :cond_0
    const-string v0, "messageId"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v0, "eventMessageType"

    const/4 v1, -0x1

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p2

    invoke-static {p2}, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->getInterfaceIdByType(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    move-object v1, p0

    move-object v2, p1

    move v5, p3

    move-object v8, p4

    invoke-virtual/range {v1 .. v8}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)V

    return-void
.end method

.method public reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)V
    .locals 8

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->mContext:Landroid/content/Context;

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move-wide v5, p5

    move-object v7, p7

    invoke-static/range {v1 .. v7}, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->reportEvent2Object(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)Lcom/xiaomi/clientreport/data/EventClientReport;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/xiaomi/clientreport/data/BaseClientReport;->setAppPackageName(Ljava/lang/String;)V

    const-string p1, "3_6_19"

    invoke-virtual {p2, p1}, Lcom/xiaomi/clientreport/data/BaseClientReport;->setSdkVersion(Ljava/lang/String;)V

    invoke-direct {p0, p2}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->collectData(Lcom/xiaomi/clientreport/data/BaseClientReport;)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    .locals 8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move-object v7, p5

    invoke-virtual/range {v0 .. v7}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)V

    return-void
.end method

.method public reportEvent4DUPMD(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    const/16 v4, 0xfa2

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v7, p4

    invoke-virtual/range {v0 .. v7}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)V

    return-void
.end method

.method public reportEvent4ERROR(Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;)V
    .locals 9

    if-nez p2, :cond_0

    return-void

    :cond_0
    const-string v0, "messageId"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v0, "eventMessageType"

    const/4 v1, -0x1

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p2

    invoke-static {p2}, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->getInterfaceIdByType(I)Ljava/lang/String;

    move-result-object v3

    const/16 v5, 0x1389

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    move-object v1, p0

    move-object v2, p1

    move-object v8, p3

    invoke-virtual/range {v1 .. v8}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)V

    return-void
.end method

.method public reportEvent4ERROR(Ljava/lang/String;Landroid/content/Intent;Ljava/lang/Throwable;)V
    .locals 9

    if-nez p2, :cond_0

    return-void

    :cond_0
    const-string v0, "messageId"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v0, "eventMessageType"

    const/4 v1, -0x1

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p2

    invoke-static {p2}, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->getInterfaceIdByType(I)Ljava/lang/String;

    move-result-object v3

    const/16 v5, 0x1389

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {p3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v8

    move-object v1, p0

    move-object v2, p1

    invoke-virtual/range {v1 .. v8}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)V

    return-void
.end method

.method public reportEvent4ERROR(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    const/16 v4, 0x1389

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v7, p4

    invoke-virtual/range {v0 .. v7}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)V

    return-void
.end method

.method public reportEvent4ERROR(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-virtual {p4}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v7

    const/16 v4, 0x1389

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-virtual/range {v0 .. v7}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)V

    return-void
.end method

.method public reportEvent4NeedDrop(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    const/16 v4, 0x138a

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v7, p4

    invoke-virtual/range {v0 .. v7}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)V

    return-void
.end method

.method public reportPerf(Ljava/lang/String;IJJ)V
    .locals 9

    if-ltz p2, :cond_1

    const-wide/16 v0, 0x0

    cmp-long v2, p5, v0

    if-ltz v2, :cond_1

    cmp-long v2, p3, v0

    if-gtz v2, :cond_0

    goto :goto_0

    :cond_0
    iget-object v3, p0, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->mContext:Landroid/content/Context;

    move v4, p2

    move-wide v5, p3

    move-wide v7, p5

    invoke-static/range {v3 .. v8}, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->reportPerf2Object(Landroid/content/Context;IJJ)Lcom/xiaomi/clientreport/data/PerfClientReport;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/xiaomi/clientreport/data/BaseClientReport;->setAppPackageName(Ljava/lang/String;)V

    const-string p1, "3_6_19"

    invoke-virtual {p2, p1}, Lcom/xiaomi/clientreport/data/BaseClientReport;->setSdkVersion(Ljava/lang/String;)V

    invoke-direct {p0, p2}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->collectData(Lcom/xiaomi/clientreport/data/BaseClientReport;)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method
