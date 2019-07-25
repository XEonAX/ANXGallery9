.class public final synthetic Lcom/miui/gallery/cloud/download/-$$Lambda$MicroBatchDownloadManager$1$m1Q8LdN-VFO937LcGIXO36xcHys;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager;


# direct methods
.method public synthetic constructor <init>(Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/cloud/download/-$$Lambda$MicroBatchDownloadManager$1$m1Q8LdN-VFO937LcGIXO36xcHys;->f$0:Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/-$$Lambda$MicroBatchDownloadManager$1$m1Q8LdN-VFO937LcGIXO36xcHys;->f$0:Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager;

    invoke-static {v0}, Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager$1;->lambda$onReceive$39(Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager;)V

    return-void
.end method
