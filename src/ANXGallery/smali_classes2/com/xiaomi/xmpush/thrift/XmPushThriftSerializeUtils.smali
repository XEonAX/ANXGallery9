.class public Lcom/xiaomi/xmpush/thrift/XmPushThriftSerializeUtils;
.super Ljava/lang/Object;
.source "XmPushThriftSerializeUtils.java"


# direct methods
.method public static convertByteArrayToThriftObject(Lorg/apache/thrift/TBase;[B)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lorg/apache/thrift/TBase<",
            "TT;*>;>(TT;[B)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    if-eqz p1, :cond_0

    new-instance v0, Lorg/apache/thrift/TDeserializer;

    new-instance v1, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol$Factory;

    array-length v2, p1

    const/4 v3, 0x1

    invoke-direct {v1, v3, v3, v2}, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol$Factory;-><init>(ZZI)V

    invoke-direct {v0, v1}, Lorg/apache/thrift/TDeserializer;-><init>(Lorg/apache/thrift/protocol/TProtocolFactory;)V

    invoke-virtual {v0, p0, p1}, Lorg/apache/thrift/TDeserializer;->deserialize(Lorg/apache/thrift/TBase;[B)V

    return-void

    :cond_0
    new-instance p0, Lorg/apache/thrift/TException;

    const-string p1, "the message byte is empty."

    invoke-direct {p0, p1}, Lorg/apache/thrift/TException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static convertThriftObjectToBytes(Lorg/apache/thrift/TBase;)[B
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lorg/apache/thrift/TBase<",
            "TT;*>;>(TT;)[B"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    :try_start_0
    new-instance v1, Lorg/apache/thrift/TSerializer;

    new-instance v2, Lorg/apache/thrift/protocol/TBinaryProtocol$Factory;

    invoke-direct {v2}, Lorg/apache/thrift/protocol/TBinaryProtocol$Factory;-><init>()V

    invoke-direct {v1, v2}, Lorg/apache/thrift/TSerializer;-><init>(Lorg/apache/thrift/protocol/TProtocolFactory;)V

    invoke-virtual {v1, p0}, Lorg/apache/thrift/TSerializer;->serialize(Lorg/apache/thrift/TBase;)[B

    move-result-object p0
    :try_end_0
    .catch Lorg/apache/thrift/TException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    const-string v1, "convertThriftObjectToBytes catch TException."

    invoke-static {v1, p0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v0
.end method

.method public static getDeviceStatus(Landroid/content/Context;Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)S
    .locals 2

    iget-object p1, p1, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->packageName:Ljava/lang/String;

    invoke-static {p0, p1}, Lcom/xiaomi/channel/commonutils/android/AppInfoUtils;->getAppNotificationOp(Landroid/content/Context;Ljava/lang/String;)Lcom/xiaomi/channel/commonutils/android/AppInfoUtils$AppNotificationOp;

    move-result-object p1

    invoke-virtual {p1}, Lcom/xiaomi/channel/commonutils/android/AppInfoUtils$AppNotificationOp;->getValue()I

    move-result p1

    const/4 v0, 0x0

    add-int/2addr p1, v0

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/misc/MobileStatusUtils;->isCharging(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x4

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    add-int/2addr p1, v1

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/misc/MobileStatusUtils;->isScreenLocked(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/16 v0, 0x8

    :cond_1
    add-int/2addr p1, v0

    int-to-short p0, p1

    return p0
.end method
