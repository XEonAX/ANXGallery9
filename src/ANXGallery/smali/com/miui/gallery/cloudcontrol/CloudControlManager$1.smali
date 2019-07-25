.class Lcom/miui/gallery/cloudcontrol/CloudControlManager$1;
.super Landroid/os/AsyncTask;
.source "CloudControlManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloudcontrol/CloudControlManager;
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
.field final synthetic this$0:Lcom/miui/gallery/cloudcontrol/CloudControlManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/cloudcontrol/CloudControlManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager$1;->this$0:Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Landroid/content/Context;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/cloudcontrol/CloudControlManager$1;->doInBackground([Landroid/content/Context;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Landroid/content/Context;)Ljava/lang/Void;
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager$1;->this$0:Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    invoke-static {v0}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->access$000(Lcom/miui/gallery/cloudcontrol/CloudControlManager;)V

    const/4 v0, 0x0

    const/4 v1, 0x1

    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    aget-object p1, p1, v0

    iget-object v4, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager$1;->this$0:Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    invoke-static {v4}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->access$100(Lcom/miui/gallery/cloudcontrol/CloudControlManager;)Lcom/miui/gallery/cloudcontrol/ProfileCache;

    move-result-object v4

    invoke-virtual {v4, p1}, Lcom/miui/gallery/cloudcontrol/ProfileCache;->load(Landroid/content/Context;)V

    iget-object p1, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager$1;->this$0:Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    invoke-static {p1, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->access$202(Lcom/miui/gallery/cloudcontrol/CloudControlManager;Z)Z

    const-string p1, "CloudControlManager"

    const-string v4, "Load cache costs %d ms."

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    const/4 v7, 0x0

    sub-long/2addr v5, v2

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {p1, v4, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_1
    iget-object v2, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager$1;->this$0:Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    invoke-static {v2, v0}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->access$202(Lcom/miui/gallery/cloudcontrol/CloudControlManager;Z)Z

    const-string v0, "CloudControlManager"

    const-string v2, "Init failed, what should not happen: %s."

    invoke-static {v0, v2, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager$1;->this$0:Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    invoke-static {p1, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->access$302(Lcom/miui/gallery/cloudcontrol/CloudControlManager;Z)Z

    iget-object p1, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager$1;->this$0:Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    invoke-static {p1}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->access$400(Lcom/miui/gallery/cloudcontrol/CloudControlManager;)Ljava/util/concurrent/CountDownLatch;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    iget-object p1, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager$1;->this$0:Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    invoke-static {p1}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->access$100(Lcom/miui/gallery/cloudcontrol/CloudControlManager;)Lcom/miui/gallery/cloudcontrol/ProfileCache;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/ProfileCache;->notifyAfterLoadFinished()V

    const/4 p1, 0x0

    return-object p1

    :goto_1
    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager$1;->this$0:Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    invoke-static {v0, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->access$302(Lcom/miui/gallery/cloudcontrol/CloudControlManager;Z)Z

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager$1;->this$0:Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    invoke-static {v0}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->access$400(Lcom/miui/gallery/cloudcontrol/CloudControlManager;)Ljava/util/concurrent/CountDownLatch;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    throw p1
.end method
