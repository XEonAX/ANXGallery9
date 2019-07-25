.class Lcom/miui/gallery/cleaner/ScannerManager$7;
.super Ljava/lang/Object;
.source "ScannerManager.java"

# interfaces
.implements Lcom/miui/gallery/cleaner/BaseScanner$OnScanResultUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cleaner/ScannerManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/cleaner/ScannerManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/cleaner/ScannerManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cleaner/ScannerManager$7;->this$0:Lcom/miui/gallery/cleaner/ScannerManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onUpdate(IJLcom/miui/gallery/cleaner/ScanResult;)V
    .locals 5

    const-wide/16 v0, 0x0

    if-eqz p4, :cond_1

    invoke-virtual {p4}, Lcom/miui/gallery/cleaner/ScanResult;->getSize()J

    move-result-wide v2

    cmp-long v4, v2, v0

    if-gtz v4, :cond_0

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/cleaner/ScannerManager$7;->this$0:Lcom/miui/gallery/cleaner/ScannerManager;

    invoke-static {v2, p1, p4}, Lcom/miui/gallery/cleaner/ScannerManager;->access$1000(Lcom/miui/gallery/cleaner/ScannerManager;ILcom/miui/gallery/cleaner/ScanResult;)V

    goto :goto_1

    :cond_1
    :goto_0
    iget-object p4, p0, Lcom/miui/gallery/cleaner/ScannerManager$7;->this$0:Lcom/miui/gallery/cleaner/ScannerManager;

    invoke-static {p4, p1}, Lcom/miui/gallery/cleaner/ScannerManager;->access$900(Lcom/miui/gallery/cleaner/ScannerManager;I)V

    :goto_1
    cmp-long p4, p2, v0

    if-lez p4, :cond_3

    iget-object p4, p0, Lcom/miui/gallery/cleaner/ScannerManager$7;->this$0:Lcom/miui/gallery/cleaner/ScannerManager;

    invoke-static {p4}, Lcom/miui/gallery/cleaner/ScannerManager;->access$400(Lcom/miui/gallery/cleaner/ScannerManager;)Ljava/util/ArrayList;

    move-result-object p4

    invoke-virtual {p4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p4

    :cond_2
    :goto_2
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cleaner/BaseScanner;

    iget v1, v0, Lcom/miui/gallery/cleaner/BaseScanner;->mType:I

    if-eq v1, p1, :cond_2

    invoke-virtual {v0, p2, p3}, Lcom/miui/gallery/cleaner/BaseScanner;->onMediaItemDeleted(J)V

    goto :goto_2

    :cond_3
    return-void
.end method
