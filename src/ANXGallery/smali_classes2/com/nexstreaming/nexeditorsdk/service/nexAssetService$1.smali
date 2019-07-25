.class Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$1;
.super Landroid/os/AsyncTask;
.source "nexAssetService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->onReceivedAssetInfoData(IILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Landroid/content/Context;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;

.field private b:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$1;->a:Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs a([Landroid/content/Context;)Ljava/lang/Void;
    .locals 4

    const/4 v0, 0x0

    aget-object p1, p1, v0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$1;->b:Landroid/content/Context;

    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$1;->a:Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->access$000(Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;)J

    move-result-wide v2

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x3e8

    cmp-long p1, v0, v2

    if-gez p1, :cond_0

    const-string p1, "nexAssetService"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onReceivedAssetInfoData() wait="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$1;->a:Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;

    invoke-static {v1}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->access$000(Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-wide/16 v0, 0x1f4

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method protected a(Ljava/lang/Void;)V
    .locals 2

    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    new-instance p1, Landroid/content/Intent;

    const-string v0, "com.nexstreaming.nexeditorsdk.asset.feathredlist.completed"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "update"

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$1;->a:Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;

    invoke-static {v1}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->access$100(Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;)Z

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$1;->b:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$1;->a:Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->access$102(Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;Z)Z

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$1;->a:Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;

    invoke-static {p1, v0}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->access$202(Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;Z)Z

    const-string p1, "nexAssetService"

    const-string v0, "onReceivedAssetInfoData() End.."

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method protected synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Landroid/content/Context;

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$1;->a([Landroid/content/Context;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$1;->a(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 2

    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    const-string v0, "nexAssetService"

    const-string v1, "onReceivedAssetInfoData() Start.."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
