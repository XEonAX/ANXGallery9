.class final Lcom/xiaomi/mipush/sdk/AwakeHelper$2;
.super Lcom/xiaomi/push/service/OnlineConfig$OCUpdateCallback;
.source "AwakeHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/mipush/sdk/AwakeHelper;->doAWork(Landroid/content/Context;Landroid/content/Intent;Landroid/net/Uri;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(ILjava/lang/String;Landroid/content/Context;)V
    .locals 0

    iput-object p3, p0, Lcom/xiaomi/mipush/sdk/AwakeHelper$2;->val$context:Landroid/content/Context;

    invoke-direct {p0, p1, p2}, Lcom/xiaomi/push/service/OnlineConfig$OCUpdateCallback;-><init>(ILjava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected onCallback()V
    .locals 4

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AwakeHelper$2;->val$context:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/push/service/awake/module/AwakeManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/awake/module/AwakeManager;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AwakeHelper$2;->val$context:Landroid/content/Context;

    invoke-static {v1}, Lcom/xiaomi/push/service/OnlineConfig;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/OnlineConfig;

    move-result-object v1

    sget-object v2, Lcom/xiaomi/xmpush/thrift/ConfigKey;->AwakeInfoUploadWaySwitch:Lcom/xiaomi/xmpush/thrift/ConfigKey;

    invoke-virtual {v2}, Lcom/xiaomi/xmpush/thrift/ConfigKey;->getValue()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/xiaomi/push/service/OnlineConfig;->getIntValue(II)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/service/awake/module/AwakeManager;->setOnLineCmd(I)V

    return-void
.end method
