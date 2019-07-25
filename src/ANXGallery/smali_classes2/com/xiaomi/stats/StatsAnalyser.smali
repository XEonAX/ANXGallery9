.class final Lcom/xiaomi/stats/StatsAnalyser;
.super Ljava/lang/Object;
.source "StatsAnalyser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;
    }
.end annotation


# direct methods
.method private static checkNull(Ljava/lang/Exception;)V
    .locals 0

    if-eqz p0, :cond_0

    return-void

    :cond_0
    new-instance p0, Ljava/lang/NullPointerException;

    invoke-direct {p0}, Ljava/lang/NullPointerException;-><init>()V

    throw p0
.end method

.method static fromBind(Ljava/lang/Exception;)Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;
    .locals 4

    invoke-static {p0}, Lcom/xiaomi/stats/StatsAnalyser;->checkNull(Ljava/lang/Exception;)V

    instance-of v0, p0, Lcom/xiaomi/smack/XMPPException;

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Lcom/xiaomi/smack/XMPPException;

    invoke-virtual {v0}, Lcom/xiaomi/smack/XMPPException;->getWrappedThrowable()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/xiaomi/smack/XMPPException;->getWrappedThrowable()Ljava/lang/Throwable;

    move-result-object p0

    :cond_0
    new-instance v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;

    invoke-direct {v0}, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    :cond_1
    invoke-static {p0}, Lcom/xiaomi/smack/ConnectionHelper;->asErrorCode(Ljava/lang/Throwable;)I

    move-result v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ":"

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const/16 v3, 0x69

    if-eq v2, v3, :cond_4

    const/16 v3, 0xc7

    if-eq v2, v3, :cond_3

    const/16 v3, 0x1f3

    if-eq v2, v3, :cond_2

    packed-switch v2, :pswitch_data_0

    sget-object v1, Lcom/xiaomi/push/thrift/ChannelStatsType;->BIND_XMPP_ERR:Lcom/xiaomi/push/thrift/ChannelStatsType;

    iput-object v1, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    goto :goto_0

    :pswitch_0
    sget-object v1, Lcom/xiaomi/push/thrift/ChannelStatsType;->BIND_TCP_BROKEN_PIPE:Lcom/xiaomi/push/thrift/ChannelStatsType;

    iput-object v1, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    goto :goto_0

    :pswitch_1
    sget-object v1, Lcom/xiaomi/push/thrift/ChannelStatsType;->BIND_TCP_CONNRESET:Lcom/xiaomi/push/thrift/ChannelStatsType;

    iput-object v1, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    goto :goto_0

    :cond_2
    sget-object v2, Lcom/xiaomi/push/thrift/ChannelStatsType;->BIND_BOSH_ERR:Lcom/xiaomi/push/thrift/ChannelStatsType;

    iput-object v2, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    const-string v2, "Terminal binding condition encountered: item-not-found"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    sget-object v1, Lcom/xiaomi/push/thrift/ChannelStatsType;->BIND_BOSH_ITEM_NOT_FOUND:Lcom/xiaomi/push/thrift/ChannelStatsType;

    iput-object v1, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    goto :goto_0

    :cond_3
    sget-object v1, Lcom/xiaomi/push/thrift/ChannelStatsType;->BIND_TCP_ERR:Lcom/xiaomi/push/thrift/ChannelStatsType;

    iput-object v1, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    goto :goto_0

    :cond_4
    sget-object v1, Lcom/xiaomi/push/thrift/ChannelStatsType;->BIND_TCP_READ_TIMEOUT:Lcom/xiaomi/push/thrift/ChannelStatsType;

    iput-object v1, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    :cond_5
    :goto_0
    iget-object v1, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    sget-object v2, Lcom/xiaomi/push/thrift/ChannelStatsType;->BIND_TCP_ERR:Lcom/xiaomi/push/thrift/ChannelStatsType;

    if-eq v1, v2, :cond_6

    iget-object v1, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    sget-object v2, Lcom/xiaomi/push/thrift/ChannelStatsType;->BIND_XMPP_ERR:Lcom/xiaomi/push/thrift/ChannelStatsType;

    if-eq v1, v2, :cond_6

    iget-object v1, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    sget-object v2, Lcom/xiaomi/push/thrift/ChannelStatsType;->BIND_BOSH_ERR:Lcom/xiaomi/push/thrift/ChannelStatsType;

    if-ne v1, v2, :cond_7

    :cond_6
    iput-object p0, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->annotation:Ljava/lang/String;

    :cond_7
    return-object v0

    :pswitch_data_0
    .packed-switch 0x6d
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method static fromConnectionException(Ljava/lang/Exception;)Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;
    .locals 5

    invoke-static {p0}, Lcom/xiaomi/stats/StatsAnalyser;->checkNull(Ljava/lang/Exception;)V

    instance-of v0, p0, Lcom/xiaomi/smack/XMPPException;

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Lcom/xiaomi/smack/XMPPException;

    invoke-virtual {v0}, Lcom/xiaomi/smack/XMPPException;->getWrappedThrowable()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/xiaomi/smack/XMPPException;->getWrappedThrowable()Ljava/lang/Throwable;

    move-result-object p0

    :cond_0
    new-instance v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;

    invoke-direct {v0}, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    :cond_1
    invoke-static {p0}, Lcom/xiaomi/smack/ConnectionHelper;->asErrorCode(Ljava/lang/Throwable;)I

    move-result v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    if-eqz v2, :cond_2

    sget-object v3, Lcom/xiaomi/push/thrift/ChannelStatsType;->CONN_SUCCESS:Lcom/xiaomi/push/thrift/ChannelStatsType;

    invoke-virtual {v3}, Lcom/xiaomi/push/thrift/ChannelStatsType;->getValue()I

    move-result v3

    add-int/2addr v3, v2

    invoke-static {v3}, Lcom/xiaomi/push/thrift/ChannelStatsType;->findByValue(I)Lcom/xiaomi/push/thrift/ChannelStatsType;

    move-result-object v2

    iput-object v2, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    iget-object v2, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    sget-object v3, Lcom/xiaomi/push/thrift/ChannelStatsType;->CONN_BOSH_ERR:Lcom/xiaomi/push/thrift/ChannelStatsType;

    if-ne v2, v3, :cond_3

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    if-eqz p0, :cond_3

    instance-of p0, p0, Ljava/net/UnknownHostException;

    if-eqz p0, :cond_3

    sget-object p0, Lcom/xiaomi/push/thrift/ChannelStatsType;->CONN_BOSH_UNKNOWNHOST:Lcom/xiaomi/push/thrift/ChannelStatsType;

    iput-object p0, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    goto :goto_0

    :cond_2
    sget-object p0, Lcom/xiaomi/push/thrift/ChannelStatsType;->CONN_XMPP_ERR:Lcom/xiaomi/push/thrift/ChannelStatsType;

    iput-object p0, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    :cond_3
    :goto_0
    iget-object p0, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    sget-object v2, Lcom/xiaomi/push/thrift/ChannelStatsType;->CONN_TCP_ERR_OTHER:Lcom/xiaomi/push/thrift/ChannelStatsType;

    if-eq p0, v2, :cond_4

    iget-object p0, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    sget-object v2, Lcom/xiaomi/push/thrift/ChannelStatsType;->CONN_XMPP_ERR:Lcom/xiaomi/push/thrift/ChannelStatsType;

    if-eq p0, v2, :cond_4

    iget-object p0, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    sget-object v2, Lcom/xiaomi/push/thrift/ChannelStatsType;->CONN_BOSH_ERR:Lcom/xiaomi/push/thrift/ChannelStatsType;

    if-ne p0, v2, :cond_5

    :cond_4
    iput-object v1, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->annotation:Ljava/lang/String;

    :cond_5
    return-object v0
