.class public Lcom/miui/gallery/push/PushMessageDispatcher;
.super Ljava/lang/Object;
.source "PushMessageDispatcher.java"


# direct methods
.method public static dispatch(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/MiPushMessage;)V
    .locals 6

    invoke-virtual {p1}, Lcom/xiaomi/mipush/sdk/MiPushMessage;->getContent()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string p0, "PushMessageDispatcher"

    const-string p1, "Message content is empty"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "mipush"

    const-string p1, "message_content_is_empty"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-static {v0}, Lcom/miui/gallery/push/GalleryPushMessage;->fromJson(Ljava/lang/String;)Lcom/miui/gallery/push/GalleryPushMessage;

    move-result-object v1

    if-nez v1, :cond_1

    const-string p0, "PushMessageDispatcher"

    const-string p1, "Parse message content failed: %s"

    invoke-static {p0, p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const-string p0, "mipush"

    const-string p1, "message_content_parse_failed"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    invoke-virtual {v1}, Lcom/miui/gallery/push/GalleryPushMessage;->getMessageScope()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/push/PushConstants$MessageScope;->getScope(Ljava/lang/String;)Lcom/miui/gallery/push/PushConstants$MessageScope;

    move-result-object v0

    sget-object v2, Lcom/miui/gallery/push/PushConstants$MessageScope;->RELEASE:Lcom/miui/gallery/push/PushConstants$MessageScope;

    if-eq v0, v2, :cond_3

    sget-object v2, Lcom/miui/gallery/push/PushConstants$MessageScope;->DEBUG:Lcom/miui/gallery/push/PushConstants$MessageScope;

    if-ne v0, v2, :cond_2

    sget-boolean v0, Lcom/miui/gallery/util/BuildUtil;->IS_DEBUG_BUILD:Z

    if-nez v0, :cond_3

    :cond_2
    const-string p0, "PushMessageDispatcher"

    const-string p1, "Message scope does not match: %s"

    invoke-virtual {v1}, Lcom/miui/gallery/push/GalleryPushMessage;->getMessageScope()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    const-string p1, "msg_scope"

    invoke-virtual {v1}, Lcom/miui/gallery/push/GalleryPushMessage;->getMessageScope()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "mipush"

    const-string v0, "unknown_message_scope_doesnt_match"

    invoke-static {p1, v0, p0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void

    :cond_3
    invoke-virtual {v1}, Lcom/miui/gallery/push/GalleryPushMessage;->getType()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/push/PushConstants$MessageType;->getType(Ljava/lang/String;)Lcom/miui/gallery/push/PushConstants$MessageType;

    move-result-object v0

    if-nez v0, :cond_4

    const-string p0, "PushMessageDispatcher"

    const-string p1, "Unknown message type: %s"

    invoke-virtual {v1}, Lcom/miui/gallery/push/GalleryPushMessage;->getType()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    const-string p1, "msg_type"

    invoke-virtual {v1}, Lcom/miui/gallery/push/GalleryPushMessage;->getType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "mipush"

    const-string v0, "unknown_message_type"

    invoke-static {p1, v0, p0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void

    :cond_4
    invoke-virtual {p1}, Lcom/xiaomi/mipush/sdk/MiPushMessage;->getUserAccount()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_5

    move-object p1, v3

    goto :goto_0

    :cond_5
    invoke-virtual {p1}, Lcom/xiaomi/mipush/sdk/MiPushMessage;->getUserAccount()Ljava/lang/String;

    move-result-object p1

    :goto_0
    invoke-static {}, Lcom/miui/gallery/cloud/AccountCache;->getAccount()Landroid/accounts/Account;

    move-result-object v2

    if-eqz v2, :cond_6

    invoke-static {}, Lcom/miui/gallery/cloud/AccountCache;->getAccount()Landroid/accounts/Account;

    move-result-object v2

    iget-object v2, v2, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/util/Encode;->SHA1Encode([B)Ljava/lang/String;

    move-result-object v3

    :cond_6
    if-eqz p1, :cond_7

    invoke-static {p1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_7

    const-string p0, "PushMessageDispatcher"

    const-string v0, "UserAccount doesn\'t match, skip handle"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    const-string v0, "pushAccount_localAccount"

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "%s_%s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 p1, 0x1

    aput-object v3, v4, p1

    invoke-static {v1, v2, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "mipush"

    const-string v0, "push_user_account_doesnt_match"

    invoke-static {p1, v0, p0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void

    :cond_7
    invoke-virtual {v1}, Lcom/miui/gallery/push/GalleryPushMessage;->getBusinessModule()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/push/MessageHandlerFactory;->create(Ljava/lang/String;)Lcom/miui/gallery/push/messagehandler/MessageHandler;

    move-result-object v2

    if-nez v2, :cond_8

    const-string p0, "PushMessageDispatcher"

    const-string v0, "MessageHandler is undefined: %s"

    invoke-static {p0, v0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :cond_8
    sget-object p1, Lcom/miui/gallery/push/PushMessageDispatcher$1;->$SwitchMap$com$miui$gallery$push$PushConstants$MessageType:[I

    invoke-virtual {v0}, Lcom/miui/gallery/push/PushConstants$MessageType;->ordinal()I

    move-result v0

    aget p1, p1, v0

    packed-switch p1, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    invoke-virtual {v2, p0, v1}, Lcom/miui/gallery/push/messagehandler/MessageHandler;->handleDirect(Landroid/content/Context;Lcom/miui/gallery/push/GalleryPushMessage;)V

    goto :goto_1

    :pswitch_1
    invoke-virtual {v2, p0, v1}, Lcom/miui/gallery/push/messagehandler/MessageHandler;->handlePull(Landroid/content/Context;Lcom/miui/gallery/push/GalleryPushMessage;)V

    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
