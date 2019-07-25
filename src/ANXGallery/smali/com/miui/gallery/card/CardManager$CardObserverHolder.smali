.class Lcom/miui/gallery/card/CardManager$CardObserverHolder;
.super Ljava/lang/Object;
.source "CardManager.java"

# interfaces
.implements Lcom/miui/gallery/card/CardManager$CardObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/card/CardManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CardObserverHolder"
.end annotation


# instance fields
.field final observers:Ljava/util/concurrent/CopyOnWriteArraySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArraySet<",
            "Lcom/miui/gallery/card/CardManager$CardObserver;",
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

    iput-object v0, p0, Lcom/miui/gallery/card/CardManager$CardObserverHolder;->observers:Ljava/util/concurrent/CopyOnWriteArraySet;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/card/CardManager$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/card/CardManager$CardObserverHolder;-><init>()V

    return-void
.end method


# virtual methods
.method public onCardAdded(ILcom/miui/gallery/card/Card;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/card/CardManager$CardObserverHolder;->observers:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/card/CardManager$CardObserver;

    invoke-interface {v1, p1, p2}, Lcom/miui/gallery/card/CardManager$CardObserver;->onCardAdded(ILcom/miui/gallery/card/Card;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onCardDeleted(ILcom/miui/gallery/card/Card;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/card/CardManager$CardObserverHolder;->observers:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/card/CardManager$CardObserver;

    invoke-interface {v1, p1, p2}, Lcom/miui/gallery/card/CardManager$CardObserver;->onCardDeleted(ILcom/miui/gallery/card/Card;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onCardUpdated(ILcom/miui/gallery/card/Card;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/card/CardManager$CardObserverHolder;->observers:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/card/CardManager$CardObserver;

    invoke-interface {v1, p1, p2}, Lcom/miui/gallery/card/CardManager$CardObserver;->onCardUpdated(ILcom/miui/gallery/card/Card;)V

    goto :goto_0

    :cond_0
    return-void
.end method