.end method

.method static fromDisconnectEx(Ljava/lang/Exception;)Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;
    .locals 4

    invoke-static {p0}, Lcom/xiaomi/stats/StatsAnalyser;->checkNull(Ljava/lang/Exception;)V

    instance-of v0, p0, Lcom/xiaomi/smack/XMPPException;

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Lcom/xiaomi/smack/XMPPException;

    invoke-virtual {v0}, Lcom/xiaomi/smack/XMPPException;->getWrappedThrowable()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/xiaomi/smack/XMPPException;->getWrappedThrowable()Ljava/lang/Throwable;

    move-result-object p0

    :cond_0
    new-instance v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;

    invoke-direct {v0}, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0}, Lcom/xiaomi/smack/ConnectionHelper;->asErrorCode(Ljava/lang/Throwable;)I

    move-result v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ":"

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const/16 v3, 0x69

    if-eq v2, v3, :cond_3

    const/16 v3, 0xc7

    if-eq v2, v3, :cond_2

    const/16 v3, 0x1f3

    if-eq v2, v3, :cond_1

    packed-switch v2, :pswitch_data_0

    sget-object v1, Lcom/xiaomi/push/thrift/ChannelStatsType;->CHANNEL_XMPPEXCEPTION:Lcom/xiaomi/push/thrift/ChannelStatsType;

    iput-object v1, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    goto :goto_0

    :pswitch_0
    sget-object v1, Lcom/xiaomi/push/thrift/ChannelStatsType;->CHANNEL_TCP_BROKEN_PIPE:Lcom/xiaomi/push/thrift/ChannelStatsType;

    iput-object v1, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    goto :goto_0

    :pswitch_1
    sget-object v1, Lcom/xiaomi/push/thrift/ChannelStatsType;->CHANNEL_TCP_CONNRESET:Lcom/xiaomi/push/thrift/ChannelStatsType;

    iput-object v1, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    goto :goto_0

    :cond_1
    sget-object v2, Lcom/xiaomi/push/thrift/ChannelStatsType;->CHANNEL_BOSH_EXCEPTION:Lcom/xiaomi/push/thrift/ChannelStatsType;

    iput-object v2, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    const-string v2, "Terminal binding condition encountered: item-not-found"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    sget-object v1, Lcom/xiaomi/push/thrift/ChannelStatsType;->CHANNEL_BOSH_ITEMNOTFIND:Lcom/xiaomi/push/thrift/ChannelStatsType;

    iput-object v1, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    goto :goto_0

    :cond_2
    sget-object v1, Lcom/xiaomi/push/thrift/ChannelStatsType;->CHANNEL_TCP_ERR:Lcom/xiaomi/push/thrift/ChannelStatsType;

    iput-object v1, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    goto :goto_0

    :cond_3
    sget-object v1, Lcom/xiaomi/push/thrift/ChannelStatsType;->CHANNEL_TCP_READTIMEOUT:Lcom/xiaomi/push/thrift/ChannelStatsType;

    iput-object v1, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    :cond_4
    :goto_0
    iget-object v1, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    sget-object v2, Lcom/xiaomi/push/thrift/ChannelStatsType;->CHANNEL_TCP_ERR:Lcom/xiaomi/push/thrift/ChannelStatsType;

    if-eq v1, v2, :cond_5

    iget-object v1, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    sget-object v2, Lcom/xiaomi/push/thrift/ChannelStatsType;->CHANNEL_XMPPEXCEPTION:Lcom/xiaomi/push/thrift/ChannelStatsType;

    if-eq v1, v2, :cond_5

    iget-object v1, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    sget-object v2, Lcom/xiaomi/push/thrift/ChannelStatsType;->CHANNEL_BOSH_EXCEPTION:Lcom/xiaomi/push/thrift/ChannelStatsType;

    if-ne v1, v2, :cond_6

    :cond_5
    iput-object p0, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->annotation:Ljava/lang/String;

    :cond_6
    return-object v0

    :pswitch_data_0
    .packed-switch 0x6d
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method static fromGslbException(Ljava/lang/Exception;)Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;
    .locals 4

    invoke-static {p0}, Lcom/xiaomi/stats/StatsAnalyser;->checkNull(Ljava/lang/Exception;)V

    instance-of v0, p0, Lcom/xiaomi/smack/XMPPException;

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Lcom/xiaomi/smack/XMPPException;

    invoke-virtual {v0}, Lcom/xiaomi/smack/XMPPException;->getWrappedThrowable()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/xiaomi/smack/XMPPException;->getWrappedThrowable()Ljava/lang/Throwable;

    move-result-object p0

    :cond_0
    new-instance v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;

    invoke-direct {v0}, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0}, Lcom/xiaomi/smack/ConnectionHelper;->asErrorCode(Ljava/lang/Throwable;)I

    move-result p0

    if-eqz p0, :cond_2

    sget-object v2, Lcom/xiaomi/push/thrift/ChannelStatsType;->GSLB_REQUEST_SUCCESS:Lcom/xiaomi/push/thrift/ChannelStatsType;

    invoke-virtual {v2}, Lcom/xiaomi/push/thrift/ChannelStatsType;->getValue()I

    move-result v2

    add-int/2addr v2, p0

    invoke-static {v2}, Lcom/xiaomi/push/thrift/ChannelStatsType;->findByValue(I)Lcom/xiaomi/push/thrift/ChannelStatsType;

    move-result-object p0

    iput-object p0, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    :cond_2
    iget-object p0, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    if-nez p0, :cond_3

    sget-object p0, Lcom/xiaomi/push/thrift/ChannelStatsType;->GSLB_TCP_ERR_OTHER:Lcom/xiaomi/push/thrift/ChannelStatsType;

    iput-object p0, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    :cond_3
    iget-object p0, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->type:Lcom/xiaomi/push/thrift/ChannelStatsType;

    sget-object v2, Lcom/xiaomi/push/thrift/ChannelStatsType;->GSLB_TCP_ERR_OTHER:Lcom/xiaomi/push/thrift/ChannelStatsType;

    if-ne p0, v2, :cond_4

    iput-object v1, v0, Lcom/xiaomi/stats/StatsAnalyser$TypeWraper;->annotation:Ljava/lang/String;

    :cond_4
    return-object v0
.end method
