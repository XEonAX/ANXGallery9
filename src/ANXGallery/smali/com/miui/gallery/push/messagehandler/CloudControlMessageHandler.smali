.class public Lcom/miui/gallery/push/messagehandler/CloudControlMessageHandler;
.super Lcom/miui/gallery/push/messagehandler/MessageHandler;
.source "CloudControlMessageHandler.java"


# static fields
.field private static final ONE_WEEK_MILLIS:J


# direct methods
.method static constructor <clinit>()V
    .locals 3

    sget-object v0, Ljava/util/concurrent/TimeUnit;->DAYS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x7

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lcom/miui/gallery/push/messagehandler/CloudControlMessageHandler;->ONE_WEEK_MILLIS:J

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/push/messagehandler/MessageHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleDirect(Landroid/content/Context;Lcom/miui/gallery/push/GalleryPushMessage;)V
    .locals 9

    invoke-virtual {p2}, Lcom/miui/gallery/push/GalleryPushMessage;->getTag()J

    move-result-wide v0

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CloudControl;->getPushTag()J

    move-result-wide v2

    cmp-long v4, v0, v2

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-gtz v4, :cond_0

    const-string p1, "CloudControlMessageHandler"

    const-string v4, "Current push tag is less than last push tag, skip handle"

    invoke-static {p1, v4}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->generatorCommonParams()Ljava/util/Map;

    move-result-object p1

    const-string v4, "businessModule"

    invoke-virtual {p2}, Lcom/miui/gallery/push/GalleryPushMessage;->getBusinessModule()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, v4, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "tag_lastTag"

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "%d_%d"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v8, v6

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v8, v5

    invoke-static {v4, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "mipush"

    const-string v0, "push_tag_is_invalid"

    invoke-static {p2, v0, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void

    :cond_0
    invoke-static {v0, v1}, Lcom/miui/gallery/preference/GalleryPreferences$CloudControl;->setPushTag(J)V

    invoke-virtual {p2}, Lcom/miui/gallery/push/GalleryPushMessage;->getData()Ljava/lang/String;

    move-result-object p2

    :try_start_0
    new-instance v0, Lcom/google/gson/GsonBuilder;

    invoke-direct {v0}, Lcom/google/gson/GsonBuilder;-><init>()V

    const-class v1, Lcom/miui/gallery/cloudcontrol/FeatureProfile;

    new-instance v2, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Deserializer;

    invoke-direct {v2}, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Deserializer;-><init>()V

    invoke-virtual {v0, v1, v2}, Lcom/google/gson/GsonBuilder;->registerTypeAdapter(Ljava/lang/reflect/Type;Ljava/lang/Object;)Lcom/google/gson/GsonBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/GsonBuilder;->create()Lcom/google/gson/Gson;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/push/messagehandler/CloudControlMessageHandler$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/push/messagehandler/CloudControlMessageHandler$1;-><init>(Lcom/miui/gallery/push/messagehandler/CloudControlMessageHandler;)V

    invoke-virtual {v1}, Lcom/miui/gallery/push/messagehandler/CloudControlMessageHandler$1;->getType()Ljava/lang/reflect/Type;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/cloudcontrol/FeatureProfile;

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->insertToCache(Lcom/miui/gallery/cloudcontrol/FeatureProfile;)V

    invoke-static {p1, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlDBHelper;->tryInsertToDB(Landroid/content/Context;Lcom/miui/gallery/cloudcontrol/FeatureProfile;)I

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "CloudControlMessageHandler"

    const-string v3, "Persist failed: %s"

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v3, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v6, 0x1

    goto :goto_0

    :cond_2
    if-eqz v6, :cond_3

    invoke-static {}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->generatorCommonParams()Ljava/util/Map;

    move-result-object p1

    const-string v0, "response"

    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "cloud_control"

    const-string v0, "cloud_control_persist_error"

    invoke-static {p2, v0, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_3
    return-void

    :catch_0
    move-exception p1

    const-string v0, "CloudControlMessageHandler"

    const-string v1, "Parse direct content [%s] failed: \n%s"

    invoke-static {v0, v1, p2, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public handlePull(Landroid/content/Context;Lcom/miui/gallery/push/GalleryPushMessage;)V
    .locals 5

    if-nez p2, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lmiui/net/ConnectivityHelper;->getInstance()Lmiui/net/ConnectivityHelper;

    move-result-object v0

    invoke-virtual {v0}, Lmiui/net/ConnectivityHelper;->isUnmeteredNetworkConnected()Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance p2, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;

    invoke-direct {p2, p1}, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2}, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;->execRequestSync()Z

    const-string p1, "CloudControlMessageHandler"

    const-string p2, "Pull data trigger by push"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    invoke-static {}, Lmiui/net/ConnectivityHelper;->getInstance()Lmiui/net/ConnectivityHelper;

    move-result-object v0

    invoke-virtual {v0}, Lmiui/net/ConnectivityHelper;->isNetworkConnected()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CloudControl;->getLastRequestSucceedTime()J

    move-result-wide v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v0

    sget-wide v0, Lcom/miui/gallery/push/messagehandler/CloudControlMessageHandler;->ONE_WEEK_MILLIS:J

    cmp-long v4, v2, v0

    if-ltz v4, :cond_2

    new-instance p2, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;

    invoke-direct {p2, p1}, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2}, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;->execRequestSync()Z

    const-string p1, "CloudControlMessageHandler"

    const-string p2, "Force pull data after one week"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_2
    const-string p1, "CloudControlMessageHandler"

    const-string v0, "Post as pending task"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->getInstance()Lcom/miui/gallery/pendingtask/PendingTaskManager;

    move-result-object p1

    const/4 v0, 0x3

    invoke-virtual {p1, v0, p2}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->postTask(ILjava/lang/Object;)V

    return-void
.end method
