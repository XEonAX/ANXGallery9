.class public Lcom/xiaomi/mipush/sdk/PushMessageProcessor;
.super Ljava/lang/Object;
.source "PushMessageProcessor.java"


# static fields
.field private static lock:Ljava/lang/Object;

.field private static mCachedMsgIds:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sInstance:Lcom/xiaomi/mipush/sdk/PushMessageProcessor;


# instance fields
.field private sAppContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->lock:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    :cond_0
    return-void
.end method

.method static synthetic access$000(Lcom/xiaomi/mipush/sdk/PushMessageProcessor;Landroid/content/Context;Landroid/content/pm/PackageInfo;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sendUploadLogIntent(Landroid/content/Context;Landroid/content/pm/PackageInfo;)V

    return-void
.end method

.method private ackMessage(Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)V
    .locals 4

    invoke-virtual {p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getMetaInfo()Lcom/xiaomi/xmpush/thrift/PushMetaInfo;

    move-result-object v0

    new-instance v1, Lcom/xiaomi/xmpush/thrift/XmPushActionAckMessage;

    invoke-direct {v1}, Lcom/xiaomi/xmpush/thrift/XmPushActionAckMessage;-><init>()V

    invoke-virtual {p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getAppid()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/xiaomi/xmpush/thrift/XmPushActionAckMessage;->setAppId(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/XmPushActionAckMessage;

    invoke-virtual {v0}, Lcom/xiaomi/xmpush/thrift/PushMetaInfo;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/xiaomi/xmpush/thrift/XmPushActionAckMessage;->setId(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/XmPushActionAckMessage;

    invoke-virtual {v0}, Lcom/xiaomi/xmpush/thrift/PushMetaInfo;->getMessageTs()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/xiaomi/xmpush/thrift/XmPushActionAckMessage;->setMessageTs(J)Lcom/xiaomi/xmpush/thrift/XmPushActionAckMessage;

    invoke-virtual {v0}, Lcom/xiaomi/xmpush/thrift/PushMetaInfo;->getTopic()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v0}, Lcom/xiaomi/xmpush/thrift/PushMetaInfo;->getTopic()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/xiaomi/xmpush/thrift/XmPushActionAckMessage;->setTopic(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/XmPushActionAckMessage;

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/xiaomi/xmpush/thrift/XmPushThriftSerializeUtils;->getDeviceStatus(Landroid/content/Context;Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)S

    move-result v0

    invoke-virtual {v1, v0}, Lcom/xiaomi/xmpush/thrift/XmPushActionAckMessage;->setDeviceStatus(S)Lcom/xiaomi/xmpush/thrift/XmPushActionAckMessage;

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/PushServiceClient;

    move-result-object v0

    sget-object v2, Lcom/xiaomi/xmpush/thrift/ActionType;->AckMessage:Lcom/xiaomi/xmpush/thrift/ActionType;

    const/4 v3, 0x0

    invoke-virtual {p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getMetaInfo()Lcom/xiaomi/xmpush/thrift/PushMetaInfo;

    move-result-object p1

    invoke-virtual {v0, v1, v2, v3, p1}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->sendMessage(Lorg/apache/thrift/TBase;Lcom/xiaomi/xmpush/thrift/ActionType;ZLcom/xiaomi/xmpush/thrift/PushMetaInfo;)V

    return-void
.end method

.method private ackMessage(Lcom/xiaomi/xmpush/thrift/XmPushActionSendMessage;Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)V
    .locals 4

    invoke-virtual {p2}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getMetaInfo()Lcom/xiaomi/xmpush/thrift/PushMetaInfo;

    move-result-object v0

    new-instance v1, Lcom/xiaomi/xmpush/thrift/XmPushActionAckMessage;

    invoke-direct {v1}, Lcom/xiaomi/xmpush/thrift/XmPushActionAckMessage;-><init>()V

    invoke-virtual {p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionSendMessage;->getAppId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/xiaomi/xmpush/thrift/XmPushActionAckMessage;->setAppId(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/XmPushActionAckMessage;

    invoke-virtual {p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionSendMessage;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/xiaomi/xmpush/thrift/XmPushActionAckMessage;->setId(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/XmPushActionAckMessage;

    invoke-virtual {p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionSendMessage;->getMessage()Lcom/xiaomi/xmpush/thrift/PushMessage;

    move-result-object v2

    invoke-virtual {v2}, Lcom/xiaomi/xmpush/thrift/PushMessage;->getCreateAt()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/xiaomi/xmpush/thrift/XmPushActionAckMessage;->setMessageTs(J)Lcom/xiaomi/xmpush/thrift/XmPushActionAckMessage;

    invoke-virtual {p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionSendMessage;->getTopic()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionSendMessage;->getTopic()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/xiaomi/xmpush/thrift/XmPushActionAckMessage;->setTopic(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/XmPushActionAckMessage;

    :cond_0
    invoke-virtual {p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionSendMessage;->getAliasName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionSendMessage;->getAliasName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionAckMessage;->setAliasName(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/XmPushActionAckMessage;

    :cond_1
    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {p1, p2}, Lcom/xiaomi/xmpush/thrift/XmPushThriftSerializeUtils;->getDeviceStatus(Landroid/content/Context;Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)S

    move-result p1

    invoke-virtual {v1, p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionAckMessage;->setDeviceStatus(S)Lcom/xiaomi/xmpush/thrift/XmPushActionAckMessage;

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/PushServiceClient;

    move-result-object p1

    sget-object p2, Lcom/xiaomi/xmpush/thrift/ActionType;->AckMessage:Lcom/xiaomi/xmpush/thrift/ActionType;

    invoke-virtual {p1, v1, p2, v0}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->sendMessage(Lorg/apache/thrift/TBase;Lcom/xiaomi/xmpush/thrift/ActionType;Lcom/xiaomi/xmpush/thrift/PushMetaInfo;)V

    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/PushMessageProcessor;
    .locals 1

    sget-object v0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sInstance:Lcom/xiaomi/mipush/sdk/PushMessageProcessor;

    if-nez v0, :cond_0

    new-instance v0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;

    invoke-direct {v0, p0}, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sInstance:Lcom/xiaomi/mipush/sdk/PushMessageProcessor;

    :cond_0
    sget-object p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sInstance:Lcom/xiaomi/mipush/sdk/PushMessageProcessor;

    return-object p0
.end method

.method public static getNotificationMessageIntent(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)Landroid/content/Intent;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p2, :cond_a

    const-string v1, "notify_effect"

    invoke-interface {p2, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_5

    :cond_0
    const-string v1, "notify_effect"

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const/4 v2, -0x1

    const-string v3, "intent_flag"

    invoke-interface {p2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    :try_start_0
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move v2, v3

    goto :goto_0

    :catch_0
    move-exception v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Cause by intent_flag: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    :cond_1
    :goto_0
    sget-object v3, Lcom/xiaomi/push/service/PushConstants;->NOTIFICATION_CLICK_DEFAULT:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p2

    invoke-virtual {p2, p1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-object p2, p1

    goto/16 :goto_4

    :catch_1
    move-exception p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Cause: "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    goto/16 :goto_3

    :cond_2
    sget-object v3, Lcom/xiaomi/push/service/PushConstants;->NOTIFICATION_CLICK_INTENT:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    const-string v1, "intent_uri"

    invoke-interface {p2, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v1, "intent_uri"

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    if-eqz p2, :cond_7

    const/4 v1, 0x1

    :try_start_2
    invoke-static {p2, v1}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p2
    :try_end_2
    .catch Ljava/net/URISyntaxException; {:try_start_2 .. :try_end_2} :catch_3

    :try_start_3
    invoke-virtual {p2, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;
    :try_end_3
    .catch Ljava/net/URISyntaxException; {:try_start_3 .. :try_end_3} :catch_2

    goto/16 :goto_4

    :catch_2
    move-exception p1

    goto :goto_1

    :catch_3
    move-exception p1

    move-object p2, v0

    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cause: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/net/URISyntaxException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    goto/16 :goto_4

    :cond_3
    const-string v1, "class_name"

    invoke-interface {p2, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    const-string v1, "class_name"

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    new-instance v3, Landroid/content/ComponentName;

    invoke-direct {v3, p1, p2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-object p2, v1

    goto/16 :goto_4

    :cond_4
    sget-object p1, Lcom/xiaomi/push/service/PushConstants;->NOTIFICATION_CLICK_WEB_PAGE:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    const-string p1, "web_uri"

    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_7

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    const-string p2, "http://"

    invoke-virtual {p1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_5

    const-string p2, "https://"

    invoke-virtual {p1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_5

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "http://"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_5
    :try_start_4
    new-instance p2, Ljava/net/URL;

    invoke-direct {p2, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object p2

    const-string v1, "http"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    const-string v1, "https"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_7

    :cond_6
    new-instance p2, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {p2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/net/MalformedURLException; {:try_start_4 .. :try_end_4} :catch_5

    :try_start_5
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;
    :try_end_5
    .catch Ljava/net/MalformedURLException; {:try_start_5 .. :try_end_5} :catch_4

    goto :goto_4

    :catch_4
    move-exception p1

    goto :goto_2

    :catch_5
    move-exception p1

    move-object p2, v0

    :goto_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cause: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/net/MalformedURLException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    goto :goto_4

    :cond_7
    :goto_3
    move-object p2, v0

    :goto_4
    if-eqz p2, :cond_9

    if-ltz v2, :cond_8

    invoke-virtual {p2, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    :cond_8
    const/high16 p1, 0x10000000

    invoke-virtual {p2, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    :try_start_6
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const/high16 p1, 0x10000

    invoke-virtual {p0, p2, p1}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object p0
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_6

    if-eqz p0, :cond_9

    return-object p2

    :catch_6
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Cause: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    :cond_9
    return-object v0

    :cond_a
    :goto_5
    return-object v0
.end method

.method private static isDuplicateMessage(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 7

    sget-object v0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->lock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/AppInfoHolder;

    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    sget-object v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->mCachedMsgIds:Ljava/util/Queue;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    const-string v1, "pref_msg_ids"

    const-string v3, ""

    invoke-interface {p0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v3, ","

    invoke-virtual {v1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    sput-object v3, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->mCachedMsgIds:Ljava/util/Queue;

    array-length v3, v1

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_0

    aget-object v5, v1, v4

    sget-object v6, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->mCachedMsgIds:Ljava/util/Queue;

    invoke-interface {v6, v5}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_0
    sget-object v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->mCachedMsgIds:Ljava/util/Queue;

    invoke-interface {v1, p1}, Ljava/util/Queue;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    monitor-exit v0

    const/4 p0, 0x1

    return p0

    :cond_1
    sget-object v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->mCachedMsgIds:Ljava/util/Queue;

    invoke-interface {v1, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    sget-object p1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->mCachedMsgIds:Ljava/util/Queue;

    invoke-interface {p1}, Ljava/util/Queue;->size()I

    move-result p1

    const/16 v1, 0x19

    if-le p1, v1, :cond_2

    sget-object p1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->mCachedMsgIds:Ljava/util/Queue;

    invoke-interface {p1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    :cond_2
    sget-object p1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->mCachedMsgIds:Ljava/util/Queue;

    const-string v1, ","

    invoke-static {p1, v1}, Lcom/xiaomi/channel/commonutils/string/XMStringUtils;->join(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v1, "pref_msg_ids"

    invoke-interface {p0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/android/SharedPrefsCompat;->apply(Landroid/content/SharedPreferences$Editor;)V

    monitor-exit v0

    return v2

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method private isHybridMsg(Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)Z
    .locals 3

    const-string v0, "com.miui.hybrid"

    invoke-virtual {p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "com.miui.hybrid.loader"

    invoke-virtual {p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getMetaInfo()Lcom/xiaomi/xmpush/thrift/PushMetaInfo;

    move-result-object v0

    if-nez v0, :cond_1

    const/4 p1, 0x0

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getMetaInfo()Lcom/xiaomi/xmpush/thrift/PushMetaInfo;

    move-result-object p1

    invoke-virtual {p1}, Lcom/xiaomi/xmpush/thrift/PushMetaInfo;->getExtra()Ljava/util/Map;

    move-result-object p1

    :goto_0
    if-nez p1, :cond_2

    return v1

    :cond_2
    const-string v0, "push_server_action"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    const-string v0, "hybrid_message"

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string v0, "platform_message"

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_1

    :cond_3
    return v1

    :cond_4
    :goto_1
    const/4 p1, 0x1

    return p1
.end method

.method private processMessage(Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;Z[BLjava/lang/String;I)Lcom/xiaomi/mipush/sdk/PushMessageHandler$PushMessageInterface;
    .locals 19

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v0, p2

    move-object/from16 v3, p3

    move-object/from16 v8, p4

    move/from16 v9, p5

    const/4 v10, 0x0

    :try_start_0
    iget-object v4, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v4, v2}, Lcom/xiaomi/mipush/sdk/PushContainerHelper;->getResponseMessageBodyFromContainer(Landroid/content/Context;Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)Lorg/apache/thrift/TBase;

    move-result-object v4

    if-nez v4, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "receiving an un-recognized message. "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v2, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->action:Lcom/xiaomi/xmpush/thrift/ActionType;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/clientReport/PushClientReportManager;

    move-result-object v0

    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-static/range {p5 .. p5}, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->getInterfaceIdByType(I)Ljava/lang/String;

    move-result-object v4

    const-string v5, "receiving an un-recognized message."

    invoke-virtual {v0, v3, v4, v8, v5}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->reportEvent4ERROR(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/xiaomi/mipush/sdk/DecryptException; {:try_start_0 .. :try_end_0} :catch_6
    .catch Lorg/apache/thrift/TException; {:try_start_0 .. :try_end_0} :catch_5

    return-object v10

    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getAction()Lcom/xiaomi/xmpush/thrift/ActionType;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "processing a message, action="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    sget-object v6, Lcom/xiaomi/mipush/sdk/PushMessageProcessor$2;->$SwitchMap$com$xiaomi$xmpush$thrift$ActionType:[I

    invoke-virtual {v5}, Lcom/xiaomi/xmpush/thrift/ActionType;->ordinal()I

    move-result v5

    aget v5, v6, v5

    const/4 v6, 0x1

    const-wide/16 v11, 0x0

    const/4 v7, 0x0

    packed-switch v5, :pswitch_data_0

    goto/16 :goto_f

    :pswitch_0
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    iget-object v5, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    sget-object v8, Lcom/xiaomi/xmpush/thrift/ActionType;->Notification:Lcom/xiaomi/xmpush/thrift/ActionType;

    array-length v3, v3

    invoke-static {v0, v5, v4, v8, v3}, Lcom/xiaomi/push/clientreport/PerfMessageHelper;->collectPerfData(Ljava/lang/String;Landroid/content/Context;Lorg/apache/thrift/TBase;Lcom/xiaomi/xmpush/thrift/ActionType;I)V

    instance-of v0, v4, Lcom/xiaomi/xmpush/thrift/XmPushActionAckNotification;

    if-eqz v0, :cond_e

    check-cast v4, Lcom/xiaomi/xmpush/thrift/XmPushActionAckNotification;

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionAckNotification;->getId()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Lcom/xiaomi/xmpush/thrift/NotificationType;->DisablePushMessage:Lcom/xiaomi/xmpush/thrift/NotificationType;

    iget-object v2, v2, Lcom/xiaomi/xmpush/thrift/NotificationType;->value:Ljava/lang/String;

    iget-object v3, v4, Lcom/xiaomi/xmpush/thrift/XmPushActionAckNotification;->type:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    const/16 v3, 0xa

    if-eqz v2, :cond_6

    iget-wide v4, v4, Lcom/xiaomi/xmpush/thrift/XmPushActionAckNotification;->errorCode:J

    cmp-long v2, v4, v11

    if-nez v2, :cond_2

    const-class v2, Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    monitor-enter v2

    :try_start_1
    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->isMessageOperating(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->removeOperateMessage(Ljava/lang/String;)V

    const-string v0, "syncing"

    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v3

    sget-object v4, Lcom/xiaomi/mipush/sdk/RetryType;->DISABLE_PUSH:Lcom/xiaomi/mipush/sdk/RetryType;

    invoke-virtual {v3, v4}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getSyncStatus(Lcom/xiaomi/mipush/sdk/RetryType;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v0

    sget-object v3, Lcom/xiaomi/mipush/sdk/RetryType;->DISABLE_PUSH:Lcom/xiaomi/mipush/sdk/RetryType;

    const-string v4, "synced"

    invoke-virtual {v0, v3, v4}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->putSyncStatus(Lcom/xiaomi/mipush/sdk/RetryType;Ljava/lang/String;)V

    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/MiPushClient;->clearNotification(Landroid/content/Context;)V

    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/MiPushClient;->clearLocalNotificationType(Landroid/content/Context;)V

    invoke-static {}, Lcom/xiaomi/mipush/sdk/PushMessageHandler;->removeAllPushCallbackClass()V

    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/PushServiceClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->closePush()V

    :cond_1
    monitor-exit v2

    goto/16 :goto_f

    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :cond_2
    const-string v2, "syncing"

    iget-object v4, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v4

    sget-object v5, Lcom/xiaomi/mipush/sdk/RetryType;->DISABLE_PUSH:Lcom/xiaomi/mipush/sdk/RetryType;

    invoke-virtual {v4, v5}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getSyncStatus(Lcom/xiaomi/mipush/sdk/RetryType;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    const-class v2, Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    monitor-enter v2

    :try_start_2
    iget-object v4, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v4

    invoke-virtual {v4, v0}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->isMessageOperating(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    iget-object v4, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v4

    invoke-virtual {v4, v0}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getRetryCount(Ljava/lang/String;)I

    move-result v4

    if-ge v4, v3, :cond_3

    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->increaseRetryCount(Ljava/lang/String;)V

    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/PushServiceClient;

    move-result-object v3

    invoke-virtual {v3, v6, v0}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->sendPushEnableDisableMessage(ZLjava/lang/String;)V

    goto :goto_0

    :cond_3
    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->removeOperateMessage(Ljava/lang/String;)V

    :cond_4
    :goto_0
    monitor-exit v2

    goto/16 :goto_f

    :catchall_1
    move-exception v0

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v0

    :cond_5
    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->removeOperateMessage(Ljava/lang/String;)V

    goto/16 :goto_f

    :cond_6
    sget-object v2, Lcom/xiaomi/xmpush/thrift/NotificationType;->EnablePushMessage:Lcom/xiaomi/xmpush/thrift/NotificationType;

    iget-object v2, v2, Lcom/xiaomi/xmpush/thrift/NotificationType;->value:Ljava/lang/String;

    iget-object v5, v4, Lcom/xiaomi/xmpush/thrift/XmPushActionAckNotification;->type:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_c

    iget-wide v4, v4, Lcom/xiaomi/xmpush/thrift/XmPushActionAckNotification;->errorCode:J

    cmp-long v2, v4, v11

    if-nez v2, :cond_8

    const-class v2, Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    monitor-enter v2

    :try_start_3
    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->isMessageOperating(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_7

    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->removeOperateMessage(Ljava/lang/String;)V

    const-string v0, "syncing"

    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v3

    sget-object v4, Lcom/xiaomi/mipush/sdk/RetryType;->ENABLE_PUSH:Lcom/xiaomi/mipush/sdk/RetryType;

    invoke-virtual {v3, v4}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getSyncStatus(Lcom/xiaomi/mipush/sdk/RetryType;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v0

    sget-object v3, Lcom/xiaomi/mipush/sdk/RetryType;->ENABLE_PUSH:Lcom/xiaomi/mipush/sdk/RetryType;

    const-string v4, "synced"

    invoke-virtual {v0, v3, v4}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->putSyncStatus(Lcom/xiaomi/mipush/sdk/RetryType;Ljava/lang/String;)V

    :cond_7
    monitor-exit v2

    goto/16 :goto_f

    :catchall_2
    move-exception v0

    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    throw v0

    :cond_8
    const-string v2, "syncing"

    iget-object v4, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v4

    sget-object v5, Lcom/xiaomi/mipush/sdk/RetryType;->ENABLE_PUSH:Lcom/xiaomi/mipush/sdk/RetryType;

    invoke-virtual {v4, v5}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getSyncStatus(Lcom/xiaomi/mipush/sdk/RetryType;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    const-class v2, Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    monitor-enter v2

    :try_start_4
    iget-object v4, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v4

    invoke-virtual {v4, v0}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->isMessageOperating(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_a

    iget-object v4, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v4

    invoke-virtual {v4, v0}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getRetryCount(Ljava/lang/String;)I

    move-result v4

    if-ge v4, v3, :cond_9

    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->increaseRetryCount(Ljava/lang/String;)V

    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/PushServiceClient;

    move-result-object v3

    invoke-virtual {v3, v7, v0}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->sendPushEnableDisableMessage(ZLjava/lang/String;)V

    goto :goto_1

    :cond_9
    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->removeOperateMessage(Ljava/lang/String;)V

    :cond_a
    :goto_1
    monitor-exit v2

    goto/16 :goto_f

    :catchall_3
    move-exception v0

    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    throw v0

    :cond_b
    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->removeOperateMessage(Ljava/lang/String;)V

    goto/16 :goto_f

    :cond_c
    sget-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->ThirdPartyRegUpdate:Lcom/xiaomi/xmpush/thrift/NotificationType;

    iget-object v0, v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->value:Ljava/lang/String;

    iget-object v2, v4, Lcom/xiaomi/xmpush/thrift/XmPushActionAckNotification;->type:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-direct {v1, v4}, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->processSendTokenAckNotification(Lcom/xiaomi/xmpush/thrift/XmPushActionAckNotification;)V

    goto/16 :goto_f

    :cond_d
    sget-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->UploadTinyData:Lcom/xiaomi/xmpush/thrift/NotificationType;

    iget-object v0, v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->value:Ljava/lang/String;

    iget-object v2, v4, Lcom/xiaomi/xmpush/thrift/XmPushActionAckNotification;->type:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_43

    invoke-direct {v1, v4}, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->processStatDataACK(Lcom/xiaomi/xmpush/thrift/XmPushActionAckNotification;)V

    goto/16 :goto_f

    :cond_e
    instance-of v0, v4, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    if-eqz v0, :cond_43

    check-cast v4, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    const-string v0, "registration id expired"

    iget-object v3, v4, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->type:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_12

    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/MiPushClient;->getAllAlias(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/xiaomi/mipush/sdk/MiPushClient;->getAllTopic(Landroid/content/Context;)Ljava/util/List;

    move-result-object v2

    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/MiPushClient;->getAllUserAccount(Landroid/content/Context;)Ljava/util/List;

    move-result-object v3

    iget-object v4, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/MiPushClient;->getAcceptTime(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    sget-object v8, Lcom/xiaomi/xmpush/thrift/RegistrationReason;->RegIdExpired:Lcom/xiaomi/xmpush/thrift/RegistrationReason;

    invoke-static {v5, v8}, Lcom/xiaomi/mipush/sdk/MiPushClient;->reInitialize(Landroid/content/Context;Lcom/xiaomi/xmpush/thrift/RegistrationReason;)V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    iget-object v8, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v8, v5}, Lcom/xiaomi/mipush/sdk/MiPushClient;->removeAlias(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v8, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v8, v5, v10}, Lcom/xiaomi/mipush/sdk/MiPushClient;->setAlias(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_f
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_10

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v5, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v5, v2}, Lcom/xiaomi/mipush/sdk/MiPushClient;->removeTopic(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v5, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v5, v2, v10}, Lcom/xiaomi/mipush/sdk/MiPushClient;->subscribe(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    :cond_10
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_11

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v3, v2}, Lcom/xiaomi/mipush/sdk/MiPushClient;->removeAccount(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v3, v2, v10}, Lcom/xiaomi/mipush/sdk/MiPushClient;->setUserAccount(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    :cond_11
    const-string v0, ","

    invoke-virtual {v4, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    array-length v2, v0

    const/4 v3, 0x2

    if-ne v2, v3, :cond_43

    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/xiaomi/mipush/sdk/MiPushClient;->removeAcceptTime(Landroid/content/Context;)V

    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    aget-object v3, v0, v7

    aget-object v0, v0, v6

    invoke-static {v2, v3, v0}, Lcom/xiaomi/mipush/sdk/MiPushClient;->addAcceptTime(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_f

    :cond_12
    const-string v0, "client_info_update_ok"

    iget-object v3, v4, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->type:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_13

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->getExtra()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_43

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->getExtra()Ljava/util/Map;

    move-result-object v0

    const-string v2, "app_version"

    invoke-interface {v0, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_43

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->getExtra()Ljava/util/Map;

    move-result-object v0

    const-string v2, "app_version"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/AppInfoHolder;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->updateVersionName(Ljava/lang/String;)V

    goto/16 :goto_f

    :cond_13
    sget-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->AwakeApp:Lcom/xiaomi/xmpush/thrift/NotificationType;

    iget-object v0, v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->value:Ljava/lang/String;

    iget-object v3, v4, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->type:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_14

    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->isEncryptAction()Z

    move-result v0

    if-eqz v0, :cond_43

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->getExtra()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_43

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->getExtra()Ljava/util/Map;

    move-result-object v0

    const-string v2, "awake_info"

    invoke-interface {v0, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_43

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->getExtra()Ljava/util/Map;

    move-result-object v0

    const-string v2, "awake_info"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/AppInfoHolder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getAppID()Ljava/lang/String;

    move-result-object v3

    iget-object v4, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/xiaomi/push/service/OnlineConfig;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/OnlineConfig;

    move-result-object v4

    sget-object v5, Lcom/xiaomi/xmpush/thrift/ConfigKey;->AwakeInfoUploadWaySwitch:Lcom/xiaomi/xmpush/thrift/ConfigKey;

    invoke-virtual {v5}, Lcom/xiaomi/xmpush/thrift/ConfigKey;->getValue()I

    move-result v5

    invoke-virtual {v4, v5, v7}, Lcom/xiaomi/push/service/OnlineConfig;->getIntValue(II)I

    move-result v4

    invoke-static {v2, v3, v4, v0}, Lcom/xiaomi/mipush/sdk/AwakeHelper;->doAwAppLogic(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;)V

    goto/16 :goto_f

    :cond_14
    sget-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->NormalClientConfigUpdate:Lcom/xiaomi/xmpush/thrift/NotificationType;

    iget-object v0, v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->value:Ljava/lang/String;

    iget-object v2, v4, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->type:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_15

    new-instance v0, Lcom/xiaomi/xmpush/thrift/XmPushActionNormalConfig;

    invoke-direct {v0}, Lcom/xiaomi/xmpush/thrift/XmPushActionNormalConfig;-><init>()V

    :try_start_5
    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->getBinaryExtra()[B

    move-result-object v2

    invoke-static {v0, v2}, Lcom/xiaomi/xmpush/thrift/XmPushThriftSerializeUtils;->convertByteArrayToThriftObject(Lorg/apache/thrift/TBase;[B)V

    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/xiaomi/push/service/OnlineConfig;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/OnlineConfig;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/xiaomi/push/service/OnlineConfigHelper;->updateNormalConfigs(Lcom/xiaomi/push/service/OnlineConfig;Lcom/xiaomi/xmpush/thrift/XmPushActionNormalConfig;)V
    :try_end_5
    .catch Lorg/apache/thrift/TException; {:try_start_5 .. :try_end_5} :catch_0

    goto/16 :goto_f

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    goto/16 :goto_f

    :cond_15
    sget-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->CustomClientConfigUpdate:Lcom/xiaomi/xmpush/thrift/NotificationType;

    iget-object v0, v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->value:Ljava/lang/String;

    iget-object v2, v4, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->type:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_16

    new-instance v0, Lcom/xiaomi/xmpush/thrift/XmPushActionCustomConfig;

    invoke-direct {v0}, Lcom/xiaomi/xmpush/thrift/XmPushActionCustomConfig;-><init>()V

    :try_start_6
    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->getBinaryExtra()[B

    move-result-object v2

    invoke-static {v0, v2}, Lcom/xiaomi/xmpush/thrift/XmPushThriftSerializeUtils;->convertByteArrayToThriftObject(Lorg/apache/thrift/TBase;[B)V

    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/xiaomi/push/service/OnlineConfig;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/OnlineConfig;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/xiaomi/push/service/OnlineConfigHelper;->updateCustomConfigs(Lcom/xiaomi/push/service/OnlineConfig;Lcom/xiaomi/xmpush/thrift/XmPushActionCustomConfig;)V
    :try_end_6
    .catch Lorg/apache/thrift/TException; {:try_start_6 .. :try_end_6} :catch_1

    goto/16 :goto_f

    :catch_1
    move-exception v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    goto/16 :goto_f

    :cond_16
    sget-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->SyncInfoResult:Lcom/xiaomi/xmpush/thrift/NotificationType;

    iget-object v0, v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->value:Ljava/lang/String;

    iget-object v2, v4, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->type:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_17

    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v0, v4}, Lcom/xiaomi/mipush/sdk/SyncInfoHelper;->saveInfo(Landroid/content/Context;Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;)V

    goto/16 :goto_f

    :cond_17
    sget-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->ForceSync:Lcom/xiaomi/xmpush/thrift/NotificationType;

    iget-object v0, v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->value:Ljava/lang/String;

    iget-object v2, v4, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->type:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_18

    const-string v0, "receive force sync notification"

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v0, v7}, Lcom/xiaomi/mipush/sdk/SyncInfoHelper;->doSyncInfoAsync(Landroid/content/Context;Z)V

    goto/16 :goto_f

    :cond_18
    sget-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->CancelPushMessage:Lcom/xiaomi/xmpush/thrift/NotificationType;

    iget-object v0, v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->value:Ljava/lang/String;

    iget-object v2, v4, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->type:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1d

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->getExtra()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_43

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->getExtra()Ljava/util/Map;

    move-result-object v0

    sget-object v2, Lcom/xiaomi/push/service/PushConstants;->PUSH_NOTIFY_ID:Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    const/4 v2, -0x2

    if-eqz v0, :cond_19

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->getExtra()Ljava/util/Map;

    move-result-object v0

    sget-object v3, Lcom/xiaomi/push/service/PushConstants;->PUSH_NOTIFY_ID:Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_19

    :try_start_7
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_7
    .catch Ljava/lang/NumberFormatException; {:try_start_7 .. :try_end_7} :catch_2

    move v2, v0

    goto :goto_5

    :catch_2
    move-exception v0

    move-object v3, v0

    invoke-virtual {v3}, Ljava/lang/NumberFormatException;->printStackTrace()V

    :cond_19
    :goto_5
    const/4 v0, -0x1

    if-lt v2, v0, :cond_1a

    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v0, v2}, Lcom/xiaomi/mipush/sdk/MiPushClient;->clearNotification(Landroid/content/Context;I)V

    goto/16 :goto_f

    :cond_1a
    const-string v0, ""

    const-string v2, ""

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->getExtra()Ljava/util/Map;

    move-result-object v3

    sget-object v5, Lcom/xiaomi/push/service/PushConstants;->PUSH_TITLE:Ljava/lang/String;

    invoke-interface {v3, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1b

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->getExtra()Ljava/util/Map;

    move-result-object v0

    sget-object v3, Lcom/xiaomi/push/service/PushConstants;->PUSH_TITLE:Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :cond_1b
    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->getExtra()Ljava/util/Map;

    move-result-object v3

    sget-object v5, Lcom/xiaomi/push/service/PushConstants;->PUSH_DESCRIPTION:Ljava/lang/String;

    invoke-interface {v3, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1c

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->getExtra()Ljava/util/Map;

    move-result-object v2

    sget-object v3, Lcom/xiaomi/push/service/PushConstants;->PUSH_DESCRIPTION:Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    :cond_1c
    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v3, v0, v2}, Lcom/xiaomi/mipush/sdk/MiPushClient;->clearNotification(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_f

    :cond_1d
    sget-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->HybridRegisterResult:Lcom/xiaomi/xmpush/thrift/NotificationType;

    iget-object v0, v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->value:Ljava/lang/String;

    iget-object v2, v4, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->type:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    :try_start_8
    new-instance v0, Lcom/xiaomi/xmpush/thrift/XmPushActionRegistrationResult;

    invoke-direct {v0}, Lcom/xiaomi/xmpush/thrift/XmPushActionRegistrationResult;-><init>()V

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->getBinaryExtra()[B

    move-result-object v2

    invoke-static {v0, v2}, Lcom/xiaomi/xmpush/thrift/XmPushThriftSerializeUtils;->convertByteArrayToThriftObject(Lorg/apache/thrift/TBase;[B)V

    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v2, v0}, Lcom/xiaomi/mipush/sdk/MiPushClient4Hybrid;->onReceiveRegisterResult(Landroid/content/Context;Lcom/xiaomi/xmpush/thrift/XmPushActionRegistrationResult;)V
    :try_end_8
    .catch Lorg/apache/thrift/TException; {:try_start_8 .. :try_end_8} :catch_3

    goto/16 :goto_f

    :catch_3
    move-exception v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    goto/16 :goto_f

    :cond_1e
    sget-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->HybridUnregisterResult:Lcom/xiaomi/xmpush/thrift/NotificationType;

    iget-object v0, v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->value:Ljava/lang/String;

    iget-object v2, v4, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->type:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1f

    :try_start_9
    new-instance v0, Lcom/xiaomi/xmpush/thrift/XmPushActionUnRegistrationResult;

    invoke-direct {v0}, Lcom/xiaomi/xmpush/thrift/XmPushActionUnRegistrationResult;-><init>()V

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->getBinaryExtra()[B

    move-result-object v2

    invoke-static {v0, v2}, Lcom/xiaomi/xmpush/thrift/XmPushThriftSerializeUtils;->convertByteArrayToThriftObject(Lorg/apache/thrift/TBase;[B)V

    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v2, v0}, Lcom/xiaomi/mipush/sdk/MiPushClient4Hybrid;->onReceiveUnregisterResult(Landroid/content/Context;Lcom/xiaomi/xmpush/thrift/XmPushActionUnRegistrationResult;)V
    :try_end_9
    .catch Lorg/apache/thrift/TException; {:try_start_9 .. :try_end_9} :catch_4

    goto/16 :goto_f

    :catch_4
    move-exception v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    goto/16 :goto_f

    :cond_1f
    sget-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->PushLogUpload:Lcom/xiaomi/xmpush/thrift/NotificationType;

    iget-object v0, v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->value:Ljava/lang/String;

    iget-object v2, v4, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->type:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_43

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->getExtra()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_43

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->getExtra()Ljava/util/Map;

    move-result-object v0

    const-string v2, "packages"

    invoke-interface {v0, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_43

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->getExtra()Ljava/util/Map;

    move-result-object v0

    const-string v2, "packages"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v2, ","

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "com.xiaomi.xmsf"

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_20

    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v2, v6}, Lcom/xiaomi/mipush/sdk/Logger;->uploadLogFile(Landroid/content/Context;Z)V

    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-direct {v1, v2, v0}, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->uploadAppLog(Landroid/content/Context;[Ljava/lang/String;)V

    goto/16 :goto_f

    :cond_20
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v0, v7}, Lcom/xiaomi/mipush/sdk/Logger;->uploadLogFile(Landroid/content/Context;Z)V

    goto/16 :goto_f

    :pswitch_1
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    sget-object v5, Lcom/xiaomi/xmpush/thrift/ActionType;->Command:Lcom/xiaomi/xmpush/thrift/ActionType;

    array-length v3, v3

    invoke-static {v0, v2, v4, v5, v3}, Lcom/xiaomi/push/clientreport/PerfMessageHelper;->collectPerfData(Ljava/lang/String;Landroid/content/Context;Lorg/apache/thrift/TBase;Lcom/xiaomi/xmpush/thrift/ActionType;I)V

    check-cast v4, Lcom/xiaomi/xmpush/thrift/XmPushActionCommandResult;

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionCommandResult;->getCmdName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionCommandResult;->getCmdArgs()Ljava/util/List;

    move-result-object v0

    iget-wide v2, v4, Lcom/xiaomi/xmpush/thrift/XmPushActionCommandResult;->errorCode:J

    cmp-long v5, v2, v11

    if-nez v5, :cond_28

    sget-object v2, Lcom/xiaomi/push/service/xmpush/Command;->COMMAND_SET_ACCEPT_TIME:Lcom/xiaomi/push/service/xmpush/Command;

    iget-object v2, v2, Lcom/xiaomi/push/service/xmpush/Command;->value:Ljava/lang/String;

    invoke-static {v13, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_22

    if-eqz v0, :cond_22

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-le v2, v6, :cond_22

    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v2, v3, v5}, Lcom/xiaomi/mipush/sdk/MiPushClient;->addAcceptTime(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "00:00"

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_21

    const-string v2, "00:00"

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_21

    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/AppInfoHolder;

    move-result-object v2

    invoke-virtual {v2, v6}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->setPaused(Z)V

    goto :goto_6

    :cond_21
    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/AppInfoHolder;

    move-result-object v2

    invoke-virtual {v2, v7}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->setPaused(Z)V

    :goto_6
    const-string v2, "GMT+08"

    invoke-static {v2}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v2

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v3

    invoke-virtual {v1, v2, v3, v0}, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->getTimeForTimeZone(Ljava/util/TimeZone;Ljava/util/TimeZone;Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    goto/16 :goto_7

    :cond_22
    sget-object v2, Lcom/xiaomi/push/service/xmpush/Command;->COMMAND_SET_ALIAS:Lcom/xiaomi/push/service/xmpush/Command;

    iget-object v2, v2, Lcom/xiaomi/push/service/xmpush/Command;->value:Ljava/lang/String;

    invoke-static {v13, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_23

    if-eqz v0, :cond_23

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_23

    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/xiaomi/mipush/sdk/MiPushClient;->addAlias(Landroid/content/Context;Ljava/lang/String;)V

    goto/16 :goto_7

    :cond_23
    sget-object v2, Lcom/xiaomi/push/service/xmpush/Command;->COMMAND_UNSET_ALIAS:Lcom/xiaomi/push/service/xmpush/Command;

    iget-object v2, v2, Lcom/xiaomi/push/service/xmpush/Command;->value:Ljava/lang/String;

    invoke-static {v13, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_24

    if-eqz v0, :cond_24

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_24

    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/xiaomi/mipush/sdk/MiPushClient;->removeAlias(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_7

    :cond_24
    sget-object v2, Lcom/xiaomi/push/service/xmpush/Command;->COMMAND_SET_ACCOUNT:Lcom/xiaomi/push/service/xmpush/Command;

    iget-object v2, v2, Lcom/xiaomi/push/service/xmpush/Command;->value:Ljava/lang/String;

    invoke-static {v13, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_25

    if-eqz v0, :cond_25

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_25

    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/xiaomi/mipush/sdk/MiPushClient;->addAccount(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_7

    :cond_25
    sget-object v2, Lcom/xiaomi/push/service/xmpush/Command;->COMMAND_UNSET_ACCOUNT:Lcom/xiaomi/push/service/xmpush/Command;

    iget-object v2, v2, Lcom/xiaomi/push/service/xmpush/Command;->value:Ljava/lang/String;

    invoke-static {v13, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_26

    if-eqz v0, :cond_26

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_26

    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/xiaomi/mipush/sdk/MiPushClient;->removeAccount(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_7

    :cond_26
    sget-object v2, Lcom/xiaomi/push/service/xmpush/Command;->COMMAND_CHK_VDEVID:Lcom/xiaomi/push/service/xmpush/Command;

    iget-object v2, v2, Lcom/xiaomi/push/service/xmpush/Command;->value:Ljava/lang/String;

    invoke-static {v13, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_28

    if-eqz v0, :cond_27

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_27

    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v2, v0}, Lcom/xiaomi/channel/commonutils/android/DeviceInfo;->updateVirtDevId(Landroid/content/Context;Ljava/lang/String;)V

    :cond_27
    return-object v10

    :cond_28
    :goto_7
    move-object v14, v0

    iget-wide v2, v4, Lcom/xiaomi/xmpush/thrift/XmPushActionCommandResult;->errorCode:J

    iget-object v0, v4, Lcom/xiaomi/xmpush/thrift/XmPushActionCommandResult;->reason:Ljava/lang/String;

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionCommandResult;->getCategory()Ljava/lang/String;

    move-result-object v18

    move-wide v15, v2

    move-object/from16 v17, v0

    invoke-static/range {v13 .. v18}, Lcom/xiaomi/mipush/sdk/PushMessageHelper;->generateCommandMessage(Ljava/lang/String;Ljava/util/List;JLjava/lang/String;Ljava/lang/String;)Lcom/xiaomi/mipush/sdk/MiPushCommandMessage;

    move-result-object v0

    return-object v0

    :pswitch_2
    check-cast v4, Lcom/xiaomi/xmpush/thrift/XmPushActionUnSubscriptionResult;

    iget-wide v2, v4, Lcom/xiaomi/xmpush/thrift/XmPushActionUnSubscriptionResult;->errorCode:J

    cmp-long v0, v2, v11

    if-nez v0, :cond_29

    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionUnSubscriptionResult;->getTopic()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/xiaomi/mipush/sdk/MiPushClient;->removeTopic(Landroid/content/Context;Ljava/lang/String;)V

    :cond_29
    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionUnSubscriptionResult;->getTopic()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2a

    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionUnSubscriptionResult;->getTopic()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v10, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2a
    move-object v12, v10

    sget-object v0, Lcom/xiaomi/push/service/xmpush/Command;->COMMAND_UNSUBSCRIBE_TOPIC:Lcom/xiaomi/push/service/xmpush/Command;

    iget-object v11, v0, Lcom/xiaomi/push/service/xmpush/Command;->value:Ljava/lang/String;

    iget-wide v13, v4, Lcom/xiaomi/xmpush/thrift/XmPushActionUnSubscriptionResult;->errorCode:J

    iget-object v15, v4, Lcom/xiaomi/xmpush/thrift/XmPushActionUnSubscriptionResult;->reason:Ljava/lang/String;

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionUnSubscriptionResult;->getCategory()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v11 .. v16}, Lcom/xiaomi/mipush/sdk/PushMessageHelper;->generateCommandMessage(Ljava/lang/String;Ljava/util/List;JLjava/lang/String;Ljava/lang/String;)Lcom/xiaomi/mipush/sdk/MiPushCommandMessage;

    move-result-object v0

    return-object v0

    :pswitch_3
    check-cast v4, Lcom/xiaomi/xmpush/thrift/XmPushActionSubscriptionResult;

    iget-wide v2, v4, Lcom/xiaomi/xmpush/thrift/XmPushActionSubscriptionResult;->errorCode:J

    cmp-long v0, v2, v11

    if-nez v0, :cond_2b

    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionSubscriptionResult;->getTopic()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/xiaomi/mipush/sdk/MiPushClient;->addTopic(Landroid/content/Context;Ljava/lang/String;)V

    :cond_2b
    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionSubscriptionResult;->getTopic()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2c

    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionSubscriptionResult;->getTopic()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v10, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2c
    move-object v12, v10

    sget-object v0, Lcom/xiaomi/push/service/xmpush/Command;->COMMAND_SUBSCRIBE_TOPIC:Lcom/xiaomi/push/service/xmpush/Command;

    iget-object v11, v0, Lcom/xiaomi/push/service/xmpush/Command;->value:Ljava/lang/String;

    iget-wide v13, v4, Lcom/xiaomi/xmpush/thrift/XmPushActionSubscriptionResult;->errorCode:J

    iget-object v15, v4, Lcom/xiaomi/xmpush/thrift/XmPushActionSubscriptionResult;->reason:Ljava/lang/String;

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionSubscriptionResult;->getCategory()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v11 .. v16}, Lcom/xiaomi/mipush/sdk/PushMessageHelper;->generateCommandMessage(Ljava/lang/String;Ljava/util/List;JLjava/lang/String;Ljava/lang/String;)Lcom/xiaomi/mipush/sdk/MiPushCommandMessage;

    move-result-object v0

    return-object v0

    :pswitch_4
    check-cast v4, Lcom/xiaomi/xmpush/thrift/XmPushActionUnRegistrationResult;

    iget-wide v2, v4, Lcom/xiaomi/xmpush/thrift/XmPushActionUnRegistrationResult;->errorCode:J

    cmp-long v0, v2, v11

    if-nez v0, :cond_2d

    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/AppInfoHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->clear()V

    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/MiPushClient;->clearExtras(Landroid/content/Context;)V

    :cond_2d
    invoke-static {}, Lcom/xiaomi/mipush/sdk/PushMessageHandler;->removeAllPushCallbackClass()V

    goto/16 :goto_f

    :pswitch_5
    move-object v0, v4

    check-cast v0, Lcom/xiaomi/xmpush/thrift/XmPushActionRegistrationResult;

    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/AppInfoHolder;

    move-result-object v2

    iget-object v2, v2, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->appRegRequestId:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_31

    invoke-virtual {v0}, Lcom/xiaomi/xmpush/thrift/XmPushActionRegistrationResult;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2e

    goto/16 :goto_9

    :cond_2e
    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/AppInfoHolder;

    move-result-object v2

    iput-object v10, v2, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->appRegRequestId:Ljava/lang/String;

    iget-wide v2, v0, Lcom/xiaomi/xmpush/thrift/XmPushActionRegistrationResult;->errorCode:J

    cmp-long v4, v2, v11

    if-nez v4, :cond_2f

    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/AppInfoHolder;

    move-result-object v2

    iget-object v3, v0, Lcom/xiaomi/xmpush/thrift/XmPushActionRegistrationResult;->regId:Ljava/lang/String;

    iget-object v4, v0, Lcom/xiaomi/xmpush/thrift/XmPushActionRegistrationResult;->regSecret:Ljava/lang/String;

    iget-object v5, v0, Lcom/xiaomi/xmpush/thrift/XmPushActionRegistrationResult;->region:Ljava/lang/String;

    invoke-virtual {v2, v3, v4, v5}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->putRegIDAndSecret(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/clientReport/PushClientReportManager;

    move-result-object v2

    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-static/range {p5 .. p5}, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->getInterfaceIdByType(I)Ljava/lang/String;

    move-result-object v4

    const/16 v6, 0x1776

    const-string v7, "receive register result success"

    move-object/from16 v5, p4

    invoke-virtual/range {v2 .. v7}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    goto :goto_8

    :cond_2f
    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/clientReport/PushClientReportManager;

    move-result-object v2

    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-static/range {p5 .. p5}, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->getInterfaceIdByType(I)Ljava/lang/String;

    move-result-object v4

    const/16 v6, 0x1776

    const-string v7, "receive register result fail"

    move-object/from16 v5, p4

    invoke-virtual/range {v2 .. v7}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    :goto_8
    iget-object v2, v0, Lcom/xiaomi/xmpush/thrift/XmPushActionRegistrationResult;->regId:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_30

    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    iget-object v2, v0, Lcom/xiaomi/xmpush/thrift/XmPushActionRegistrationResult;->regId:Ljava/lang/String;

    invoke-interface {v10, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_30
    move-object v4, v10

    sget-object v2, Lcom/xiaomi/push/service/xmpush/Command;->COMMAND_REGISTER:Lcom/xiaomi/push/service/xmpush/Command;

    iget-object v3, v2, Lcom/xiaomi/push/service/xmpush/Command;->value:Ljava/lang/String;

    iget-wide v5, v0, Lcom/xiaomi/xmpush/thrift/XmPushActionRegistrationResult;->errorCode:J

    iget-object v7, v0, Lcom/xiaomi/xmpush/thrift/XmPushActionRegistrationResult;->reason:Ljava/lang/String;

    const/4 v8, 0x0

    invoke-static/range {v3 .. v8}, Lcom/xiaomi/mipush/sdk/PushMessageHelper;->generateCommandMessage(Ljava/lang/String;Ljava/util/List;JLjava/lang/String;Ljava/lang/String;)Lcom/xiaomi/mipush/sdk/MiPushCommandMessage;

    move-result-object v0

    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/PushServiceClient;

    move-result-object v2

    invoke-virtual {v2}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->processPendRequest()V

    return-object v0

    :cond_31
    :goto_9
    const-string v0, "bad Registration result:"

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/clientReport/PushClientReportManager;

    move-result-object v0

    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-static/range {p5 .. p5}, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->getInterfaceIdByType(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "bad Registration result:"

    invoke-virtual {v0, v2, v3, v8, v4}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->reportEvent4ERROR(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v10

    :pswitch_6
    iget-object v5, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v5}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/AppInfoHolder;

    move-result-object v5

    invoke-virtual {v5}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->isPaused()Z

    move-result v5

    if-eqz v5, :cond_32

    if-nez v0, :cond_32

    const-string v0, "receive a message in pause state. drop it"

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/clientReport/PushClientReportManager;

    move-result-object v0

    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-static/range {p5 .. p5}, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->getInterfaceIdByType(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "receive a message in pause state. drop it"

    invoke-virtual {v0, v2, v3, v8, v4}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->reportEvent4NeedDrop(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v10

    :cond_32
    check-cast v4, Lcom/xiaomi/xmpush/thrift/XmPushActionSendMessage;

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionSendMessage;->getMessage()Lcom/xiaomi/xmpush/thrift/PushMessage;

    move-result-object v5

    if-nez v5, :cond_33

    const-string v0, "receive an empty message without push content, drop it"

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/clientReport/PushClientReportManager;

    move-result-object v0

    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-static/range {p5 .. p5}, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->getInterfaceIdByType(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "receive an empty message without push content, drop it"

    invoke-virtual {v0, v2, v3, v8, v4}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->reportEvent4ERROR(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v10

    :cond_33
    if-eqz v0, :cond_35

    invoke-static/range {p1 .. p1}, Lcom/xiaomi/push/service/MIPushNotificationHelper;->isBusinessMessage(Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)Z

    move-result v6

    if-eqz v6, :cond_34

    iget-object v6, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v5}, Lcom/xiaomi/xmpush/thrift/PushMessage;->getId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getMetaInfo()Lcom/xiaomi/xmpush/thrift/PushMetaInfo;

    move-result-object v13

    iget-object v14, v2, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->packageName:Ljava/lang/String;

    invoke-virtual {v5}, Lcom/xiaomi/xmpush/thrift/PushMessage;->getAppId()Ljava/lang/String;

    move-result-object v15

    invoke-static {v6, v7, v13, v14, v15}, Lcom/xiaomi/mipush/sdk/MiPushClient;->reportIgnoreRegMessageClicked(Landroid/content/Context;Ljava/lang/String;Lcom/xiaomi/xmpush/thrift/PushMetaInfo;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_a

    :cond_34
    iget-object v6, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v5}, Lcom/xiaomi/xmpush/thrift/PushMessage;->getId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getMetaInfo()Lcom/xiaomi/xmpush/thrift/PushMetaInfo;

    move-result-object v13

    invoke-virtual {v5}, Lcom/xiaomi/xmpush/thrift/PushMessage;->getAppId()Ljava/lang/String;

    move-result-object v14

    invoke-static {v6, v7, v13, v14}, Lcom/xiaomi/mipush/sdk/MiPushClient;->reportMessageClicked(Landroid/content/Context;Ljava/lang/String;Lcom/xiaomi/xmpush/thrift/PushMetaInfo;Ljava/lang/String;)V

    :cond_35
    :goto_a
    if-nez v0, :cond_37

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionSendMessage;->getAliasName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_36

    iget-object v6, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionSendMessage;->getAliasName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/xiaomi/mipush/sdk/MiPushClient;->aliasSetTime(Landroid/content/Context;Ljava/lang/String;)J

    move-result-wide v6

    cmp-long v13, v6, v11

    if-gez v13, :cond_36

    iget-object v6, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionSendMessage;->getAliasName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/xiaomi/mipush/sdk/MiPushClient;->addAlias(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_b

    :cond_36
    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionSendMessage;->getTopic()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_37

    iget-object v6, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionSendMessage;->getTopic()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/xiaomi/mipush/sdk/MiPushClient;->topicSubscribedTime(Landroid/content/Context;Ljava/lang/String;)J

    move-result-wide v6

    cmp-long v13, v6, v11

    if-gez v13, :cond_37

    iget-object v6, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionSendMessage;->getTopic()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/xiaomi/mipush/sdk/MiPushClient;->addTopic(Landroid/content/Context;Ljava/lang/String;)V

    :cond_37
    :goto_b
    iget-object v6, v2, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->metaInfo:Lcom/xiaomi/xmpush/thrift/PushMetaInfo;

    if-eqz v6, :cond_38

    iget-object v6, v2, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->metaInfo:Lcom/xiaomi/xmpush/thrift/PushMetaInfo;

    invoke-virtual {v6}, Lcom/xiaomi/xmpush/thrift/PushMetaInfo;->getExtra()Ljava/util/Map;

    move-result-object v6

    if-eqz v6, :cond_38

    iget-object v6, v2, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->metaInfo:Lcom/xiaomi/xmpush/thrift/PushMetaInfo;

    iget-object v6, v6, Lcom/xiaomi/xmpush/thrift/PushMetaInfo;->extra:Ljava/util/Map;

    const-string v7, "jobkey"

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    goto :goto_c

    :cond_38
    move-object v6, v10

    :goto_c
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_39

    invoke-virtual {v5}, Lcom/xiaomi/xmpush/thrift/PushMessage;->getId()Ljava/lang/String;

    move-result-object v6

    :cond_39
    if-nez v0, :cond_3a

    iget-object v7, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v7, v6}, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->isDuplicateMessage(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3a

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "drop a duplicate message, key="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/clientReport/PushClientReportManager;

    move-result-object v3

    iget-object v5, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-static/range {p5 .. p5}, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->getInterfaceIdByType(I)Ljava/lang/String;

    move-result-object v7

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "drop a duplicate message, key="

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v7, v8, v6}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->reportEvent4DUPMD(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_e

    :cond_3a
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getMetaInfo()Lcom/xiaomi/xmpush/thrift/PushMetaInfo;

    move-result-object v7

    invoke-static {v4, v7, v0}, Lcom/xiaomi/mipush/sdk/PushMessageHelper;->generateMessage(Lcom/xiaomi/xmpush/thrift/XmPushActionSendMessage;Lcom/xiaomi/xmpush/thrift/PushMetaInfo;Z)Lcom/xiaomi/mipush/sdk/MiPushMessage;

    move-result-object v7

    invoke-virtual {v7}, Lcom/xiaomi/mipush/sdk/MiPushMessage;->getPassThrough()I

    move-result v11

    if-nez v11, :cond_3b

    if-nez v0, :cond_3b

    invoke-virtual {v7}, Lcom/xiaomi/mipush/sdk/MiPushMessage;->getExtra()Ljava/util/Map;

    move-result-object v11

    invoke-static {v11}, Lcom/xiaomi/push/service/MIPushNotificationHelper;->isNotifyForeground(Ljava/util/Map;)Z

    move-result v11

    if-eqz v11, :cond_3b

    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v0, v2, v3}, Lcom/xiaomi/push/service/MIPushNotificationHelper;->notifyPushMessage(Landroid/content/Context;Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;[B)Lcom/xiaomi/push/service/MIPushNotificationHelper$NotifyPushMessageInfo;

    return-object v10

    :cond_3b
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "receive a message, msgid="

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Lcom/xiaomi/xmpush/thrift/PushMessage;->getId()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, ", jobkey="

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    if-eqz v0, :cond_41

    invoke-virtual {v7}, Lcom/xiaomi/mipush/sdk/MiPushMessage;->getExtra()Ljava/util/Map;

    move-result-object v3

    if-eqz v3, :cond_41

    invoke-virtual {v7}, Lcom/xiaomi/mipush/sdk/MiPushMessage;->getExtra()Ljava/util/Map;

    move-result-object v3

    const-string v6, "notify_effect"

    invoke-interface {v3, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_41

    invoke-virtual {v7}, Lcom/xiaomi/mipush/sdk/MiPushMessage;->getExtra()Ljava/util/Map;

    move-result-object v0

    const-string v3, "notify_effect"

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v11, v3

    check-cast v11, Ljava/lang/String;

    invoke-static/range {p1 .. p1}, Lcom/xiaomi/push/service/MIPushNotificationHelper;->isBusinessMessage(Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)Z

    move-result v3

    if-eqz v3, :cond_3e

    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    iget-object v2, v2, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->packageName:Ljava/lang/String;

    invoke-static {v3, v2, v0}, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->getNotificationMessageIntent(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)Landroid/content/Intent;

    move-result-object v0

    const-string v2, "eventMessageType"

    invoke-virtual {v0, v2, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v2, "messageId"

    invoke-virtual {v0, v2, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    if-nez v0, :cond_3c

    const-string v0, "Getting Intent fail from ignore reg message. "

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/clientReport/PushClientReportManager;

    move-result-object v0

    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-static/range {p5 .. p5}, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->getInterfaceIdByType(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "Getting Intent fail from ignore reg message."

    invoke-virtual {v0, v2, v3, v8, v4}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->reportEvent4ERROR(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v10

    :cond_3c
    invoke-virtual {v5}, Lcom/xiaomi/xmpush/thrift/PushMessage;->getPayload()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3d

    const-string v3, "payload"

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_3d
    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v2, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/clientReport/PushClientReportManager;

    move-result-object v2

    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-static/range {p5 .. p5}, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->getInterfaceIdByType(I)Ljava/lang/String;

    move-result-object v4

    const/16 v6, 0xbbe

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "business message is clicked typeId "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v5, p4

    invoke-virtual/range {v2 .. v7}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    goto/16 :goto_d

    :cond_3e
    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->getNotificationMessageIntent(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_40

    sget-object v2, Lcom/xiaomi/push/service/PushConstants;->NOTIFICATION_CLICK_WEB_PAGE:Ljava/lang/String;

    invoke-virtual {v11, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3f

    const-string v2, "key_message"

    invoke-virtual {v0, v2, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    const-string v2, "eventMessageType"

    invoke-virtual {v0, v2, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v2, "messageId"

    invoke-virtual {v0, v2, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_3f
    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v2, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/clientReport/PushClientReportManager;

    move-result-object v2

    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-static/range {p5 .. p5}, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->getInterfaceIdByType(I)Ljava/lang/String;

    move-result-object v4

    const/16 v6, 0x3ee

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "notification message is clicked typeId "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v5, p4

    invoke-virtual/range {v2 .. v7}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    sget-object v0, Lcom/xiaomi/push/service/PushConstants;->NOTIFICATION_CLICK_WEB_PAGE:Ljava/lang/String;

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_40

    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/clientReport/PushClientReportManager;

    move-result-object v0

    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-static/range {p5 .. p5}, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->getInterfaceIdByType(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "try open web page typeId "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v2, v3, v8, v4}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->reportEvent4NeedDrop(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_40
    :goto_d
    return-object v10

    :cond_41
    move-object v10, v7

    :goto_e
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getMetaInfo()Lcom/xiaomi/xmpush/thrift/PushMetaInfo;

    move-result-object v3

    if-nez v3, :cond_42

    if-nez v0, :cond_42

    invoke-direct {v1, v4, v2}, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->ackMessage(Lcom/xiaomi/xmpush/thrift/XmPushActionSendMessage;Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)V

    :cond_42
    return-object v10

    :cond_43
    :goto_f
    return-object v10

    :catch_5
    move-exception v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    const-string v2, "receive a message which action string is not valid. is the reg expired?"

    invoke-static {v2}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/clientReport/PushClientReportManager;

    move-result-object v2

    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-static/range {p5 .. p5}, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->getInterfaceIdByType(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4, v8, v0}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->reportEvent4ERROR(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v10

    :catch_6
    move-exception v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    invoke-direct/range {p0 .. p1}, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->reportDecryptFail(Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)V

    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/clientReport/PushClientReportManager;

    move-result-object v2

    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-static/range {p5 .. p5}, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->getInterfaceIdByType(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4, v8, v0}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->reportEvent4ERROR(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v10

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private processMessage(Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;[B)Lcom/xiaomi/mipush/sdk/PushMessageHandler$PushMessageInterface;
    .locals 4

    const/4 p2, 0x0

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/xiaomi/mipush/sdk/PushContainerHelper;->getResponseMessageBodyFromContainer(Landroid/content/Context;Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)Lorg/apache/thrift/TBase;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "message arrived: receiving an un-recognized message. "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p1, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->action:Lcom/xiaomi/xmpush/thrift/ActionType;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/xiaomi/mipush/sdk/DecryptException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/apache/thrift/TException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p2

    :cond_0
    invoke-virtual {p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getAction()Lcom/xiaomi/xmpush/thrift/ActionType;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "message arrived: processing an arrived message, action="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    sget-object v2, Lcom/xiaomi/mipush/sdk/PushMessageProcessor$2;->$SwitchMap$com$xiaomi$xmpush$thrift$ActionType:[I

    invoke-virtual {v1}, Lcom/xiaomi/xmpush/thrift/ActionType;->ordinal()I

    move-result v1

    aget v1, v2, v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_1

    return-object p2

    :cond_1
    check-cast v0, Lcom/xiaomi/xmpush/thrift/XmPushActionSendMessage;

    invoke-virtual {v0}, Lcom/xiaomi/xmpush/thrift/XmPushActionSendMessage;->getMessage()Lcom/xiaomi/xmpush/thrift/PushMessage;

    move-result-object v1

    if-nez v1, :cond_2

    const-string p1, "message arrived: receive an empty message without push content, drop it"

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    return-object p2

    :cond_2
    iget-object v3, p1, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->metaInfo:Lcom/xiaomi/xmpush/thrift/PushMetaInfo;

    if-eqz v3, :cond_3

    iget-object v3, p1, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->metaInfo:Lcom/xiaomi/xmpush/thrift/PushMetaInfo;

    invoke-virtual {v3}, Lcom/xiaomi/xmpush/thrift/PushMetaInfo;->getExtra()Ljava/util/Map;

    move-result-object v3

    if-eqz v3, :cond_3

    iget-object p2, p1, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->metaInfo:Lcom/xiaomi/xmpush/thrift/PushMetaInfo;

    iget-object p2, p2, Lcom/xiaomi/xmpush/thrift/PushMetaInfo;->extra:Ljava/util/Map;

    const-string v3, "jobkey"

    invoke-interface {p2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    :cond_3
    invoke-virtual {p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getMetaInfo()Lcom/xiaomi/xmpush/thrift/PushMetaInfo;

    move-result-object p1

    const/4 v3, 0x0

    invoke-static {v0, p1, v3}, Lcom/xiaomi/mipush/sdk/PushMessageHelper;->generateMessage(Lcom/xiaomi/xmpush/thrift/XmPushActionSendMessage;Lcom/xiaomi/xmpush/thrift/PushMetaInfo;Z)Lcom/xiaomi/mipush/sdk/MiPushMessage;

    move-result-object p1

    invoke-virtual {p1, v2}, Lcom/xiaomi/mipush/sdk/MiPushMessage;->setArrivedMessage(Z)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "message arrived: receive a message, msgid="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/xiaomi/xmpush/thrift/PushMessage;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", jobkey="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    return-object p1

    :catch_0
    move-exception p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    const-string p1, "message arrived: receive a message which action string is not valid. is the reg expired?"

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    return-object p2

    :catch_1
    move-exception p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    const-string p1, "message arrived: receive a message but decrypt failed. report when click."

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    return-object p2
.end method

.method private processSendTokenAckNotification(Lcom/xiaomi/xmpush/thrift/XmPushActionAckNotification;)V
    .locals 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ASSEMBLE_PUSH : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionAckNotification;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->v(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionAckNotification;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionAckNotification;->getExtra()Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_3

    const-string v2, "RegInfo"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "brand:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Lcom/xiaomi/mipush/sdk/PhoneBrand;->FCM:Lcom/xiaomi/mipush/sdk/PhoneBrand;

    invoke-virtual {v3}, Lcom/xiaomi/mipush/sdk/PhoneBrand;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "ASSEMBLE_PUSH : receive fcm token sync ack"

    invoke-static {v2}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    sget-object v3, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_FCM:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-static {v2, v3, v1}, Lcom/xiaomi/mipush/sdk/AssemblePushHelper;->saveAssemblePushTokenAfterAck(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/AssemblePush;Ljava/lang/String;)V

    iget-wide v1, p1, Lcom/xiaomi/xmpush/thrift/XmPushActionAckNotification;->errorCode:J

    sget-object p1, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_FCM:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-direct {p0, v0, v1, v2, p1}, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->processSingleTokenACK(Ljava/lang/String;JLcom/xiaomi/mipush/sdk/AssemblePush;)V

    goto/16 :goto_0

    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "brand:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Lcom/xiaomi/mipush/sdk/PhoneBrand;->HUAWEI:Lcom/xiaomi/mipush/sdk/PhoneBrand;

    invoke-virtual {v3}, Lcom/xiaomi/mipush/sdk/PhoneBrand;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v2, "ASSEMBLE_PUSH : receive hw token sync ack"

    invoke-static {v2}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    sget-object v3, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_HUAWEI:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-static {v2, v3, v1}, Lcom/xiaomi/mipush/sdk/AssemblePushHelper;->saveAssemblePushTokenAfterAck(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/AssemblePush;Ljava/lang/String;)V

    iget-wide v1, p1, Lcom/xiaomi/xmpush/thrift/XmPushActionAckNotification;->errorCode:J

    sget-object p1, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_HUAWEI:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-direct {p0, v0, v1, v2, p1}, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->processSingleTokenACK(Ljava/lang/String;JLcom/xiaomi/mipush/sdk/AssemblePush;)V

    goto :goto_0

    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "brand:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Lcom/xiaomi/mipush/sdk/PhoneBrand;->OPPO:Lcom/xiaomi/mipush/sdk/PhoneBrand;

    invoke-virtual {v3}, Lcom/xiaomi/mipush/sdk/PhoneBrand;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string v2, "ASSEMBLE_PUSH : receive COS token sync ack"

    invoke-static {v2}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    sget-object v3, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_COS:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-static {v2, v3, v1}, Lcom/xiaomi/mipush/sdk/AssemblePushHelper;->saveAssemblePushTokenAfterAck(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/AssemblePush;Ljava/lang/String;)V

    iget-wide v1, p1, Lcom/xiaomi/xmpush/thrift/XmPushActionAckNotification;->errorCode:J

    sget-object p1, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_COS:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-direct {p0, v0, v1, v2, p1}, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->processSingleTokenACK(Ljava/lang/String;JLcom/xiaomi/mipush/sdk/AssemblePush;)V

    goto :goto_0

    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "brand:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Lcom/xiaomi/mipush/sdk/PhoneBrand;->VIVO:Lcom/xiaomi/mipush/sdk/PhoneBrand;

    invoke-virtual {v3}, Lcom/xiaomi/mipush/sdk/PhoneBrand;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    const-string v2, "ASSEMBLE_PUSH : receive FTOS token sync ack"

    invoke-static {v2}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    sget-object v3, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_FTOS:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-static {v2, v3, v1}, Lcom/xiaomi/mipush/sdk/AssemblePushHelper;->saveAssemblePushTokenAfterAck(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/AssemblePush;Ljava/lang/String;)V

    iget-wide v1, p1, Lcom/xiaomi/xmpush/thrift/XmPushActionAckNotification;->errorCode:J

    sget-object p1, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_FTOS:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-direct {p0, v0, v1, v2, p1}, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->processSingleTokenACK(Ljava/lang/String;JLcom/xiaomi/mipush/sdk/AssemblePush;)V

    :cond_3
    :goto_0
    return-void
.end method

.method private processSingleTokenACK(Ljava/lang/String;JLcom/xiaomi/mipush/sdk/AssemblePush;)V
    .locals 4

    invoke-static {p4}, Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper;->getRetryType(Lcom/xiaomi/mipush/sdk/AssemblePush;)Lcom/xiaomi/mipush/sdk/RetryType;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const-wide/16 v1, 0x0

    cmp-long v3, p2, v1

    if-nez v3, :cond_2

    const-class p2, Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    monitor-enter p2

    :try_start_0
    iget-object p3, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {p3}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object p3

    invoke-virtual {p3, p1}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->isMessageOperating(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_1

    iget-object p3, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {p3}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object p3

    invoke-virtual {p3, p1}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->removeOperateMessage(Ljava/lang/String;)V

    const-string p1, "syncing"

    iget-object p3, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {p3}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object p3

    invoke-virtual {p3, v0}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getSyncStatus(Lcom/xiaomi/mipush/sdk/RetryType;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object p1

    const-string p3, "synced"

    invoke-virtual {p1, v0, p3}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->putSyncStatus(Lcom/xiaomi/mipush/sdk/RetryType;Ljava/lang/String;)V

    :cond_1
    monitor-exit p2

    goto :goto_1

    :catchall_0
    move-exception p1

    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_2
    const-string p2, "syncing"

    iget-object p3, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {p3}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object p3

    invoke-virtual {p3, v0}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getSyncStatus(Lcom/xiaomi/mipush/sdk/RetryType;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_5

    const-class p2, Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    monitor-enter p2

    :try_start_1
    iget-object p3, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {p3}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object p3

    invoke-virtual {p3, p1}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->isMessageOperating(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_4

    iget-object p3, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {p3}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object p3

    invoke-virtual {p3, p1}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getRetryCount(Ljava/lang/String;)I

    move-result p3

    const/16 v1, 0xa

    if-ge p3, v1, :cond_3

    iget-object p3, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {p3}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object p3

    invoke-virtual {p3, p1}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->increaseRetryCount(Ljava/lang/String;)V

    iget-object p3, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {p3}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/PushServiceClient;

    move-result-object p3

    invoke-virtual {p3, p1, v0, p4}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->sendAssemblePushTokenCommon(Ljava/lang/String;Lcom/xiaomi/mipush/sdk/RetryType;Lcom/xiaomi/mipush/sdk/AssemblePush;)V

    goto :goto_0

    :cond_3
    iget-object p3, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {p3}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object p3

    invoke-virtual {p3, p1}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->removeOperateMessage(Ljava/lang/String;)V

    :cond_4
    :goto_0
    monitor-exit p2

    goto :goto_1

    :catchall_1
    move-exception p1

    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw p1

    :cond_5
    iget-object p2, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {p2}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->removeOperateMessage(Ljava/lang/String;)V

    :goto_1
    return-void
.end method

.method private processStatDataACK(Lcom/xiaomi/xmpush/thrift/XmPushActionAckNotification;)V
    .locals 7

    invoke-virtual {p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionAckNotification;->getId()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "receive ack "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->i(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionAckNotification;->getExtra()Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_1

    const-string v2, "real_source"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "receive ack : messageId = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "  realSource = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->i(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;

    move-result-object v2

    iget-wide v3, p1, Lcom/xiaomi/xmpush/thrift/XmPushActionAckNotification;->errorCode:J

    const-wide/16 v5, 0x0

    cmp-long p1, v3, v5

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {v2, v0, v1, p1}, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->onResult(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V

    :cond_1
    return-void
.end method

.method private reportDecryptFail(Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)V
    .locals 4

    const-string v0, "receive a message but decrypt failed. report now."

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    new-instance v0, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    invoke-virtual {p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getMetaInfo()Lcom/xiaomi/xmpush/thrift/PushMetaInfo;

    move-result-object v1

    iget-object v1, v1, Lcom/xiaomi/xmpush/thrift/PushMetaInfo;->id:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;-><init>(Ljava/lang/String;Z)V

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->DecryptMessageFail:Lcom/xiaomi/xmpush/thrift/NotificationType;

    iget-object v1, v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->setType(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    invoke-virtual {p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getAppid()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->setAppId(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    iget-object p1, p1, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->packageName:Ljava/lang/String;

    invoke-virtual {v0, p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->setPackageName(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, v0, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->extra:Ljava/util/Map;

    iget-object p1, v0, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->extra:Ljava/util/Map;

    const-string v1, "regid"

    iget-object v3, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/MiPushClient;->getRegId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/PushServiceClient;

    move-result-object p1

    sget-object v1, Lcom/xiaomi/xmpush/thrift/ActionType;->Notification:Lcom/xiaomi/xmpush/thrift/ActionType;

    const/4 v3, 0x0

    invoke-virtual {p1, v0, v1, v2, v3}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->sendMessage(Lorg/apache/thrift/TBase;Lcom/xiaomi/xmpush/thrift/ActionType;ZLcom/xiaomi/xmpush/thrift/PushMetaInfo;)V

    return-void
.end method

.method private sendUploadLogIntent(Landroid/content/Context;Landroid/content/pm/PackageInfo;)V
    .locals 5

    iget-object p2, p2, Landroid/content/pm/PackageInfo;->services:[Landroid/content/pm/ServiceInfo;

    if-eqz p2, :cond_1

    array-length v0, p2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p2, v1

    iget-boolean v3, v2, Landroid/content/pm/ServiceInfo;->exported:Z

    if-eqz v3, :cond_0

    iget-boolean v3, v2, Landroid/content/pm/ServiceInfo;->enabled:Z

    if-eqz v3, :cond_0

    const-string v3, "com.xiaomi.mipush.sdk.PushMessageHandler"

    iget-object v4, v2, Landroid/content/pm/ServiceInfo;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, v2, Landroid/content/pm/ServiceInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :try_start_0
    new-instance p2, Landroid/content/Intent;

    invoke-direct {p2}, Landroid/content/Intent;-><init>()V

    iget-object v0, v2, Landroid/content/pm/ServiceInfo;->packageName:Ljava/lang/String;

    iget-object v1, v2, Landroid/content/pm/ServiceInfo;->name:Ljava/lang/String;

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "com.xiaomi.mipush.sdk.SYNC_LOG"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {p1, p2}, Lcom/xiaomi/mipush/sdk/PushMessageHandler;->addJob(Landroid/content/Context;Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :catch_0
    :cond_1
    :goto_1
    return-void
.end method

.method private tryToReinitialize()V
    .locals 8

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    const-string v1, "mipush_extra"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    const-string v3, "last_reinitialize"

    const-wide/16 v4, 0x0

    invoke-interface {v0, v3, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    sub-long v3, v1, v3

    invoke-static {v3, v4}, Ljava/lang/Math;->abs(J)J

    move-result-wide v3

    const-wide/32 v5, 0x1b7740

    cmp-long v7, v3, v5

    if-lez v7, :cond_0

    iget-object v3, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    sget-object v4, Lcom/xiaomi/xmpush/thrift/RegistrationReason;->PackageUnregistered:Lcom/xiaomi/xmpush/thrift/RegistrationReason;

    invoke-static {v3, v4}, Lcom/xiaomi/mipush/sdk/MiPushClient;->reInitialize(Landroid/content/Context;Lcom/xiaomi/xmpush/thrift/RegistrationReason;)V

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v3, "last_reinitialize"

    invoke-interface {v0, v3, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    :cond_0
    return-void
.end method

.method private uploadAppLog(Landroid/content/Context;[Ljava/lang/String;)V
    .locals 2

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;

    move-result-object v0

    new-instance v1, Lcom/xiaomi/mipush/sdk/PushMessageProcessor$1;

    invoke-direct {v1, p0, p2, p1}, Lcom/xiaomi/mipush/sdk/PushMessageProcessor$1;-><init>(Lcom/xiaomi/mipush/sdk/PushMessageProcessor;[Ljava/lang/String;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->addOneShootJob(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public getTimeForTimeZone(Ljava/util/TimeZone;Ljava/util/TimeZone;Ljava/util/List;)Ljava/util/List;
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/TimeZone;",
            "Ljava/util/TimeZone;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    move-object/from16 v0, p3

    invoke-virtual/range {p1 .. p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_0
    const-wide/16 v1, 0x5a0

    invoke-virtual/range {p1 .. p1}, Ljava/util/TimeZone;->getRawOffset()I

    move-result v3

    invoke-virtual/range {p2 .. p2}, Ljava/util/TimeZone;->getRawOffset()I

    move-result v4

    sub-int/2addr v3, v4

    div-int/lit16 v3, v3, 0x3e8

    div-int/lit8 v3, v3, 0x3c

    int-to-long v3, v3

    const/4 v5, 0x0

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    aget-object v6, v6, v5

    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    const-string v9, ":"

    invoke-virtual {v8, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x1

    aget-object v8, v8, v9

    invoke-static {v8}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v10

    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    const-string v12, ":"

    invoke-virtual {v8, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    aget-object v8, v8, v5

    invoke-static {v8}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v12

    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v8, ":"

    invoke-virtual {v0, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v9

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v14

    const-wide/16 v16, 0x3c

    mul-long v6, v6, v16

    add-long/2addr v6, v10

    sub-long/2addr v6, v3

    add-long/2addr v6, v1

    rem-long/2addr v6, v1

    mul-long v12, v12, v16

    add-long/2addr v12, v14

    sub-long/2addr v12, v3

    add-long/2addr v12, v1

    rem-long/2addr v12, v1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "%1$02d:%2$02d"

    const/4 v2, 0x2

    new-array v3, v2, [Ljava/lang/Object;

    div-long v10, v6, v16

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v3, v5

    rem-long v6, v6, v16

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v3, v9

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v1, "%1$02d:%2$02d"

    new-array v2, v2, [Ljava/lang/Object;

    div-long v3, v12, v16

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v2, v5

    rem-long v12, v12, v16

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v2, v9

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public processIntent(Landroid/content/Intent;)Lcom/xiaomi/mipush/sdk/PushMessageHandler$PushMessageInterface;
    .locals 13

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "receive an intent from server, action="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    const-string v1, "mrt"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    :cond_0
    const-string v2, "messageId"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v2, "eventMessageType"

    const/4 v3, -0x1

    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v8

    const-string v2, "com.xiaomi.mipush.RECEIVE_MESSAGE"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v9, 0x0

    const/4 v3, 0x0

    if-eqz v2, :cond_e

    const-string v0, "mipush_payload"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object v6

    const-string v0, "mipush_notified"

    invoke-virtual {p1, v0, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v5

    if-nez v6, :cond_1

    const-string v0, "receiving an empty message, drop"

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/clientReport/PushClientReportManager;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "receiving an empty message, drop"

    invoke-virtual {v0, v1, p1, v2}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->reportEvent4ERROR(Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;)V

    return-object v9

    :cond_1
    new-instance v4, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    invoke-direct {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;-><init>()V

    :try_start_0
    invoke-static {v4, v6}, Lcom/xiaomi/xmpush/thrift/XmPushThriftSerializeUtils;->convertByteArrayToThriftObject(Lorg/apache/thrift/TBase;[B)V

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/AppInfoHolder;

    move-result-object v0

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getMetaInfo()Lcom/xiaomi/xmpush/thrift/PushMetaInfo;

    move-result-object v2

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getAction()Lcom/xiaomi/xmpush/thrift/ActionType;

    move-result-object v10

    sget-object v11, Lcom/xiaomi/xmpush/thrift/ActionType;->SendMessage:Lcom/xiaomi/xmpush/thrift/ActionType;

    if-ne v10, v11, :cond_3

    if-eqz v2, :cond_3

    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->isPaused()Z

    move-result v10

    if-nez v10, :cond_3

    if-nez v5, :cond_3

    const-string v10, "mrt"

    invoke-virtual {v2, v10, v1}, Lcom/xiaomi/xmpush/thrift/PushMetaInfo;->putToExtra(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "mat"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v2, v1, v10}, Lcom/xiaomi/xmpush/thrift/PushMetaInfo;->putToExtra(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v4}, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->isHybridMsg(Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-direct {p0, v4}, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->ackMessage(Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)V

    goto :goto_0

    :cond_2
    const-string v1, "this is a mina\'s message, ack later"

    invoke-static {v1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->i(Ljava/lang/String;)V

    const-string v1, "__hybrid_message_ts"

    invoke-virtual {v2}, Lcom/xiaomi/xmpush/thrift/PushMetaInfo;->getMessageTs()J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v2, v1, v10}, Lcom/xiaomi/xmpush/thrift/PushMetaInfo;->putToExtra(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "__hybrid_device_status"

    iget-object v10, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v10, v4}, Lcom/xiaomi/xmpush/thrift/XmPushThriftSerializeUtils;->getDeviceStatus(Landroid/content/Context;Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)S

    move-result v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v2, v1, v10}, Lcom/xiaomi/xmpush/thrift/PushMetaInfo;->putToExtra(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    :goto_0
    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getAction()Lcom/xiaomi/xmpush/thrift/ActionType;

    move-result-object v1

    sget-object v10, Lcom/xiaomi/xmpush/thrift/ActionType;->SendMessage:Lcom/xiaomi/xmpush/thrift/ActionType;

    if-ne v1, v10, :cond_9

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->isEncryptAction()Z

    move-result v1

    if-nez v1, :cond_9

    invoke-static {v4}, Lcom/xiaomi/push/service/MIPushNotificationHelper;->isBusinessMessage(Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)Z

    move-result v1

    const/4 v10, 0x1

    const/4 v11, 0x2

    if-nez v1, :cond_6

    const-string v0, "drop an un-encrypted messages. %1$s, %2$s"

    new-array v1, v11, [Ljava/lang/Object;

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getPackageName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v1, v3

    if-eqz v2, :cond_4

    invoke-virtual {v2}, Lcom/xiaomi/xmpush/thrift/PushMetaInfo;->getId()Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    :cond_4
    const-string v5, ""

    :goto_1
    aput-object v5, v1, v10

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/clientReport/PushClientReportManager;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v5, "drop an un-encrypted messages. %1$s, %2$s"

    new-array v6, v11, [Ljava/lang/Object;

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getPackageName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v6, v3

    if-eqz v2, :cond_5

    invoke-virtual {v2}, Lcom/xiaomi/xmpush/thrift/PushMetaInfo;->getId()Ljava/lang/String;

    move-result-object v2

    goto :goto_2

    :cond_5
    const-string v2, ""

    :goto_2
    aput-object v2, v6, v10

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, p1, v2}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->reportEvent4ERROR(Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;)V

    return-object v9

    :cond_6
    if-eqz v5, :cond_7

    invoke-virtual {v2}, Lcom/xiaomi/xmpush/thrift/PushMetaInfo;->getExtra()Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_7

    invoke-virtual {v2}, Lcom/xiaomi/xmpush/thrift/PushMetaInfo;->getExtra()Ljava/util/Map;

    move-result-object v1

    const-string v12, "notify_effect"

    invoke-interface {v1, v12}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    goto :goto_4

    :cond_7
    const-string v0, "drop an un-encrypted messages. %1$s, %2$s"

    new-array v1, v11, [Ljava/lang/Object;

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getPackageName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v1, v3

    invoke-virtual {v2}, Lcom/xiaomi/xmpush/thrift/PushMetaInfo;->getId()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v1, v10

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/clientReport/PushClientReportManager;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v5, "drop an un-encrypted messages. %1$s, %2$s"

    new-array v6, v11, [Ljava/lang/Object;

    invoke-virtual {v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getPackageName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v6, v3

    if-eqz v2, :cond_8

    invoke-virtual {v2}, Lcom/xiaomi/xmpush/thrift/PushMetaInfo;->getId()Ljava/lang/String;

    move-result-object v2

    goto :goto_3

    :cond_8
    const-string v2, ""

    :goto_3
    aput-object v2, v6, v10

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, p1, v2}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->reportEvent4ERROR(Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;)V

    return-object v9

    :cond_9
    :goto_4
    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->appRegistered()Z

    move-result v1

    if-nez v1, :cond_b

    iget-object v1, v4, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->action:Lcom/xiaomi/xmpush/thrift/ActionType;

    sget-object v2, Lcom/xiaomi/xmpush/thrift/ActionType;->Registration:Lcom/xiaomi/xmpush/thrift/ActionType;

    if-eq v1, v2, :cond_b

    invoke-static {v4}, Lcom/xiaomi/push/service/MIPushNotificationHelper;->isBusinessMessage(Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)Z

    move-result v0

    if-eqz v0, :cond_a

    move-object v3, p0

    invoke-direct/range {v3 .. v8}, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->processMessage(Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;Z[BLjava/lang/String;I)Lcom/xiaomi/mipush/sdk/PushMessageHandler$PushMessageInterface;

    move-result-object v0

    return-object v0

    :cond_a
    const-string v0, "receive message without registration. need re-register!"

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/clientReport/PushClientReportManager;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "receive message without registration. need re-register!"

    invoke-virtual {v0, v1, p1, v2}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->reportEvent4ERROR(Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->tryToReinitialize()V

    goto/16 :goto_5

    :cond_b
    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->appRegistered()Z

    move-result v1

    if-eqz v1, :cond_d

    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->invalidated()Z

    move-result v1

    if-eqz v1, :cond_d

    iget-object v1, v4, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->action:Lcom/xiaomi/xmpush/thrift/ActionType;

    sget-object v2, Lcom/xiaomi/xmpush/thrift/ActionType;->UnRegistration:Lcom/xiaomi/xmpush/thrift/ActionType;

    if-ne v1, v2, :cond_c

    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->clear()V

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/MiPushClient;->clearExtras(Landroid/content/Context;)V

    invoke-static {}, Lcom/xiaomi/mipush/sdk/PushMessageHandler;->removeAllPushCallbackClass()V

    goto/16 :goto_5

    :cond_c
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/MiPushClient;->unregisterPush(Landroid/content/Context;)V

    goto/16 :goto_5

    :cond_d
    move-object v3, p0

    invoke-direct/range {v3 .. v8}, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->processMessage(Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;Z[BLjava/lang/String;I)Lcom/xiaomi/mipush/sdk/PushMessageHandler$PushMessageInterface;

    move-result-object v0
    :try_end_0
    .catch Lorg/apache/thrift/TException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/clientReport/PushClientReportManager;

    move-result-object v1

    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, p1, v0}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->reportEvent4ERROR(Ljava/lang/String;Landroid/content/Intent;Ljava/lang/Throwable;)V

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    goto/16 :goto_5

    :catch_1
    move-exception v0

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/clientReport/PushClientReportManager;

    move-result-object v1

    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, p1, v0}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->reportEvent4ERROR(Ljava/lang/String;Landroid/content/Intent;Ljava/lang/Throwable;)V

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    goto/16 :goto_5

    :cond_e
    const-string v1, "com.xiaomi.mipush.ERROR"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10

    new-instance v0, Lcom/xiaomi/mipush/sdk/MiPushCommandMessage;

    invoke-direct {v0}, Lcom/xiaomi/mipush/sdk/MiPushCommandMessage;-><init>()V

    new-instance v1, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    invoke-direct {v1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;-><init>()V

    :try_start_1
    const-string v2, "mipush_payload"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object v2

    if-eqz v2, :cond_f

    invoke-static {v1, v2}, Lcom/xiaomi/xmpush/thrift/XmPushThriftSerializeUtils;->convertByteArrayToThriftObject(Lorg/apache/thrift/TBase;[B)V
    :try_end_1
    .catch Lorg/apache/thrift/TException; {:try_start_1 .. :try_end_1} :catch_2

    :catch_2
    :cond_f
    invoke-virtual {v1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getAction()Lcom/xiaomi/xmpush/thrift/ActionType;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/mipush/sdk/MiPushCommandMessage;->setCommand(Ljava/lang/String;)V

    const-string v1, "mipush_error_code"

    invoke-virtual {p1, v1, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/mipush/sdk/MiPushCommandMessage;->setResultCode(J)V

    const-string v1, "mipush_error_msg"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/mipush/sdk/MiPushCommandMessage;->setReason(Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "receive a error message. code = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "mipush_error_code"

    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", msg= "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "mipush_error_msg"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    return-object v0

    :cond_10
    const-string v1, "com.xiaomi.mipush.MESSAGE_ARRIVED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    const-string v0, "mipush_payload"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object p1

    if-nez p1, :cond_11

    const-string p1, "message arrived: receiving an empty message, drop"

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    return-object v9

    :cond_11
    new-instance v0, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    invoke-direct {v0}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;-><init>()V

    :try_start_2
    invoke-static {v0, p1}, Lcom/xiaomi/xmpush/thrift/XmPushThriftSerializeUtils;->convertByteArrayToThriftObject(Lorg/apache/thrift/TBase;[B)V

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->sAppContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/AppInfoHolder;

    move-result-object v1

    invoke-static {v0}, Lcom/xiaomi/push/service/MIPushNotificationHelper;->isBusinessMessage(Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)Z

    move-result v2

    if-eqz v2, :cond_12

    const-string p1, "message arrived: receive ignore reg message, ignore!"

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    goto :goto_5

    :cond_12
    invoke-virtual {v1}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->appRegistered()Z

    move-result v2

    if-nez v2, :cond_13

    const-string p1, "message arrived: receive message without registration. need unregister or re-register!"

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    goto :goto_5

    :cond_13
    invoke-virtual {v1}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->appRegistered()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-virtual {v1}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->invalidated()Z

    move-result v1

    if-eqz v1, :cond_14

    const-string p1, "message arrived: app info is invalidated"

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    goto :goto_5

    :cond_14
    invoke-direct {p0, v0, p1}, Lcom/xiaomi/mipush/sdk/PushMessageProcessor;->processMessage(Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;[B)Lcom/xiaomi/mipush/sdk/PushMessageHandler$PushMessageInterface;

    move-result-object p1
    :try_end_2
    .catch Lorg/apache/thrift/TException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    return-object p1

    :catch_3
    move-exception p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    goto :goto_5

    :catch_4
    move-exception p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    :cond_15
    :goto_5
    return-object v9
.end method
