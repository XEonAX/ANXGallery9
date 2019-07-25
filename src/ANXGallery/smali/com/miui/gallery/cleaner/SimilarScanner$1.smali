.class Lcom/miui/gallery/cleaner/SimilarScanner$1;
.super Ljava/lang/Object;
.source "SimilarScanner.java"

# interfaces
.implements Lcom/miui/gallery/cleaner/SimilarScanner$OnClusterCompletedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/cleaner/SimilarScanner;->scan()Lcom/miui/gallery/cleaner/ScanResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/cleaner/SimilarScanner;


# direct methods
.method constructor <init>(Lcom/miui/gallery/cleaner/SimilarScanner;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cleaner/SimilarScanner$1;->this$0:Lcom/miui/gallery/cleaner/SimilarScanner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAllCompleted()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner$1;->this$0:Lcom/miui/gallery/cleaner/SimilarScanner;

    invoke-static {v0}, Lcom/miui/gallery/cleaner/SimilarScanner;->access$000(Lcom/miui/gallery/cleaner/SimilarScanner;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/cleaner/SimilarScanner$1;->this$0:Lcom/miui/gallery/cleaner/SimilarScanner;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/miui/gallery/cleaner/SimilarScanner;->access$102(Lcom/miui/gallery/cleaner/SimilarScanner;Z)Z

    iget-object v1, p0, Lcom/miui/gallery/cleaner/SimilarScanner$1;->this$0:Lcom/miui/gallery/cleaner/SimilarScanner;

    invoke-static {v1}, Lcom/miui/gallery/cleaner/SimilarScanner;->access$000(Lcom/miui/gallery/cleaner/SimilarScanner;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onCompleteInBatch()V
    .locals 0

    return-void
.end method
