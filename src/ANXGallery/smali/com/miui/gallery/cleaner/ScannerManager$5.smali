.class Lcom/miui/gallery/cleaner/ScannerManager$5;
.super Lcom/miui/gallery/threadpool/FutureHandler;
.source "ScannerManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cleaner/ScannerManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/threadpool/FutureHandler<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/cleaner/ScannerManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/cleaner/ScannerManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cleaner/ScannerManager$5;->this$0:Lcom/miui/gallery/cleaner/ScannerManager;

    invoke-direct {p0}, Lcom/miui/gallery/threadpool/FutureHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public onPostExecute(Lcom/miui/gallery/threadpool/Future;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/threadpool/Future<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/Future;->isCancelled()Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/cleaner/ScannerManager$5;->this$0:Lcom/miui/gallery/cleaner/ScannerManager;

    invoke-static {p1}, Lcom/miui/gallery/cleaner/ScannerManager;->access$100(Lcom/miui/gallery/cleaner/ScannerManager;)Lcom/miui/gallery/cleaner/ScannerManager$ScanObserverHolder;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager$5;->this$0:Lcom/miui/gallery/cleaner/ScannerManager;

    invoke-static {v0}, Lcom/miui/gallery/cleaner/ScannerManager;->access$200(Lcom/miui/gallery/cleaner/ScannerManager;)J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/cleaner/ScannerManager$ScanObserverHolder;->onScanFinish(J)V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/miui/gallery/cleaner/ScannerManager$5;->this$0:Lcom/miui/gallery/cleaner/ScannerManager;

    invoke-static {v2}, Lcom/miui/gallery/cleaner/ScannerManager;->access$300(Lcom/miui/gallery/cleaner/ScannerManager;)J

    move-result-wide v2

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    long-to-int v0, v0

    const-string v1, "timeCost"

    int-to-float v0, v0

    sget-object v2, Lcom/miui/gallery/cleaner/ScannerManager;->TIME_COST_STAGE:[I

    invoke-static {v0, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->formatValueStage(F[I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "cleaner"

    const-string v1, "cleaner_scan_finish"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_0
    return-void
.end method
