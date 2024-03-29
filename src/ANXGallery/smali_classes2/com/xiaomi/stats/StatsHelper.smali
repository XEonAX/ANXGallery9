.class public Lcom/xiaomi/stats/StatsHelper;
.super Ljava/lang/Object;
.source "StatsHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/stats/StatsHelper$Holder;
    }
.end annotation


# static fields
.field private static final PING_RTT:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lcom/xiaomi/push/thrift/ChannelStatsType;->PING_RTT:Lcom/xiaomi/push/thrift/ChannelStatsType;

    invoke-virtual {v0}, Lcom/xiaomi/push/thrift/ChannelStatsType;->getValue()I

    move-result v0

    sput v0, Lcom/xiaomi/stats/StatsHelper;->PING_RTT:I

    return-void
.end method

.method public static connectFail(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 2

    :try_start_0
    invoke-static {p1}, Lcom/xiaomi/stats/StatsAnalyser;->fromConnectionException(Ljava/lang/Exception;)Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;

    move-result-object p1

    invoke-static {}, Lcom/xiaomi/stats/StatsHandler;->getInstance()Lcom/xiaomi/stats/StatsHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/stats/StatsHandler;->createStatsEvent()Lcom/xiaomi/push/thrift/StatsEvent;

    move-result-object v0

    iget-object v1, p1, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    invoke-virtual {v1}, Lcom/xiaomi/push/thrift/ChannelStatsType;->getValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/thrift/StatsEvent;->setType(I)Lcom/xiaomi/push/thrift/StatsEvent;

    iget-object p1, p1, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->annotation:Ljava/lang/String;

    invoke-virtual {v0, p1}, Lcom/xiaomi/push/thrift/StatsEvent;->setAnnotation(Ljava/lang/String;)Lcom/xiaomi/push/thrift/StatsEvent;

    invoke-virtual {v0, p0}, Lcom/xiaomi/push/thrift/StatsEvent;->setHost(Ljava/lang/String;)Lcom/xiaomi/push/thrift/StatsEvent;

    invoke-static {}, Lcom/xiaomi/stats/StatsHandler;->getInstance()Lcom/xiaomi/stats/StatsHandler;

    move-result-object p0

    invoke-virtual {p0, v0}, Lcom/xiaomi/stats/StatsHandler;->add(Lcom/xiaomi/push/thrift/StatsEvent;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public static connectionDown(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 2

    :try_start_0
    invoke-static {p1}, Lcom/xiaomi/stats/StatsAnalyser;->fromDisconnectEx(Ljava/lang/Exception;)Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;

    move-result-object p1

    invoke-static {}, Lcom/xiaomi/stats/StatsHandler;->getInstance()Lcom/xiaomi/stats/StatsHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/stats/StatsHandler;->createStatsEvent()Lcom/xiaomi/push/thrift/StatsEvent;

    move-result-object v0

    iget-object v1, p1, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    invoke-virtual {v1}, Lcom/xiaomi/push/thrift/ChannelStatsType;->getValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/thrift/StatsEvent;->setType(I)Lcom/xiaomi/push/thrift/StatsEvent;

    iget-object p1, p1, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->annotation:Ljava/lang/String;

    invoke-virtual {v0, p1}, Lcom/xiaomi/push/thrift/StatsEvent;->setAnnotation(Ljava/lang/String;)Lcom/xiaomi/push/thrift/StatsEvent;

    invoke-virtual {v0, p0}, Lcom/xiaomi/push/thrift/StatsEvent;->setHost(Ljava/lang/String;)Lcom/xiaomi/push/thrift/StatsEvent;

    invoke-static {}, Lcom/xiaomi/stats/StatsHandler;->getInstance()Lcom/xiaomi/stats/StatsHandler;

    move-result-object p0

    invoke-virtual {p0, v0}, Lcom/xiaomi/stats/StatsHandler;->add(Lcom/xiaomi/push/thrift/StatsEvent;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public static count(I)V
    .locals 2

    invoke-static {}, Lcom/xiaomi/stats/StatsHandler;->getInstance()Lcom/xiaomi/stats/StatsHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/stats/StatsHandler;->createStatsEvent()Lcom/xiaomi/push/thrift/StatsEvent;

    move-result-object v0

    sget-object v1, Lcom/xiaomi/push/thrift/ChannelStatsType;->CHANNEL_STATS_COUNTER:Lcom/xiaomi/push/thrift/ChannelStatsType;

    invoke-virtual {v1}, Lcom/xiaomi/push/thrift/ChannelStatsType;->getValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/thrift/StatsEvent;->setType(I)Lcom/xiaomi/push/thrift/StatsEvent;

    invoke-virtual {v0, p0}, Lcom/xiaomi/push/thrift/StatsEvent;->setSubvalue(I)Lcom/xiaomi/push/thrift/StatsEvent;

    invoke-static {}, Lcom/xiaomi/stats/StatsHandler;->getInstance()Lcom/xiaomi/stats/StatsHandler;

    move-result-object p0

    invoke-virtual {p0, v0}, Lcom/xiaomi/stats/StatsHandler;->add(Lcom/xiaomi/push/thrift/StatsEvent;)V

    return-void
.end method

.method public static pingEnded()V
    .locals 4

    sget v0, Lcom/xiaomi/stats/StatsHelper;->PING_RTT:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, -0x1

    invoke-static {v1, v0, v2, v3}, Lcom/xiaomi/stats/StatsHelper;->trackEnd(IILjava/lang/String;I)V

    return-void
.end method

.method public static pingStarted()V
    .locals 2

    sget v0, Lcom/xiaomi/stats/StatsHelper;->PING_RTT:I

    const/4 v1, 0x0

    invoke-static {v1, v0}, Lcom/xiaomi/stats/StatsHelper;->trackStart(II)V

    return-void
.end method

.method public static retriveStatsAsByte()[B
    .locals 1

    invoke-static {}, Lcom/xiaomi/stats/StatsHandler;->getInstance()Lcom/xiaomi/stats/StatsHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/stats/StatsHandler;->retriveStatsEvents()Lcom/xiaomi/push/thrift/StatsEvents;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {v0}, Lcom/xiaomi/xmpush/thrift/XmPushThriftSerializeUtils;->convertThriftObjectToBytes(Lorg/apache/thrift/TBase;)[B

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public static stats(IIILjava/lang/String;I)V
    .locals 1

    invoke-static {}, Lcom/xiaomi/stats/StatsHandler;->getInstance()Lcom/xiaomi/stats/StatsHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/stats/StatsHandler;->createStatsEvent()Lcom/xiaomi/push/thrift/StatsEvent;

    move-result-object v0

    int-to-byte p0, p0

    invoke-virtual {v0, p0}, Lcom/xiaomi/push/thrift/StatsEvent;->setChid(B)Lcom/xiaomi/push/thrift/StatsEvent;

    invoke-virtual {v0, p1}, Lcom/xiaomi/push/thrift/StatsEvent;->setType(I)Lcom/xiaomi/push/thrift/StatsEvent;

    invoke-virtual {v0, p2}, Lcom/xiaomi/push/thrift/StatsEvent;->setValue(I)Lcom/xiaomi/push/thrift/StatsEvent;

    invoke-virtual {v0, p3}, Lcom/xiaomi/push/thrift/StatsEvent;->setHost(Ljava/lang/String;)Lcom/xiaomi/push/thrift/StatsEvent;

    invoke-virtual {v0, p4}, Lcom/xiaomi/push/thrift/StatsEvent;->setSubvalue(I)Lcom/xiaomi/push/thrift/StatsEvent;

    invoke-static {}, Lcom/xiaomi/stats/StatsHandler;->getInstance()Lcom/xiaomi/stats/StatsHandler;

    move-result-object p0

    invoke-virtual {p0, v0}, Lcom/xiaomi/stats/StatsHandler;->add(Lcom/xiaomi/push/thrift/StatsEvent;)V

    return-void
.end method

.method public static statsBind(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;)V
    .locals 1

    new-instance v0, Lcom/xiaomi/stats/BindTracker;

    invoke-direct {v0, p0, p1}, Lcom/xiaomi/stats/BindTracker;-><init>(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;)V

    invoke-virtual {v0}, Lcom/xiaomi/stats/BindTracker;->track()V

    return-void
.end method

.method public static statsGslb(Ljava/lang/String;ILjava/lang/Exception;)V
    .locals 1

    invoke-static {}, Lcom/xiaomi/stats/StatsHandler;->getInstance()Lcom/xiaomi/stats/StatsHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/stats/StatsHandler;->createStatsEvent()Lcom/xiaomi/push/thrift/StatsEvent;

    move-result-object v0

    if-lez p1, :cond_0

    sget-object p2, Lcom/xiaomi/push/thrift/ChannelStatsType;->GSLB_REQUEST_SUCCESS:Lcom/xiaomi/push/thrift/ChannelStatsType;

    invoke-virtual {p2}, Lcom/xiaomi/push/thrift/ChannelStatsType;->getValue()I

    move-result p2

    invoke-virtual {v0, p2}, Lcom/xiaomi/push/thrift/StatsEvent;->setType(I)Lcom/xiaomi/push/thrift/StatsEvent;

    invoke-virtual {v0, p0}, Lcom/xiaomi/push/thrift/StatsEvent;->setHost(Ljava/lang/String;)Lcom/xiaomi/push/thrift/StatsEvent;

    invoke-virtual {v0, p1}, Lcom/xiaomi/push/thrift/StatsEvent;->setValue(I)Lcom/xiaomi/push/thrift/StatsEvent;

    invoke-static {}, Lcom/xiaomi/stats/StatsHandler;->getInstance()Lcom/xiaomi/stats/StatsHandler;

    move-result-object p0

    invoke-virtual {p0, v0}, Lcom/xiaomi/stats/StatsHandler;->add(Lcom/xiaomi/push/thrift/StatsEvent;)V

    goto :goto_0

    :cond_0
    :try_start_0
    invoke-static {p2}, Lcom/xiaomi/stats/StatsAnalyser;->fromGslbException(Ljava/lang/Exception;)Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;

    move-result-object p1

    iget-object p2, p1, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    invoke-virtual {p2}, Lcom/xiaomi/push/thrift/ChannelStatsType;->getValue()I

    move-result p2

    invoke-virtual {v0, p2}, Lcom/xiaomi/push/thrift/StatsEvent;->setType(I)Lcom/xiaomi/push/thrift/StatsEvent;

    iget-object p1, p1, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->annotation:Ljava/lang/String;

    invoke-virtual {v0, p1}, Lcom/xiaomi/push/thrift/StatsEvent;->setAnnotation(Ljava/lang/String;)Lcom/xiaomi/push/thrift/StatsEvent;

    invoke-virtual {v0, p0}, Lcom/xiaomi/push/thrift/StatsEvent;->setHost(Ljava/lang/String;)Lcom/xiaomi/push/thrift/StatsEvent;

    invoke-static {}, Lcom/xiaomi/stats/StatsHandler;->getInstance()Lcom/xiaomi/stats/StatsHandler;

    move-result-object p0

    invoke-virtual {p0, v0}, Lcom/xiaomi/stats/StatsHandler;->add(Lcom/xiaomi/push/thrift/StatsEvent;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :goto_0
    return-void
.end method

.method public static declared-synchronized trackEnd(IILjava/lang/String;I)V
    .locals 6

    const-class v0, Lcom/xiaomi/stats/StatsHelper;

    monitor-enter v0

    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    shl-int/lit8 p0, p0, 0x18

    or-int/2addr p0, p1

    sget-object v3, Lcom/xiaomi/stats/StatsHelper$Holder;->sTimeTracker:Ljava/util/Hashtable;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-static {}, Lcom/xiaomi/stats/StatsHandler;->getInstance()Lcom/xiaomi/stats/StatsHandler;

    move-result-object v3

    invoke-virtual {v3}, Lcom/xiaomi/stats/StatsHandler;->createStatsEvent()Lcom/xiaomi/push/thrift/StatsEvent;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/xiaomi/push/thrift/StatsEvent;->setType(I)Lcom/xiaomi/push/thrift/StatsEvent;

    sget-object v4, Lcom/xiaomi/stats/StatsHelper$Holder;->sTimeTracker:Ljava/util/Hashtable;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v4, p0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    const/4 p0, 0x0

    sub-long/2addr v1, v4

    long-to-int p0, v1

    invoke-virtual {v3, p0}, Lcom/xiaomi/push/thrift/StatsEvent;->setValue(I)Lcom/xiaomi/push/thrift/StatsEvent;

    invoke-virtual {v3, p2}, Lcom/xiaomi/push/thrift/StatsEvent;->setHost(Ljava/lang/String;)Lcom/xiaomi/push/thrift/StatsEvent;

    const/4 p0, -0x1

    if-le p3, p0, :cond_0

    invoke-virtual {v3, p3}, Lcom/xiaomi/push/thrift/StatsEvent;->setSubvalue(I)Lcom/xiaomi/push/thrift/StatsEvent;

    :cond_0
    invoke-static {}, Lcom/xiaomi/stats/StatsHandler;->getInstance()Lcom/xiaomi/stats/StatsHandler;

    move-result-object p0

    invoke-virtual {p0, v3}, Lcom/xiaomi/stats/StatsHandler;->add(Lcom/xiaomi/push/thrift/StatsEvent;)V

    sget-object p0, Lcom/xiaomi/stats/StatsHelper$Holder;->sTimeTracker:Ljava/util/Hashtable;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    const-string p0, "stats key not found"

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized trackStart(II)V
    .locals 3

    const-class v0, Lcom/xiaomi/stats/StatsHelper;

    monitor-enter v0

    const v1, 0xffffff

    if-ge p1, v1, :cond_0

    shl-int/lit8 p0, p0, 0x18

    or-int/2addr p0, p1

    :try_start_0
    sget-object p1, Lcom/xiaomi/stats/StatsHelper$Holder;->sTimeTracker:Ljava/util/Hashtable;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, p0, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    :cond_0
    const-string p0, "stats key should less than 16777215"

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit v0

    return-void

    :goto_1
    monitor-exit v0

    throw p0
.end method
