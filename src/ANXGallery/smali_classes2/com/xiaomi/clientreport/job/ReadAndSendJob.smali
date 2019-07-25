.class public Lcom/xiaomi/clientreport/job/ReadAndSendJob;
.super Ljava/lang/Object;
.source "ReadAndSendJob.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private mContext:Landroid/content/Context;

.field private mReadAndSender:Lcom/xiaomi/clientreport/processor/IDataSend;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/clientreport/job/ReadAndSendJob;->mReadAndSender:Lcom/xiaomi/clientreport/processor/IDataSend;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/clientreport/job/ReadAndSendJob;->mReadAndSender:Lcom/xiaomi/clientreport/processor/IDataSend;

    invoke-interface {v0}, Lcom/xiaomi/clientreport/processor/IDataSend;->readAndSend()V

    :cond_0
    const-string v0, "begin read and send perf / event"

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->v(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/xiaomi/clientreport/job/ReadAndSendJob;->mReadAndSender:Lcom/xiaomi/clientreport/processor/IDataSend;

    instance-of v0, v0, Lcom/xiaomi/clientreport/processor/IEventProcessor;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/clientreport/job/ReadAndSendJob;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/clientreport/util/SPManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/clientreport/util/SPManager;

    move-result-object v0

    const-string v1, "sp_client_report_status"

    const-string v2, "event_last_upload_time"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/xiaomi/clientreport/util/SPManager;->setLongValue(Ljava/lang/String;Ljava/lang/String;J)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/xiaomi/clientreport/job/ReadAndSendJob;->mReadAndSender:Lcom/xiaomi/clientreport/processor/IDataSend;

    instance-of v0, v0, Lcom/xiaomi/clientreport/processor/IPerfProcessor;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/xiaomi/clientreport/job/ReadAndSendJob;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/clientreport/util/SPManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/clientreport/util/SPManager;

    move-result-object v0

    const-string v1, "sp_client_report_status"

    const-string v2, "perf_last_upload_time"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/xiaomi/clientreport/util/SPManager;->setLongValue(Ljava/lang/String;Ljava/lang/String;J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public setContext(Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/clientreport/job/ReadAndSendJob;->mContext:Landroid/content/Context;

    return-void
.end method

.method public setReadAndSender(Lcom/xiaomi/clientreport/processor/IDataSend;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/clientreport/job/ReadAndSendJob;->mReadAndSender:Lcom/xiaomi/clientreport/processor/IDataSend;

    return-void
.end method
