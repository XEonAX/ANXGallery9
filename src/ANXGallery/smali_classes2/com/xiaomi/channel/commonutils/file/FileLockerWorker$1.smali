.class final Lcom/xiaomi/channel/commonutils/file/FileLockerWorker$1;
.super Lcom/xiaomi/channel/commonutils/file/FileLockerWorker;
.source "FileLockerWorker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/channel/commonutils/file/FileLockerWorker;->runMutiProcessJob(Landroid/content/Context;Ljava/io/File;Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$runnable:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/io/File;Ljava/lang/Runnable;)V
    .locals 0

    iput-object p3, p0, Lcom/xiaomi/channel/commonutils/file/FileLockerWorker$1;->val$runnable:Ljava/lang/Runnable;

    const/4 p3, 0x0

    invoke-direct {p0, p1, p2, p3}, Lcom/xiaomi/channel/commonutils/file/FileLockerWorker;-><init>(Landroid/content/Context;Ljava/io/File;Lcom/xiaomi/channel/commonutils/file/FileLockerWorker$1;)V

    return-void
.end method


# virtual methods
.method protected doWork(Landroid/content/Context;)V
    .locals 0

    iget-object p1, p0, Lcom/xiaomi/channel/commonutils/file/FileLockerWorker$1;->val$runnable:Ljava/lang/Runnable;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/xiaomi/channel/commonutils/file/FileLockerWorker$1;->val$runnable:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :cond_0
    return-void
.end method
