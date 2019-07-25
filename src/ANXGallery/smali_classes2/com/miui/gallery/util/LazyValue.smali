.class public abstract Lcom/miui/gallery/util/LazyValue;
.super Ljava/lang/Object;
.source "LazyValue.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Param:",
        "Ljava/lang/Object;",
        "Value:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private volatile mResolved:Z

.field private volatile mValue:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TValue;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/util/LazyValue;->mResolved:Z

    return-void
.end method

.method private declared-synchronized init(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TParam;)V"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/miui/gallery/util/LazyValue;->mResolved:Z

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/LazyValue;->onInit(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/util/LazyValue;->mValue:Ljava/lang/Object;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/util/LazyValue;->mResolved:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method


# virtual methods
.method public final get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TParam;)TValue;"
        }
    .end annotation

    iget-boolean v0, p0, Lcom/miui/gallery/util/LazyValue;->mResolved:Z

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/LazyValue;->init(Ljava/lang/Object;)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/util/LazyValue;->mValue:Ljava/lang/Object;

    return-object p1
.end method

.method protected abstract onInit(Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TParam;)TValue;"
        }
    .end annotation
.end method
