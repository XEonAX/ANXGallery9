.class public Lcom/miui/gallery/sdk/download/executor/queue/Queue;
.super Ljava/lang/Object;
.source "Queue.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/miui/gallery/sdk/download/executor/queue/Command;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final mList:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final mMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "TT;>;"
        }
    .end annotation
.end field

.field private final mMaxSize:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->mMap:Ljava/util/HashMap;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->mList:Ljava/util/LinkedList;

    iput p1, p0, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->mMaxSize:I

    return-void
.end method

.method private needAdd(Lcom/miui/gallery/sdk/download/executor/queue/Command;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->mMap:Ljava/util/HashMap;

    invoke-interface {p1}, Lcom/miui/gallery/sdk/download/executor/queue/Command;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/sdk/download/executor/queue/Command;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-interface {v0}, Lcom/miui/gallery/sdk/download/executor/queue/Command;->getPriority()I

    move-result v2

    invoke-interface {p1}, Lcom/miui/gallery/sdk/download/executor/queue/Command;->getPriority()I

    move-result p1

    if-ge v2, p1, :cond_1

    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->remove(Lcom/miui/gallery/sdk/download/executor/queue/Command;)V

    return v1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method private putInternal(Lcom/miui/gallery/sdk/download/executor/queue/Command;Z)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;Z)Z"
        }
    .end annotation

    invoke-direct {p0, p1}, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->needAdd(Lcom/miui/gallery/sdk/download/executor/queue/Command;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->mMap:Ljava/util/HashMap;

    invoke-interface {p1}, Lcom/miui/gallery/sdk/download/executor/queue/Command;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->mList:Ljava/util/LinkedList;

    invoke-virtual {p2, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    iget p1, p0, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->mMaxSize:I

    if-lez p1, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->size()I

    move-result p1

    iget p2, p0, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->mMaxSize:I

    if-le p1, p2, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->mList:Ljava/util/LinkedList;

    invoke-virtual {p1}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/sdk/download/executor/queue/Command;

    iget-object p2, p0, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->mMap:Ljava/util/HashMap;

    invoke-interface {p1}, Lcom/miui/gallery/sdk/download/executor/queue/Command;->getKey()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    iget-object p2, p0, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->mList:Ljava/util/LinkedList;

    invoke-virtual {p2, p1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    :cond_2
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method private remove(Lcom/miui/gallery/sdk/download/executor/queue/Command;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    invoke-interface {p1}, Lcom/miui/gallery/sdk/download/executor/queue/Command;->getKey()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->mMap:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->mList:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->mMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->mList:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    return-void
.end method

.method public get(Ljava/lang/String;)Lcom/miui/gallery/sdk/download/executor/queue/Command;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->mMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/sdk/download/executor/queue/Command;

    return-object p1
.end method

.method public poll(I)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->mList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/ListIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v2

    if-ge v2, p1, :cond_0

    invoke-interface {v1}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/sdk/download/executor/queue/Command;

    invoke-virtual {v0, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    invoke-interface {v1}, Ljava/util/ListIterator;->remove()V

    iget-object v3, p0, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->mMap:Ljava/util/HashMap;

    invoke-interface {v2}, Lcom/miui/gallery/sdk/download/executor/queue/Command;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public putAtFirst(Ljava/util/List;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;)I"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/ListIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/sdk/download/executor/queue/Command;

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->putInternal(Lcom/miui/gallery/sdk/download/executor/queue/Command;Z)Z

    move-result v1

    add-int/2addr v0, v1

    goto :goto_0

    :cond_0
    return v0
.end method

.method public putAtLast(Ljava/util/List;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;)I"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    move-result-object p1

    const/4 v1, 0x0

    :goto_0
    invoke-interface {p1}, Ljava/util/ListIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {p1}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/sdk/download/executor/queue/Command;

    invoke-direct {p0, v2, v0}, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->putInternal(Lcom/miui/gallery/sdk/download/executor/queue/Command;Z)Z

    move-result v2

    add-int/2addr v1, v2

    goto :goto_0

    :cond_0
    return v1
.end method

.method public remove(Ljava/lang/String;)Lcom/miui/gallery/sdk/download/executor/queue/Command;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->mMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/sdk/download/executor/queue/Command;

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->mList:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    :cond_0
    return-object p1
.end method

.method public size()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->mMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    return v0
.end method

.method public values()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "TT;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->mMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method
