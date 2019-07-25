.class public Lcom/miui/gallery/push/messagehandler/StoryNotificationMessageHandler;
.super Lcom/miui/gallery/push/messagehandler/MessageHandler;
.source "StoryNotificationMessageHandler.java"


# static fields
.field private static mLastTime:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/push/messagehandler/MessageHandler;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/push/messagehandler/StoryNotificationMessageHandler;Landroid/content/Context;ILcom/miui/gallery/card/Card;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/push/messagehandler/StoryNotificationMessageHandler;->publishStoryNotification(Landroid/content/Context;ILcom/miui/gallery/card/Card;)V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/push/messagehandler/StoryNotificationMessageHandler;Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 0

    invoke-direct/range {p0 .. p5}, Lcom/miui/gallery/push/messagehandler/StoryNotificationMessageHandler;->publishStoryNotificationInternal(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method private getPushNotificationId(I)I
    .locals 0

    invoke-static {p1}, Lcom/miui/gallery/util/NotificationHelper;->getPushNotificationId(I)I

    move-result p1

    return p1
.end method

.method private publishStoryNotification(Landroid/content/Context;ILcom/miui/gallery/card/Card;)V
    .locals 8
    .annotation build Landroid/annotation/TargetApi;
        value = 0x17
    .end annotation

    if-eqz p1, :cond_2

    if-nez p3, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p3}, Lcom/miui/gallery/card/Card;->getTitle()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p3}, Lcom/miui/gallery/card/Card;->getDescription()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p3}, Lcom/miui/gallery/card/Card;->getOperationInfo()Lcom/miui/gallery/cloud/card/model/CardInfo$OperationInfo;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p3}, Lcom/miui/gallery/card/Card;->getOperationInfo()Lcom/miui/gallery/cloud/card/model/CardInfo$OperationInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/card/model/CardInfo$OperationInfo;->getIconUrl()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p3}, Lcom/miui/gallery/card/Card;->getOperationInfo()Lcom/miui/gallery/cloud/card/model/CardInfo$OperationInfo;

    move-result-object p3

    invoke-virtual {p3}, Lcom/miui/gallery/cloud/card/model/CardInfo$OperationInfo;->getIconUrl()Ljava/lang/String;

    move-result-object p3

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v6

    new-instance v7, Lcom/miui/gallery/push/messagehandler/StoryNotificationMessageHandler$2;

    move-object v0, v7

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/push/messagehandler/StoryNotificationMessageHandler$2;-><init>(Lcom/miui/gallery/push/messagehandler/StoryNotificationMessageHandler;Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, p3, v7}, Lcom/nostra13/universalimageloader/core/ImageLoader;->loadImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;)V

    goto :goto_0

    :cond_1
    const/4 p3, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, v4

    move-object v4, v5

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/push/messagehandler/StoryNotificationMessageHandler;->publishStoryNotificationInternal(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    :goto_0
    return-void

    :cond_2
    :goto_1
    const-string p1, "StoryNotificationMessageHandler"

    const-string p2, "No valid context or card!"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private publishStoryNotificationInternal(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 4

    const-string v0, "notification"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    if-nez v0, :cond_0

    const-string p1, "StoryNotificationMessageHandler"

    const-string p2, "notification manager is null"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.miui.gallery.action.VIEW_ALBUM"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "extra_start_page"

    const/4 v3, 0x2

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/4 v2, 0x0

    const/high16 v3, 0x8000000

    invoke-static {p1, v2, v1, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    new-instance v2, Landroid/app/Notification$Builder;

    invoke-direct {v2, p1}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, p3}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    invoke-virtual {v2, p3}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    invoke-virtual {v2, p4}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    if-eqz p5, :cond_1

    invoke-virtual {v2, p5}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;

    :cond_1
    const/high16 p3, 0x7f0d0000

    invoke-virtual {v2, p3}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    invoke-static {p1, v2}, Lcom/miui/gallery/util/NotificationHelper;->setLowChannel(Landroid/content/Context;Landroid/app/Notification$Builder;)V

    invoke-virtual {v2, v1}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    invoke-virtual {v2}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object p1

    const/16 p3, 0x10

    iput p3, p1, Landroid/app/Notification;->flags:I

    invoke-virtual {v0, p2, p1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    const-string p1, "StoryNotificationMessageHandler"

    const-string p3, "publis notification %d success"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {p1, p3, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public handleDirect(Landroid/content/Context;Lcom/miui/gallery/push/GalleryPushMessage;)V
    .locals 8

    if-eqz p1, :cond_8

    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->isStoryGenerateEnable()Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_1

    :cond_0
    invoke-virtual {p2}, Lcom/miui/gallery/push/GalleryPushMessage;->getData()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    const-string p1, "StoryNotificationMessageHandler"

    const-string p2, "message data is null"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-virtual {p2}, Lcom/miui/gallery/push/GalleryPushMessage;->getData()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v1, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p2, "id"

    const/4 v2, 0x0

    invoke-virtual {v1, p2, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p2

    invoke-direct {p0, p2}, Lcom/miui/gallery/push/messagehandler/StoryNotificationMessageHandler;->getPushNotificationId(I)I

    move-result p2

    const-string v3, "isCancel"

    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_3

    const-string v1, "notification"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/NotificationManager;

    if-eqz p1, :cond_2

    invoke-virtual {p1, p2}, Landroid/app/NotificationManager;->cancel(I)V

    const-string p1, "StoryNotificationMessageHandler"

    const-string p2, "is cancel message"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    return-void

    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sget-wide v5, Lcom/miui/gallery/push/messagehandler/StoryNotificationMessageHandler;->mLastTime:J

    const/4 v7, 0x0

    sub-long v5, v3, v5

    sput-wide v3, Lcom/miui/gallery/push/messagehandler/StoryNotificationMessageHandler;->mLastTime:J

    const-wide/32 v3, 0x927c0

    cmp-long v7, v5, v3

    if-gez v7, :cond_4

    const-string p1, "StoryNotificationMessageHandler"

    const-string p2, "too frequently to push notification, time duration is %d"

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {p1, p2, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :cond_4
    const-string v3, "version"

    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v3

    if-lez v3, :cond_5

    const-string p1, "StoryNotificationMessageHandler"

    const-string p2, "message version is not fit, server version is %d, local version is %d"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {p1, p2, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :cond_5
    const-string v2, "story_id"

    const-wide/16 v3, 0x0

    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v1

    const-string v3, "assistant"

    const-string v4, "assistant_operation_card_push_recieved"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "story_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/card/CardManager;->getInstance()Lcom/miui/gallery/card/CardManager;

    move-result-object v3

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v3, v4, v5}, Lcom/miui/gallery/card/CardManager;->getCardByServerId(Ljava/lang/String;Z)Lcom/miui/gallery/card/Card;

    move-result-object v3

    if-eqz v3, :cond_6

    invoke-virtual {v3}, Lcom/miui/gallery/card/Card;->isOutofDate()Z

    move-result v1

    if-nez v1, :cond_7

    invoke-direct {p0, p1, p2, v3}, Lcom/miui/gallery/push/messagehandler/StoryNotificationMessageHandler;->publishStoryNotification(Landroid/content/Context;ILcom/miui/gallery/card/Card;)V

    goto :goto_0

    :cond_6
    new-instance v3, Lcom/miui/gallery/cloud/card/SyncCardFromServer;

    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->getXiaomiAccount()Landroid/accounts/Account;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/miui/gallery/cloud/card/SyncCardFromServer;-><init>(Landroid/accounts/Account;)V

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/push/messagehandler/StoryNotificationMessageHandler$1;

    invoke-direct {v2, p0, p1, p2}, Lcom/miui/gallery/push/messagehandler/StoryNotificationMessageHandler$1;-><init>(Lcom/miui/gallery/push/messagehandler/StoryNotificationMessageHandler;Landroid/content/Context;I)V

    invoke-virtual {v3, v1, v2}, Lcom/miui/gallery/cloud/card/SyncCardFromServer;->getOperationCards(Ljava/lang/String;Lcom/miui/gallery/cloud/card/SyncCardFromServer$OperationCardCallback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "StoryNotificationMessageHandler"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "fail to parse notification data from"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_7
    :goto_0
    return-void

    :cond_8
    :goto_1
    const-string p1, "StoryNotificationMessageHandler"

    const-string p2, "context is null"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public handlePull(Landroid/content/Context;Lcom/miui/gallery/push/GalleryPushMessage;)V
    .locals 0

    return-void
.end method
