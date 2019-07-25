.class public Lcom/xiaomi/mipush/sdk/MiTinyDataClient;
.super Ljava/lang/Object;
.source "MiTinyDataClient.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp;
    }
.end annotation


# direct methods
.method public static upload(Landroid/content/Context;Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;)Z
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "MiTinyDataClient.upload "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->v(Ljava/lang/String;)V

    invoke-static {}, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp;->getInstance()Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp;->alreadyInit()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp;->getInstance()Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp;->init(Landroid/content/Context;)V

    :cond_0
    invoke-static {}, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp;->getInstance()Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp;->processUploadRequest(Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;)Z

    move-result p0

    return p0
.end method

.method public static upload(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)Z
    .locals 1

    new-instance v0, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    invoke-direct {v0}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;-><init>()V

    invoke-virtual {v0, p1}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->setCategory(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    invoke-virtual {v0, p2}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->setName(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    invoke-virtual {v0, p3, p4}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->setCounter(J)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    invoke-virtual {v0, p5}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->setData(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    const/4 p1, 0x1

    invoke-virtual {v0, p1}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->setFromSdk(Z)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    const-string p1, "push_sdk_channel"

    invoke-virtual {v0, p1}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->setChannel(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    invoke-static {p0, v0}, Lcom/xiaomi/mipush/sdk/MiTinyDataClient;->upload(Landroid/content/Context;Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;)Z

    move-result p0

    return p0
.end method

.method public static upload(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)Z
    .locals 1

    new-instance v0, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    invoke-direct {v0}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;-><init>()V

    invoke-virtual {v0, p0}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->setCategory(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    invoke-virtual {v0, p1}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->setName(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    invoke-virtual {v0, p2, p3}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->setCounter(J)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    invoke-virtual {v0, p4}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->setData(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    invoke-static {}, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp;->getInstance()Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp;

    move-result-object p0

    invoke-virtual {p0, v0}, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp;->processUploadRequest(Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;)Z

    move-result p0

    return p0
.end method
