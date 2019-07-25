.class final Lcom/xiaomi/mipush/sdk/SyncInfoHelper$1;
.super Ljava/lang/Object;
.source "SyncInfoHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/mipush/sdk/SyncInfoHelper;->doSyncInfoAsync(Landroid/content/Context;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$md5Info:Z


# direct methods
.method constructor <init>(Landroid/content/Context;Z)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/SyncInfoHelper$1;->val$context:Landroid/content/Context;

    iput-boolean p2, p0, Lcom/xiaomi/mipush/sdk/SyncInfoHelper$1;->val$md5Info:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    const-string v0, "do sync info"

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    new-instance v0, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    invoke-static {}, Lcom/xiaomi/push/service/PacketHelper;->generatePacketID()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;-><init>(Ljava/lang/String;Z)V

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/SyncInfoHelper$1;->val$context:Landroid/content/Context;

    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/AppInfoHolder;

    move-result-object v1

    sget-object v3, Lcom/xiaomi/xmpush/thrift/NotificationType;->SyncInfo:Lcom/xiaomi/xmpush/thrift/NotificationType;

    iget-object v3, v3, Lcom/xiaomi/xmpush/thrift/NotificationType;->value:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->setType(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    invoke-virtual {v1}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getAppID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->setAppId(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    iget-object v3, p0, Lcom/xiaomi/mipush/sdk/SyncInfoHelper$1;->val$context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->setPackageName(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, v0, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->extra:Ljava/util/Map;

    iget-object v3, v0, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->extra:Ljava/util/Map;

    const-string v4, "app_version"

    iget-object v5, p0, Lcom/xiaomi/mipush/sdk/SyncInfoHelper$1;->val$context:Landroid/content/Context;

    iget-object v6, p0, Lcom/xiaomi/mipush/sdk/SyncInfoHelper$1;->val$context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/xiaomi/channel/commonutils/android/AppInfoUtils;->getVersionName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/xiaomi/channel/commonutils/android/PreferenceUtils;->putNotNullExtra(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, v0, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->extra:Ljava/util/Map;

    const-string v4, "app_version_code"

    iget-object v5, p0, Lcom/xiaomi/mipush/sdk/SyncInfoHelper$1;->val$context:Landroid/content/Context;

    iget-object v6, p0, Lcom/xiaomi/mipush/sdk/SyncInfoHelper$1;->val$context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/xiaomi/channel/commonutils/android/AppInfoUtils;->getVersionCode(Landroid/content/Context;Ljava/lang/String;)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/xiaomi/channel/commonutils/android/PreferenceUtils;->putNotNullExtra(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, v0, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->extra:Ljava/util/Map;

    const-string v4, "push_sdk_vn"

    const-string v5, "3_6_19"

    invoke-static {v3, v4, v5}, Lcom/xiaomi/channel/commonutils/android/PreferenceUtils;->putNotNullExtra(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, v0, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->extra:Ljava/util/Map;

    const-string v4, "push_sdk_vc"

    const/16 v5, 0x779b

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/xiaomi/channel/commonutils/android/PreferenceUtils;->putNotNullExtra(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, v0, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->extra:Ljava/util/Map;

    const-string v4, "token"

    invoke-virtual {v1}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getAppToken()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/xiaomi/channel/commonutils/android/PreferenceUtils;->putNotNullExtra(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/xiaomi/channel/commonutils/android/MIUIUtils;->isGlobalRegion()Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/xiaomi/mipush/sdk/SyncInfoHelper$1;->val$context:Landroid/content/Context;

    invoke-static {v3}, Lcom/xiaomi/channel/commonutils/android/DeviceInfo;->blockingGetIMEI(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/xiaomi/channel/commonutils/string/XMStringUtils;->getMd5Digest(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/xiaomi/mipush/sdk/SyncInfoHelper$1;->val$context:Landroid/content/Context;

    invoke-static {v4}, Lcom/xiaomi/channel/commonutils/android/DeviceInfo;->blockingGetSubIMEISMd5(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ","

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :cond_0
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    iget-object v4, v0, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->extra:Ljava/util/Map;

    const-string v5, "imei_md5"

    invoke-static {v4, v5, v3}, Lcom/xiaomi/channel/commonutils/android/PreferenceUtils;->putNotNullExtra(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    iget-object v3, v0, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->extra:Ljava/util/Map;

    const-string v4, "reg_id"

    invoke-virtual {v1}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getRegID()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/xiaomi/channel/commonutils/android/PreferenceUtils;->putNotNullExtra(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, v0, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->extra:Ljava/util/Map;

    const-string v4, "reg_secret"

    invoke-virtual {v1}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getRegSecret()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1}, Lcom/xiaomi/channel/commonutils/android/PreferenceUtils;->putNotNullExtra(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/SyncInfoHelper$1;->val$context:Landroid/content/Context;

    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/MiPushClient;->getAcceptTime(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    const-string v3, ","

    const-string v4, "-"

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    iget-object v3, v0, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->extra:Ljava/util/Map;

    const-string v4, "accept_time"

    invoke-static {v3, v4, v1}, Lcom/xiaomi/channel/commonutils/android/PreferenceUtils;->putNotNullExtra(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v1, p0, Lcom/xiaomi/mipush/sdk/SyncInfoHelper$1;->val$md5Info:Z

    if-eqz v1, :cond_2

    iget-object v1, v0, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->extra:Ljava/util/Map;

    const-string v3, "aliases_md5"

    iget-object v4, p0, Lcom/xiaomi/mipush/sdk/SyncInfoHelper$1;->val$context:Landroid/content/Context;

    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/MiPushClient;->getAllAlias(Landroid/content/Context;)Ljava/util/List;

    move-result-object v4

    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/SyncInfoHelper;->access$000(Ljava/util/List;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v3, v4}, Lcom/xiaomi/channel/commonutils/android/PreferenceUtils;->putNotNullExtra(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, v0, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->extra:Ljava/util/Map;

    const-string v3, "topics_md5"

    iget-object v4, p0, Lcom/xiaomi/mipush/sdk/SyncInfoHelper$1;->val$context:Landroid/content/Context;

    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/MiPushClient;->getAllTopic(Landroid/content/Context;)Ljava/util/List;

    move-result-object v4

    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/SyncInfoHelper;->access$000(Ljava/util/List;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v3, v4}, Lcom/xiaomi/channel/commonutils/android/PreferenceUtils;->putNotNullExtra(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, v0, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->extra:Ljava/util/Map;

    const-string v3, "accounts_md5"

    iget-object v4, p0, Lcom/xiaomi/mipush/sdk/SyncInfoHelper$1;->val$context:Landroid/content/Context;

    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/MiPushClient;->getAllUserAccount(Landroid/content/Context;)Ljava/util/List;

    move-result-object v4

    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/SyncInfoHelper;->access$000(Ljava/util/List;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v3, v4}, Lcom/xiaomi/channel/commonutils/android/PreferenceUtils;->putNotNullExtra(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    iget-object v1, v0, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->extra:Ljava/util/Map;

    const-string v3, "aliases"

    iget-object v4, p0, Lcom/xiaomi/mipush/sdk/SyncInfoHelper$1;->val$context:Landroid/content/Context;

    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/MiPushClient;->getAllAlias(Landroid/content/Context;)Ljava/util/List;

    move-result-object v4

    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/SyncInfoHelper;->access$100(Ljava/util/List;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v3, v4}, Lcom/xiaomi/channel/commonutils/android/PreferenceUtils;->putNotNullExtra(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, v0, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->extra:Ljava/util/Map;

    const-string v3, "topics"

    iget-object v4, p0, Lcom/xiaomi/mipush/sdk/SyncInfoHelper$1;->val$context:Landroid/content/Context;

    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/MiPushClient;->getAllTopic(Landroid/content/Context;)Ljava/util/List;

    move-result-object v4

    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/SyncInfoHelper;->access$100(Ljava/util/List;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v3, v4}, Lcom/xiaomi/channel/commonutils/android/PreferenceUtils;->putNotNullExtra(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, v0, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->extra:Ljava/util/Map;

    const-string v3, "user_accounts"

    iget-object v4, p0, Lcom/xiaomi/mipush/sdk/SyncInfoHelper$1;->val$context:Landroid/content/Context;

    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/MiPushClient;->getAllUserAccount(Landroid/content/Context;)Ljava/util/List;

    move-result-object v4

    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/SyncInfoHelper;->access$100(Ljava/util/List;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v3, v4}, Lcom/xiaomi/channel/commonutils/android/PreferenceUtils;->putNotNullExtra(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/SyncInfoHelper$1;->val$context:Landroid/content/Context;

    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/PushServiceClient;

    move-result-object v1

    sget-object v3, Lcom/xiaomi/xmpush/thrift/ActionType;->Notification:Lcom/xiaomi/xmpush/thrift/ActionType;

    const/4 v4, 0x0

    invoke-virtual {v1, v0, v3, v2, v4}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->sendMessage(Lorg/apache/thrift/TBase;Lcom/xiaomi/xmpush/thrift/ActionType;ZLcom/xiaomi/xmpush/thrift/PushMetaInfo;)V

    return-void
.end method
