.class Lcom/miui/gallery/cleaner/SimilarScanner$5$1;
.super Ljava/lang/Object;
.source "SimilarScanner.java"

# interfaces
.implements Lcom/miui/gallery/cleaner/SimilarScanner$OnClusterCompletedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cleaner/SimilarScanner$5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/cleaner/SimilarScanner$5;


# direct methods
.method constructor <init>(Lcom/miui/gallery/cleaner/SimilarScanner$5;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cleaner/SimilarScanner$5$1;->this$1:Lcom/miui/gallery/cleaner/SimilarScanner$5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAllCompleted()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner$5$1;->this$1:Lcom/miui/gallery/cleaner/SimilarScanner$5;

    iget-object v0, v0, Lcom/miui/gallery/cleaner/SimilarScanner$5;->this$0:Lcom/miui/gallery/cleaner/SimilarScanner;

    invoke-static {v0}, Lcom/miui/gallery/cleaner/SimilarScanner;->access$700(Lcom/miui/gallery/cleaner/SimilarScanner;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner$5$1;->this$1:Lcom/miui/gallery/cleaner/SimilarScanner$5;

    iget-object v0, v0, Lcom/miui/gallery/cleaner/SimilarScanner$5;->this$0:Lcom/miui/gallery/cleaner/SimilarScanner;

    invoke-static {v0}, Lcom/miui/gallery/cleaner/SimilarScanner;->access$400(Lcom/miui/gallery/cleaner/SimilarScanner;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner$5$1;->this$1:Lcom/miui/gallery/cleaner/SimilarScanner$5;

    iget-object v0, v0, Lcom/miui/gallery/cleaner/SimilarScanner$5;->this$0:Lcom/miui/gallery/cleaner/SimilarScanner;

    const/16 v1, 0x3e8

    const/16 v2, 0x1e

    invoke-static {v0, v1, v2, p0}, Lcom/miui/gallery/cleaner/SimilarScanner;->access$800(Lcom/miui/gallery/cleaner/SimilarScanner;IILcom/miui/gallery/cleaner/SimilarScanner$OnClusterCompletedListener;)Z

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner$5$1;->this$1:Lcom/miui/gallery/cleaner/SimilarScanner$5;

    iget-object v0, v0, Lcom/miui/gallery/cleaner/SimilarScanner$5;->this$0:Lcom/miui/gallery/cleaner/SimilarScanner;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/cleaner/SimilarScanner;->access$402(Lcom/miui/gallery/cleaner/SimilarScanner;Z)Z

    iget-object v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner$5$1;->this$1:Lcom/miui/gallery/cleaner/SimilarScanner$5;

    iget-object v0, v0, Lcom/miui/gallery/cleaner/SimilarScanner$5;->this$0:Lcom/miui/gallery/cleaner/SimilarScanner;

    invoke-static {v0}, Lcom/miui/gallery/cleaner/SimilarScanner;->access$500(Lcom/miui/gallery/cleaner/SimilarScanner;)V

    iget-object v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner$5$1;->this$1:Lcom/miui/gallery/cleaner/SimilarScanner$5;

    iget-object v0, v0, Lcom/miui/gallery/cleaner/SimilarScanner$5;->this$0:Lcom/miui/gallery/cleaner/SimilarScanner;

    iget-object v1, p0, Lcom/miui/gallery/cleaner/SimilarScanner$5$1;->this$1:Lcom/miui/gallery/cleaner/SimilarScanner$5;

    iget-object v1, v1, Lcom/miui/gallery/cleaner/SimilarScanner$5;->this$0:Lcom/miui/gallery/cleaner/SimilarScanner;

    invoke-static {v1}, Lcom/miui/gallery/cleaner/SimilarScanner;->access$600(Lcom/miui/gallery/cleaner/SimilarScanner;)Lcom/miui/gallery/cleaner/ScanResult;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cleaner/SimilarScanner;->updateScanResult(Lcom/miui/gallery/cleaner/ScanResult;)V

    const-string v0, "SimilarScanner"

    const-string v1, "finish handle all images."

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public onCompleteInBatch()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner$5$1;->this$1:Lcom/miui/gallery/cleaner/SimilarScanner$5;

    iget-object v0, v0, Lcom/miui/gallery/cleaner/SimilarScanner$5;->this$0:Lcom/miui/gallery/cleaner/SimilarScanner;

    invoke-static {v0}, Lcom/miui/gallery/cleaner/SimilarScanner;->access$400(Lcom/miui/gallery/cleaner/SimilarScanner;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner$5$1;->this$1:Lcom/miui/gallery/cleaner/SimilarScanner$5;

    iget-object v0, v0, Lcom/miui/gallery/cleaner/SimilarScanner$5;->this$0:Lcom/miui/gallery/cleaner/SimilarScanner;

    invoke-static {v0}, Lcom/miui/gallery/cleaner/SimilarScanner;->access$500(Lcom/miui/gallery/cleaner/SimilarScanner;)V

    iget-object v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner$5$1;->this$1:Lcom/miui/gallery/cleaner/SimilarScanner$5;

    iget-object v0, v0, Lcom/miui/gallery/cleaner/SimilarScanner$5;->this$0:Lcom/miui/gallery/cleaner/SimilarScanner;

    iget-object v1, p0, Lcom/miui/gallery/cleaner/SimilarScanner$5$1;->this$1:Lcom/miui/gallery/cleaner/SimilarScanner$5;

    iget-object v1, v1, Lcom/miui/gallery/cleaner/SimilarScanner$5;->this$0:Lcom/miui/gallery/cleaner/SimilarScanner;

    invoke-static {v1}, Lcom/miui/gallery/cleaner/SimilarScanner;->access$600(Lcom/miui/gallery/cleaner/SimilarScanner;)Lcom/miui/gallery/cleaner/ScanResult;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cleaner/SimilarScanner;->updateScanResult(Lcom/miui/gallery/cleaner/ScanResult;)V

    const-string v0, "SimilarScanner"

    const-string v1, "update scan result."

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
