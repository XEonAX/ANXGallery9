.class Lcom/xiaomi/push/service/awake/module/AwakeManager$1;
.super Ljava/lang/Object;
.source "AwakeManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/push/service/awake/module/AwakeManager;->wakeup(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/push/service/awake/module/AwakeManager;

.field final synthetic val$appId:Ljava/lang/String;

.field final synthetic val$awakeInfo:Ljava/lang/String;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$spackageName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/xiaomi/push/service/awake/module/AwakeManager;Ljava/lang/String;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;->this$0:Lcom/xiaomi/push/service/awake/module/AwakeManager;

    iput-object p2, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;->val$awakeInfo:Ljava/lang/String;

    iput-object p3, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;->val$context:Landroid/content/Context;

    iput-object p4, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;->val$spackageName:Ljava/lang/String;

    iput-object p5, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;->val$appId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    iget-object v0, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;->val$awakeInfo:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/16 v1, 0x3f0

    if-nez v0, :cond_7

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;->val$context:Landroid/content/Context;

    iget-object v2, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;->val$awakeInfo:Ljava/lang/String;

    const/16 v3, 0x3e9

    const-string v4, "get message"

    invoke-static {v0, v2, v3, v4}, Lcom/xiaomi/push/service/awake/AwakeUploadHelper;->uploadData(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;)V

    new-instance v0, Lorg/json/JSONObject;

    iget-object v2, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;->val$awakeInfo:Ljava/lang/String;

    invoke-direct {v0, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v2, "action"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "awakened_app_packagename"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "awake_app_packagename"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "awake_app"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "awake_type"

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v6, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;->val$spackageName:Ljava/lang/String;

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    iget-object v6, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;->val$appId:Ljava/lang/String;

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    goto/16 :goto_0

    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_5

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_5

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_5

    iget-object v6, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;->this$0:Lcom/xiaomi/push/service/awake/module/AwakeManager;

    invoke-virtual {v6, v4}, Lcom/xiaomi/push/service/awake/module/AwakeManager;->setPackageName(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;->this$0:Lcom/xiaomi/push/service/awake/module/AwakeManager;

    invoke-virtual {v4, v5}, Lcom/xiaomi/push/service/awake/module/AwakeManager;->setAppId(Ljava/lang/String;)V

    new-instance v4, Lcom/xiaomi/push/service/awake/module/AwakeInfo;

    invoke-direct {v4}, Lcom/xiaomi/push/service/awake/module/AwakeInfo;-><init>()V

    invoke-virtual {v4, v2}, Lcom/xiaomi/push/service/awake/module/AwakeInfo;->setAction(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Lcom/xiaomi/push/service/awake/module/AwakeInfo;->setTargetPackageName(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;->val$awakeInfo:Ljava/lang/String;

    invoke-virtual {v4, v3}, Lcom/xiaomi/push/service/awake/module/AwakeInfo;->setAwakeInfo(Ljava/lang/String;)V

    const-string v3, "service"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;->this$0:Lcom/xiaomi/push/service/awake/module/AwakeManager;

    sget-object v2, Lcom/xiaomi/push/service/awake/module/HelpType;->SERVICE_ACTION:Lcom/xiaomi/push/service/awake/module/HelpType;

    iget-object v3, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;->val$context:Landroid/content/Context;

    invoke-static {v0, v2, v3, v4}, Lcom/xiaomi/push/service/awake/module/AwakeManager;->access$000(Lcom/xiaomi/push/service/awake/module/AwakeManager;Lcom/xiaomi/push/service/awake/module/HelpType;Landroid/content/Context;Lcom/xiaomi/push/service/awake/module/AwakeInfo;)V

    goto/16 :goto_1

    :cond_1
    const-string v0, "com.xiaomi.mipush.sdk.PushMessageHandler"

    invoke-virtual {v4, v0}, Lcom/xiaomi/push/service/awake/module/AwakeInfo;->setClassName(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;->this$0:Lcom/xiaomi/push/service/awake/module/AwakeManager;

    sget-object v2, Lcom/xiaomi/push/service/awake/module/HelpType;->SERVICE_COMPONENT:Lcom/xiaomi/push/service/awake/module/HelpType;

    iget-object v3, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;->val$context:Landroid/content/Context;

    invoke-static {v0, v2, v3, v4}, Lcom/xiaomi/push/service/awake/module/AwakeManager;->access$000(Lcom/xiaomi/push/service/awake/module/AwakeManager;Lcom/xiaomi/push/service/awake/module/HelpType;Landroid/content/Context;Lcom/xiaomi/push/service/awake/module/AwakeInfo;)V

    goto/16 :goto_1

    :cond_2
    sget-object v2, Lcom/xiaomi/push/service/awake/module/HelpType;->ACTIVITY:Lcom/xiaomi/push/service/awake/module/HelpType;

    iget-object v2, v2, Lcom/xiaomi/push/service/awake/module/HelpType;->typeValue:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v0, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;->this$0:Lcom/xiaomi/push/service/awake/module/AwakeManager;

    sget-object v2, Lcom/xiaomi/push/service/awake/module/HelpType;->ACTIVITY:Lcom/xiaomi/push/service/awake/module/HelpType;

    iget-object v3, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;->val$context:Landroid/content/Context;

    invoke-static {v0, v2, v3, v4}, Lcom/xiaomi/push/service/awake/module/AwakeManager;->access$000(Lcom/xiaomi/push/service/awake/module/AwakeManager;Lcom/xiaomi/push/service/awake/module/HelpType;Landroid/content/Context;Lcom/xiaomi/push/service/awake/module/AwakeInfo;)V

    goto :goto_1

    :cond_3
    sget-object v2, Lcom/xiaomi/push/service/awake/module/HelpType;->PROVIDER:Lcom/xiaomi/push/service/awake/module/HelpType;

    iget-object v2, v2, Lcom/xiaomi/push/service/awake/module/HelpType;->typeValue:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    iget-object v0, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;->this$0:Lcom/xiaomi/push/service/awake/module/AwakeManager;

    sget-object v2, Lcom/xiaomi/push/service/awake/module/HelpType;->PROVIDER:Lcom/xiaomi/push/service/awake/module/HelpType;

    iget-object v3, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;->val$context:Landroid/content/Context;

    invoke-static {v0, v2, v3, v4}, Lcom/xiaomi/push/service/awake/module/AwakeManager;->access$000(Lcom/xiaomi/push/service/awake/module/AwakeManager;Lcom/xiaomi/push/service/awake/module/HelpType;Landroid/content/Context;Lcom/xiaomi/push/service/awake/module/AwakeInfo;)V

    goto :goto_1

    :cond_4
    iget-object v2, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;->val$context:Landroid/content/Context;

    iget-object v3, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;->val$awakeInfo:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "A receive a incorrect message with unknown type "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v3, v1, v0}, Lcom/xiaomi/push/service/awake/AwakeUploadHelper;->uploadData(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;)V

    goto :goto_1

    :cond_5
    iget-object v0, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;->val$context:Landroid/content/Context;

    iget-object v2, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;->val$awakeInfo:Ljava/lang/String;

    const-string v3, "A receive a incorrect message with empty type"

    invoke-static {v0, v2, v1, v3}, Lcom/xiaomi/push/service/awake/AwakeUploadHelper;->uploadData(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;)V

    goto :goto_1

    :cond_6
    :goto_0
    iget-object v0, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;->val$context:Landroid/content/Context;

    iget-object v2, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;->val$awakeInfo:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "A receive a incorrect message with incorrect package info"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v2, v1, v3}, Lcom/xiaomi/push/service/awake/AwakeUploadHelper;->uploadData(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    iget-object v0, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;->val$context:Landroid/content/Context;

    iget-object v2, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;->val$awakeInfo:Ljava/lang/String;

    const-string v3, "A meet a exception when receive the message"

    invoke-static {v0, v2, v1, v3}, Lcom/xiaomi/push/service/awake/AwakeUploadHelper;->uploadData(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;)V

    goto :goto_1

    :cond_7
    iget-object v0, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;->val$context:Landroid/content/Context;

    const-string v2, "null"

    const-string v3, "A receive a incorrect message with empty info"

    invoke-static {v0, v2, v1, v3}, Lcom/xiaomi/push/service/awake/AwakeUploadHelper;->uploadData(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;)V

    :goto_1
    return-void
.end method
