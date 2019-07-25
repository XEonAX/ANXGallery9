.class public abstract Lcom/miui/gallery/cleaner/BaseScanner;
.super Ljava/lang/Object;
.source "BaseScanner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cleaner/BaseScanner$OnScanResultUpdateListener;
    }
.end annotation


# instance fields
.field mListeners:Ljava/util/concurrent/CopyOnWriteArraySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArraySet<",
            "Lcom/miui/gallery/cleaner/BaseScanner$OnScanResultUpdateListener;",
            ">;"
        }
    .end annotation
.end field

.field protected mType:I


# direct methods
.method protected constructor <init>(I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cleaner/BaseScanner;->mListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    iput p1, p0, Lcom/miui/gallery/cleaner/BaseScanner;->mType:I

    return-void
.end method


# virtual methods
.method public final addListener(Lcom/miui/gallery/cleaner/BaseScanner$OnScanResultUpdateListener;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cleaner/BaseScanner;->mListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method public onMediaItemDeleted(J)V
    .locals 0

    return-void
.end method

.method protected abstract onReset()V
.end method

.method public final removeListener(Lcom/miui/gallery/cleaner/BaseScanner$OnScanResultUpdateListener;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cleaner/BaseScanner;->mListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->remove(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method public final reset()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cleaner/BaseScanner;->mListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->clear()V

    invoke-virtual {p0}, Lcom/miui/gallery/cleaner/BaseScanner;->onReset()V

    return-void
.end method

.method public abstract scan()Lcom/miui/gallery/cleaner/ScanResult;
.end method

.method protected final updateScanResult(JLcom/miui/gallery/cleaner/ScanResult;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/cleaner/BaseScanner;->mListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/cleaner/BaseScanner$OnScanResultUpdateListener;

    if-eqz v1, :cond_0

    iget v2, p0, Lcom/miui/gallery/cleaner/BaseScanner;->mType:I

    invoke-interface {v1, v2, p1, p2, p3}, Lcom/miui/gallery/cleaner/BaseScanner$OnScanResultUpdateListener;->onUpdate(IJLcom/miui/gallery/cleaner/ScanResult;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method protected final updateScanResult(Lcom/miui/gallery/cleaner/ScanResult;)V
    .locals 2

    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1, p1}, Lcom/miui/gallery/cleaner/BaseScanner;->updateScanResult(JLcom/miui/gallery/cleaner/ScanResult;)V

    return-void
.end method
