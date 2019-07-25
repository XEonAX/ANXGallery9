.class public Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;
.super Landroid/os/Handler;
.source "EventHandler.java"


# instance fields
.field private mBitSet:Ljava/util/BitSet;

.field private mCallbacks:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;->mCallbacks:Landroid/util/SparseArray;

    new-instance v0, Ljava/util/BitSet;

    invoke-direct {v0}, Ljava/util/BitSet;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;->mBitSet:Ljava/util/BitSet;

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;->mCallbacks:Landroid/util/SparseArray;

    iget p1, p1, Landroid/os/Message;->what:I

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Runnable;

    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :cond_0
    return-void
.end method

.method public register(Ljava/lang/Runnable;)I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;->mBitSet:Ljava/util/BitSet;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/BitSet;->nextClearBit(I)I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;->mCallbacks:Landroid/util/SparseArray;

    invoke-virtual {v1, v0, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;->mBitSet:Ljava/util/BitSet;

    invoke-virtual {p1, v0}, Ljava/util/BitSet;->set(I)V

    return v0
.end method

.method public unregister(I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;->mCallbacks:Landroid/util/SparseArray;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/util/SparseArray;->setValueAt(ILjava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;->mBitSet:Ljava/util/BitSet;

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->clear(I)V

    return-void
.end method
