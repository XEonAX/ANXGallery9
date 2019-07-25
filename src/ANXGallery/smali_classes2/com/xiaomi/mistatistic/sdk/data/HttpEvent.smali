.class public Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;
.super Ljava/lang/Object;
.source "HttpEvent.java"


# instance fields
.field private exceptionName:Ljava/lang/String;

.field private firstPacketCost:J

.field private flowStatus:I

.field private ip:Ljava/lang/String;

.field private net:Ljava/lang/String;

.field private netFlow:J

.field private operator:Ljava/lang/String;

.field private reqId:Ljava/lang/String;

.field private responseCode:I

.field private time:J

.field private timeCost:J

.field private url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;JILjava/lang/String;)V
    .locals 8

    const-wide/16 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move v6, p4

    move-object v7, p5

    invoke-direct/range {v0 .. v7}, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;-><init>(Ljava/lang/String;JJILjava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;JJI)V
    .locals 8

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-wide v4, p4

    move v6, p6

    invoke-direct/range {v0 .. v7}, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;-><init>(Ljava/lang/String;JJILjava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;JJILjava/lang/String;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->flowStatus:I

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->netFlow:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->time:J

    iput-object p1, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->url:Ljava/lang/String;

    iput-wide p2, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->timeCost:J

    iput p6, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->responseCode:I

    iput-object p7, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->exceptionName:Ljava/lang/String;

    iput-wide p4, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->netFlow:J

    invoke-virtual {p0}, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->setNet()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    const-wide/16 v2, -0x1

    const/4 v4, -0x1

    move-object v0, p0

    move-object v1, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;-><init>(Ljava/lang/String;JILjava/lang/String;)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 6

    instance-of v0, p1, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    check-cast p1, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->url:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->url:Ljava/lang/String;

    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->net:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->net:Ljava/lang/String;

    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->exceptionName:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->exceptionName:Ljava/lang/String;

    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->ip:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->ip:Ljava/lang/String;

    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->responseCode:I

    iget v2, p1, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->responseCode:I

    if-ne v0, v2, :cond_1

    iget-wide v2, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->timeCost:J

    iget-wide v4, p1, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->timeCost:J

    cmp-long v0, v2, v4

    if-nez v0, :cond_1

    iget-wide v2, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->time:J

    iget-wide v4, p1, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->time:J

    cmp-long v0, v2, v4

    if-nez v0, :cond_1

    iget-wide v2, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->netFlow:J

    iget-wide v4, p1, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->netFlow:J

    cmp-long v0, v2, v4

    if-nez v0, :cond_1

    iget v0, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->flowStatus:I

    iget v2, p1, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->flowStatus:I

    if-ne v0, v2, :cond_1

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->reqId:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->reqId:Ljava/lang/String;

    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-wide v2, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->firstPacketCost:J

    iget-wide v4, p1, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->firstPacketCost:J

    cmp-long p1, v2, v4

    if-nez p1, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->url:Ljava/lang/String;

    return-object v0
.end method

.method public setFirstPacketCost(J)V
    .locals 0

    iput-wide p1, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->firstPacketCost:J

    return-void
.end method

.method public setIp(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->ip:Ljava/lang/String;

    return-void
.end method

.method public setNet()V
    .locals 3

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/d;->a()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "NULL"

    iput-object v0, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->net:Ljava/lang/String;

    goto :goto_0

    :cond_0
    invoke-static {v0}, Lcom/xiaomi/mistatistic/sdk/controller/l;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v0, "NULL"

    iput-object v0, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->net:Ljava/lang/String;

    goto :goto_0

    :cond_1
    iput-object v1, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->net:Ljava/lang/String;

    const-string v2, "WIFI"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    :try_start_0
    const-string v1, "phone"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimOperator()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->operator:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "setNet exception"

    invoke-static {v1, v0}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public setRequestId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->reqId:Ljava/lang/String;

    return-void
.end method

.method public setUrl(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->url:Ljava/lang/String;

    return-void
.end method

.method public toJSON()Lorg/json/JSONObject;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "net"

    iget-object v2, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->net:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-wide v1, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->timeCost:J

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-lez v5, :cond_0

    const-string v1, "cost"

    iget-wide v5, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->timeCost:J

    invoke-virtual {v0, v1, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    :cond_0
    iget-wide v1, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->firstPacketCost:J

    cmp-long v5, v1, v3

    if-lez v5, :cond_1

    const-string v1, "first_byte_t"

    iget-wide v5, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->firstPacketCost:J

    invoke-virtual {v0, v1, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    :cond_1
    iget v1, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->responseCode:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_2

    const-string v1, "code"

    iget v2, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->responseCode:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    :cond_2
    iget-object v1, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->exceptionName:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "exception"

    iget-object v2, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->exceptionName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_3
    iget-object v1, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->operator:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string v1, "op"

    iget-object v2, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->operator:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_4
    iget-wide v1, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->netFlow:J

    cmp-long v5, v1, v3

    if-lez v5, :cond_5

    const-string v1, "flow"

    iget-wide v2, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->netFlow:J

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    :cond_5
    iget v1, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->flowStatus:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_6

    iget v1, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->flowStatus:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_7

    :cond_6
    const-string v1, "flow_status"

    iget v2, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->flowStatus:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    :cond_7
    iget-object v1, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->reqId:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_8

    const-string v1, "rid"

    iget-object v2, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->reqId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_8
    iget-object v1, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->ip:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_9

    const-string v1, "dns"

    iget-object v2, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->ip:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_9
    const-string v1, "t"

    iget-wide v2, p0, Lcom/xiaomi/mistatistic/sdk/data/HttpEvent;->time:J

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    return-object v0
.end method
