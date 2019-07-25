.class public final synthetic Lcom/miui/gallery/cloud/download/-$$Lambda$MicroBatchDownloadManager$LFQ899ijAfS7McsaQJao_xk8C8s;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# instance fields
.field private final synthetic f$0:Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager;


# direct methods
.method public synthetic constructor <init>(Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/cloud/download/-$$Lambda$MicroBatchDownloadManager$LFQ899ijAfS7McsaQJao_xk8C8s;->f$0:Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/-$$Lambda$MicroBatchDownloadManager$LFQ899ijAfS7McsaQJao_xk8C8s;->f$0:Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p1}, Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager;->lambda$ensureSubscribed$41(Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager;Ljava/util/List;)V

    return-void
.end method
