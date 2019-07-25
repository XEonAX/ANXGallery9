.class Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserverHolder;
.super Ljava/lang/Object;
.source "SlimController.java"

# interfaces
.implements Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cleaner/slim/SlimController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SpaceSlimObserverHolder"
.end annotation


# instance fields
.field observers:Ljava/util/concurrent/CopyOnWriteArraySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArraySet<",
            "Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserver;",
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

    iput-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserverHolder;->observers:Ljava/util/concurrent/CopyOnWriteArraySet;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/cleaner/slim/SlimController$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserverHolder;-><init>()V

    return-void
.end method


# virtual methods
.method public onSlimPaused()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserverHolder;->observers:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserver;

    invoke-interface {v1}, Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserver;->onSlimPaused()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onSlimProgress(JJI)V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserverHolder;->observers:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserver;

    move-wide v3, p1

    move-wide v5, p3

    move v7, p5

    invoke-interface/range {v2 .. v7}, Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserver;->onSlimProgress(JJI)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onSlimResumed()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserverHolder;->observers:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserver;

    invoke-interface {v1}, Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserver;->onSlimResumed()V

    goto :goto_0

    :cond_0
    return-void
.end method
