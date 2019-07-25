.class Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender$2;
.super Ljava/lang/Object;
.source "MiTinyDataClient.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;


# direct methods
.method constructor <init>(Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender$2;->this$1:Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender$2;->this$1:Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;

    iget-object v0, v0, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;->mList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender$2;->this$1:Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;->access$100(Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender$2;->this$1:Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;->access$200(Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender$2;->this$1:Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;->access$200(Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender$2;->this$1:Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;->access$202(Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;Ljava/util/concurrent/ScheduledFuture;)Ljava/util/concurrent/ScheduledFuture;

    :cond_1
    :goto_0
    return-void
.end method
