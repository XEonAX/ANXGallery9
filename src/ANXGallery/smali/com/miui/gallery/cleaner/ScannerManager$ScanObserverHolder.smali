.class Lcom/miui/gallery/cleaner/ScannerManager$ScanObserverHolder;
.super Ljava/lang/Object;
.source "ScannerManager.java"

# interfaces
.implements Lcom/miui/gallery/cleaner/ScannerManager$ScanObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cleaner/ScannerManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ScanObserverHolder"
.end annotation


# instance fields
.field observers:Ljava/util/concurrent/CopyOnWriteArraySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArraySet<",
            "Lcom/miui/gallery/cleaner/ScannerManager$ScanObserver;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager$ScanObserverHolder;->observers:Ljava/util/concurrent/CopyOnWriteArraySet;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/cleaner/ScannerManager$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cleaner/ScannerManager$ScanObserverHolder;-><init>()V

    return-void
.end method


# virtual methods
.method public onScanCanceled()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager$ScanObserverHolder;->observers:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/cleaner/ScannerManager$ScanObserver;

    invoke-interface {v1}, Lcom/miui/gallery/cleaner/ScannerManager$ScanObserver;->onScanCanceled()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onScanFinish(J)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager$ScanObserverHolder;->observers:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/cleaner/ScannerManager$ScanObserver;

    invoke-interface {v1, p1, p2}, Lcom/miui/gallery/cleaner/ScannerManager$ScanObserver;->onScanFinish(J)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onScanProgress(J)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager$ScanObserverHolder;->observers:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/cleaner/ScannerManager$ScanObserver;

    invoke-interface {v1, p1, p2}, Lcom/miui/gallery/cleaner/ScannerManager$ScanObserver;->onScanProgress(J)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onScanResultUpdate(J)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager$ScanObserverHolder;->observers:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/cleaner/ScannerManager$ScanObserver;

    invoke-interface {v1, p1, p2}, Lcom/miui/gallery/cleaner/ScannerManager$ScanObserver;->onScanResultUpdate(J)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onScanStart()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager$ScanObserverHolder;->observers:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/cleaner/ScannerManager$ScanObserver;

    invoke-interface {v1}, Lcom/miui/gallery/cleaner/ScannerManager$ScanObserver;->onScanStart()V

    goto :goto_0

    :cond_0
    return-void
.end method
