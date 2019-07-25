.class final Lcom/xiaomi/mipush/sdk/MiPushClient$6;
.super Lcom/xiaomi/push/service/OnlineConfig$OCUpdateCallback;
.source "MiPushClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/mipush/sdk/MiPushClient;->initEventPerfLogic(Landroid/content/Context;)V
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

    iput-object p3, p0, Lcom/xiaomi/mipush/sdk/MiPushClient$6;->val$context:Landroid/content/Context;

    invoke-direct {p0, p1, p2}, Lcom/xiaomi/push/service/OnlineConfig$OCUpdateCallback;-><init>(ILjava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected onCallback()V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/MiPushClient$6;->val$context:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->checkConfigChange(Landroid/content/Context;)V

    return-void
.end method
