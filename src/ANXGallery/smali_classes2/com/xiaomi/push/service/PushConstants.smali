.class public abstract Lcom/xiaomi/push/service/PushConstants;
.super Ljava/lang/Object;
.source "PushConstants.java"


# static fields
.field public static ACTION_BATCH_SEND_MESSAGE:Ljava/lang/String; = "com.xiaomi.push.BATCH_SEND_MESSAGE"

.field public static ACTION_CHANGE_HOST:Ljava/lang/String; = "com.xiaomi.push.CHANGE_HOST"

.field public static ACTION_CLOSE_CHANNEL:Ljava/lang/String; = "com.xiaomi.push.CLOSE_CHANNEL"

.field public static ACTION_FORCE_RECONNECT:Ljava/lang/String; = "com.xiaomi.push.FORCE_RECONN"

.field public static ACTION_OPEN_CHANNEL:Ljava/lang/String; = "com.xiaomi.push.OPEN_CHANNEL"

.field public static ACTION_PING_TIMER:Ljava/lang/String; = "com.xiaomi.push.PING_TIMER"

.field public static ACTION_RESET_CONNECTION:Ljava/lang/String; = "com.xiaomi.push.RESET_CONN"

.field public static ACTION_SEND_IQ:Ljava/lang/String; = "com.xiaomi.push.SEND_IQ"

.field public static ACTION_SEND_MESSAGE:Ljava/lang/String; = "com.xiaomi.push.SEND_MESSAGE"

.field public static ACTION_SEND_PRESENCE:Ljava/lang/String; = "com.xiaomi.push.SEND_PRES"

.field public static ACTION_SEND_STATS:Ljava/lang/String; = "com.xiaomi.push.SEND_STATS"

.field public static ACTION_UPDATE_CHANNEL_INFO:Ljava/lang/String; = "com.xiaomi.push.UPDATE_CHANNEL_INFO"

.field public static EXTRA_AUTH_METHOD:Ljava/lang/String; = "ext_auth_method"

.field public static EXTRA_CHANNEL_ID:Ljava/lang/String; = "ext_chid"

.field public static EXTRA_CLIENT_ATTR:Ljava/lang/String; = "ext_client_attr"

.field public static EXTRA_CLOUD_ATTR:Ljava/lang/String; = "ext_cloud_attr"

.field public static EXTRA_KICK:Ljava/lang/String; = "ext_kick"

.field public static EXTRA_MESSENGER:Ljava/lang/String; = "ext_messenger"

.field public static EXTRA_NOTIFY_DESCRIPTION:Ljava/lang/String; = "ext_notify_description"

.field public static EXTRA_NOTIFY_ID:Ljava/lang/String; = "ext_notify_id"

.field public static EXTRA_NOTIFY_TITLE:Ljava/lang/String; = "ext_notify_title"

.field public static EXTRA_NOTIFY_TYPE:Ljava/lang/String; = "ext_notify_type"

.field public static EXTRA_PACKAGE_NAME:Ljava/lang/String; = "ext_pkg_name"

.field public static EXTRA_SECURITY:Ljava/lang/String; = "ext_security"

.field public static EXTRA_SESSION:Ljava/lang/String; = "ext_session"

.field public static EXTRA_SID:Ljava/lang/String; = "ext_sid"

.field public static EXTRA_SIG:Ljava/lang/String; = "sig"

.field public static EXTRA_TOKEN:Ljava/lang/String; = "ext_token"

.field public static EXTRA_USER_ID:Ljava/lang/String; = "ext_user_id"

.field public static EXTRA_USER_RES:Ljava/lang/String; = "ext_user_res"

.field public static NOTIFICATION_CLICK_DEFAULT:Ljava/lang/String; = "1"

.field public static NOTIFICATION_CLICK_INTENT:Ljava/lang/String; = "2"

.field public static NOTIFICATION_CLICK_WEB_PAGE:Ljava/lang/String; = "3"

.field public static PUSH_DESCRIPTION:Ljava/lang/String; = "description"

.field public static PUSH_NOTIFY_ID:Ljava/lang/String; = "notifyId"

.field public static PUSH_TITLE:Ljava/lang/String; = "title"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public static getErrorDesc(I)Ljava/lang/String;
    .locals 0

    packed-switch p0, :pswitch_data_0

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_0
    const-string p0, "ERROR_PING_TIMEOUT"

    return-object p0

    :pswitch_1
    const-string p0, "ERROR_BIND_TIMEOUT"

    return-object p0

    :pswitch_2
    const-string p0, "ERROR_REDIRECT"

    return-object p0

    :pswitch_3
    const-string p0, "ERROR_USER_BLOCKED"

    return-object p0

    :pswitch_4
    const-string p0, "ERROR_CONNECTIING_TIMEOUT"

    return-object p0

    :pswitch_5
    const-string p0, "ERROR_READ_TIMEOUT"

    return-object p0

    :pswitch_6
    const-string p0, "ERROR_SESSION_CHANGED"

    return-object p0

    :pswitch_7
    const-string p0, "ERROR_SERVICE_DESTROY"

    return-object p0

    :pswitch_8
    const-string p0, "ERROR_THREAD_BLOCK"

    return-object p0

    :pswitch_9
    const-string p0, "ERROR_SERVER_STREAM"

    return-object p0

    :pswitch_a
    const-string p0, "ERROR_NO_CLIENT"

    return-object p0

    :pswitch_b
    const-string p0, "ERROR_RESET"

    return-object p0

    :pswitch_c
    const-string p0, "ERROR_SEND_ERROR"

    return-object p0

    :pswitch_d
    const-string p0, "ERROR_READ_ERROR"

    return-object p0

    :pswitch_e
    const-string p0, "ERROR_RECEIVE_TIMEOUT"

    return-object p0

    :pswitch_f
    const-string p0, "ERROR_SERVER_ERROR"

    return-object p0

    :pswitch_10
    const-string p0, "ERROR_MULTI_LOGIN"

    return-object p0

    :pswitch_11
    const-string p0, "ERROR_AUTH_FAILED"

    return-object p0

    :pswitch_12
    const-string p0, "ERROR_ACCESS_DENIED"

    return-object p0

    :pswitch_13
    const-string p0, "ERROR_NETWORK_FAILED"

    return-object p0

    :pswitch_14
    const-string p0, "ERROR_NETWORK_NOT_AVAILABLE"

    return-object p0

    :pswitch_15
    const-string p0, "ERROR_SERVICE_NOT_INSTALLED"

    return-object p0

    :pswitch_16
    const-string p0, "ERROR_OK"

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
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
