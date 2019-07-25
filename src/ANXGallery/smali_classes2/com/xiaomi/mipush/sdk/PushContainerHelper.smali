.class public Lcom/xiaomi/mipush/sdk/PushContainerHelper;
.super Ljava/lang/Object;
.source "PushContainerHelper.java"


# direct methods
.method private static createRespMessageFromAction(Lcom/xiaomi/xmpush/thrift/ActionType;Z)Lorg/apache/thrift/TBase;
    .locals 1

    sget-object v0, Lcom/xiaomi/mipush/sdk/PushContainerHelper$1;->$SwitchMap$com$xiaomi$xmpush$thrift$ActionType:[I

    invoke-virtual {p0}, Lcom/xiaomi/xmpush/thrift/ActionType;->ordinal()I

    move-result p0

    aget p0, v0, p0

    packed-switch p0, :pswitch_data_0

    const/4 p0, 0x0

    return-object p0

    :pswitch_0
    new-instance p0, Lcom/xiaomi/xmpush/thrift/XmPushActionCommandResult;

    invoke-direct {p0}, Lcom/xiaomi/xmpush/thrift/XmPushActionCommandResult;-><init>()V

    return-object p0

    :pswitch_1
    if-eqz p1, :cond_0

    new-instance p0, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    invoke-direct {p0}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;-><init>()V

    return-object p0

    :cond_0
    new-instance p0, Lcom/xiaomi/xmpush/thrift/XmPushActionAckNotification;

    invoke-direct {p0}, Lcom/xiaomi/xmpush/thrift/XmPushActionAckNotification;-><init>()V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionAckNotification;->setErrorCodeIsSet(Z)V

    return-object p0

    :pswitch_2
    new-instance p0, Lcom/xiaomi/xmpush/thrift/XmPushActionSendFeedbackResult;

    invoke-direct {p0}, Lcom/xiaomi/xmpush/thrift/XmPushActionSendFeedbackResult;-><init>()V

    return-object p0

    :pswitch_3
    new-instance p0, Lcom/xiaomi/xmpush/thrift/XmPushActionCommandResult;

    invoke-direct {p0}, Lcom/xiaomi/xmpush/thrift/XmPushActionCommandResult;-><init>()V

    return-object p0

    :pswitch_4
    new-instance p0, Lcom/xiaomi/xmpush/thrift/XmPushActionAckMessage;

    invoke-direct {p0}, Lcom/xiaomi/xmpush/thrift/XmPushActionAckMessage;-><init>()V

    return-object p0

    :pswitch_5
    new-instance p0, Lcom/xiaomi/xmpush/thrift/XmPushActionSendMessage;

    invoke-direct {p0}, Lcom/xiaomi/xmpush/thrift/XmPushActionSendMessage;-><init>()V

    return-object p0

    :pswitch_6
    new-instance p0, Lcom/xiaomi/xmpush/thrift/XmPushActionUnSubscriptionResult;

    invoke-direct {p0}, Lcom/xiaomi/xmpush/thrift/XmPushActionUnSubscriptionResult;-><init>()V

    return-object p0

    :pswitch_7
    new-instance p0, Lcom/xiaomi/xmpush/thrift/XmPushActionSubscriptionResult;

    invoke-direct {p0}, Lcom/xiaomi/xmpush/thrift/XmPushActionSubscriptionResult;-><init>()V

    return-object p0

    :pswitch_8
    new-instance p0, Lcom/xiaomi/xmpush/thrift/XmPushActionUnRegistrationResult;

    invoke-direct {p0}, Lcom/xiaomi/xmpush/thrift/XmPushActionUnRegistrationResult;-><init>()V

    return-object p0

    :pswitch_9
    new-instance p0, Lcom/xiaomi/xmpush/thrift/XmPushActionRegistrationResult;

    invoke-direct {p0}, Lcom/xiaomi/xmpush/thrift/XmPushActionRegistrationResult;-><init>()V

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected static generateRequestContainer(Landroid/content/Context;Lorg/apache/thrift/TBase;Lcom/xiaomi/xmpush/thrift/ActionType;)Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lorg/apache/thrift/TBase<",
            "TT;*>;>(",
            "Landroid/content/Context;",
            "TT;",
            "Lcom/xiaomi/xmpush/thrift/ActionType;",
            ")",
            "Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;"
        }
    .end annotation

    sget-object v0, Lcom/xiaomi/xmpush/thrift/ActionType;->Registration:Lcom/xiaomi/xmpush/thrift/ActionType;

    invoke-virtual {p2, v0}, Lcom/xiaomi/xmpush/thrift/ActionType;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v4, v0, 0x1

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/AppInfoHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getAppID()Ljava/lang/String;

    move-result-object v6

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-static/range {v1 .. v6}, Lcom/xiaomi/mipush/sdk/PushContainerHelper;->generateRequestContainer(Landroid/content/Context;Lorg/apache/thrift/TBase;Lcom/xiaomi/xmpush/thrift/ActionType;ZLjava/lang/String;Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    move-result-object p0

    return-object p0
.end method

.method protected static generateRequestContainer(Landroid/content/Context;Lorg/apache/thrift/TBase;Lcom/xiaomi/xmpush/thrift/ActionType;ZLjava/lang/String;Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lorg/apache/thrift/TBase<",
            "TT;*>;>(",
            "Landroid/content/Context;",
            "TT;",
            "Lcom/xiaomi/xmpush/thrift/ActionType;",
            "Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;"
        }
    .end annotation

    invoke-static {p1}, Lcom/xiaomi/xmpush/thrift/XmPushThriftSerializeUtils;->convertThriftObjectToBytes(Lorg/apache/thrift/TBase;)[B

    move-result-object p1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    const-string p0, "invoke convertThriftObjectToBytes method, return null."

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    return-object v0

    :cond_0
    new-instance v1, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    invoke-direct {v1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;-><init>()V

    if-eqz p3, :cond_2

    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/AppInfoHolder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getRegSecret()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string p0, "regSecret is empty, return null"

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    return-object v0

    :cond_1
    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/string/Base64Coder;->decode(Ljava/lang/String;)[B

    move-result-object p0

    :try_start_0
    invoke-static {p0, p1}, Lcom/xiaomi/channel/commonutils/android/DataCryptUtils;->mipushEncrypt([B[B)[B

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p0, "encryption error. "

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    :cond_2
    move-object p0, p1

    :goto_0
    new-instance p1, Lcom/xiaomi/xmpush/thrift/Target;

    invoke-direct {p1}, Lcom/xiaomi/xmpush/thrift/Target;-><init>()V

    const-wide/16 v2, 0x5

    iput-wide v2, p1, Lcom/xiaomi/xmpush/thrift/Target;->channelId:J

    const-string v0, "fakeid"

    iput-object v0, p1, Lcom/xiaomi/xmpush/thrift/Target;->userId:Ljava/lang/String;

    invoke-virtual {v1, p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->setTarget(Lcom/xiaomi/xmpush/thrift/Target;)Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p0

    invoke-virtual {v1, p0}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->setPushAction(Ljava/nio/ByteBuffer;)Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    invoke-virtual {v1, p2}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->setAction(Lcom/xiaomi/xmpush/thrift/ActionType;)Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    const/4 p0, 0x1

    invoke-virtual {v1, p0}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->setIsRequest(Z)Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    invoke-virtual {v1, p4}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->setPackageName(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    invoke-virtual {v1, p3}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->setEncryptAction(Z)Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    invoke-virtual {v1, p5}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->setAppid(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    return-object v1
.end method

.method public static getResponseMessageBodyFromContainer(Landroid/content/Context;Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)Lorg/apache/thrift/TBase;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;,
            Lcom/xiaomi/mipush/sdk/DecryptException;
        }
    .end annotation

    invoke-virtual {p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->isEncryptAction()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/AppInfoHolder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getRegSecret()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/string/Base64Coder;->decode(Ljava/lang/String;)[B

    move-result-object p0

    :try_start_0
    invoke-virtual {p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getPushAction()[B

    move-result-object v0

    invoke-static {p0, v0}, Lcom/xiaomi/channel/commonutils/android/DataCryptUtils;->mipushDecrypt([B[B)[B

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    new-instance p1, Lcom/xiaomi/mipush/sdk/DecryptException;

    const-string v0, "the aes decrypt failed."

    invoke-direct {p1, v0, p0}, Lcom/xiaomi/mipush/sdk/DecryptException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1

    :cond_0
    invoke-virtual {p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getPushAction()[B

    move-result-object p0

    :goto_0
    invoke-virtual {p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getAction()Lcom/xiaomi/xmpush/thrift/ActionType;

    move-result-object v0

    iget-boolean p1, p1, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->isRequest:Z

    invoke-static {v0, p1}, Lcom/xiaomi/mipush/sdk/PushContainerHelper;->createRespMessageFromAction(Lcom/xiaomi/xmpush/thrift/ActionType;Z)Lorg/apache/thrift/TBase;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-static {p1, p0}, Lcom/xiaomi/xmpush/thrift/XmPushThriftSerializeUtils;->convertByteArrayToThriftObject(Lorg/apache/thrift/TBase;[B)V

    :cond_1
    return-object p1
.end method
