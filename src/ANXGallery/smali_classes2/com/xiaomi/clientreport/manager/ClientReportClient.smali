.class public Lcom/xiaomi/clientreport/manager/ClientReportClient;
.super Ljava/lang/Object;
.source "ClientReportClient.java"


# direct methods
.method public static init(Landroid/content/Context;Lcom/xiaomi/clientreport/data/Config;Lcom/xiaomi/clientreport/processor/IEventProcessor;Lcom/xiaomi/clientreport/processor/IPerfProcessor;)V
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "init in process "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/android/AppInfoUtils;->getProcessName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " pid :"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " threadId: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->v(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->init(Lcom/xiaomi/clientreport/data/Config;Lcom/xiaomi/clientreport/processor/IEventProcessor;Lcom/xiaomi/clientreport/processor/IPerfProcessor;)V

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/android/AppInfoUtils;->isAppMainProc(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "init in process\u3000start scheduleJob"

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->v(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;

    move-result-object p0

    invoke-virtual {p0}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->startScheduleJob()V

    :cond_0
    return-void
.end method

.method public static reportEvent(Landroid/content/Context;Lcom/xiaomi/clientreport/data/EventClientReport;)V
    .locals 0

    if-eqz p1, :cond_0

    invoke-static {p0}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->writeEvent(Lcom/xiaomi/clientreport/data/EventClientReport;)V

    :cond_0
    return-void
.end method

.method public static reportPerf(Landroid/content/Context;Lcom/xiaomi/clientreport/data/PerfClientReport;)V
    .locals 0

    if-eqz p1, :cond_0

    invoke-static {p0}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->writePerf(Lcom/xiaomi/clientreport/data/PerfClientReport;)V

    :cond_0
    return-void
.end method

.method public static updateConfig(Landroid/content/Context;Lcom/xiaomi/clientreport/data/Config;)V
    .locals 7

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-static {p0}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;

    move-result-object v0

    invoke-virtual {p1}, Lcom/xiaomi/clientreport/data/Config;->isEventUploadSwitchOpen()Z

    move-result v1

    invoke-virtual {p1}, Lcom/xiaomi/clientreport/data/Config;->isPerfUploadSwitchOpen()Z

    move-result v2

    invoke-virtual {p1}, Lcom/xiaomi/clientreport/data/Config;->getEventUploadFrequency()J

    move-result-wide v3

    invoke-virtual {p1}, Lcom/xiaomi/clientreport/data/Config;->getPerfUploadFrequency()J

    move-result-wide v5

    invoke-virtual/range {v0 .. v6}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->updateConfig(ZZJJ)V

    return-void
.end method
