.class Lcom/miui/gallery/discovery/PrintSilentInstallTask$1;
.super Ljava/lang/Object;
.source "PrintSilentInstallTask.java"

# interfaces
.implements Lcom/miui/gallery/util/PrintInstallHelper$InstallStateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/discovery/PrintSilentInstallTask;->process(Ljava/lang/Object;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/discovery/PrintSilentInstallTask;


# direct methods
.method constructor <init>(Lcom/miui/gallery/discovery/PrintSilentInstallTask;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/discovery/PrintSilentInstallTask$1;->this$0:Lcom/miui/gallery/discovery/PrintSilentInstallTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFinish(ZII)V
    .locals 2

    if-nez p1, :cond_0

    const/4 p1, 0x3

    if-ne p3, p1, :cond_1

    :cond_0
    invoke-static {}, Lcom/miui/gallery/discovery/PrintSilentInstallTask;->setSilentInstallTimesDisable()V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/discovery/PrintSilentInstallTask$1;->this$0:Lcom/miui/gallery/discovery/PrintSilentInstallTask;

    invoke-static {p1}, Lcom/miui/gallery/discovery/PrintSilentInstallTask;->access$000(Lcom/miui/gallery/discovery/PrintSilentInstallTask;)Ljava/util/concurrent/CountDownLatch;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    const-string p1, "sdfa"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onFinish"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/util/PrintInstallHelper;->getInstance()Lcom/miui/gallery/util/PrintInstallHelper;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/miui/gallery/util/PrintInstallHelper;->removeInstallStateListener(Lcom/miui/gallery/util/PrintInstallHelper$InstallStateListener;)V

    return-void
.end method

.method public onInstallLimited()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/discovery/PrintSilentInstallTask$1;->this$0:Lcom/miui/gallery/discovery/PrintSilentInstallTask;

    invoke-static {v0}, Lcom/miui/gallery/discovery/PrintSilentInstallTask;->access$000(Lcom/miui/gallery/discovery/PrintSilentInstallTask;)Ljava/util/concurrent/CountDownLatch;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    invoke-static {}, Lcom/miui/gallery/util/PrintInstallHelper;->getInstance()Lcom/miui/gallery/util/PrintInstallHelper;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/miui/gallery/util/PrintInstallHelper;->removeInstallStateListener(Lcom/miui/gallery/util/PrintInstallHelper$InstallStateListener;)V

    return-void
.end method

.method public onInstalling()V
    .locals 0

    return-void
.end method
