.class public Lcom/miui/gallery/push/messagehandler/FeatureRedDotMessageHandler;
.super Lcom/miui/gallery/push/messagehandler/MessageHandler;
.source "FeatureRedDotMessageHandler.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/push/messagehandler/MessageHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleDirect(Landroid/content/Context;Lcom/miui/gallery/push/GalleryPushMessage;)V
    .locals 7

    if-nez p1, :cond_0

    const-string p1, "FeatureRedDotMessageHandler"

    const-string p2, "context is null"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-virtual {p2}, Lcom/miui/gallery/push/GalleryPushMessage;->getData()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_1

    const-string p1, "FeatureRedDotMessageHandler"

    const-string p2, "message data is null"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-virtual {p2}, Lcom/miui/gallery/push/GalleryPushMessage;->getData()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v0, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    new-instance p2, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd HH:mm:ss"

    invoke-direct {p2, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    const-string v1, "start_time"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "end_time"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    const-wide/16 v3, 0x0

    goto :goto_0

    :cond_2
    invoke-virtual {p2, v1}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    :goto_0
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-wide v1, 0x7fffffffffffffffL

    goto :goto_1

    :cond_3
    invoke-virtual {p2, v2}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    :goto_1
    const-string p2, "feature_name"

    invoke-virtual {v0, p2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    cmp-long v0, v5, v1

    if-gtz v0, :cond_4

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    invoke-static {p2, v3, v4, v1, v2}, Lcom/miui/gallery/preference/GalleryPreferences$FeatureRedDot;->setFeatureRedDotValidTime(Ljava/lang/String;JJ)V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "featureName"

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "feature_red_dot"

    const-string v1, "push_red_dot_arrive"

    invoke-static {p2, v1, v0}, Lcom/miui/gallery/util/GalleryStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p2

    const-string v0, "FeatureRedDotMessageHandler"

    const-string v1, "fail to parse feature red dot data from %s"

    invoke-static {v0, v1, p1, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_4
    :goto_2
    return-void
.end method

.method public handlePull(Landroid/content/Context;Lcom/miui/gallery/push/GalleryPushMessage;)V
    .locals 0

    return-void
.end method
