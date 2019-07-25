.class public Lcom/miui/gallery/picker/uri/OriginUrlRequestor;
.super Ljava/lang/Object;
.source "OriginUrlRequestor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginUrlRequestTask;,
        Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginInfo;,
        Lcom/miui/gallery/picker/uri/OriginUrlRequestor$ProgressListener;
    }
.end annotation


# instance fields
.field private mProgressListener:Lcom/miui/gallery/picker/uri/OriginUrlRequestor$ProgressListener;

.field private mRequestAsyncTask:Landroid/os/AsyncTask;

.field private final mTasks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginUrlRequestTask;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;Lcom/miui/gallery/picker/uri/OriginUrlRequestor$ProgressListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginUrlRequestTask;",
            ">;",
            "Lcom/miui/gallery/picker/uri/OriginUrlRequestor$ProgressListener;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    iput-object p1, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor;->mTasks:Ljava/util/List;

    iput-object p2, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor;->mProgressListener:Lcom/miui/gallery/picker/uri/OriginUrlRequestor$ProgressListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/picker/uri/OriginUrlRequestor;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor;->mTasks:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/picker/uri/OriginUrlRequestor;)Lcom/miui/gallery/picker/uri/OriginUrlRequestor$ProgressListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor;->mProgressListener:Lcom/miui/gallery/picker/uri/OriginUrlRequestor$ProgressListener;

    return-object p0
.end method


# virtual methods
.method public cancel()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor;->mRequestAsyncTask:Landroid/os/AsyncTask;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor;->mRequestAsyncTask:Landroid/os/AsyncTask;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/AsyncTask;->cancel(Z)Z

    :cond_0
    return-void
.end method

.method public destroy()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor;->mRequestAsyncTask:Landroid/os/AsyncTask;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor;->mRequestAsyncTask:Landroid/os/AsyncTask;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/os/AsyncTask;->cancel(Z)Z

    iput-object v1, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor;->mRequestAsyncTask:Landroid/os/AsyncTask;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor;->mProgressListener:Lcom/miui/gallery/picker/uri/OriginUrlRequestor$ProgressListener;

    if-eqz v0, :cond_1

    iput-object v1, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor;->mProgressListener:Lcom/miui/gallery/picker/uri/OriginUrlRequestor$ProgressListener;

    :cond_1
    return-void
.end method

.method public start([Landroid/net/Uri;[Ljava/lang/String;)V
    .locals 6

    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    array-length v2, p1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    if-eqz p1, :cond_3

    if-eqz p2, :cond_3

    array-length v2, p1

    array-length v3, p2

    if-eq v2, v3, :cond_1

    goto :goto_2

    :cond_1
    const/4 v2, 0x0

    :goto_1
    array-length v3, p1

    if-ge v2, v3, :cond_2

    new-instance v3, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginInfo;

    aget-object v4, p1, v2

    aget-object v5, p2, v2

    invoke-direct {v3, v4, v5}, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginInfo;-><init>(Landroid/net/Uri;Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor;->mProgressListener:Lcom/miui/gallery/picker/uri/OriginUrlRequestor$ProgressListener;

    iget-object p2, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor;->mTasks:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    invoke-interface {p1, p2}, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$ProgressListener;->onStart(I)V

    new-instance p1, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$1;

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$1;-><init>(Lcom/miui/gallery/picker/uri/OriginUrlRequestor;Ljava/util/ArrayList;)V

    new-array p2, v1, [Ljava/lang/Void;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$1;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor;->mRequestAsyncTask:Landroid/os/AsyncTask;

    return-void

    :cond_3
    :goto_2
    iget-object p1, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor;->mProgressListener:Lcom/miui/gallery/picker/uri/OriginUrlRequestor$ProgressListener;

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor;->mProgressListener:Lcom/miui/gallery/picker/uri/OriginUrlRequestor$ProgressListener;

    invoke-interface {p1, v0, v1}, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$ProgressListener;->onEnd(Ljava/util/ArrayList;Z)V

    :cond_4
    return-void
.end method
